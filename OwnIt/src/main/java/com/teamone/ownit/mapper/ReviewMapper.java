package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.ReplyVO;
import com.teamone.ownit.vo.ReviewListVO;
import com.teamone.ownit.vo.ReviewVO;
import com.teamone.ownit.vo.Style_like_listVO;

public interface ReviewMapper {

	List<ReviewListVO> selectReviewList();

	ReviewListVO selectReview(int review_idx);

	List<ReviewListVO> selectReviewImage(int review_idx); 
	
	List<ReplyVO> selectReply(int review_idx);

	ReviewListVO selectProduct(int order_buy_idx);

	int insertReview(ReviewVO review);

	int insertReviewImage(ReviewVO review);

	int deleteReview(ReviewVO review);
	
	ReviewListVO selectProfile(int member_idx);

	List<ReviewListVO> selectMystyleList(int member_idx);

	int selectReviewCount(int member_idx);

	int updateReview(ReviewVO review);

	int updateReviewImage(ReviewVO review);

	void updateReplycount(int review_idx);
	
	int insertReply(ReplyVO reply);

	int selectReplyCount(int review_idx);

	int deleteReply(ReplyVO reply);

	void updateReplycount2(int review_idx);

//	Style_like_listVO selectLike(@Param("member_idx") int member_idx, @Param("review_idx") int review_idx);
	
	int selectLike(Style_like_listVO like);

	void deleteLike(Style_like_listVO likeVO);

	void insertLike(Style_like_listVO likeVO);


	


	
}
