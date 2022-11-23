package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.MypageMapper;
import com.teamone.ownit.vo.AccountVO;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.MemberVO;
import com.teamone.ownit.vo.MypageSellListVO;
import com.teamone.ownit.vo.MypageVO;
import com.teamone.ownit.vo.Order_buyMyVO;
import com.teamone.ownit.vo.Order_buyVO;
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
	
	//주소록 추가
	public int registAddress(AddressVO address) {
		return mapper.insertAddress(address);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
