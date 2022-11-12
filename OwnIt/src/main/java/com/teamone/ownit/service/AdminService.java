package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.AdminMapper;
import com.teamone.ownit.vo.AdminProductVO;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.ProductVO;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	// 김소희
	
	// 전체 상품 목록 갯수 조회
	public int getProductListCount() {
		return mapper.selectProductListCount();
	}
	
	// ProductList 조회
	public List<ProductVO> getProductList(int startRow, int listLimit) {
		return mapper.selectProductList(startRow, listLimit);
	}
	
	// Product 등록 (글쓰기)
	public int registProduct(AdminProductVO product) {
		return mapper.insertProduct(product);
	}
	// Product 등록 (글쓰기) + 이미지
	public int registProductImage(AdminProductVO product) {
		return mapper.insertProductImage(product);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 300
	
}
