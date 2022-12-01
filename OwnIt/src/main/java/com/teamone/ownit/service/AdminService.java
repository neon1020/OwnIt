package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.AdminMapper;
import com.teamone.ownit.vo.*;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	// 김소희
	
	// 전체 상품 목록 갯수 조회
	public int getProductListCount(String searchType, String keyword, String status) {
		return mapper.selectProductListCount(searchType, keyword, status);
	}
	
	// 상품 목록 조회 productList (검색, 페이징 추가)
	public List<AdminProductVO> getProductList(int startRow, int listLimit, String searchType, String keyword, String status) {
		return mapper.selectProductList(startRow, listLimit, searchType, keyword, status);
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
	public int getBuyListCount(String searchType, String keyword, String status) {
		return mapper.selectBuyListCount(searchType, keyword, status);
	}
	
	// Order - BuyList(구매목록) 조회
	public List<AdminOrderVO> getBuyList(int startRow, int listLimit, String searchType, String keyword, String status) {
		return mapper.selectBuyList(startRow, listLimit, searchType, keyword, status);
	}

	// Order - ProductBuy 구매목록 상세조회
	public List<AdminOrderVO> getProductBuyDetail(int order_group_idx) {
		return mapper.selectProductBuyDetail(order_group_idx);
	}
	// Order - ProductBuy 구매목록 상세조회 + Member 정보
	public List<AdminOrderVO> getMemberInfo(int order_group_idx) {
		return mapper.selectMemberInfo(order_group_idx);
	}
	
	// Order - SellList 갯수 조회
	public int getSellListCount(String searchType, String keyword, String status) {
		return mapper.selectSellListCount(searchType, keyword, status);
	}

	// Order - SellList(판매목록) 조회
	public List<AdminOrderVO> getSellList(int startRow, int listLimit, String searchType, String keyword, String status) {
		return mapper.selectSellList(startRow, listLimit, searchType, keyword, status);
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
	
	// Main - 거래량
	public int getSalesCount() {
		return mapper.selectSalesCount();
	}
	
	// Main - 매출액
	public int getSalesMoeny() {
		return mapper.selectSalesMoeny();
	}

	// Main - 회원수
	public int getMemberCount() {
		return mapper.selectMemberCount();
	}

	// Main - 리뷰수
	public int getReviewCount() {
		return mapper.selectReviewCount();
	}

	// 제품 등록폼 - 상품명 중복확인
	public int checkProductName(String productName) {
		return mapper.selectProductName(productName);
	}

	// 제품 등록폼 - 제품 번호 중복확인
	public int checkModelNum(String modelNum) {
		return mapper.selectModelNum(modelNum);
	}
	








	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	// 정채연 - 300
	public List<MemberVO> getMemberList(int startRow, int listLimit, String searchType, String keyword) {
		System.out.println("AdminService - getMemberList()");
		return mapper.selectMemberList(startRow, listLimit, searchType, keyword);
	}
	
	public int getMemberListCount(String searchType, String keyword) {
		System.out.println("AdminService - getMemberListCount()");
		return mapper.selectMemberListCount(searchType, keyword);
	}
	
	// 오버로딩
	public Integer getMemberListCount2(int startRow, int listLimit, String searchType, String keyword) {
		System.out.println("AdminService - getMemberListCount2()");
		return mapper.selectMemberListCount2(startRow, listLimit, searchType, keyword);
	}

	public int removeMember(int member_idx) {
		System.out.println("AdminService - removeMember()");
		return mapper.deleteMember(member_idx);
	}

	

	

	

	
	

	
}
