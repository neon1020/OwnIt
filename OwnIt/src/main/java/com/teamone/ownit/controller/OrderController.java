package com.teamone.ownit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamone.ownit.service.OrderService;
import com.teamone.ownit.vo.ImageVO;
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
	public String order_sellForm(@RequestParam int product_idx, Model model) {
		ImageVO image = service.selectDetailImage(product_idx);
		model.addAttribute("image", image);
	
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		return "order/order_sellForm";
	}
	
	
	
	// 상품 판매 정산 정보
	@GetMapping(value = "order_sellDetail")
	public String order_sellDetail(@RequestParam int product_idx, Model model) {
		ImageVO image = service.selectDetailImage(product_idx);
		model.addAttribute("image", image);
	
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		return "order/order_sellDetail";
	}
	
	@GetMapping(value = "order_buyAgree")
	public String order_buyAgree(@RequestParam int product_idx, Model model) {
		ImageVO image = service.selectDetailImage(product_idx);
		model.addAttribute("image", image);
	
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		return "order/order_buyAgree";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//200번라인
