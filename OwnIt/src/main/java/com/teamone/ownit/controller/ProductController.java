package com.teamone.ownit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.teamone.ownit.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@GetMapping(value = "product_detail")
	public String product_detail() {
		return "product/product_detail";
	}
	
	@GetMapping(value = "product_list")
	public String product_list() {
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
	
}
































































// 박주닮


































































































