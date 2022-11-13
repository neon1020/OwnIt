package com.teamone.ownit.mapper;

import java.util.List;

import com.teamone.ownit.vo.ReviewListVO;

public interface ReviewMapper {

	List<ReviewListVO> selectReviewList(); 
	
}
