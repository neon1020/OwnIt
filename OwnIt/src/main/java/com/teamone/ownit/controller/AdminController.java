package com.teamone.ownit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping(value = "admin")
	public String admin() {
		
		return "admin/admin_main";
	}
	
	@GetMapping(value = "admin_productList")
	public String admin2() {
		
		return "admin/admin_productList";
	}
	
	@GetMapping(value = "admin_productUpdate")
	public String admin3() {
		
		return "admin/admin_productUpdate";
	}
	
	@GetMapping(value = "admin_productWriteForm")
	public String admin4() {
		
		return "admin/admin_productWriteForm";
	}
	
	@GetMapping(value = "admin_productBuy")
	public String admin5() {
		
		return "admin/admin_productBuy";
	}
	
	@GetMapping(value = "admin_productSell")
	public String admin6() {
		
		return "admin/admin_productSell";
	}
	
	@GetMapping(value = "admin_memberList")
	public String admin7() {
		
		return "admin/admin_memberList";
	}
	

}
