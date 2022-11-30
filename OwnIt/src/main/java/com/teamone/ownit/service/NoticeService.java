package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.NoticeMapper;
import com.teamone.ownit.vo.NoticeVO;
import com.teamone.ownit.vo.ReplyVO;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	// 글 쓰기
	public int registNotice(NoticeVO notice) {
		return mapper.insertNotice(notice);
	}
	
	// 전체 글 목록 갯수 조회
	// => 파라미터 : 검색타입, 검색어    리턴타입 : int(listCount)
	public int getNoticeListCount(String searchType, String keyword) {
		return mapper.selectNoticeListCount(searchType, keyword);
	}
	
	// 게시물 목록 조회
	// => 파라미터 : 시작행번호, 페이지 당 목록 갯수, 검색타입, 검색어
	//    리턴타입 : List<NoticeVO>(boardList)
	public List<NoticeVO> getNoticeList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectNoticeList(startRow, listLimit, searchType, keyword);
	}

	// 게시물 조회수 증가
	// => 파라미터 : 글번호, 리턴타입 : void	
	public void increaseReadcount(int notice_idx) {
		mapper.updateReadcount(notice_idx);
	}
	
	// 게시물 상세 정보 조회
	// => 파라미터 : 글번호, 리턴타입 : BoardVO(board)
	public NoticeVO getNotice(int notice_idx) {
		return mapper.selectNotice(notice_idx);
	}
	
	// 게시물 삭제
	// => 파라미터 : 글번호, 리턴타입 : void
	public void removeNotice(int notice_idx) {
		mapper.deleteNotice(notice_idx);
	}
	
	// 게시물 수정
	public int modifyNotice(NoticeVO notice) {
		return mapper.updateNotice(notice);
	}

	
	
	// 정채연
	public List<ReplyVO> getReplyList(int notice_idx, int startRow, int listLimit) {
		System.out.println("NoticeService - getReplyList()");
		return mapper.selectReplyList(notice_idx, startRow, listLimit);
	}

	public int getReplyListCount(int notice_idx) {
		System.out.println("NoticeService - getReplyListCount()");
		return mapper.selectReplyListCount(notice_idx);
	}

	public int addEventReply(ReplyVO reply) {
		System.out.println("NoticeService - addEventReply()");
		return mapper.insertEventReply(reply);
	}

	public int getMaxSeq(int reply_re_ref) {
		System.out.println("NoticeService - getMaxSeq()");
		return mapper.selectMaxSeq(reply_re_ref);
	}
	
	public int add_re_Reply(int maxSeq, ReplyVO reply) {
		System.out.println("NoticeService - add_re_Reply()");
		return mapper.insert_re_Reply(maxSeq, reply);
	}

	public int removeEventReply(int reply_idx) {
		System.out.println("NoticeService - removeEventReply()");
		return mapper.deleteEventReply(reply_idx);
	}

	public Integer getReplyListCount2(int notice_idx, int startRow, int listLimit) {
		System.out.println("NoticeService - getReplyListCount2()");
		return mapper.selectReplyListCount2(notice_idx, startRow, listLimit);
	}

	
	
	
	
	
	
	
	
}
