package com.teamone.ownit.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.AddressVO;
import com.teamone.ownit.vo.Auth_infoVO;
import com.teamone.ownit.vo.MemberVO;



public interface MemberMapper {  
	
	// 정채연
	int selectEmail(String email);

	int selectNickname(String nickname);

	int insertMember(MemberVO member);

	int insertAddress(@Param("member") MemberVO member, @Param("address") AddressVO address);
	
	int insertImage(MemberVO member);

	int selectMember_idx(String id);

	int insertAuthCode(Auth_infoVO authInfo);

	int selectAuthCode(Auth_infoVO authInfo);

	int updateAuthCode(Auth_infoVO authInfo);

	int selectAuthInfo(Auth_infoVO authInfo);

	int updateAuthInfo(Auth_infoVO authInfo);

	int deleteAuthInfo(Auth_infoVO authInfo);
	
	String selectPasswd(MemberVO member);
	
	MemberVO selectMember(MemberVO member);
	
	int selectMember2(String member_id);
	
	int selectAuthStatus(MemberVO member);
	
	int deleteMember(String member_id);
	
	int updatePasswd(@Param("member_id") String member_id, @Param("secureNewPassword") String secureNewPassword);
	
	int insertNaverMember(MemberVO member);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 류혜지 - 300
	
	
	// 아이디 찾기
	MemberVO findEmail(String member_phone);
	
	// 카카오 가입 정보 찾기
	MemberVO findkakao(HashMap<String, Object> userInfo);
	
	// 카카오 가입 정보 저장
	void kakaoinsert(HashMap<String, Object> userInfo);
	
	//카카오 가입시 프로필 사진 저장
	void insertImage(HashMap<String, Object> userInfo);



	

	

	

	

	

	

	
	
	
	
	
	
	
	
	
}
