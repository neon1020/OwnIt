package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.ReviewMapper;
import com.teamone.ownit.vo.ProductVO;
import com.teamone.ownit.vo.ReplyVO;
import com.teamone.ownit.vo.ReviewListVO;

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

    // 리뷰 댓글
	public List<ReplyVO> getReply(int review_idx) {
        return mapper.selectReply(review_idx);
	}
	
	public ProductVO getProduct(int product_idx) {
		return mapper.selectProduct(product_idx);
	}


	
}
