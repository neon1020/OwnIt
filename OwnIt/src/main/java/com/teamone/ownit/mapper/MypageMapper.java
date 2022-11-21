package com.teamone.ownit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.MypageVO;
import com.teamone.ownit.vo.WishlistVO;


public interface MypageMapper {

	
	
	// 류혜지
	// 회원 정보 조회에 필요한 selectMemberInfo() 메서드 정의
	MypageVO selectMemberInfo(String id);
	
	//비밀번호 수정
	int updateMember(@Param("member") MemberVO member, @Param("secureNewPassword") String secureNewPassword);
	
	//패스워드 조회
	String selectPasswd(String sId);
	
	//판매내역 갯수 조회
	int selectMySellListCount(@Param("searchType") String searchType, @Param("keyword") String keyword, @Param("id") String id); 
	
	//판매내역 목록
	List<MypageSellListVO> selectMySell(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword, @Param("id") String id);

	//위시리스트 목록
	List<WishlistVO> selectWishlist(@Param("member_idx") int member_idx, @Param("startRow") int startRow, @Param("listLimit") int listLimit);
	
	//위시리스트 갯수 조회
	int selectWishlistCount(int member_idx);
	
	//위시리스트 삭제
	int deleteWishlist(@Param("member_idx") int member_idx, @Param("product_idx") int product_idx);
	
	//주소록 갯수 조회
	int selectAddressCount(int member_idx);
	
	//주소록 목록
	List<AddressVO> selectAddress(int member_idx);
	
	//주소록 추가
	int insertAddress(@Param("address") AddressVO address, @Param("member_idx") int member_idx, @Param("addressCount") int addressCount);
	
	//주소록 삭제
	int deleteAddress(AddressVO address);
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 300
}
