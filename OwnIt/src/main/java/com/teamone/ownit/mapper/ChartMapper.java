package com.teamone.ownit.mapper;

import java.util.List;

import com.teamone.ownit.vo.ChartVO;

public interface ChartMapper {

	List<ChartVO> selectTypeList();

	List<ChartVO> selectMonthlySalesBuy();

	List<ChartVO> selectMonthlySalesSell();

	List<ChartVO> selectProductBuyTop5();

	List<ChartVO> selectProductBuyTop5_image();

	List<ChartVO> selectProductSellTop5();

	List<ChartVO> selectProductSellTop5_image();
	
}
