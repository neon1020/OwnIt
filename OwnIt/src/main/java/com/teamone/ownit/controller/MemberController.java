package com.teamone.ownit.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamone.ownit.auth.GenerateUserAuthenticationCode;
import com.teamone.ownit.auth.SendMail;
import com.teamone.ownit.service.MemberService;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.Auth_infoVO;
import com.teamone.ownit.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

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
	
	// 회원가입 - 이메일 중복 확인
	@RequestMapping("/checkEmail")
	@ResponseBody
	public Map<Object, Object> checkEmail(@RequestBody String email) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = service.checkEmail(email);
		map.put("cnt", count);
		
		return map;
	}
	
	// 회원가입 - 닉네임 중복 확인
	@RequestMapping("/checkNickname")
	@ResponseBody
	public Map<Object, Object> checkNickname(@RequestBody String nickname) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = service.checkNickname(nickname);
		map.put("cnt", count);
		
		return map;
	}
	
	// 회원가입 수행
	@PostMapping(value = "member_joinPro")
	public String joinPro(@ModelAttribute MemberVO member, @ModelAttribute AddressVO address, Model model) {
		// 1. 패스워드 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(member.getMember_passwd());
		member.setMember_passwd(securePassword);
		
		// 2. 회원가입 작업 수행 - member 테이블
		int insertCount = service.joinMember(member);
		int insertAddress = service.joinAddress(member, address);
		
		if(insertCount > 0 && insertAddress > 0) {
			return "MemberSendAuthMail?id=" + member.getMember_id();
		} else {
			model.addAttribute("msg", "회원가입 실패");
			return "notice/fail_back";
		}
	}
	
	// 회원가입 후 인증 메일 발송
	@PostMapping(value = "MemberSendAuthMail")
	public String SendMailPro(@RequestParam String id, Model model) {
		// GenerateUserAuthenticationCode 클래스 인스턴스 생성 및 인증코드 생성
		GenerateUserAuthenticationCode code = new GenerateUserAuthenticationCode(20);
		String auth_code = code.getAuthCode();
		
		// member_idx 가져오기
		int member_idx = service.getMember_idx(id);
		
		// AuthInfoBean 객체 생성 및 아이디, 인증코드 저장
		Auth_infoVO authInfo = new Auth_infoVO(member_idx, auth_code);
		
		// 인증 메일 발송에 사용될 정보(수신자 메일주소, 메일 제목, 메일 본문) 생성
		String subject = "[OwnIt] OwnIt 가입 인증 메일";
		String content = "<a href='http://localhost:8081/ownit/MemberAuth?id=" + id +"&authCode=" + auth_code + "'><b>클릭하여 인증을 진행해주세요.</b></a>";
		
		// 인증 메일 발송을 위해 SendMail 클래스 인스턴스 생성 및 sendMail() 메소드 호출하여 메일 발송
		SendMail sendMail = new SendMail();
		boolean isSendSuccess = sendMail.sendMail(id, subject, content);
		
		// 인증 정보 등록 전 인증 정보 유무 확인 작업
		int getAuthCode = service.getAuthCode(authInfo);
		int insertCount = 1, updateCount = 1;
		
		if(getAuthCode > 0) {
			// 기존 인증 정보 있을 경우 update 작업 수행
			updateCount = service.modifyAuthCode(authInfo);
		} else {
			// 기존 인증 정보 없을 경우 insert 작업 수행
			insertCount = service.joinAuthCode(authInfo);
		}
		
		if(!isSendSuccess || insertCount == 0 || updateCount == 0) {
			return "MemberSendAuthMail?id=" + id + "&member_idx=" + member_idx;
		} else {
			return "member/member_joinSuccess";
		}
	}
	
	// 인증 메일 발송 후 인증 처리 작업
	@PostMapping(value = "MemberAuth")
	public String MemberAuthPro(@RequestParam String id, @RequestParam String authCode, Model model) {
		Auth_infoVO authInfo = new Auth_infoVO();
		authInfo.setMember_idx(service.getMember_idx(id));
		authInfo.setAuth_code(authCode);
		
		int getAuthInfo = service.getAuthInfo(authInfo);
		
		if(getAuthInfo > 0) {
			int updateCount = service.modifyAuthInfo(authInfo);
			int deleteCount = service.removeAuthInfo(authInfo);
			
			if(updateCount > 0 && deleteCount > 0) {
				return "member_login";
			} else {
				model.addAttribute("msg", "인증 정보 갱신 실패! 재시도 해주세요.");
				return "notice/fail_back";
			}
		} else {
			model.addAttribute("msg", "인증 실패! 인증 정보를 확인해주세요.");
			return "notice/fail_back";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 류혜지 - 300
	@GetMapping(value = "/member_findEmail")
	public String findEmail() {
		return "member/member_findEmail";
	}
	
}
