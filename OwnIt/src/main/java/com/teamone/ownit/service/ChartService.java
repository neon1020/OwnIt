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


	public List<ChartVO> monthlySalesBuy() {
		return mapper.selectMonthlySalesBuy();
	}


	public List<ChartVO> monthlySalesSell() {
		return mapper.selectMonthlySalesSell();
	}


	public List<ChartVO> productBuyTop5() {
		return mapper.selectProductBuyTop5();
	}


	public List<ChartVO> productBuyTop5_image() {
		return mapper.selectProductBuyTop5_image();
	}


	public List<ChartVO> productSellTop5() {
		return mapper.selectProductSellTop5();
	}


	public List<ChartVO> productSellTop5_image() {
		return mapper.selectProductSellTop5_image();
	}
	
}
