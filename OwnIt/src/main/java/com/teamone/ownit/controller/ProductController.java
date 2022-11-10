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
	public String product_list(Model model) {
		List<ProductVO> productList = service.getProductList();
		
		model.addAttribute("productList", productList);
		System.out.println(productList);
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
	
	
	
























































	
	// 박주닮
	@GetMapping(value = "product_detail")
	public String product_detail(@RequestParam int product_idx, Model model) {
		ProductVO product = service.productDetail(product_idx);
			model.addAttribute("product", product);
			return "product/product_detail";
		
	}



























































































}