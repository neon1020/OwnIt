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
import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.MypageVO;
import com.teamone.ownit.vo.PageInfo;
import com.teamone.ownit.vo.WishlistVO;

@Controller
public class MypageController {
	@Autowired
	private MypageService service;
	
	
	
	
	
	// 류혜지
	//메인 (프로필, 구매내역, 판매내역, 위시리스트 목록)
	@GetMapping(value = "/mypage")
	public String mypage() {
		return "mypage/mypage_main";
	}
	
	//주소록 목록
	@GetMapping(value = "address")
	public String address(@RequestParam String id, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		System.out.println(id + ", " + sId);		
		if(id == null || sId == null || id.equals("") || (!id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		} else {
		List<AddressVO> address = service.getAddress(id);
		model.addAttribute("address", address);
		System.out.println(address);
		// member/member_info.jsp 페이지로 이동
		return "mypage/mypage_address";
		}		
	}
	
	//주소록 추가
	@PostMapping(value = "addAddress")
	public String writePro(@ModelAttribute AddressVO address, Model model) {
		int insertCount = service.registAddress(address);
		System.out.println(address);
		if(insertCount > 0) {
			return "redirect:/address";
		} else {
			model.addAttribute("msg", "등록 실패!");
			return "notice/fail_back";
		}
	}	
	
	//주소록 삭제
	
	//위시리스트 목록
	@GetMapping(value = "wishlist")
	public String wishlist(@RequestParam String id, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		System.out.println(id + ", " + sId);
		
		if(id == null || sId == null || id.equals("") || (!id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		} else {
		List<WishlistVO> wishlist = service.getwishlist(id);
		model.addAttribute("wishlist", wishlist);
		System.out.println(wishlist);
		// member/member_info.jsp 페이지로 이동
		return "mypage/mypage_wishlist";
		}
	}
	
	//판매내역 목록
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
	
	//회원 정보 불러오기
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
	
	//비밀번호 수정
	@PostMapping(value = "/mypage_revisePro")
	public String revise(@ModelAttribute MemberVO member, @RequestParam String newPasswd, 
			Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null && !sId.equals("")) {
			String passwd = service.getPasswd(sId);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String secureNewPassword = encoder.encode(newPasswd);
			// System.out.println("새비밀번호 : " + secureNewPassword);
			
			if(passwd == null || !encoder.matches(member.getMember_passwd(), passwd)) {
				model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				return "notice/fail_back";
			} else {
				// Service 객체의 modifyMember() 메서드를 호출하여 회원 정보 수정
				// => 파라미터 : MemberVO 객체(member), 새 패스워드(newPasswd)
				// => 리턴타입 : int(updateCount)
				int updateCount = service.modifyMember(member, secureNewPassword);
				System.out.println(member);
				System.out.println("결과 : " + updateCount);
				
				// 업데이트 결과(updateCount) 성공(0보다 클 경우)이면
				if(updateCount > 0) {
					// "MemberInfo.me" 서블릿 요청(id 파라미터 필요)
					return "redirect:/mypage_revise?id=" + member.getMember_id();
				} else {
					// 아니면(= 실패) Model 객체의 "msg" 속성에 "수정 실패!" 저장 후 fail_back.jsp 이동
					model.addAttribute("msg", "수정 실패!");
					return "notice/fail_back";
				}
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
	
	// 마이페이지 : 계좌 정보 불러오기
	@GetMapping(value = "mypage_account")
	public String account(int member_idx, Model model) {
		
		// 계좌 리스트 불러와서 model 객체에 저장
		List<AccountVO> account = service.getAccountList(member_idx);
		model.addAttribute("account", account);
		
		// 계좌 갯수 불러와서 model 객체에 저장
		int accountCount = service.getAccountCount(member_idx);
		model.addAttribute("accountCount", accountCount);
		
		return "mypage/mypage_account";
	}
	
	// 마이페이지 : 계좌 추가 작업
	@PostMapping(value = "mypage_addAccount")
	public String addAccount(AccountVO account, int member_idx, HttpSession session, Model model) {
		int accountCount = service.getAccountCount(member_idx);
		
		if(accountCount >= 4) {
			model.addAttribute("msg", "정산 계좌는 최대 4개까지 등록 가능합니다.");
			return "notice/fail_back";
		} else {
			int insertCount = service.addAccount(account, member_idx, accountCount);
			
			if(insertCount > 0) {
				model.addAttribute("accountCount", accountCount);
				return "redirect:/mypage_account?member_idx=" + member_idx;
			} else {
				model.addAttribute("msg", "계좌 추가에 실패하였습니다. 다시 시도해주세요.");
				return "notice/fail_back";
			}
		}
		
	}
	
	// 마이페이지 : 계좌 수정 작업
	@PostMapping(value = "editAccount")
	public String editAccount(int account_idx, int member_idx, AccountVO account, Model model) {
		account.setAccount_idx(account_idx);
		
		int updateCount = service.modifyAccount(account);
		
		if(updateCount > 0) {
			return "redirect:/mypage_account?member_idx=" + member_idx;
		} else {
			model.addAttribute("msg", "계좌 수정에 실패하였습니다. 다시 시도해주세요.");
			return "notice/fail_back";
		}
	}
	
	// 마이페이지 : 계좌 삭제 작업
	@PostMapping(value = "deleteAccount")
	public String deleteAccount(int account_idx, int member_idx, Model model) {
		int deleteCount = service.removeAccount(account_idx);
		
		if(deleteCount > 0) {
			return "redirect:/mypage_account?member_idx=" + member_idx;
		} else {
			model.addAttribute("msg", "계좌 삭제에 실패하였습니다. 다시 시도해주세요.");
			return "notice/fail_back";
		}
	}
	
	// 마이페이지 : 기본 계좌 설정 작업
	@PostMapping(value = "defaultAccount")
	public String defaultAccount(int account_idx, int member_idx, Model model) {
		// 계좌 전체 1(나머지 계좌)로 설정
		int setOther = service.otherAccount(member_idx);
		
		// 해당 계좌 0(기본 계좌)으로 설정
		int setDefault = service.defaultAccount(member_idx, account_idx);
		
		if(setOther > 0 && setDefault > 0) {
			return "redirect:/mypage_account?member_idx=" + member_idx;
		} else {
			model.addAttribute("msg", "기본 계좌 설정에 실패하였습니다. 다시 시도해주세요.");
			return "notice/fail_back";
		}
	}
	
} // controller 끝
