package com.teamone.ownit.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.Session;
import com.teamone.ownit.service.OrderService;
import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.Order_SellFormInsertAccount;
import com.teamone.ownit.vo.Order_SellFormMbAddAccVO;
import com.teamone.ownit.vo.Order_sellVO;
import com.teamone.ownit.vo.ProductVO;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	//상품 구매 동의
	@GetMapping(value = "order_buyAgree")
	public String order_buyAgree(Model model, HttpSession session, @RequestParam String cbChecked, HttpServletResponse response) {
		String sId = (String)session.getAttribute("sId");
		if(sId != null && !sId.equals("")) { // 로그인 중일경우 실행
//			System.out.println(cbChecked);
//			17:1:149000/7:2:656000/8:3:3075000/
			String[] cbArr = cbChecked.split("/");
			String product_idx = "";
			int order_count = 0;
			String countTimesPrice = "";
			List<ProductVO> productList = new ArrayList<ProductVO>();
			int cnt = 0;
			ArrayList<Integer> arr = new ArrayList<Integer>();
			for(String cb : cbArr) {
				ProductVO product = new ProductVO();
				product_idx = cb.split(":")[0];
				order_count = Integer.parseInt(cb.split(":")[1]);
				countTimesPrice = cb.split(":")[2];
				product = service.selectCartCount(product_idx, order_count);
//				System.out.println(product);
				if(product.getProduct_model_num() != null) {
					productList.add(product);
					cnt++;
					arr.add(order_count);
				} else {
					model.addAttribute("msg", product.getProduct_name()+" 상품의 구매수량을 조절해주세요");
					return "order/fail_back";
				}
			}
			model.addAttribute("productList", productList);
			model.addAttribute("cbChecked", cbChecked);
			model.addAttribute("cnt", cnt);
			model.addAttribute("cartCount", arr);
			return "order/order_buyAgree";
		}
		return "member/member_login";
	}
		
	// 구매주문 폼
	@GetMapping(value = "order_buyForm")
	public String order_buyForm(@RequestParam String cbChecked, Model model, HttpSession session, ArrayList<Integer> cartCounts) {
		String sId = (String)session.getAttribute("sId");
		String[] cbArr = cbChecked.split("/");
		
		List<ProductVO> productList = new ArrayList<ProductVO>();
		Map<String, String> member = service.getMemberInfo(sId);
		int maxGroupIdx = service.getMaxGroupIdx();
		
		String product_idx = "";	// 상품코드
		int order_count = 0;		// 주문수량
		int countTimesPrice = 0;	// 상품 총금액
		int cnt = 0;				// 주문 상품 갯수
		ArrayList<Integer> arr = new ArrayList<Integer>();
		
		for(String cb : cbArr) {
			ProductVO product = new ProductVO();
			product_idx = cb.split(":")[0];
			order_count = Integer.parseInt(cb.split(":")[1]);
			countTimesPrice += Integer.parseInt(cb.split(":")[2]);
			product = service.selectCartCount(product_idx, order_count);
			productList.add(product);
			cnt++;
			arr.add(order_count);
		}
		
		model.addAttribute("productList", productList);
		model.addAttribute("cbChecked", cbChecked);
		model.addAttribute("cnt", cnt);
		model.addAttribute("countTimesPrice", countTimesPrice);
		model.addAttribute("member", member);
		model.addAttribute("maxGroupIdx", maxGroupIdx);
		model.addAttribute("cartCount", cartCounts);
		model.addAttribute("cartCount", arr);
		
		return "order/order_buyForm";
	}
	
	// 구매완료 시 상품 잔여 수량 조정 및 구매 이력 남기기
	@PostMapping(value = "successOrder")
	@ResponseBody
	public void successOrder(HttpSession session, @RequestParam String cbChecked, @RequestParam int maxGroupIdx) {
//		System.out.println(cbChecked);
		String sId = (String)session.getAttribute("sId");
		String[] cbArr = cbChecked.split("/");
		
		String product_idx = "";	// 상품코드
		int order_count = 0;		// 주문수량
		int countTimesPrice = 0;	// 상품 총금액
		
		// 1. product 테이블에 product_left_count, product_sell_count 조정
		for(String cb : cbArr) {
			product_idx = cb.split(":")[0];
			order_count = Integer.parseInt(cb.split(":")[1]);
			countTimesPrice = Integer.parseInt(cb.split(":")[2]);
			int updateCount = service.updateProductCount(product_idx, order_count);
			if(updateCount > 0) {
				// 2. order_buy 테이블에 판매내역 기재
				int insertCount = service.insertOrderBuy(maxGroupIdx, product_idx, sId, order_count, countTimesPrice);
				if(insertCount > 0) {
					// 3. 장바구니에서 해당 상품 삭제
					service.deleteCart(sId, product_idx);
				}
			}
		}
	
	}
	
	@GetMapping(value = "orderComplete")
	public String orderComplete() {
//		System.out.println("orderComplete()");
		return "order/order_buyComplete";
	}
	
// 박주닮 
	
	// 상품 판매 동의
	@GetMapping(value = "order_sellAgree")
	public String order_sellAgree(@RequestParam int product_idx, Model model,HttpSession session) {
		//상품 판매 버튼 클릭시 세션아이디가 없으면 로그인화면으로
//		session.setAttribute("sId", "test2@naver.com"); // 세션아이디 임시 테스트용
		String sId = (String)session.getAttribute("sId");
		if(sId != null && !sId.equals("")) { // 로그인 중일경우 실행
//			System.out.println(sId);
			ProductVO product = service.productDetail(product_idx);
			model.addAttribute("product", product);
			return "order/order_sellAgree";
		}
		model.addAttribute("msg", "로그인 후 이용 가능합니다.");
		return "order/fail_back";
	}
	
	// 상품판매폼 주소 추가
	@PostMapping(value = "/order_sellForm")
	public String order_sellForm(@RequestParam int product_idx,
								 @ModelAttribute Order_SellFormMbAddAccVO address,
								 Model model, HttpSession session) {
		int address_idx = 0, insertAddressCount = 0 ,account_idx = 0;
		String sId = (String)session.getAttribute("sId");
		MemberVO memberIdx = service.selectMemberIdx(sId);
		int member_idx = memberIdx.getMember_idx();
		address.setMember_idx(member_idx);
			// 주소 갯수 조회
		int addressCounter = service.getCountAddress(member_idx);
		if(addressCounter > 3 ) { // 주소가 3개보다 많을 경우(4개이상일경우)
				model.addAttribute("msg", "주소는 4개까지만 등록 가능합니다!");
				return "order/fail_back";
		} else { // 주소가 4개 미만일경우 주소 추가
			insertAddressCount = service.insertAddress(address);
			if(insertAddressCount > 0) {
//				System.out.println("주소 추가 성공");
				address_idx = service.selectAddressIdx(member_idx);
				account_idx = address.getAccount_idx();
			}
		}
			
		return "redirect:/order_sellForm?product_idx="+product_idx
									   +"&address_idx=" +address_idx
									   +"&account_idx="+account_idx;
	}
	

	//상품 판매시 계좌추가 
	@PostMapping(value = "/insertAccount")
	public String insertAccount(Model model, @ModelAttribute Order_SellFormInsertAccount account,@RequestParam int address_idx) {
		
		
		int product_idx = account.getProduct_idx();
		int member_idx = account.getMember_idx();
		// 계좌가 4개 미만일 경우에만 등록
		int accountCounter = service.getCountAccount(member_idx);
		if(accountCounter > 3 ) { // 주소가 3개보다 많을 경우(4개이상일경우)
				model.addAttribute("msg", "계좌는 최대 4개까지만 등록 가능합니다!");
				return "order/fail_back";
		}
		int account_idx = 0;
		int insertCount = service.insertAccountSell(account);
		if(insertCount > 0) {
			AccountVO accountVO = service.selectAccountSell(member_idx);
			account_idx = accountVO.getAccount_idx();
//			System.out.println("account_idx : " + account_idx);
		}
		return "redirect:/order_sellForm?product_idx="+product_idx
				   +"&address_idx=" +address_idx
				   +"&account_idx="+account_idx;
	}
		
	// 상품판매폼(get)
	@GetMapping(value = "/order_sellForm")
	public String order_sellForm(@RequestParam int product_idx,
								 @RequestParam(defaultValue = "0") int address_idx ,
								 @RequestParam(defaultValue = "0") int account_idx, Model model, HttpSession session) {
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		String sId = (String)session.getAttribute("sId");
		MemberVO memberIdx = service.selectMemberIdx(sId);
		int member_idx = memberIdx.getMember_idx();
		List<Order_SellFormMbAddAccVO> addressList = service.selectAddressList(member_idx);
		model.addAttribute("addressList", addressList);
		
		List<Order_SellFormMbAddAccVO> accountList = service.selectAccountList(member_idx);
		model.addAttribute("accountList", accountList);
		
		if(account_idx > 0 && address_idx > 0) { // 계좌 추가 후 주소 변경
			Order_SellFormMbAddAccVO memeber = service.newAccountAddressForm(member_idx,account_idx,address_idx);
			model.addAttribute("member", memeber);
			return "order/order_sellForm";
		}
		if(account_idx > 0) { // 계좌 추가시에 추가된 계좌로 보이게 하는 구문
			Order_SellFormMbAddAccVO member = service.newAccountSellForm(member_idx,account_idx);
			model.addAttribute("member", member);
			return "order/order_sellForm";
		}
		if(address_idx > 0) { // 주소 변경시에 변경된 주소로 보이게 하는 구문
			Order_SellFormMbAddAccVO member = service.clickAddress(member_idx,address_idx);
			model.addAttribute("member", member);
			return "order/order_sellForm";
		} else {
			Order_SellFormMbAddAccVO member = service.selectMember(member_idx);
			model.addAttribute("member",member);
		}
		
		return "order/order_sellForm";
	}
	
	
	
	
	// 상품 판매 (판매자 정보 INSERT작업)
	@PostMapping(value = "/order_sellDetail")
	public String order_sellDetail(@ModelAttribute Order_sellVO order_sell) {
		int product_idx = order_sell.getProduct_idx();
		int member_idx = order_sell.getMember_idx();
		
		//판매성공시 판매자 정보 입력
		if(order_sell.getAccount_idx() != 0) { // 계좌정보를 입력 받았을때만 insert작업 수행
			int insertCount = service.insertOrderSell(order_sell);
			if(insertCount > 0) {
//				System.out.println("판매자 정보 등록 성공");
				
				return "redirect:/order_sellDetail?product_idx="+product_idx+"&member_idx="+member_idx;
			}else {
				return "order/order_sellForm";
			}
			
		} else {
			return "redirect:/order_sellDetail?product_idx="+product_idx+"&member_idx="+member_idx;
		}
	}
	//상품 판매 성공시 redirect방식 호출(새로고침 중복 INSERT 방지)
	@GetMapping(value = "/order_sellDetail")
	public String order_sellDetail(HttpSession session,Model model,@RequestParam int product_idx, @RequestParam int member_idx, @RequestParam(defaultValue = "0") int order_sell_idx) {
		
		int sIdx = (session.getAttribute("sIdx")!=null) ? (int)session.getAttribute("sIdx") : 0;
		
			
		if(sIdx == member_idx) { // url에서 member_idx를 조작했을 경우
			ProductVO product = service.productDetail(product_idx);
			if(product == null) { // 없는 product_idx를 url에서 조작했을 경우
				model.addAttribute("msg","잘못된 접근입니다");
				return "order/fail_back";
			}
			model.addAttribute("product", product);
			Order_sellVO orderSell = new Order_sellVO();
			
			if(order_sell_idx > 0) {
				orderSell.setOrder_sell_idx(order_sell_idx);
			}
			orderSell.setMember_idx(member_idx);
			orderSell.setProduct_idx(product_idx);
			orderSell = service.selectOrderSell(orderSell);
			if(orderSell == null) {
				model.addAttribute("msg","잘못된 접근입니다");
				return "order/fail_back";
			}
			model.addAttribute("orderSell",orderSell);
			
			return "order/order_sellDetail";
		} else {
			model.addAttribute("msg","잘못된 접근입니다");
			return "order/fail_back";
		}
	}
	
}
