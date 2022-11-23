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
	
	public int joinImage(MemberVO member) {
		System.out.println("MemberService - joinImage()");
		return mapper.insertImage(member);
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
	
	public String getPasswd(MemberVO member) {
		System.out.println("MemberService - getPasswd()");
		return mapper.selectPasswd(member);
	}
	
	public MemberVO getMember(MemberVO member) {
		System.out.println("MemberService - getMember()");
		return mapper.selectMember(member);
	}
	
	public int getMember2(String member_id) {
		System.out.println("MemberService - getMember()");
		return mapper.selectMember2(member_id);
	}
	
	public int getAuthStatus(MemberVO member) {
		System.out.println("MemberService - getAuthStatus()");
		return mapper.selectAuthStatus(member);
	}
	
	public int removeMember(String member_id) {
		System.out.println("MemberService - removeMember()");
		return mapper.deleteMember(member_id);
	}
	
	public int modifyPasswd(String member_id, String secureNewPassword) {
		System.out.println("MemberService - modifyPasswd()");
		return mapper.updatePasswd(member_id, secureNewPassword);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 류혜지 - 300
	// 아이디 찾기
		public MemberVO findEmail(String member_phone) {
			return mapper.findEmail(member_phone);
		}

		



		

		

		

		

		
		
		
		
		
		
		
		
		
}
