package com.teamone.ownit.mapper;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.MemberAddressAccountVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.ProductVO;

public interface OrderMapper { 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
//박주닮 101번째 라인맞추기
	
	// 한 상품에 대한 상세정보
	ProductVO productDetail(@Param("product_idx") int product_idx);
	
	// 한 상품에 대한 이미지정보
	ImageVO selectDetailImage(@Param("product_idx") int product_idx);
	
	// 상품 판매시 맴버 정보 조회
	MemberAddressAccountVO selectMemberDetail(@Param("sId") String sId);
	
	// 상품 판매 성공시 판매자정보 추가
	int insertOrderSell(@Param("product_idx") int product_idx,
						@Param("member_idx") int member_idx,
						@Param("account_idx") int account_idx);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//200번째라인맞추기
