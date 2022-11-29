package com.teamone.ownit.mapper;

import java.util.List;

import com.teamone.ownit.vo.ChartVO;

public interface ChartMapper {

	// 구매 제품 비중
	List<ChartVO> selectTypeList();

	// 월별 매출액(구매)
	List<ChartVO> selectMonthlySalesBuy();

	// 월별 매출액(판매)
	List<ChartVO> selectMonthlySalesSell();

	// 구매 TOP5 제품
	List<ChartVO> selectProductBuyTop5();

	// 구매 TOP5 제품 이미지
	List<ChartVO> selectProductBuyTop5_image();

	// 판매 TOP5 제품
	List<ChartVO> selectProductSellTop5();
	
	// 판매 TOP5 제품 이미지
	List<ChartVO> selectProductSellTop5_image();
	
}
