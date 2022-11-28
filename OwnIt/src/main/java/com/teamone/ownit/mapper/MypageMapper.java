package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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


public interface MypageMapper {

	
	
	// 류혜지
	// 회원 정보 조회
	MypageVO selectMemberInfo(String id);
	
	//비밀번호 수정
	int updateMember(@Param("member") MemberVO member, @Param("secureNewPassword") String secureNewPassword);
	
	//패스워드 조회
	String selectPasswd(String sId);
	
	//프로필 정보 불러오기
	MypageVO selectProfile(int member_idx);
	
	//프로필 정보 수정하기(사진)
	int updateProfile(MypageVO mypage);
	
	//프로필 정보 수정하기(닉네임, 휴대전화)
	int updateNickname(MypageVO mypage);
	
	//마이페이지 메인 - 프로필
	List<MypageMainVO> selectMainProfile(int member_idx);
	
	//마이페이지 메인 - 구매내역
	List<MypageMainVO> selectMainOrder(int member_idx);	
	
	//마이페이지 메인 - 판매내역
	List<MypageMainVO> selectMainSell(int member_idx);	
	
	//마이페이지 메인 - 위시리스트
	List<MypageMainVO> selectMainWish(int member_idx);	
	
	//판매내역 갯수 조회
	int selectMySellListCount(@Param("date1") String date1, @Param("date2") String date2, @Param("member_idx") int member_idx); 
	
	//판매내역 목록
	List<MypageSellListVO> selectMySell(@Param("startRow") int startRow, @Param("listLimit") int listLimit, @Param("date1") String date1, @Param("date2") String date2, @Param("member_idx") int member_idx);

	//위시리스트 목록
	List<WishlistVO> selectWishlist(@Param("member_idx") int member_idx, @Param("startRow") int startRow, @Param("listLimit") int listLimit);
	
	//위시리스트 갯수 조회
	int selectWishlistCount(int member_idx);
	
	//위시리스트에 존재하는지 확인
	int isContainedInWish(@Param("member_idx") int member_idx, @Param("product_idx") int product_idx);
	
	//위시리스트 추가
	int addToWish(@Param("member_idx") int member_idx, @Param("product_idx") int product_idx);
	
	//장바구니에 존재하는지 확인
	int isContainedInCart(@Param("member_idx") int member_idx, @Param("product_idx")int product_idx);
	
	//장바구니 추가
	int addToCart(@Param("member_idx") int member_idx, @Param("product_idx")int product_idx);
	
	//위시리스트 삭제
	int deleteWishlist(@Param("member_idx") int member_idx, @Param("product_idx") int product_idx);
	
	//주소록 갯수 조회
	int selectAddressCount(int member_idx);
	
	//주소록 목록
	List<AddressVO> selectAddress(int member_idx);
	
	//주소록 추가
	int insertAddress(@Param("address") AddressVO address, @Param("member_idx") int member_idx, @Param("addressCount") int addressCount);
	
	//주소록 수정
	int updateAddress(AddressVO address);
	
	//주소록 대표 배송지 설정
	int otherAddress(int member_idx);
	int defaultAddress(@Param("member_idx") int member_idx, @Param("address_idx") int address_idx);
	
	//주소록 삭제
	int deleteAddress(AddressVO address);

	

	
	
	
	
	
	
	
	
	
	
	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 300
	int selectAccountCount(int member_idx);

	int insertAccount(@Param("account") AccountVO account, @Param("member_idx") int member_idx, @Param("accountCount") int accountCount);

	List<AccountVO> selectAccountList(int member_idx);

	int updateAccount(AccountVO account);

	int deleteAccount(int account_idx);

	int defaultAccount(@Param("member_idx") int member_idx, @Param("account_idx") int account_idx);

	int otherAccount(int member_idx);

	List<Order_buyMyVO> selectOrderList(@Param("startRow") int startRow, @Param("listLimit") int listLimit, @Param("date1") String date1, @Param("date2") String date2, @Param("member_idx") int member_idx);

	int selectOrderListCount(@Param("date1") String date1, @Param("date2") String date2, @Param("member_idx") int member_idx);


	int updateOrderBuyGb(@Param("member_idx") int member_idx, @Param("order_buy_idx") int order_buy_idx);

	ReviewVO selectReview(@Param("product_idx") int product_idx, @Param("member_idx") int member_idx);

	

	

	
}
