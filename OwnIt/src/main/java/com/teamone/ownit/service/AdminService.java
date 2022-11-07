package com.teamone.ownit.service;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.AdminMapper;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
}
