package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.NoticeMapper;
import com.teamone.ownit.vo.NoticeVO;

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
	
	
	
	
	
	
	
	
}
