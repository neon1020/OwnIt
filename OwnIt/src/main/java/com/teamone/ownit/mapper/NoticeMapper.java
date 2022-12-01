package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.NoticeVO;
import com.teamone.ownit.vo.ReplyVO;

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
	
	// 게시물 수정
	int updateNotice(NoticeVO notice);

	
	
	// 정채연
	
	// 댓글 목록 조회
	List<ReplyVO> selectReplyList(@Param("notice_idx") int notice_idx, @Param("startRow") int startRow, @Param("listLimit") int listLimit);

	// 댓글 목록 총 갯수
	int selectReplyListCount(@Param("notice_idx") int notice_idx);

	// 이벤트 댓글 등록
	int insertEventReply(ReplyVO reply);
	
	// 이벤트 대댓글 등록 전 seq 최대값 조회
	int selectMaxSeq(int reply_re_ref);
	
	// 이벤트 대댓글 등록
	int insert_re_Reply(@Param("maxSeq") int maxSeq, @Param("reply") ReplyVO reply);

	// 이벤트 댓글 및 대댓글 삭제
	int deleteEventReply(int reply_idx);

	// 댓글 삭제 시 페이징 처리
	Integer selectReplyListCount2(@Param("notice_idx") int notice_idx, @Param("startRow") int startRow, @Param("listLimit") int listLimit);

}
