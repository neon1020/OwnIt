package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.ReplyVO;
import com.teamone.ownit.vo.ReviewListVO;
import com.teamone.ownit.vo.ReviewVO;
import com.teamone.ownit.vo.Style_like_listVO;

public interface ReviewMapper {

	List<ReviewListVO> selectReviewList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit, 
			@Param("member_idx") int member_idx, @Param("keyword") String keyword);

	ReviewListVO selectReview(int review_idx);

	List<ReviewListVO> selectReviewImage(int review_idx); 
	
	List<ReplyVO> selectReply(int review_idx);

	ReviewListVO selectProduct(int order_buy_idx);

	int insertReview(ReviewVO review);

	int insertReviewImage(ReviewVO review);

	int deleteReview(ReviewVO review);
	
	ReviewListVO selectProfile(int member_idx);

	List<ReviewListVO> selectMystyleList(@Param("member_idx") int member_idx, @Param("member_idx2") int member_idx2);

	int selectReviewCount(int member_idx);

	int updateReview(ReviewVO review);

	int updateReviewImage(ReviewVO review);

	void updateReplycount(int review_idx);
	
	int insertReply(ReplyVO reply);
	
	int insertReplies(ReplyVO reply);

	int selectReplyCount(int review_idx);

	int deleteReply(ReplyVO reply);

	void updateReplycount2(int review_idx);

	int selectLike(Style_like_listVO like);
	
	int selectLikeCount(int review_idx);
	
	void deleteLike(Style_like_listVO likeVO);

	void insertLike(Style_like_listVO likeVO);

	void updateOrderGb(int order_buy_idx);

	int selectOrderBuy(@Param("order_buy_idx") int order_buy_idx, @Param("member_idx") int member_idx);

	int selectReviewMember(@Param("review_idx") int review_idx, @Param("member_idx") int member_idx);

}
