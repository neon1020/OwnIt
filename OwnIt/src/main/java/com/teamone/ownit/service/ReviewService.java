package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.ReviewMapper;
import com.teamone.ownit.vo.ProductVO;
import com.teamone.ownit.vo.ReplyVO;
import com.teamone.ownit.vo.ReviewListVO;
import com.teamone.ownit.vo.ReviewVO;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
    // 리뷰 목록
	public List<ReviewListVO> getReviewList() {
		return mapper.selectReviewList();
	}

    // 리뷰 상세페이지
	public ReviewListVO getReview(int review_idx) {
		return mapper.selectReview(review_idx);
	}
	
	// 리뷰 상세페이지 이미지 출력
	public List<ReviewListVO> getReviewImage(int review_idx) {
		return mapper.selectReviewImage(review_idx);
	}

    // 리뷰 댓글
	public List<ReplyVO> getReply(int review_idx) {
        return mapper.selectReply(review_idx);
	}
	
	// 리뷰 폼 상품 출력
	public ProductVO getProduct(int order_buy_idx) {
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



	
}
