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
	
	// 구매 제품 비중
	public List<ChartVO> getTypeList() {
		return mapper.selectTypeList();
	}

	// 월별 매출액(구매)
	public List<ChartVO> monthlySalesBuy() {
		return mapper.selectMonthlySalesBuy();
	}

	// 월별 매출액(판매)
	public List<ChartVO> monthlySalesSell() {
		return mapper.selectMonthlySalesSell();
	}

	// 구매 TOP5 제품
	public List<ChartVO> productBuyTop5() {
		return mapper.selectProductBuyTop5();
	}

	// 구매 TOP5 제품 이미지
	public List<ChartVO> productBuyTop5_image() {
		return mapper.selectProductBuyTop5_image();
	}

	// 판매 TOP5 제품
	public List<ChartVO> productSellTop5() {
		return mapper.selectProductSellTop5();
	}

	// 판매 TOP5 제품 이미지
	public List<ChartVO> productSellTop5_image() {
		return mapper.selectProductSellTop5_image();
	}
	
}
