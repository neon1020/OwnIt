package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.MypageMapper;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.MypageVO;
import com.teamone.ownit.vo.WishlistVO;


@Service
public class MypageService {

	@Autowired
	private MypageMapper mapper;

	
	
	// 류혜지
	// 회원 정보 조회 수행 getMemberInfo()
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
	
	//판매내역 갯수 조회
	public int getMySellListCount(String searchType, String keyword, String id) {
		return mapper.selectMySellListCount(searchType, keyword, id);
	}
	
	//판매내역 목록
	public List<MypageSellListVO> getMySell(int startRow, int listLimit, String searchType, String keyword, String id) {
		return mapper.selectMySell(startRow, listLimit, searchType, keyword, id);
	}
	
	//위시리스트 갯수 조회
	public int getWishlistCount(int member_idx) {
		return mapper.selectWishlistCount(member_idx);
	}
	
	//위시리스트 목록
	public List<WishlistVO> getWishlist(int member_idx, int startRow, int listLimit) {
		return mapper.selectWishlist(member_idx,startRow,listLimit);
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
	
	//주소록 삭제
	public int removeAddress(AddressVO address) {
		return mapper.deleteAddress(address);
	}
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	// 정채연 - 300
	
}
