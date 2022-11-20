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
	
	//판매내역 목록갯수
	public int getMySellListCount(String searchType, String keyword, String id) {
		return mapper.selectMySellListCount(searchType, keyword, id);
	}
	
	//판매내역 목록
	public List<MypageSellListVO> getMySell(int startRow, int listLimit, String searchType, String keyword, String id) {
		return mapper.selectMySell(startRow, listLimit, searchType, keyword, id);
	}
	
	//비밀번호 수정
	public int modifyMember(MemberVO member, String secureNewPassword) {
		System.out.println("MypageService - modifyMember()");
		return mapper.updateMember(member, secureNewPassword);
	}
	
	//위시리스트 목록
	public List<WishlistVO> getwishlist(String id) {
		return mapper.selectWishlist(id);
	}
	
	//패스워드 조회
	public String getPasswd(String sId) {
		return mapper.selectPasswd(sId);
	}
	
	//주소록 목록
	public List<AddressVO> getAddress(String id) {
		return mapper.selectAddress(id);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 300
	
}
