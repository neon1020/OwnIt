package com.teamone.ownit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.Order_SellFormInsertAccount;
import com.teamone.ownit.vo.Order_SellFormMbAddAccVO;
import com.teamone.ownit.vo.Order_sellVO;
import com.teamone.ownit.vo.ProductVO;

public interface OrderMapper { 
	// 구매수량과 잔여수량 비교
	ProductVO selectCartCount(@Param("product_idx")String product_idx, @Param("order_count")int order_count);
	
	// 결제정보를 위한 회원정보 조회
	Map<String, String> getMemberInfo(String sId);
	
	// 고유 주문번호 및 group_idx 생성을 위한 idx값 조회
	int getMaxGroupIdx();
	
	// 상품 구매 성공 시 product 테이블의 수량 조정
	int updateProductCount(@Param("product_idx")String product_idx, @Param("order_count")int order_count);
	
	// 상품 구매 성공 시 order_buy 테이블에 내용 기입
	int insertOrderBuy(@Param("maxGroupIdx")int maxGroupIdx, @Param("product_idx")String product_idx,
			@Param("sId")String sId, @Param("order_count")int order_count, @Param("countTimesPrice")int countTimesPrice);
	
	// 상품 구매 성공 시 cart에서 해당 상품 삭제
	int deleteCart(@Param("sId")String sId, @Param("product_idx")String product_idx);
			
//박주닮 
	
	// 한 상품에 대한 상세정보
	ProductVO productDetail(@Param("product_idx") int product_idx);
	
//	// 한 상품에 대한 이미지정보
//	ImageVO selectDetailImage(@Param("product_idx") int product_idx);
	
	// 상품 판매시 맴버 정보 조회
	Order_SellFormMbAddAccVO selectMemberDetail(@Param("member_idx") int member_idx);
	
	// 상품 판매 성공시 판매자정보 추가
	int insertOrderSell(Order_sellVO order_Sell);
	// 상품 판매 성공시 판매자정보 추가 후 정보를 가져오는작업
	Order_sellVO selectOrderSell(Order_sellVO order_sell);

	int insertAddress(Order_SellFormMbAddAccVO address);

	List<Order_SellFormMbAddAccVO> selectAddressList(int member_idx);

	MemberVO selectMemberIdx(@Param("sId") String sId);

	Order_SellFormMbAddAccVO clickChangeAddress(@Param("member_idx")int member_idx,@Param("address_idx") int address_idx);

	int insertAccountSell(Order_SellFormInsertAccount account);

	AccountVO selectAccountSell(@Param("member_idx") int member_idx);

	Order_SellFormMbAddAccVO newAccountSellForm(@Param("member_idx")int member_idx,@Param("account_idx") int account_idx);

	Order_SellFormMbAddAccVO selectAccountAddressSellForm(@Param("member_idx") int member_idx,
														  @Param("account_idx") int account_idx,
														  @Param("address_idx")int address_idx);

	int selectAddressIdx(int member_idx);

	List<Order_SellFormMbAddAccVO> selectAccountList(int member_idx);

	int getCountAddress(int member_idx);

	int getCountAccount(int member_idx);

}
