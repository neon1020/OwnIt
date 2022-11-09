package com.teamone.ownit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	
	@GetMapping(value = "noticeList")
	public String noticeList() {
		return "notice/notice_list";
	}
	
	@GetMapping(value = "noticeDetail")
	public String noticeDetail() {
		return "notice/notice_detail";
	}
	
	@GetMapping(value = "notice_authPolicy")
	public String authPolicy() {
		return "notice/notice_authPolicy";
	}
	
	@GetMapping(value = "notice_chat")
	public String chat() {
		return "notice/notice_chat";
	}
	
	@GetMapping(value = "notice_qna")
	public String qna() {
		return "notice/notice_qna";
	}
	
	@GetMapping(value = "admin_noticeDetail")
	public String admin8() {
		
		return "notice/admin_noticeDetail";
	}
	
	@GetMapping(value = "admin_noticeList")
	public String admin9() {
		
		return "notice/admin_noticeList";
	}
	
	@GetMapping(value = "admin_noticeUpdate")
	public String admin10() {
		
		return "notice/admin_noticeUpdate";
	}
	
	@GetMapping(value = "admin_noticeWrite")
	public String admin11() {
		
		return "notice/admin_noticeWrite";
	}
	
}
