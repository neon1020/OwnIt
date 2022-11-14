package com.teamone.ownit.mapper;

import java.util.List;

import com.teamone.ownit.vo.ProductVO;
import com.teamone.ownit.vo.ReplyVO;
import com.teamone.ownit.vo.ReviewListVO;

public interface ReviewMapper {

	List<ReviewListVO> selectReviewList();

	ReviewListVO selectReview(int review_idx);

	List<ReplyVO> selectReply(int review_idx);

	ProductVO selectProduct(int product_idx); 
	
}
