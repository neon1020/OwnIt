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
//			ImageVO image = service.selectDetailImage(product_idx);
//			model.addAttribute("image", image);
			
			ProductVO product = service.productDetail(product_idx);
			model.addAttribute("product", product);
			return "order/order_sellAgree";
		}
		return "member/member_login";
	}
	
	// 상품판매폼
	@PostMapping(value = "/order_sellForm")
	public String order_sellForm(@RequestParam int product_idx,@ModelAttribute AddressVO address,Model model, HttpSession session) {
		
		// 주소를 입력 받았을시에만 실행
		if(address.getAddress1() != null && !address.getAddress1().equals("")) {
				int insertCount = service.insertAddress(address);
				if(insertCount > 0) {
					//주소추가시 가장 최근에 등록된 주소 외에 원래 있던 주소의 gb를 1로 바꿔준다.
					System.out.println("주소추가 성공");
					int updateCount = service.updateAddress(address);
					if(updateCount > 0) {
						System.out.println("업데이트 성공");
					}
			}
		}
		return "redirect:/order_sellForm?product_idx="+product_idx;
	}
	
	// 상품판매폼(PRG 패턴)
	@GetMapping(value = "/order_sellForm")
	public String order_sellForm(@RequestParam int product_idx,Model model, HttpSession session) {
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		String sId = (String)session.getAttribute("sId");
		MemberVO memberIdx = service.selectMemberIdx(sId);
		int member_idx = memberIdx.getMember_idx();
		
		Order_SellFormMbAddAccVO member = service.selectMember(member_idx);
		model.addAttribute("member",member);
		List<Order_SellFormMbAddAccVO> addressList = service.selectAddressList(member_idx);
		model.addAttribute("addressList", addressList);
		
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
//		session.setAttribute("sId", "test2@naver.com"); // 세션아이디 임시 테스트용
		String sId = (String)session.getAttribute("sId");
		if(sId != null && !sId.equals("")) { // 로그인 중일경우 실행
//			ImageVO image = service.selectDetailImage(product_idx);
//			model.addAttribute("image", image);
		
			ProductVO product = service.productDetail(product_idx);
			model.addAttribute("product", product);
			return "order/order_buyAgree";
		}
		return "member/member_login";
	}
	
	
	// orderSellForm에서 주소록 주소 변경시 
	@ResponseBody
	@PostMapping(value = "OrderFormChangeAddress")
	public void OrderFormChangeAddress(@RequestParam int address_idx,HttpSession session) {
		System.out.println(address_idx);
		int updateCount = service.updateAddressForm(address_idx);
		if(updateCount > 0) {
			System.out.println("업데이트 성공");
			String sId = (String)session.getAttribute("sId");
			MemberVO memberIdx = service.selectMemberIdx(sId);
			int member_idx = memberIdx.getMember_idx();
			// 지정한 address_idx 빼고 gb를 모두 1로바꾸는 구문 재사용
			service.updateAddressSelect(address_idx,member_idx);
		}
	}
		
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
}//900번라인
