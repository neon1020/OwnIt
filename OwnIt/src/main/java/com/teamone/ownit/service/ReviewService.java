package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.ReviewMapper;
import com.teamone.ownit.vo.ReviewListVO;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
	public List<ReviewListVO> getReviewList() {
		return mapper.selectReviewList();
	}

	
}
