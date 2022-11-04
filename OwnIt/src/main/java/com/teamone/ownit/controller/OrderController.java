package com.teamone.ownit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
	
	@GetMapping(value = "member_sell_agree")
	public String member_sell_agree() {
		
		return "order/order_sellAgree";
	}
	
	@GetMapping(value = "member_sell_form")
	public String member_sell_form() {
		
		return "order/order_sellForm";
	}
	
	@GetMapping(value = "member_sell_detail")
	public String memeber_sell_detail() {
		
		return "order/order_sellDetail";
	}
	
	@GetMapping(value = "member_buy_agree")
	public String member_buy_agree() {
		
		return "order/order_buyAgree";
	}
	
	@GetMapping(value = "member_buy_form")
	public String member_buy_form() {
		
		return "order/order_buyForm";
	}
	
}
