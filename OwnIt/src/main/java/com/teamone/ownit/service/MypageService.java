package com.teamone.ownit.service;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.MypageMapper;

@Service
public class MypageService {

	@Autowired
	private MypageMapper mapper;
	
}
