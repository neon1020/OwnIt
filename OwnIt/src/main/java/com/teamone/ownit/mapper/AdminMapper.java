package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.AdminOrderVO;
import com.teamone.ownit.vo.AdminProductVO;

public interface AdminMapper {

	// 김소희
	
	// 전체 상품 목록 갯수 조회
	int selectProductListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 상품 목록 조회 productList (검색, 페이징 추가)
	List<AdminProductVO> selectProductList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	// Product 등록 (글쓰기)
	int insertProduct(AdminProductVO product);

	// Product 등록 (글쓰기) + 다중 파일 업로드
	int insertProductImage(AdminProductVO product);

	// Order - BuyList 갯수 조회
	int selectBuyListCount(
			@Param("searchType")String searchType, @Param("keyword") String keyword);

	// Order- BuyList(구매 목록) 조회
	List<AdminOrderVO> selectBuyList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	// Order - SellList 갯수 조회
	int selectSellListCount(
			@Param("searchType")String searchType, @Param("keyword") String keyword);

	// Order- SellList(구매 목록) 조회
	List<AdminOrderVO> selectSellList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 300
	
}
