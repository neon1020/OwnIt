package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.MypageMapper;
import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.MypageMainVO;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.MypageVO;
import com.teamone.ownit.vo.Order_buyMyVO;
import com.teamone.ownit.vo.Order_buyVO;
import com.teamone.ownit.vo.ReviewVO;
import com.teamone.ownit.vo.WishlistVO;


@Service
public class MypageService {

	@Autowired
	private MypageMapper mapper;

	
	
	// 류혜지
	// 회원 정보 조회
	public MypageVO getMemberInfo(String id) {
		return mapper.selectMemberInfo(id);
	}
	
	//비밀번호 수정
	public int modifyMember(MemberVO member, String secureNewPassword) {
		System.out.println("MypageService - modifyMember()");
		return mapper.updateMember(member, secureNewPassword);
	}
	
	//패스워드 조회
	public String getPasswd(String sId) {
		return mapper.selectPasswd(sId);
	}
	
	//프로필 정보 불러오기
	public MypageVO getProfile(int member_idx) {
		return mapper.selectProfile(member_idx);
	}
	
	//프로필 정보 수정하기(사진)
	public int modifyProfile(MypageVO mypage) {
		return mapper.updateProfile(mypage);
	}
	
	//프로필 정보 수정하기(닉네임)
	public int modifyNickname(MypageVO mypage) {
		return mapper.updateNickname(mypage);
	}
	
	//마이페이지 메인 - 프로필
	public List<MypageMainVO> getMainProfile(int member_idx) {
		return mapper.selectMainProfile(member_idx);
	}
	
	//마이페이지 메인 - 구매내역
	public List<MypageMainVO> getMainOrder(int member_idx) {
		return mapper.selectMainOrder(member_idx);
	}
	
	//마이페이지 메인 - 판매내역
	public List<MypageMainVO> getMainSell(int member_idx) {
		return mapper.selectMainSell(member_idx);
	}
	
	//마이페이지 메인 - 위시리스트	
	public List<MypageMainVO> getMainWish(int member_idx) {
		return mapper.selectMainWish(member_idx);
	}
	
	//판매내역 갯수 조회
	public int getMySellListCount(String date1, String date2, int member_idx) {
		return mapper.selectMySellListCount(date1, date2, member_idx);
	}
	
	//판매내역 목록
	public List<MypageSellListVO> getMySell(int startRow, int listLimit, String date1, String date2, int member_idx) {
		return mapper.selectMySell(startRow, listLimit, date1, date2, member_idx);
	}
	
	//위시리스트 갯수 조회
	public int getWishlistCount(int member_idx) {
		return mapper.selectWishlistCount(member_idx);
	}
	
	//위시리스트 목록
	public List<WishlistVO> getWishlist(int member_idx, int startRow, int listLimit) {
		return mapper.selectWishlist(member_idx,startRow,listLimit);
	}
	
	//위시리스트에 존재하는지 확인
	public int isContainedInWish(int member_idx, int product_idx) {
		return mapper.isContainedInWish(member_idx, product_idx);
	}
	
	//위시리스트 추가
	public int addToWish(int member_idx, int product_idx) {
		return mapper.addToWish(member_idx, product_idx);
	}
	
	//장바구니에 존재하는지 확인
	public int isContainedInCart(int member_idx, int product_idx) {
		return mapper.isContainedInCart(member_idx, product_idx);
	}
	
	//장바구니 추가
	public int addToCart(int member_idx, int product_idx) {
		return mapper.addToCart(member_idx, product_idx);
	}
	
	//위시리스트 삭제
	public int deleteWishlist(int member_idx, int product_idx) {
		return mapper.deleteWishlist(member_idx, product_idx);
	}
	
	//주소록 갯수 조회
	public int getAddressCount(int member_idx) {
		return mapper.selectAddressCount(member_idx);
	}
	
	//주소록 목록
	public List<AddressVO> getAddress(int member_idx) {
		return mapper.selectAddress(member_idx);
	}

	//주소록 추가
	public int addAddress(AddressVO address, int member_idx, int addressCount) {
		return mapper.insertAddress(address, member_idx, addressCount);
	}
	
	//주소록 수정
	public int updateAddress(AddressVO address) {
		return mapper.updateAddress(address);
	}
	
	//주소록 대표 배송지 설정
	public int otherAddress(int member_idx) {
		return mapper.otherAddress(member_idx);
	}
	public int defaultAddress(int member_idx, int address_idx) {
		return mapper.defaultAddress(member_idx, address_idx);
	}
	
	//주소록 삭제
	public int removeAddress(AddressVO address) {
		return mapper.deleteAddress(address);
	}

	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 300
	public int getAccountCount(int member_idx) {
		System.out.println("MypageService - getAccountCount()");
		return mapper.selectAccountCount(member_idx);
	}

	public int addAccount(AccountVO account, int member_idx, int accountCount) {
		System.out.println("MypageService - addAccount()");
		return mapper.insertAccount(account, member_idx, accountCount);
	}

	public List<AccountVO> getAccountList(int member_idx) {
		System.out.println("MypageService - getAccountList()");
		return mapper.selectAccountList(member_idx);
	}

	public int modifyAccount(AccountVO account) {
		System.out.println("MypageService - modifyAccount()");
		return mapper.updateAccount(account);
	}

	public int removeAccount(int account_idx) {
		System.out.println("MypageService - removeAccount()");
		return mapper.deleteAccount(account_idx);
	}

	public int defaultAccount(int member_idx, int account_idx) {
		System.out.println("MypageService - defaultAccount()");
		return mapper.defaultAccount(member_idx, account_idx);
	}

	public int otherAccount(int member_idx) {
		System.out.println("MypageService - defaultAccount()");
		return mapper.otherAccount(member_idx);
	}

	public List<Order_buyMyVO> getOrderList(int startRow, int listLimit, String date1, String date2, int member_idx) {
		System.out.println("MypageService - getOrderList()");
		return mapper.selectOrderList(startRow, listLimit, date1, date2, member_idx);
	}

	public int getOrderListCount(String date1, String date2, int member_idx) {
		System.out.println("MypageService - getOrderListCount()");
		return mapper.selectOrderListCount(date1, date2, member_idx);
	}

	public int modifyOrderBuyGb(int member_idx, int order_buy_idx) {
		System.out.println("MypageService - modifyOrderBuyGb()");
		return mapper.updateOrderBuyGb(member_idx, order_buy_idx);
	}

	public ReviewVO getReview(int product_idx, int member_idx) {
		System.out.println("MypageService - getReview()");
		return mapper.selectReview(product_idx, member_idx);
	}





	















	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
