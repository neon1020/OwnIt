package com.teamone.ownit.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	// 구매주문 폼
	@GetMapping(value = "order_buyForm")
	public String order_buyForm(@RequestParam int product_idx, Model model) {
		//이미지 하나 가져오는 작업 불필요시 삭제
//		ImageVO image = service.selectDetailImage(product_idx);
//		model.addAttribute("image", image);
	
		//프로덕트 정보 가져오는 작업 불필요시 삭제
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		return "order/order_buyForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
				
// 박주닮 501번째라인
	
	
	
	
	
	
	// 상품 판매 동의
	@GetMapping(value = "order_sellAgree")
	public String order_sellAgree(@RequestParam int product_idx, Model model,HttpSession session) {
		//상품 판매 버튼 클릭시 세션아이디가 없으면 로그인화면으로
		session.setAttribute("sId", "test2@naver.com"); // 세션아이디 임시 테스트용
		String sId = (String)session.getAttribute("sId");
		if(sId != null && !sId.equals("")) { // 로그인 중일경우 실행
			System.out.println(sId);
			ProductVO product = service.productDetail(product_idx);
			model.addAttribute("product", product);
			return "order/order_sellAgree";
		}
		return "member/member_login";
	}
	
	// 상품판매폼 주소 추가
	@PostMapping(value = "/order_sellForm")
	public String order_sellForm(@RequestParam int product_idx,
								 @ModelAttribute Order_SellFormMbAddAccVO address,
								 Model model, HttpSession session) {
		int address_idx = 0;
		int insertAddressCount = 0;
		int account_idx = 0;
		String sId = (String)session.getAttribute("sId");
		MemberVO memberIdx = service.selectMemberIdx(sId);
		int member_idx = memberIdx.getMember_idx();
		address.setMember_idx(member_idx);
		// 주소를 입력 받았을시에만 실행
		if(address.getAddress1() != null && !address.getAddress1().equals("")) {
			// 주소추가를 입력받았을시 주소 갯수 조회
			int addressCounter = service.getCountAddress(member_idx);
			if(addressCounter > 3 ) { // 주소가 3개보다 많을 경우(4개이상일경우)
					model.addAttribute("msg", "주소는 4개까지만 등록 가능합니다!");
					return "order/fail_back";
			} else { // 주소가 4개 미만일경우 주소 추가
				insertAddressCount = service.insertAddress(address);
				if(insertAddressCount > 0) {
					System.out.println("주소 추가 성공");
					address_idx = service.selectAddressIdx(member_idx);
					account_idx = address.getAccount_idx();
				}
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
		System.out.println(member_idx + "member_idx");
		// 계좌가 4개 미만일 경우에만 등록
		int accountCounter = service.getCountAccount(member_idx);
		if(accountCounter > 3 ) { // 주소가 3개보다 많을 경우(4개이상일경우)
				model.addAttribute("msg", "계좌는 최대 4개까지만 등록 가능합니다!");
				return "order/fail_back";
		}
		int account_idx = 0;
		int insertCount = service.insertAccountSell(account);
		if(insertCount > 0) {
			System.out.println("계좌 추가 성공");
			AccountVO accountVO = service.selectAccountSell(member_idx);
			account_idx = accountVO.getAccount_idx();
			System.out.println("account_idx : " + account_idx);
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
		System.out.println("Get방식 호출");
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		String sId = (String)session.getAttribute("sId");
		MemberVO memberIdx = service.selectMemberIdx(sId);
		int member_idx = memberIdx.getMember_idx();
		List<Order_SellFormMbAddAccVO> addressList = service.selectAddressList(member_idx);
		model.addAttribute("addressList", addressList);
		
		List<Order_SellFormMbAddAccVO> accountList = service.selectAccountList(member_idx);
		model.addAttribute("accountList", accountList);
		
		System.out.println("account_idx"+account_idx);
		System.out.println("member_idx"+member_idx);
		System.out.println("address_idx"+address_idx);
		
		if(account_idx > 0 && address_idx > 0) {
			Order_SellFormMbAddAccVO memeber = service.newAccountAddressForm(member_idx,account_idx,address_idx);
			model.addAttribute("member", memeber);
			System.out.println("계좌 추가 후 주소 변경");
			return "order/order_sellForm";
		}
		if(account_idx > 0) { // 계좌 추가시에 추가된 계좌로 보이게 하는 구문
			Order_SellFormMbAddAccVO member = service.newAccountSellForm(member_idx,account_idx);
			model.addAttribute("member", member);
			System.out.println("계좌만 추가");
			return "order/order_sellForm";
		}
		if(address_idx > 0) { // 주소 변경시에 변경된 주소로 보이게 하는 구문
			Order_SellFormMbAddAccVO member = service.clickAddress(member_idx,address_idx);
			model.addAttribute("member", member);
			System.out.println("주소만 변경");
			return "order/order_sellForm";
		} else {
			Order_SellFormMbAddAccVO member = service.selectMember(member_idx);
			model.addAttribute("member",member);
		}
		
		return "order/order_sellForm";
	}
	
	
	
	
	// 상품 판매 (맵핑호출 시 account_idx 를 주면 insert작업수행, account_idx를 주지않으면 insert작업 수행안함)
	@PostMapping(value = "/order_sellDetail")
	public String order_sellDetail(@ModelAttribute Order_sellVO order_sell) {
		System.out.println("post방식 호출됨");
		int product_idx = order_sell.getProduct_idx();
		int member_idx = order_sell.getMember_idx();
		
		//판매성공시 판매자 정보 입력
		if(order_sell.getAccount_idx() != 0) { // 계좌정보를 입력 받았을때만 insert작업 수행
			int insertCount = service.insertOrderSell(order_sell);
			if(insertCount > 0) {
				System.out.println("판매자 정보 등록 성공");
				
				return "redirect:/order_sellDetail?product_idx="+product_idx+"&member_idx="+member_idx;
			}else {
				System.out.println("판매실패");
				return "order/order_sellForm";
			}
			
		} else {
			return "redirect:/order_sellDetail?product_idx="+product_idx+"&member_idx="+member_idx;
		}
	}
	//상품 판매 성공시 redirect방식 호출(새로고침 중복 INSERT 방지)
	@GetMapping(value = "/order_sellDetail")
	public String order_sellDetail(Model model,@RequestParam int product_idx, @RequestParam int member_idx) {
		System.out.println("get방식 호출됨");
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		
		Order_sellVO orderSell = new Order_sellVO();
		orderSell.setMember_idx(member_idx);
		orderSell.setProduct_idx(product_idx);
		orderSell = service.selectOrderSell(orderSell);
		model.addAttribute("orderSell",orderSell);
		
		return "order/order_sellDetail";
	}
	

	
	
	
	
	
	//상품 구매 동의
	@GetMapping(value = "order_buyAgree")
	public String order_buyAgree(@RequestParam int product_idx, Model model,HttpSession session) {
		session.setAttribute("sId", "test2@naver.com"); // 세션아이디 임시 테스트용
		String sId = (String)session.getAttribute("sId");
		if(sId != null && !sId.equals("")) { // 로그인 중일경우 실행
		
			ProductVO product = service.productDetail(product_idx);
			model.addAttribute("product", product);
			return "order/order_buyAgree";
		}
		return "member/member_login";
	}
	
	
	//
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
}//900번라인
