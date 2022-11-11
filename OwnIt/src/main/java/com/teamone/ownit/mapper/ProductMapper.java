package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.ProductVO;

public interface ProductMapper {
	// 상품목록 조회
	List<ProductVO> getProductList(); 

	// 이미지 조회
	List<ImageVO> selectImage(List<ProductVO> productList); 
	
	// 상품 카테고리에 따른 상품목록 조회(휴대폰, 태블릿...)
	List<ProductVO> getCategorisedProduct(String id); 

	// 상품 카테고리에 따른 상품목록 조회(인기순, 가격순...)
	List<ProductVO> arrayByCategory(String id);















































































// 박주닮

	// 한 상품에 대한 상세정보
	ProductVO productDetail(@Param("product_idx") int product_idx);
	// 한 상품에 대한 이미지정보
	ImageVO selectDetailImage(@Param("product_idx") int product_idx);

	
	





	






















































































}