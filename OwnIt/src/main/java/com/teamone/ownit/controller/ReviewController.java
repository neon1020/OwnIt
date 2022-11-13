package com.teamone.ownit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.teamone.ownit.service.ReviewService;
import com.teamone.ownit.vo.ReviewListVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	@GetMapping(value = "/review")
	public String review(Model model) {
		List<ReviewListVO> reviewList = service.getReviewList();
		model.addAttribute("reviewList", reviewList);
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
