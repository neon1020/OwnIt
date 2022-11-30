package com.teamone.ownit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamone.ownit.service.NoticeService;
import com.teamone.ownit.vo.NoticeVO;
import com.teamone.ownit.vo.PageInfo;
import com.teamone.ownit.vo.ReplyPageInfo;
import com.teamone.ownit.vo.ReplyVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	//공지사항 글쓰기(관리자ver) Form - admin_noticeWrite
	@GetMapping(value = "admin_noticeWrite")
	public String write() {
		return "notice/admin_noticeWrite";
	}
	
	//공지사항 글쓰기(관리자ver) Pro - admin_noticeWritePro
	@PostMapping(value = "admin_noticeWritePro")
	public String writePro(@ModelAttribute NoticeVO notice, Model model) {
		int insertCount = service.registNotice(notice);
		System.out.println(notice);
		if(insertCount > 0) {
			return "redirect:/admin_noticeList";
		} else {
			model.addAttribute("msg", "글 쓰기 실패!");
			return "notice/fail_back";
		}
	}
	
	//공지사항 글목록(관리자ver) - admin_noticeList
	@GetMapping(value = "admin_noticeList")
	public String list(
			@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// Service 객체의 getNoticeList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<NoticeVO>(noticeList)
		List<NoticeVO> noticeList = service.getNoticeList(startRow, listLimit, searchType, keyword);
		// -------------------------------------------
		// Service 객체의 getNoticeListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.getNoticeListCount(searchType, keyword);
		
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
//		System.out.println(pageInfo);
		// --------------------------------------------------------------------------------
		// 게시물 목록(noticeList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "notice/admin_noticeList";
	}
	
	//공지사항 글내용(관리자ver) - admin_noticeDetail
	@GetMapping(value = "admin_noticeDetail")
	public String detail(@RequestParam int notice_idx, @RequestParam(defaultValue = "1") int replyListNum, Model model) {
		// Service 객체의 increaseReadcount() 메서드 호출하여 게시물 조회 증가
		// => 파라미터 : 글번호, 리턴타입 : void
		service.increaseReadcount(notice_idx);
		
		// Service 객체의 getNotice() 메서드를 호출하여 게시물 상세 정보 조회
		// => 파라미터 : 글번호, 리턴타입 : NoticeVO(notice)
		NoticeVO notice = service.getNotice(notice_idx);
		
		// 공지사항 중 이벤트 게시글에 대한 댓글 목록 불러오기 및 페이징 정보 저장
		if(notice.getNotice_category().equals("[이벤트]")) {
			
			// 페이징 처리를 위한 계산 작업
			int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 5; // 한 페이지 당 표시할 페이지 목록 갯수
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (replyListNum - 1) * listLimit;
			
			// 해당 이벤트 게시글에 대한 댓글 및 대댓글 목록 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
			// => 리턴타입 : List<NoticeVO>(noticeList)
			List<ReplyVO> replyList = service.getReplyList(notice_idx, startRow, listLimit);
			// -------------------------------------------
			// 댓글 및 대댓글 목록 갯수 조회
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = service.getReplyListCount(notice_idx);
			
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			// 시작 페이지 번호 계산
			int startPage = (replyListNum - 1) / pageListLimit * pageListLimit + 1;
			
			// 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
			// 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
			ReplyPageInfo pageInfo = new ReplyPageInfo(
					replyListNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			// --------------------------------------------------------------------------------
			model.addAttribute("replyList", replyList);
			model.addAttribute("listCount", listCount);
			model.addAttribute("pageInfo", pageInfo);
		}
		
		// Model 객체에 NoticeVO 객체 추가
		model.addAttribute("notice", notice);
		
		return "notice/admin_noticeDetail";
	}
	
	//공지사항 글삭제(관리자ver) - admin_noticeDelete
	@GetMapping(value = "admin_noticeDelete")
	public String delete(@RequestParam int notice_idx) {
		// Service - removeBoard() 메서드 호출하여 삭제 작업 요청
		service.removeNotice(notice_idx);
		
		return "redirect:/admin_noticeList";
	}	
	
	//공지사항 글수정(관리자ver) - admin_noticeUpdate
	@GetMapping(value = "admin_noticeUpdate")
	public String modify(@RequestParam int notice_idx, Model model) {
		
		NoticeVO notice = service.getNotice(notice_idx);
		model.addAttribute("notice", notice);		
		
		return "notice/admin_noticeUpdate";
	}
	
	//공지사항 글수정Pro(관리자ver) - admin_noticeUpdatePro
	@PostMapping(value = "admin_noticeUpdatePro")
	public String modifyPro(@ModelAttribute NoticeVO notice, @RequestParam int pageNum, Model model) {
		// Service - modifyBoard() 메서드 호출하여 수정 작업 요청
		// => 파라미터 : BoardVO 객체, 리턴타입 : int(updateCount)
		int updateCount = service.modifyNotice(notice);
		
		// 수정 실패 시 "패스워드 틀림!" 메세지 저장 후 fail_back.jsp 페이지로 포워딩
		// 아니면, BoardDetail.bo 서블릿 요청(글번호, 페이지번호 전달)
		if(updateCount == 0) {
			model.addAttribute("msg", "패스워드 틀림!");
			return "notice/fail_back";
		}
		return "redirect:/admin_noticeDetail?notice_idx=" + notice.getNotice_idx() + "&pageNum=" + pageNum;
	}
	
	
	//공지사항 글목록(사용자ver) - noticeList
	@GetMapping(value = "noticeList")
	public String noticeList(
			@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
			System.out.println("searchType : " + searchType);
			System.out.println("keyword : " + keyword);
			// -------------------------------------------------------------------
			// 페이징 처리를 위한 계산 작업
			int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (pageNum - 1) * listLimit;
			
			// Service 객체의 getNoticeList() 메서드를 호출하여 게시물 목록 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
			// => 리턴타입 : List<NoticeVO>(noticeList)
			List<NoticeVO> noticeList = service.getNoticeList(startRow, listLimit, searchType, keyword);
			// -------------------------------------------
			// Service 객체의 getNoticeListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = service.getNoticeListCount(searchType, keyword);
			
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
//			System.out.println(pageInfo);
			// --------------------------------------------------------------------------------
			// 게시물 목록(noticeList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("pageInfo", pageInfo);		
		
		return "notice/notice_list";
	}
	
	//공지사항 글내용(사용자ver) - noticeDetail
	@GetMapping(value = "noticeDetail")
	public String noticeDetail(@RequestParam int notice_idx, @RequestParam(defaultValue = "1") int replyListNum, Model model) {
		// Service 객체의 increaseReadcount() 메서드 호출하여 게시물 조회 증가
		// => 파라미터 : 글번호, 리턴타입 : void
		service.increaseReadcount(notice_idx);
		
		// Service 객체의 getNotice() 메서드를 호출하여 게시물 상세 정보 조회
		// => 파라미터 : 글번호, 리턴타입 : NoticeVO(notice)
		NoticeVO notice = service.getNotice(notice_idx);
		
		// 공지사항 중 이벤트 게시글에 대한 댓글 목록 불러오기 및 페이징 정보 저장
		if(notice.getNotice_category().equals("[이벤트]")) {
			
			// 페이징 처리를 위한 계산 작업
			int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 5; // 한 페이지 당 표시할 페이지 목록 갯수
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (replyListNum - 1) * listLimit;
			
			// 해당 이벤트 게시글에 대한 댓글 및 대댓글 목록 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
			// => 리턴타입 : List<NoticeVO>(noticeList)
			List<ReplyVO> replyList = service.getReplyList(notice_idx, startRow, listLimit);
			// -------------------------------------------
			// 댓글 및 대댓글 목록 갯수 조회
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = service.getReplyListCount(notice_idx);
			
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			// 시작 페이지 번호 계산
			int startPage = (replyListNum - 1) / pageListLimit * pageListLimit + 1;
			
			// 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
			// 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
			ReplyPageInfo pageInfo = new ReplyPageInfo(
					replyListNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			// --------------------------------------------------------------------------------
			model.addAttribute("replyList", replyList);
			model.addAttribute("listCount", listCount);
			model.addAttribute("pageInfo", pageInfo);
		}
		
		// Model 객체에 NoticeVO 객체 추가
		model.addAttribute("notice", notice);		
		
		return "notice/notice_detail";
	}
	
	@GetMapping(value = "notice_authPolicy")
	public String authPolicy() {
		return "notice/notice_authPolicy";
	}
	
	@GetMapping(value = "notice_qna")
	public String qna() {
		return "notice/notice_qna";
	}
	
	
	
	// 정채연
	
	// 이벤트 댓글 등록
	@PostMapping(value = "writeEventReply")
	public String writeEventReply(ReplyVO reply, int replyListNum, int pageNum, Model model) {
		
		int insertCount = service.addEventReply(reply);
		
		if(insertCount > 0) {
			
			Integer listCount = service.getReplyListCount(reply.getNotice_idx());
			System.out.println("리스트 카운트 : " + listCount);
			
			// 댓글 등록 후 해당 pageNum 에 10개 꽉 찼을 경우 뒷 페이지로 이동
			if(listCount % 10 == 1) {
				replyListNum += 1;
			}
			
			return "redirect:/noticeDetail?notice_idx=" + reply.getNotice_idx() + "&pageNum=" + pageNum + "&replyListNum=" + replyListNum;
		} else {
			model.addAttribute("msg", "댓글 등록에 실패하였습니다.");
			return "notice/fail_back";
		}
	}
	
	// 이벤트 대댓글 등록
	@PostMapping(value = "writeEvent_re_Reply")
	public String writeEvent_re_Reply(ReplyVO reply, int replyListNum, int pageNum, Model model) {
		
		// reply_re_seq 번호 조회
		int maxSeq = service.getMaxSeq(reply.getReply_re_ref());
		
		// 대댓글 등록
		int insertCount = service.add_re_Reply(maxSeq, reply);
		
		if(insertCount > 0) {
			
			return "redirect:/noticeDetail?notice_idx=" + reply.getNotice_idx() + "&pageNum=" + pageNum + "&replyListNum=" + replyListNum;
		
		} else {
			model.addAttribute("msg", "댓글 등록에 실패하였습니다.");
			return "notice/fail_back";
		}
	}

	@GetMapping(value = "event_replyDelete")
	public String replyDelete(
			int notice_idx, int reply_idx, int pageNum, int replyListNum, @RequestParam(defaultValue = "") String board, Model model) {
		
		int deleteCount = service.removeEventReply(reply_idx);
		
		if(deleteCount > 0) {
			
			// 페이징 처리를 위한 계산 작업
			int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (replyListNum - 1) * listLimit;
			
			// 해당 페이지 회원 목록 수 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수, 검색조건
			// => 리턴타입 : int
			Integer replyListCount = service.getReplyListCount2(notice_idx, startRow, listLimit);
			
			// 삭제 후 해당 pageNum 에 아무 목록 없을 경우 앞 페이지로 이동
			if(replyListCount == null) {
				if(replyListNum != 1) {
					replyListNum -= 1;
				}
			}
			
			if(board.equals("admin")) {
				return "redirect:/admin_noticeDetail?notice_idx=" + notice_idx + "&pageNum=" + pageNum + "&replyListNum=" + replyListNum;
			} else {
				return "redirect:/noticeDetail?notice_idx=" + notice_idx + "&pageNum=" + pageNum + "&replyListNum=" + replyListNum;
			}
		} else {
			model.addAttribute("msg", "댓글 삭제에 실패하였습니다.");
			return "notice/fail_back";
		}
	}
	
	
	
	
	
	
	
	
	
}
