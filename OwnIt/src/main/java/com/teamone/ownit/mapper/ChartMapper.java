package com.teamone.ownit.mapper;

import java.util.List;

import com.teamone.ownit.vo.ChartVO;

public interface ChartMapper {

	List<ChartVO> selectTypeList();

	List<ChartVO> selectmonthlySalesBuy();

	List<ChartVO> selectmonthlySalesSell();

	List<ChartVO> selectproductTop5();

	List<ChartVO> selectproductTop5_image();
	
}
