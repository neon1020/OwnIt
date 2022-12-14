package com.teamone.ownit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.OrderMapper;
import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.Order_SellFormInsertAccount;
import com.teamone.ownit.vo.Order_SellFormMbAddAccVO;
import com.teamone.ownit.vo.Order_sellVO;
import com.teamone.ownit.vo.ProductVO;

@Service
public class OrderService {
	@Autowired
	private OrderMapper mapper;
	
	public ProductVO selectCartCount(String product_idx, int order_count) {
		return mapper.selectCartCount(product_idx, order_count);
	}
	
	public Map<String, String> getMemberInfo(String sId) {
		return mapper.getMemberInfo(sId);
	}
	
	public int getMaxGroupIdx() {
		return mapper.getMaxGroupIdx();
	}
	
	public int updateProductCount(String product_idx, int order_count) {
		return mapper.updateProductCount(product_idx, order_count);
	}
	
	public int insertOrderBuy(int maxGroupIdx, String product_idx, String sId, int order_count,
			int countTimesPrice) {
		return mapper.insertOrderBuy(maxGroupIdx, product_idx, sId, order_count, countTimesPrice);
	}
	
	public int deleteCart(String sId, String product_idx) {
		return mapper.deleteCart(sId, product_idx);
	}
	
	
// 박주닮
	//상품의 정보를 불러오는 메서드
	public ProductVO productDetail(int product_idx) {
		return mapper.productDetail(product_idx);
	}
	// 한 상품에 대한 이미지정보
//	public ImageVO selectDetailImage(int product_idx) {
//		return mapper.selectDetailImage(product_idx);
//	}
	// 상품 판매시 맴버 정보 조회
	public Order_SellFormMbAddAccVO selectMember(int member_idx) {
		return mapper.selectMemberDetail(member_idx);
	}
	// 판매테이블 정보 입력
	public int insertOrderSell(Order_sellVO order_sell) {
		return mapper.insertOrderSell(order_sell);
	}
	public Order_sellVO selectOrderSell(Order_sellVO order_sell) {
		return mapper.selectOrderSell(order_sell);
	}
	
	// ordersellfrom - 주소 추가
	public int insertAddress(Order_SellFormMbAddAccVO address) {
		return mapper.insertAddress(address);
	}
	public List<Order_SellFormMbAddAccVO> selectAddressList(int member_idx) {
		return mapper.selectAddressList(member_idx);
	}
	public MemberVO selectMemberIdx(String sId) {
		return mapper.selectMemberIdx(sId);
	}
	public Order_SellFormMbAddAccVO clickAddress(int member_idx, int address_idx) {
		return mapper.clickChangeAddress(member_idx,address_idx);
	}
	public int insertAccountSell(Order_SellFormInsertAccount account) {
		return mapper.insertAccountSell(account);
	}
	public AccountVO selectAccountSell(int member_idx) {
		return mapper.selectAccountSell(member_idx);
	}
	public Order_SellFormMbAddAccVO newAccountSellForm(int member_idx, int account_idx) {
		return mapper.newAccountSellForm(member_idx,account_idx);
	}
	public Order_SellFormMbAddAccVO newAccountAddressForm(int member_idx, int account_idx, int address_idx) {
		return mapper.selectAccountAddressSellForm(member_idx,account_idx,address_idx);
	}
	public int selectAddressIdx(int member_idx) {
		return mapper.selectAddressIdx(member_idx);
	}
	public List<Order_SellFormMbAddAccVO> selectAccountList(int member_idx) {
		return mapper.selectAccountList(member_idx);
	}
	public int getCountAddress(int member_idx) {
		return mapper.getCountAddress(member_idx);
	}
	public int getCountAccount(int member_idx) {
		return mapper.getCountAccount(member_idx);
	}

}
