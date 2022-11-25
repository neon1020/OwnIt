package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.AdminOrderVO;
import com.teamone.ownit.vo.AdminProductVO;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.ProductVO;

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
			@Param("searchType")String searchType, @Param("keyword") String keyword);

	
	// Order - BuyList(구매 목록) 조회
	List<AdminOrderVO> selectBuyList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	
	int selectBuyListCount_0(
			@Param("searchType")String searchType, @Param("keyword") String keyword);
	
	List<AdminOrderVO> selectBuyList_0(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	
	// Order - ProductBuy 구매목록 상세조회
	List<AdminOrderVO> selectProductBuyDetail(int order_group_idx);
	// Order - ProductBuy 구매목록 상세조회 + Member 정보
	List<AdminOrderVO> selectMemberInfo(int order_group_idx);
	
	
	// Order - SellList 갯수 조회
	int selectSellListCount(
			@Param("searchType")String searchType, @Param("keyword") String keyword);

	
	// Order- SellList(구매 목록) 조회
	List<AdminOrderVO> selectSellList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	
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


	int selectBuyListCount_1(
			@Param("searchType")String searchType, @Param("keyword") String keyword);


	List<AdminOrderVO> selectBuyList_1(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);


	int selectBuyListCount_2(
			@Param("searchType")String searchType, @Param("keyword") String keyword);


	List<AdminOrderVO> selectBuyList_2(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);



	
	



	






	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	
	
	// 정채연 - 500
	
}
