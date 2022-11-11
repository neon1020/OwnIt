package com.teamone.ownit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamone.ownit.service.OrderService;
import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.MemberAddressAccountVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.ProductVO;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	// 구매주문 폼
	@GetMapping(value = "order_buyForm")
	public String order_buyForm(@RequestParam int product_idx, Model model) {
		//이미지 하나 가져오는 작업 불필요시 삭제
		ImageVO image = service.selectDetailImage(product_idx);
		model.addAttribute("image", image);
	
		//프로덕트 정보 가져오는 작업 불필요시 삭제
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		return "order/order_buyForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
// 박주닮 101번째라인
	
	
	
	
	
	
	// 상품 판매 동의
	@GetMapping(value = "order_sellAgree")
	public String order_sellAgree(@RequestParam int product_idx, Model model) {
		ImageVO image = service.selectDetailImage(product_idx);
		model.addAttribute("image", image);
	
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		return "order/order_sellAgree";
	}
	
	// 상품판매폼
	@GetMapping(value = "order_sellForm")
	public String order_sellForm(@RequestParam int product_idx, Model model, HttpSession session) {
		//상품의 이미지를 불러오는 메서드
		ImageVO image = service.selectDetailImage(product_idx);
		model.addAttribute("image", image);
		//상품의 정보를 불러오는 메서드
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		//판매자의 정보를 불러오는 메서드
		session.setAttribute("sId", "test2@naver.com"); //임시 테스트용 세션저장
		String sId = (String)session.getAttribute("sId");
		MemberAddressAccountVO member = service.selectMember(sId);
		model.addAttribute("member",member);
		
		return "order/order_sellForm";
	}
	
	
	
	// 상품 판매 정산 정보
	@PostMapping(value = "order_sellDetail")
	public String order_sellDetail(@RequestParam int product_idx, 
									@RequestParam int member_idx, 
									@RequestParam int account_idx,  Model model) {
		
		ImageVO image = service.selectDetailImage(product_idx);
		model.addAttribute("image", image);
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		
		//판매성공시 판매자 정보 입력
		int insertCount = service.insertOrderSell(product_idx,member_idx,account_idx);
		
		if(insertCount > 0) {
			System.out.println("판매성공");
			
			return "order/order_sellDetail";
		}else {
			System.out.println("판매실패");
			return null;
		}
		
		
	}
	
	@GetMapping(value = "member_buy_agree")
	public String member_buy_agree() {
		
		return "order/order_buyAgree";
	}
	
	@GetMapping(value = "member_buy_form")
	public String member_buy_form() {
		
		return "order/order_buyForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			
}//200번라인
