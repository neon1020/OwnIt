package com.teamone.ownit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.MemberMapper;
import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.Auth_infoVO;
import com.teamone.ownit.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;
	
	// 정채연
	public int checkEmail(String email) {
		System.out.println("MemberService - checkEmail()");
		return mapper.selectEmail(email);
	}

	public int checkNickname(String nickname) {
		System.out.println("MemberService - checkNickname()");
		return mapper.selectNickname(nickname);
	}

	public int joinMember(MemberVO member) {
		System.out.println("MemberService - joinMember()");
		return mapper.insertMember(member);
	}

	public int joinAddress(MemberVO member, AddressVO address) {
		System.out.println("MemberService - joinAddress()");
		return mapper.insertAddress(member, address);
	}

	public int getMember_idx(String id) {
		System.out.println("MemberService - getMember_idx()");
		return mapper.selectMember_idx(id);
	}

	public int joinAuthCode(Auth_infoVO authInfo) {
		System.out.println("MemberService - joinAuthCode()");
		return mapper.insertAuthCode(authInfo);
	}

	public int getAuthCode(Auth_infoVO authInfo) {
		System.out.println("MemberService - getAuthcode()");
		return mapper.selectAuthCode(authInfo);
	}

	public int modifyAuthCode(Auth_infoVO authInfo) {
		System.out.println("MemberService - modifyAuthCode()");
		return mapper.updateAuthCode(authInfo);
	}

	public int getAuthInfo(Auth_infoVO authInfo) {
		System.out.println("MemberService - getAuthInfo()");
		return mapper.selectAuthInfo(authInfo);
	}

	public int modifyAuthInfo(Auth_infoVO authInfo) {
		System.out.println("MemberService - modifyAuthInfo()");
		return mapper.updateAuthInfo(authInfo);
	}

	public int removeAuthInfo(Auth_infoVO authInfo) {
		System.out.println("MemberService - removeAuthInfo()");
		return mapper.deleteAuthInfo(authInfo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 류혜지 - 300
	
}
