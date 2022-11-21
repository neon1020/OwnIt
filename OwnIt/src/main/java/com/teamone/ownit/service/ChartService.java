package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.ChartMapper;
import com.teamone.ownit.vo.ChartVO;

@Service
public class ChartService {

	@Autowired
	private ChartMapper mapper;
	
	
	public List<ChartVO> getTypeList() {
		return mapper.selectTypeList();
	}
	
}
