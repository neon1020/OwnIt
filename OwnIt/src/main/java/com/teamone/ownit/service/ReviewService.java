package com.teamone.ownit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.ReviewMapper;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.ReplyVO;
import com.teamone.ownit.vo.ReviewListVO;
import com.teamone.ownit.vo.ReviewVO;
import com.teamone.ownit.vo.Style_like_listVO;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
    // 리뷰 목록
	public List<ReviewListVO> getReviewList(int startRow, int listLimit, int member_idx, String keyword) {
		return mapper.selectReviewList(startRow, listLimit, member_idx, keyword);
	}

    // 리뷰 상세페이지
	public ReviewListVO getReview(int review_idx) {
		return mapper.selectReview(review_idx);
	}
	
	// 리뷰 상세페이지 이미지 출력
	public List<ReviewListVO> getReviewImage(int review_idx) {
		return mapper.selectReviewImage(review_idx);
	}

    // 리뷰 댓글 출력
	public List<ReplyVO> getReply(int review_idx) {
        return mapper.selectReply(review_idx);
	}
	
	// 리뷰 폼 상품 출력
	public ReviewListVO getProduct(int order_buy_idx) {
		return mapper.selectProduct(order_buy_idx);
	}

	// 리뷰 등록
	public int registReview(ReviewVO review) {
		return mapper.insertReview(review);
	}

	// 리뷰 이미지 등록
	public int registReviewImage(ReviewVO review) {
		return mapper.insertReviewImage(review);
	}

	// 리뷰 삭제
	public int removeReview(ReviewVO review) {
		return mapper.deleteReview(review);
	}

	// 마이스타일 프로필 출력
	public ReviewListVO getProfile(int member_idx) {
		return mapper.selectProfile(member_idx);
	}

	// 마이스타일 목록
	public List<ReviewListVO> getMystyleList(int member_idx, int member_idx2) {
		return mapper.selectMystyleList(member_idx, member_idx2);
	}

	// 작성 리뷰 수
	public int getReviewCount(int member_idx) {
		return mapper.selectReviewCount(member_idx);
	}

	// 리뷰 수정
	public int modifyReview(ReviewVO review) {
		return mapper.updateReview(review);
	}

	// 리뷰 이미지 수정
	public int modifyReviewImage(ReviewVO review) {
		return mapper.updateReviewImage(review);
	}

	// 리뷰 댓글 수 증가
	public void increaseReplycount(int review_idx) {
		mapper.updateReplycount(review_idx);
	}
	
	// 리뷰 댓글 등록
	public int registReply(ReplyVO reply) {
		return mapper.insertReply(reply);
	}
	
	// 리뷰 대댓글 등록
	public int registReplies(ReplyVO reply) {
		return mapper.insertReplies(reply);
	}

	// 리뷰 댓글 수 출력
	public int getReplyCount(int review_idx) {
		return mapper.selectReplyCount(review_idx);
	}

	// 리뷰 댓글 삭제
	public int removeReply(ReplyVO reply) {
		return mapper.deleteReply(reply);
	}

	// 리뷰 댓글 수 감소
	public void decreaseReplycount(int review_idx) {
		mapper.updateReplycount2(review_idx);
	}

	// 상세페이지에서 좋아요 상태 판별
	public int findLike(Style_like_listVO like) {
		return mapper.selectLike(like);
	}

	// 좋아요 수 출력
	public int getLikeCount(int review_idx) {
		return mapper.selectLikeCount(review_idx);
	}
	
	// 좋아요 취소
	public void removeLike(Style_like_listVO likeVO) {
		mapper.deleteLike(likeVO);
	}

	// 좋아요
	public void pushLike(Style_like_listVO likeVO) {
		mapper.insertLike(likeVO);
	}

	// 리뷰 작성 후 GB 업데이트
	public void modifyOrderGb(int order_buy_idx) {
		mapper.updateOrderGb(order_buy_idx);
	}

	// review_writeForm 서블릿 차단
	public int getOrderBuy(int order_buy_idx, int member_idx) {
		return mapper.selectOrderBuy(order_buy_idx, member_idx);
	}

	// review_modifyForm 서블릿 차단
	public int getReviewMember(int review_idx, int member_idx) {
		return mapper.selectReviewMember(review_idx, member_idx);
	}

	
}
