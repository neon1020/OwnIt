package com.teamone.ownit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamone.ownit.service.MypageService;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.MypageVO;
import com.teamone.ownit.vo.Order_sellVO;

@Controller
public class MypageController {
	@Autowired
	private MypageService service;
	
	// 류혜지
	@GetMapping(value = "address")
	public String address() {
		return "mypage/mypage_address";
	}
	
	@GetMapping(value = "wishlist")
	public String wishlist() {
		return "mypage/mypage_wishlist";
	}
	
	@GetMapping(value = "/mypage")
	public String mypage() {
		return "mypage/mypage_main";
	}
	
	@GetMapping(value = "/mypage_sell")
	public String sell(@RequestParam String id, Model model, HttpSession session) {
		session.setAttribute("sId", "test9@naver.com");
		String sId = (String)session.getAttribute("sId");
		System.out.println(id + ", " + sId);	
		if(id == null || sId == null || id.equals("") || (!id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		} else {
			MypageSellListVO mysell = service.getMySell(id); // 파라미터는 검색할 아이디 전달
			// Model 객체에 "member" 속성명으로 MemberVO 객체 저장
			System.out.println(mysell);
			model.addAttribute("mysell", mysell);
			// member/member_info.jsp 페이지로 이동
			return "mypage/mypage_sell";
		}
	}
	
	@GetMapping(value = "/mypage_revise")
	public String revise(@RequestParam String id, Model model, HttpSession session) {
		session.setAttribute("sId", "test9@naver.com");
		String sId = (String)session.getAttribute("sId");
		System.out.println(id + ", " + sId);
		
		if(id == null || sId == null || id.equals("") || (!id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		} else {
			MypageVO mypage = service.getMemberInfo(id); // 파라미터는 검색할 아이디 전달
			// Model 객체에 "member" 속성명으로 MemberVO 객체 저장
			System.out.println(mypage);
			model.addAttribute("mypage", mypage);
			// member/member_info.jsp 페이지로 이동
			return "mypage/mypage_revise";
		}
		
		
	}
	
	@GetMapping(value = "/mypage_revisePro")
	public String revise() {
		return "mypage/mypage_revise";
		
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 300
	@GetMapping(value = "/mypage_order")
	public String order() {
		return "mypage/mypage_order";
	}
	
	@GetMapping(value = "account")
	public String account() {
		return "mypage/mypage_account";
	}
	
}
