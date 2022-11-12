package com.teamone.ownit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.teamone.ownit.service.MemberService;
import com.teamone.ownit.vo.MemberVO;

@Controller
public class MemberController {

	// 정채연
	@GetMapping(value = "/member_findPasswd")
	public String findPasswd() {
		return "member/member_findPasswd";
	}
	
	@GetMapping(value = "/member_joinForm")
	public String joinForm() {
		return "member/member_joinForm";
	}
	
	@GetMapping(value = "/member_login")
	public String login() {
		return "member/member_login";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 류혜지 - 300
	@Autowired
	private MemberService service;
	
	//이메일 찾기 페이지 이동 
	@GetMapping(value = "member_findEmailForm")
	public String findEmailForm() {
		return "member/member_findEmailForm";
	}
	
    // 아이디 찾기 실행
	@PostMapping(value="member_findEmailResult")
	public String findEmailPro(MemberVO member, Model model) {
		member = service.findEmail(member);
		
		if(member == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("member_id", member.getMember_id());
		}
		return "member/member_findEmailForm";
	}
	
	
	
	
	
	
	
	
	
	
}
