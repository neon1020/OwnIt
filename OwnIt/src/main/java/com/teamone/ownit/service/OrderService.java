package com.teamone.ownit.service;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.OrderMapper;
import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.MemberAddressAccountVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.Member_sellVO;
import com.teamone.ownit.vo.ProductVO;

@Service
public class OrderService {
	@Autowired
	private OrderMapper mapper;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// 박주닮 101번라인
		//상품의 정보를 불러오는 메서드
		public ProductVO productDetail(int product_idx) {
			return mapper.productDetail(product_idx);
		}
		// 한 상품에 대한 이미지정보
		public ImageVO selectDetailImage(int product_idx) {
			return mapper.selectDetailImage(product_idx);
		}
		// 상품 판매시 맴버 정보 조회
		public MemberAddressAccountVO selectMember(String sId) {
			return mapper.selectMemberDetail(sId);
		}






	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}












