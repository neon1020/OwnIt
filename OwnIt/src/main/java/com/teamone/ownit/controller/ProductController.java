package com.teamone.ownit.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamone.ownit.service.ProductService;
import com.teamone.ownit.vo.*;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;

	@GetMapping(value = "product_list")
	public String product_list(Model model, HttpSession session) {
//		String sId = (String)session.getAttribute("sId");
		String sId = "test1@naver.com";
		List<ProductVO> productList = service.getProductList(sId);
		System.out.println(productList);
		int cnt = 0;
		for(ProductVO product : productList) cnt++;
		model.addAttribute("productList", productList);
		model.addAttribute("cnt", cnt);
		return "product/product_list";
	}
	
	@GetMapping(value = "cart")
	public String cart() {
		return "order/order_cart";
	}
	
	@GetMapping(value = "order_complete")
	public String complete() {
		return "product/product_order_complete";
	}
	
	@GetMapping(value = "listProductByCategory")
	public String listProduct(String id, Model model) {
		List<ProductVO> productList = service.getCategorisedProduct(id);
//		System.out.println(productList);
		int cnt = 0;
		for(ProductVO product : productList) cnt++;
		model.addAttribute("productList", productList);
		model.addAttribute("cnt", cnt);
		return "product/product_list";
	}

	@GetMapping(value = "arrayByCategory")
	public String arrayByCategory(String id, Model model) {
		List<ProductVO> productList = service.arrayByCategory(id);
		System.out.println(productList);
		int cnt = 0;
		for(ProductVO product : productList) cnt++;
		model.addAttribute("productList", productList);
		model.addAttribute("cnt", cnt);
		return "product/product_list";
	}

	@GetMapping(value = "arrayByBrand")
	public String arrayByBrand(String chArr) {
		System.out.println(chArr);
		return "";
	}

	@GetMapping(value = "addLikeList")
	public String addLikeList(HttpSession session, int product_idx) {
//		String sId = (String)session.getAttribute("sId");
		System.out.println(product_idx);
		String sId = "test1@naver.com";
		int ischecked = service.checkLike(sId, product_idx);
		if(ischecked > 0) System.out.println("존재하는 wishlist");	
		// TODO wishlist 존재여부 판별했으므로 있으면 삭제작업, 없으면 추가작업


		return "";
	}













	
	
	// 박주닮
	@GetMapping(value = "product_detail")
	public String product_detail(@RequestParam int product_idx, Model model) {
		
		ImageVO image = service.selectDetailImage(product_idx);
			model.addAttribute("image", image);
		
		
		ProductVO product = service.productDetail(product_idx);
			model.addAttribute("product", product);
			return "product/product_detail";
		
	}






















































































}