package com.teamone.ownit.mapper;

import java.util.List;

import com.teamone.ownit.vo.ProductVO;
import com.teamone.ownit.vo.ReplyVO;
import com.teamone.ownit.vo.ReviewListVO;
import com.teamone.ownit.vo.ReviewVO;

public interface ReviewMapper {

	List<ReviewListVO> selectReviewList();

	ReviewListVO selectReview(int review_idx);

	List<ReviewListVO> selectReviewImage(int review_idx); 
	
	List<ReplyVO> selectReply(int review_idx);

	ProductVO selectProduct(int order_buy_idx);

	int insertReview(ReviewVO review);

	int insertReviewImage(ReviewVO review);

	
}
