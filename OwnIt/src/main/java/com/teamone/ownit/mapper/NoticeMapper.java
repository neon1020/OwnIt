package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.NoticeVO;

public interface NoticeMapper {

	// 공지사항 등록
	int insertNotice(NoticeVO notice);

	// 전체 공지사항 목록 갯수 조회
	int selectNoticeListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	// 공지사항 목록 조회(복수개의 파라미터는 @Param 어노테이션으로 이름 설정)
	List<NoticeVO> selectNoticeList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 게시물 조회수 증가
	void updateReadcount(int notice_idx);

	// 게시물 상세 정보 조회
	NoticeVO selectNotice(int notice_idx);

	// 게시물 삭제
	void deleteNotice(int notice_idx);
	
	


}
