package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.AdminMapper;
import com.teamone.ownit.vo.AdminOrderVO;
import com.teamone.ownit.vo.AdminProductVO;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.ProductVO;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	// 김소희
	
	// 전체 상품 목록 갯수 조회
	public int getProductListCount(String searchType, String keyword) {
		return mapper.selectProductListCount(searchType, keyword);
	}
	
	// 상품 목록 조회 productList (검색, 페이징 추가)
	public List<AdminProductVO> getProductList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectProductList(startRow, listLimit, searchType, keyword);
	}
	
	// Product 등록 (글쓰기)
	public int registProduct(AdminProductVO product) {
		return mapper.insertProduct(product);
	}
	
	// Product 등록 (글쓰기) + 다중 파일 업로드
	public int registProductImage(AdminProductVO product) {
		return mapper.insertProductImage(product);
	}
	
	// Product 수정을 위해 글 가져오기
	public AdminProductVO getProduct(int product_idx) {
		return mapper.selectProduct(product_idx);
	}
	
	// Product Modify 수정 작업 수행
	public int modifyProduct(AdminProductVO product) {
		return mapper.updateProduct(product);
	}
	
	// 삭제 전 실제 업로드 된 파일명 조회 작업 요청
	public String getRealFiles(int product_idx) {
		return mapper.selectRealFiles(product_idx);
	}

	// Product Delete 삭제 작업 수행
	public int removeProduct(int product_idx) {
		return mapper.deleteProduct(product_idx);
	}

	// Order - BuyList 갯수 조회
	public int getBuyListCount(String searchType, String keyword) {
		return mapper.selectBuyListCount(searchType, keyword);
	}
	
	// Order - BuyList(구매목록) 조회
	public List<AdminOrderVO> getBuyList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectBuyList(startRow, listLimit, searchType, keyword);
	}

	// Order - SellList 갯수 조회
	public int getSellListCount(String searchType, String keyword) {
		return mapper.selectSellListCount(searchType, keyword);
	}

	// Order - SellList(판매목록) 조회
	public List<AdminOrderVO> getSellList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectSellList(startRow, listLimit, searchType, keyword);
	}

	// Order - SellList(판매목록) 조회 : Status 0
	public int getSellListCount_0(String searchType, String keyword) {
		return mapper.selectSellListCount_0(searchType, keyword);
	}
	public List<AdminOrderVO> getSellList_0(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectSellList_0(startRow, listLimit, searchType, keyword);
	}
	// Order - SellList(판매목록) 조회 : Status 1
	public int getSellListCount_1(String searchType, String keyword) {
		return mapper.selectSellListCount_1(searchType, keyword);
	}
	public List<AdminOrderVO> getSellList_1(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectSellList_1(startRow, listLimit, searchType, keyword);
	}
	// Order - SellList(판매목록) 조회 : Status 2
	public int getSellListCount_2(String searchType, String keyword) {
		return mapper.selectSellListCount_2(searchType, keyword);
	}
	public List<AdminOrderVO> getSellList_2(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectSellList_2(startRow, listLimit, searchType, keyword);
	}
	
	// Order_Buy 상태 변경 (order_buy_gb)
	public int updateOrderBuy(AdminOrderVO adminOrder) {
		return mapper.modifyOrderBuy(adminOrder);
	}

	// Order_Sell 상태 변경 (order_sell_gb) + product_left_count
	public int updateOrderSell(AdminOrderVO adminOrder) {
		return mapper.modifyOrderSell(adminOrder);
	}

	// ProductList 재고변경
	public int updateProductLeftCount(ProductVO product) {
		return mapper.modifyProductLeftCount(product);
	}
	
	// ProductBuy 구매목록 상세조회
	public List<AdminOrderVO> getProductBuyDetail(int order_group_idx) {
		return mapper.selectProductBuyDetail(order_group_idx);
	}
	// ProductBuy 구매목록 상세조회 + Member 정보
	public List<AdminOrderVO> getMemberInfo(int order_group_idx) {
		return mapper.selectMemberInfo(order_group_idx);
	}



	








	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 500
	
}
