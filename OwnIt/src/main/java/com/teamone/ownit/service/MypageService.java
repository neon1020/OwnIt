package com.teamone.ownit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.MypageMapper;
import com.teamone.ownit.vo.AccountVO;
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

	public int getMySellListCount(String searchType, String keyword, String id) {
		return mapper.selectMySellListCount(searchType, keyword, id);
	}

	public List<MypageSellListVO> getMySell(int startRow, int listLimit, String searchType, String keyword, String id) {
		return mapper.selectMySell(startRow, listLimit, searchType, keyword, id);
	}

	public int modifyMember(MemberVO member, String newPasswd) {
		return mapper.updateMember(member, newPasswd);
	}

	public List<WishlistVO> getwishlist(String id) {
		return mapper.selectWishlist(id);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
