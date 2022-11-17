package com.teamone.ownit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamone.ownit.service.MypageService;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.MypageVO;
import com.teamone.ownit.vo.PageInfo;

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
	public String sell(
			@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, Model model, 
			@RequestParam String id, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		System.out.println(id + ", " + sId);
		
		if(id == null || sId == null || id.equals("") || (!id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		} else {
			// -------------------------------------------------------------------
			// 페이징 처리를 위한 계산 작업
			int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (pageNum - 1) * listLimit;
			
			// Service 객체의 getNoticeList() 메서드를 호출하여 게시물 목록 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
			// => 리턴타입 : List<NoticeVO>(noticeList)
			List<MypageSellListVO> mysell = service.getMySell(startRow, listLimit, searchType, keyword, id);
			// -------------------------------------------
			// Service 객체의 getNoticeListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = service.getMySellListCount(searchType, keyword, id);
			
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			// Math 클래스의 ceil() 메서드를 활용하여 소수점 올림 처리를 통해 전체 페이지 수 계산
			// => listCount / listLimit 를 실수 연산으로 수행하여 소수점까지 계산하고
			//    Math.ceil() 메서드를 통해 올림 처리 후 결과값을 정수로 변환
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			// 시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			// 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
			// 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
			PageInfo pageInfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			System.out.println(pageInfo);
			System.out.println(mysell);
			// --------------------------------------------------------------------------------
			// 게시물 목록(noticeList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
			model.addAttribute("mysell", mysell);
			model.addAttribute("pageInfo", pageInfo);
			
			return "mypage/mypage_sell";
		}
	}
	
	
	
	
	@GetMapping(value = "/mypage_revise")
	public String revise(@RequestParam String id, Model model, HttpSession session) {
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
	
	@PostMapping(value = "/mypage_revisePro")
	public String revise(@ModelAttribute MemberVO member, @RequestParam String newPasswd, 
			Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		String id = member.getMember_id();			
		
		if(id != null && sId != null && id.equals(sId) || sId.equals("admin")) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			// 새 패스워드는 존재할 경우에만 해싱
			if(newPasswd != null && !newPasswd.equals("")) {
				newPasswd = encoder.encode(newPasswd);
			}
			
			// Service 객체의 modifyMember() 메서드를 호출하여 회원 정보 수정
			// => 파라미터 : MemberVO 객체(member), 새 패스워드(newPasswd)
			// => 리턴타입 : int(updateCount)
			int updateCount = service.modifyMember(member, newPasswd);
			System.out.println(member);
			System.out.println(newPasswd);
			System.out.println("결과 : " + updateCount);
			
			// 업데이트 결과(updateCount) 성공(0보다 클 경우)이면
			if(updateCount > 0) {
				// "MemberInfo.me" 서블릿 요청(id 파라미터 필요)
				return "redirect:/mypage_revise?id=" + id;
			} else {
				// 아니면(= 실패) Model 객체의 "msg" 속성에 "수정 실패!" 저장 후 fail_back.jsp 이동
				model.addAttribute("msg", "수정 실패!");
				return "notice/fail_back";
			}
		} else {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		}		
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
