package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.ReplyVO;
import com.teamone.ownit.vo.ReviewListVO;
import com.teamone.ownit.vo.ReviewVO;

public interface ReviewMapper {

	List<ReviewListVO> selectReviewList();

	ReviewListVO selectReview(int review_idx);

	List<ReviewListVO> selectReviewImage(int review_idx); 
	
	List<ReplyVO> selectReply(int review_idx);

	ReviewListVO selectProduct(int order_buy_idx);

	int insertReview(ReviewVO review);

	int insertReviewImage(ReviewVO review);

	int deleteReview(ReviewVO review);

	List<ReviewListVO> selectMystyleList(int member_idx);

	int selectReviewCount(int member_idx);

	int updateReview(ReviewVO review);

	int updateReviewImage(ReviewVO review);

	int insertReply(ReplyVO reply);


	
}
