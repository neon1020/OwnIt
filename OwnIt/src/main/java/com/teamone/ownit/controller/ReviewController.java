package com.teamone.ownit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

	@GetMapping(value = "/review")
	public String review() {
		return "review/review";
	}
	
	@GetMapping(value = "/review_detail")
	public String reviewDetail() {
		return "review/review_detail";
	}
	
	@GetMapping(value = "/review_mystyle")
	public String reviewMystyle() {
		return "review/review_mystyle";
	}
	
	@GetMapping(value = "/review_writeForm")
	public String reviewWrite() {
		return "review/review_writeForm";
	}
	
	@GetMapping(value = "/review_modifyForm")
	public String reviewModify() {
		return "review/review_modifyForm";
	}
	
}
