package com.teamone.ownit.controller;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teamone.ownit.service.MypageService;
import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.CartVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.MypageMainVO;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.MypageVO;
import com.teamone.ownit.vo.Order_buyMyVO;
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
	public String revisePasswd(@ModelAttribute MemberVO member, @RequestParam String newPasswd, 
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
	
	//프로필 정보 불러오기
	@GetMapping(value = "mypage_profile")
	public String reviseProfile(@RequestParam int member_idx, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		System.out.println("아이디:" +  sId);
		if(sId != null && !sId.equals("")) {	
			MypageVO mypage = service.getProfile(member_idx); // 파라미터는 검색할 아이디 전달
			// Model 객체에 "member" 속성명으로 MemberVO 객체 저장
			System.out.println(mypage);
			model.addAttribute("mypage", mypage);
			// member/member_info.jsp 페이지로 이동
			return "mypage/mypage_profile";
		} else {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		}
	}	
	
	//프로필 정보 수정하기
	@PostMapping(value = "/mypage_modifyProfile")
	public String reviseModifyPro(@ModelAttribute MypageVO mypage, @RequestParam int member_idx, Model model, HttpSession session) {
		
		// 기존 실제 파일명을 변수에 저장(= 새 파일 업로드 시 삭제하기 위함)
//		String oldRealFile = mypage.getImage_real_file1();
		
		// 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => 단, request 객체에 getServletContext() 메서드 대신, session 객체로 동일한 작업 수행
		//    (request 객체에 해당 메서드 없음)
		String uploadDir = "/resources/img/member";  // 가상의 업로드 경로
		// => webapp/resources 폴더 내에 upload 폴더 생성 필요
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("실제 업로드 경로 : " + saveDir);
		
		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile = mypage.getFile();

		// 새 파일 업로드 여부와 관계없이 무조건 파일명을 가져와서 BoardVO 객체에 저장
		String originalFileName = mFile.getOriginalFilename();
		long fileSize = mFile.getSize();
		System.out.println("파일명 : " + originalFileName);
		System.out.println("파일크기 : " + fileSize + " Byte");
		
		String uuid = UUID.randomUUID().toString();
		System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName);
		
		mypage.setImage_original_file1(originalFileName);
		mypage.setImage_real_file1(uuid + "_" + originalFileName);
		
		// 새 파일 선택 여부와 관계없이 공통으로 수정 작업 요청
		// Service - modifyBoard() 메서드 호출하여 수정 작업 요청
		// => 파라미터 : BoardVO 객체, 리턴타입 : int(updateCount)
		
		int updateCount = service.modifyProfile(mypage);
		int updateCount2 = service.modifyNickname(mypage);
		
		// 수정 실패 시 "패스워드 틀림!" 메세지 저장 후 fail_back.jsp 페이지로 포워딩
		// 아니면, BoardDetail.bo 서블릿 요청(글번호, 페이지번호 전달)
		if(updateCount == 0 && updateCount2 == 0) { // 수정 실패 시
			// 임시 폴더에 업로드 파일이 저장되어 있으며
			// transferTo() 메서드를 호출하지 않으면 임시 폴더의 파일은 자동 삭제됨
			model.addAttribute("msg", "프로필 수정 실패!");
			return "notice/fail_back";
		} else { // 수정 성공 시
			// 수정 작업 성공 시 새 파일이 존재할 경우에만 실제 폴더 위치에 파일 업로드 수행
			// => 임시 폴더에 있는 업로드 파일을 실제 업로드 경로로 이동
			// => 새 파일 존재 여부는 업로드 할 파일명이 널스트링("") 이 아닌 것으로 판별
//			if(!originalFileName.equals("")) {
				try {
					mFile.transferTo(new File(saveDir, mypage.getImage_real_file1()));
//					// 기존 업로드 된 실제 파일 삭제
//					File f2 = new File(saveDir, oldRealFile);
//					if(f2.exists()) {
//						f2.delete();
//					}
				} catch (IllegalStateException e) {
					System.out.println("IllegalStateException");
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("IOException");
					e.printStackTrace();
				}
//			}
			return "redirect:/mypage_profile?member_idx=" + member_idx;
		}		
		
	}
	
	//마이페이지 메인(프로필, 구매, 판매, 위시)
	@GetMapping(value = "/mypage")
	public String myMain(@RequestParam int member_idx, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		System.out.println("아이디:" +  sId);
		if(sId != null && !sId.equals("")) {			
			
			List<MypageMainVO> mainProfile = service.getMainProfile(member_idx);
			model.addAttribute("mainProfile", mainProfile);
			System.out.println("mainProfile : " + mainProfile);
			
			List<MypageMainVO> mainOrder = service.getMainOrder(member_idx);
			model.addAttribute("mainOrder", mainOrder);
			System.out.println("mainOrder : " + mainOrder);	
			
			List<MypageMainVO> mainSell = service.getMainSell(member_idx);
			model.addAttribute("mainSell", mainSell);
			System.out.println("mainSell : " + mainSell);		
			
			List<MypageMainVO> mainWish = service.getMainWish(member_idx);
			model.addAttribute("mainWish", mainWish);
			System.out.println("mainWish : " + mainWish);		
			
			return "mypage/mypage_main";
			
			} else {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "notice/fail_back";
		}			
	}
	
	//판매내역 목록
	@GetMapping(value = "/mypage_sell")
	public String sell(Model model, int member_idx,
			@RequestParam(defaultValue = "") String date1,
			@RequestParam(defaultValue = "") String date2,
			@RequestParam(defaultValue = "1") int pageNum) {
			
		// date1, date2 형식 : 2022-11-01
		// date1 이 date2 보다 클 수 없도록 설정
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
			// -------------------------------------------------------------------
			// 페이징 처리를 위한 계산 작업
			int listLimit = 5; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 5; // 한 페이지 당 표시할 페이지 목록 갯수
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (pageNum - 1) * listLimit;
			
			// Service 객체의 getNoticeList() 메서드를 호출하여 게시물 목록 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
			// => 리턴타입 : List<NoticeVO>(noticeList)
			List<MypageSellListVO> mysell = service.getMySell(startRow, listLimit, date1, date2, member_idx);
			// -------------------------------------------
			// Service 객체의 getNoticeListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = service.getMySellListCount(date1, date2, member_idx);
			System.out.println("글 갯수 : " + listCount);
			
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
			model.addAttribute("sellCount", listCount);
			System.out.println(mysell);
			
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
			model.addAttribute("listCount", listCount);
			
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
	
	//위시리스트 추가
	@PostMapping(value = "mypage_addWish")
	public String addWish(@ModelAttribute WishlistVO wishlist, @RequestParam int member_idx, @RequestParam int product_idx, 
							Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId != null && !sId.equals("")) {
			int isContained = service.isContainedInWish(member_idx, product_idx);
			if(isContained > 0) {
				int deleteCount = service.deleteWishlist(member_idx, product_idx);
				if(deleteCount == 0) {
					model.addAttribute("msg", "삭제 실패!");
					return "notice/fail_back";
				}
				return "redirect:/product_detail?product_idx=" + product_idx;				
				
			} else {
				int insertCount = service.addToWish(member_idx, product_idx);
				if(insertCount > 0) {
					System.out.println("관심상품에 추가됨");
				} 
				return "redirect:/product_detail?product_idx=" + product_idx; 
			}
		} else {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		}
	}		
	
	
	//위시리스트 장바구니 담기
	@PostMapping(value = "mypage_addCart")
	public String addCart(@ModelAttribute CartVO cart, @RequestParam int member_idx, @RequestParam int product_idx, 
							Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId != null && !sId.equals("")) {
			int isContained = service.isContainedInCart(member_idx, product_idx);
			if(isContained > 0) {
				model.addAttribute("msg", "이미 장바구니에 존재하는 상품 입니다");
				return "notice/fail_back";
			} else {
				int insertCount = service.addToCart(member_idx, product_idx);
				if(insertCount > 0) {
					System.out.println("장바구니에 추가됨");
				} 
				return "redirect:/wishlist?member_idx=" + member_idx;
			}
		} else {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "notice/fail_back";
		}
	}	
	
	//위시리스트 삭제
	@GetMapping(value = "deleteWishlist")
	public String deleteWish(@RequestParam int member_idx, @RequestParam int product_idx, Model model, HttpSession session) {
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
			// 주소록 갯수 불러와서 model 객체에 저장
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
	
	//주소록 대표 배송지 설정
	@PostMapping(value = "defaultAddress")
	public String defaultAddress(int address_idx, int member_idx, Model model) {
		// 주소록 전체 1(나머지 주소록)로 설정
		int setOther = service.otherAddress(member_idx);
		
		// 주소록 계좌 0(기본 주소록)으로 설정
		int setDefault = service.defaultAddress(member_idx, address_idx);
		
		if(setOther > 0 && setDefault > 0) {
			return "redirect:/address?member_idx=" + member_idx;
		} else {
			model.addAttribute("msg", "대표 주소록 설정에 실패하였습니다. 다시 시도해주세요.");
			return "notice/fail_back";
		}
	}	
	
	//주소록 삭제
	@GetMapping(value = "deleteAddress")
	public String deleteAddress(@ModelAttribute AddressVO address, @RequestParam int address_idx, 
						@RequestParam int member_idx, Model model) {
		int deleteCount = service.removeAddress(address);
		if(deleteCount == 0) {
			model.addAttribute("msg", "주소지 삭제에 실패하였습니다. 다시 시도해주세요.");
			return "notice/fail_back";
		}
		return "redirect:/address?member_idx=" + member_idx;
	}	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
