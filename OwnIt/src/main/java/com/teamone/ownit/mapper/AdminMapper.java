package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.*;

public interface AdminMapper {

	// 김소희
	
	// 전체 상품 목록 갯수 조회
	int selectProductListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword, @Param("status") String status);

	
	// 상품 목록 조회 productList (검색, 페이징 추가)
	List<AdminProductVO> selectProductList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword, @Param("status") String status);
	
	
	// Product 등록 (글쓰기)
	int insertProduct(AdminProductVO product);

	
	// Product 등록 (글쓰기) + 다중 파일 업로드
	int insertProductImage(AdminProductVO product);

	
	// Product 수정을 위해 글 가져오기
	AdminProductVO selectProduct(int product_idx);

	
	// Product Modify 수정 작업 수행
	int updateProduct(AdminProductVO product);

	
	// 삭제 전 실제 업로드 된 파일명 조회
	String selectRealFiles(int product_idx);
	
	
	// Product Delete 삭제 작업 수행
	int deleteProduct(int product_idx);

	
	// Order - BuyList 갯수 조회
	int selectBuyListCount(
			@Param("searchType")String searchType, @Param("keyword") String keyword, @Param("status")String status);

	
	// Order - BuyList(구매 목록) 조회
	List<AdminOrderVO> selectBuyList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword, @Param("status")String status);
	
	
	
	// Order - ProductBuy 구매목록 상세조회
	List<AdminOrderVO> selectProductBuyDetail(int order_group_idx);
	// Order - ProductBuy 구매목록 상세조회 + Member 정보
	List<AdminOrderVO> selectMemberInfo(int order_group_idx);
	
	
	// Order - SellList 갯수 조회
	int selectSellListCount(
			@Param("searchType")String searchType, @Param("keyword") String keyword, @Param("status") String status);

	
	// Order- SellList(구매 목록) 조회
	List<AdminOrderVO> selectSellList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword, @Param("status") String status);
	
	
	// Order - SellList(판매목록) 조회 : Status 0
	int selectSellListCount_0(
			@Param("searchType")String searchType, @Param("keyword") String keyword);
	List<AdminOrderVO> selectSellList_0(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	
	// Order - SellList(판매목록) 조회 : Status 1
	int selectSellListCount_1(
			@Param("searchType")String searchType, @Param("keyword") String keyword);
	List<AdminOrderVO> selectSellList_1(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	
	// Order - SellList(판매목록) 조회 : Status 2
	int selectSellListCount_2(
			@Param("searchType")String searchType, @Param("keyword") String keyword);
	List<AdminOrderVO> selectSellList_2(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	
	// Order_Buy 상태 변경 (order_buy_gb)
	int modifyOrderBuy(AdminOrderVO adminOrder);
	
	
	// Order_Sell 상태 변경 (order_sell_gb) + product_left_count
	int modifyOrderSell(AdminOrderVO adminOrder);

	
	// ProductList 재고변경
	int modifyProductLeftCount(ProductVO product);

	// Main - 거래량
	int selectSalesCount();

	// Main - 매출액
	int selectSalesMoeny();

	// Main - 회원수
	int selectMemberCount();
	
	// Main - 리뷰수
	int selectReviewCount();

	// 제품 등록폼 - 상품명 중복확인
	int selectProductName(String productName);

	// 제품 등록폼 - 제품 번호 중복확인
	int selectModelNum(String modelNum);
	

	






	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	// 정채연 - 300
	List<MemberVO> selectMemberList(@Param("startRow") int startRow, @Param("listLimit") int listLimit, @Param("searchType") String searchType, @Param("keyword") String keyword);
	
	int selectMemberListCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	// 오버로딩
	Integer selectMemberListCount2(@Param("startRow") int startRow, @Param("listLimit") int listLimit, @Param("searchType") String searchType, @Param("keyword") String keyword);

	int deleteMember(int member_idx);


	




	


	

}
