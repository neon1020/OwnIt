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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 류혜지 - 300
	// 아이디 찾기
		public MemberVO findEmail(MemberVO member) {
			return mapper.findEmail(member);
		}
		
		
		
		
		
		
		
		
}
