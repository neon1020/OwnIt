package com.teamone.ownit.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.teamone.ownit.service.MemberService;
import com.teamone.ownit.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	// 정채연
	@GetMapping(value = "/member_joinForm")
	public String joinForm() {
		return "member/member_joinForm";
	}
	
	@GetMapping(value = "/member_login")
	public String login(HttpSession session, Model model) {
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
		
		// 선택 약관 null 값 처리
		if(member.getMember_agree() == null) {
			member.setMember_agree("0");
		}
		
		// 1. 패스워드 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(member.getMember_passwd());
		member.setMember_passwd(securePassword);
		
		// 2. 회원가입 작업 수행 - member 테이블
		int insertCount = service.joinMember(member);
		int insertAddress = service.joinAddress(member, address);
		
		if(insertCount > 0 && insertAddress > 0) {
			return "redirect:/MemberSendAuthMail?id=" + member.getMember_id();
		} else {
			model.addAttribute("msg", "회원가입 실패");
			return "notice/fail_back";
		}
	}
	
	// 회원가입 후 인증 메일 발송
	@GetMapping(value = "MemberSendAuthMail")
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
			return "redirect:/MemberSendAuthMail?id=" + id + "&member_idx=" + member_idx;
		} else {
			return "member/member_joinSuccess";
		}
	}
	
	// 인증 메일 발송 후 인증 처리 작업
	@GetMapping(value = "MemberAuth")
	public String MemberAuthPro(@RequestParam String id, @RequestParam String authCode, Model model) {
		Auth_infoVO authInfo = new Auth_infoVO();
		authInfo.setMember_idx(service.getMember_idx(id));
		authInfo.setAuth_code(authCode);
		
		int getAuthInfo = service.getAuthInfo(authInfo);
		
		if(getAuthInfo > 0) {
			int updateCount = service.modifyAuthInfo(authInfo);
			int deleteCount = service.removeAuthInfo(authInfo);
			
			if(updateCount > 0 && deleteCount > 0) {
				return "redirect:/member_login";
			} else {
				model.addAttribute("msg", "인증 정보 갱신 실패! 재시도 해주세요.");
				return "notice/fail_back";
			}
		} else {
			model.addAttribute("msg", "인증 실패! 인증 정보를 확인해주세요.");
			return "notice/fail_back"; 
		}
	}
	
	// 로그인 수행
	@PostMapping(value = "member_loginPro")
	public String loginPro(@ModelAttribute MemberVO member, @RequestParam(value="save_email", required=false) String save_email,
			Model model, HttpSession session, HttpServletResponse response) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// member 객체의 member_id, member_passwd 와 일치하는 패스워드 가져오기
		String passwd = service.getPasswd(member);
		
		if(passwd == null || !encoder.matches(member.getMember_passwd(), passwd)) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "notice/fail_back";
		} else {
			// 메일 인증 완료 여부 확인
			int getAuthStatus = service.getAuthStatus(member);
			if(getAuthStatus > 0) {
				session.setAttribute("sId", member.getMember_id());
				
				// 회원 정보 가져와서 Model 객체에 저장
				MemberVO se_member = service.getMember(member);
				session.setAttribute("member", se_member);
				
				// 아이디 저장 여부에 따라 쿠키 객체 저장 및 삭제
				if(save_email != null) {
					Cookie cookie = new Cookie("cookieId", member.getMember_id());
					cookie.setMaxAge(60 * 60 * 24);
					response.addCookie(cookie);
				} else {
					Cookie cookie = new Cookie("cookieId", null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				
				return "redirect:/";
				
			} else {
				model.addAttribute("msg", "메일 인증 후 로그인해주세요.");
				return "notice/fail_back";
			}
			
		}
	}
	
	// 로그아웃 수행
	@GetMapping(value = "member_logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 탈퇴
	@GetMapping(value = "member_remove")
	public String removeMember(HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("sId");
		int deleteCount = service.removeMember(member_id);
		
		if(deleteCount > 0) {
			session.invalidate();
			return "redirect:/";
		} else {
			model.addAttribute("msg", "탈퇴에 실패하였습니다. 다시 시도해주세요.");
			return "notice/fail_back";
		}
	}
	
	// 패스워드 찾기
	@GetMapping(value = "member_findPasswd")
	public String findPasswd(@RequestParam String member_id, Model model) {
		int getMember = service.getMember2(member_id);
		
		if(getMember > 0) {
			// GenerateUserAuthenticationCode 클래스 인스턴스 생성 및 인증코드 생성
			GenerateUserAuthenticationCode code = new GenerateUserAuthenticationCode(12);
			String newPass = code.getAuthCode();
			
			// 인증 메일 발송에 사용될 정보(수신자 메일주소, 메일 제목, 메일 본문) 생성
			String subject = "[OwnIt] OwnIt 비밀번호 찾기 메일";
			String content = "새로운 비밀번호는 " + newPass + " 입니다.<br>"
					+ "<a href='http://localhost:8081/ownit/member_login'><b>로그인 페이지로 이동</b></a>";
			
			// 인증 메일 발송을 위해 SendMail 클래스 인스턴스 생성 및 sendMail() 메소드 호출하여 메일 발송
			SendMail sendMail = new SendMail();
			boolean isSendSuccess = sendMail.sendMail(member_id, subject, content);
			
			// 새 비밀번호 암호화하여 member 테이블에 저장
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String secureNewPassword = encoder.encode(newPass);
			
			int updateCount = service.modifyPasswd(member_id, secureNewPassword);
			
			if(!isSendSuccess) {
				model.addAttribute("msg", "메일 발송에 실패하였습니다. 다시 시도해주세요.");
				return "notice/fail_back";
			} else if(updateCount == 0) {
				model.addAttribute("msg", "정보 수정 중 오류가 발생하였습니다. 다시 시도해주세요.");
				return "notice/fail_back";
			} else {
				return "member/member_findPasswdResult";
			}
		} else {
			model.addAttribute("msg", "존재하지 않는 회원입니다.");
			return "notice/fail_back";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 류혜지 - 500
	
	
    // 아이디 찾기 실행
	@GetMapping(value="member_findEmail")
	public String findEmailPro(@RequestParam String member_phone, Model model) {
		System.out.println(member_phone + ", " + member_phone);
		MemberVO member = service.findEmail(member_phone);
		System.out.println(member);
		model.addAttribute("member", member);
		
		return "member/member_findEmail";
	}
	
	
	
	
	
	
	
	
}
