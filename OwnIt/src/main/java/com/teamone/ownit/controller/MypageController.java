package com.teamone.ownit.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List; 
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
import com.teamone.ownit.vo.Order_buyMyVO;
import com.teamone.ownit.vo.Order_buyVO;
import com.teamone.ownit.vo.PageInfo;
import com.teamone.ownit.vo.ReviewVO;
import com.teamone.ownit.vo.WishlistVO;


@Controller
public class MypageController {
	@Autowired
	private MypageService service;
	
	
	
	
	
	// 류혜지
	
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
	
	//메인 (프로필, 구매내역, 판매내역, 위시리스트 목록)
	@GetMapping(value = "/mypage")
	public String mypage() {
		return "mypage/mypage_main";
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
	
	//위시리스트 목록
	@GetMapping(value = "wishlist")
	public String wishlist(@RequestParam int member_idx, Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum) {
		String sId = (String)session.getAttribute("sId");
		if(sId != null && !sId.equals("")) {	
			// -------------------------------------------------------------------
			// 페이징 처리를 위한 계산 작업
			int listLimit = 9; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 9; // 한 페이지 당 표시할 페이지 목록 갯수			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (pageNum - 1) * listLimit;			
			
			List<WishlistVO> wishlist = service.getWishlist(member_idx, startRow, listLimit);
			
			// -------------------------------------------
			// Service 객체의 getNoticeListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = service.getWishlistCount(member_idx);
			
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
			// --------------------------------------------------------------------------------
			// 게시물 목록(noticeList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장			
			model.addAttribute("wishlist", wishlist);
			model.addAttribute("pageInfo", pageInfo);
			System.out.println(wishlist);
			// member/member_info.jsp 페이지로 이동
			return "mypage/mypage_wishlist";
		} else {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		}
	}
	
	//위시리스트 삭제
	@GetMapping(value = "deleteWishlist")
	public String delete(@RequestParam int member_idx, @RequestParam int product_idx, Model model, HttpSession session) {
		System.out.println("상품번호" + product_idx);
		int deleteCount = service.deleteWishlist(member_idx, product_idx);
		if(deleteCount == 0) {
			model.addAttribute("msg", "삭제 실패!");
			return "notice/fail_back";
		}
		return "redirect:/wishlist?member_idx=" + member_idx;
	}
	
	//주소록 목록
	@GetMapping(value = "address")
	public String address(@RequestParam int member_idx, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId != null && !sId.equals("")) {	
			List<AddressVO> address = service.getAddress(member_idx);
			model.addAttribute("address", address);
			System.out.println(address);
			// 계좌 갯수 불러와서 model 객체에 저장
			int addressCount = service.getAddressCount(member_idx);
			model.addAttribute("addressCount", addressCount);
			// member/member_info.jsp 페이지로 이동
			return "mypage/mypage_address";
		} else {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		}		
	}
	
	//주소록 추가
	@PostMapping(value = "addAddress")
	public String addAddress(AddressVO address, int member_idx, Model model, HttpSession session) {
		int addressCount = service.getAddressCount(member_idx);
		System.out.println("addressCount :" + addressCount);
		if(addressCount >= 4) {
			model.addAttribute("msg", "주소지는 최대 4개까지 등록 가능합니다.");
			return "notice/fail_back";
		} else {
			int insertCount = service.addAddress(address, member_idx, addressCount);
			
			if(insertCount > 0) {
				return "redirect:/address?member_idx=" + member_idx;
			} else {
				model.addAttribute("msg", "주소지 추가에 실패하였습니다. 다시 시도해주세요.");
				return "notice/fail_back";
			}
		}
	}	
	
	//주소록 수정
	@PostMapping(value = "updateAddress")
	public String updateAddress(AddressVO address, int member_idx, Model model, HttpSession session) {
		int updateCount = service.updateAddress(address);
		
		if(updateCount == 0) {
			model.addAttribute("msg", "주소지 수정에 실패하였습니다. 다시 시도해주세요.");
			return "notice/fail_back";
		}
		return "redirect:/address?member_idx=" + member_idx;
	}	
	
	//대표 주소 활성 & 비활성
	
	
	
	//주소록 삭제
	@GetMapping(value = "deleteAddress")
	public String delete(@ModelAttribute AddressVO address, @RequestParam int address_idx, @RequestParam int member_idx, Model model) {
		
		int deleteCount = service.removeAddress(address);
		if(deleteCount == 0) {
			model.addAttribute("msg", "주소지 삭제에 실패하였습니다. 다시 시도해주세요.");
			return "notice/fail_back";
		}
		return "redirect:/address?member_idx=" + member_idx;
	}	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 300
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 500
	
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
	
	// 마이페이지 : 구매내역 (기본)
	@GetMapping(value = "/mypage_order")
	public String orderList_basic(Model model, int member_idx,
			@RequestParam(defaultValue = "") String date1,
			@RequestParam(defaultValue = "") String date2,
			@RequestParam(defaultValue = "1") int pageNum) {
		
		// date1, date2 형식 : 2022-11-01
		
		// date1(이전 날짜) 이 date2(이후 날짜) 보다 클 수 없도록 설정
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		int compare = 0;
		try {
			java.util.Date fmDate1 = fm.parse(date1);
			java.util.Date fmDate2 = fm.parse(date2);
			System.out.println(fmDate1 + ", " + fmDate2);
			
			compare = fmDate1.compareTo(fmDate2);
			
		} catch (ParseException e) {
			// e.printStackTrace();
		}
		
		if(compare > 0) {
			// date1 (이전날짜)가 더 큰 상황
			model.addAttribute("msg", "날짜 설정을 확인해주세요.");
			return "notice/fail_back";
		} else {
			// 페이징 처리를 위한 계산 작업
			int listLimit = 5; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 5; // 한 페이지 당 표시할 페이지 목록 갯수
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (pageNum - 1) * listLimit;
			
			// 구매내역 목록 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수, 검색조건
			// => 리턴타입 : List<Order_buyVO>(orderList)
			List<Order_buyMyVO> orderList = service.getOrderList(startRow, listLimit, date1, date2, member_idx);
			
			// Service 객체의 getOrderListCount() 메소드를 호출하여 해당 회원의 전체 구매 목록 갯수 조회
			// => 파라미터 : 검색조건, 리턴타입 : int(listCount)
			int listCount = service.getOrderListCount(date1, date2, member_idx);
			
			// ----------------------------------------------------------------------------------------
			
			// 페이지 계산 작업 수행
			
			// 전체 페이지 수 계산
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			// 시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			// 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
			// 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) { endPage = maxPage; }
			
			// 페이징 처리 정보 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
			PageInfo pageInfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			// ----------------------------------------------------------------------------------------
			
			// 게시물 목록(boardList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("orderList", orderList);
			model.addAttribute("listCount", listCount);
			
			return "mypage/mypage_order";
		}
	}
	
	// 마이페이지 : 구매확정 진행
	@PostMapping(value = "buyFix")
	public String buyFix(int member_idx, int order_buy_idx, Model model) {
		int updateCount = service.modifyOrderBuyGb(member_idx, order_buy_idx);
		
		if(updateCount > 0) {
			return "redirect:/mypage_order?member_idx=" + member_idx;
		} else {
			model.addAttribute("msg", "구매확정에 실패하였습니다. 다시 시도해주세요.");
			return "notice/fail_back";
		}
	}
	
	// 마이페이지 : 작성한 리뷰 보기 위해 파라미터 전달 후 리뷰 상세 페이지로 이동
	@GetMapping(value = "goReview")
	public String goReview(int product_idx, int member_idx, Model model) {
		int review_idx = 0;
		ReviewVO review = service.getReview(product_idx, member_idx);
		
		if(review != null) { review_idx = review.getReview_idx(); }
		
		if(review_idx != 0) {
			return "redirect:/review_detail?review_idx=" + review_idx;
		} else {
			model.addAttribute("msg", "작성한 리뷰가 없습니다. 다시 확인해주세요.");
			return "notice/fail_back";
		}
	}
	
} // controller 끝
