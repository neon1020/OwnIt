package com.teamone.ownit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	
	@GetMapping(value = "address")
	public String address() {
		return "mypage/mypage_address";
	}
	
	@GetMapping(value = "account")
	public String account() {
		return "mypage/mypage_account";
	}
	
	@GetMapping(value = "wishlist")
	public String wishlist() {
		return "mypage/mypage_wishlist";
	}
	
	@GetMapping(value = "/mypage")
	public String mypage() {
		return "mypage/mypage_main";
	}
	
	@GetMapping(value = "/mypage_order")
	public String order() {
		return "mypage/mypage_order";
	}
	
	@GetMapping(value = "/mypage_sell")
	public String sell() {
		return "mypage/mypage_sell";
	}
	
	@GetMapping(value = "/mypage_revise")
	public String revise() {
		return "mypage/mypage_revise";
	}
	
}
