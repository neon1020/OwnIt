package com.teamone.ownit.auth;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

// 자바 메일 기능 사용 시 메일 서버 (ex Gmail 등) 인증을 위한 인증 정보 관리하는
// javax.mail.Authenticator를 상속받는 서브클래스 정의
public class GoogleSMTPAuthenticator extends Authenticator {
	// 인증 정보(아이디, 패스워드) 관리할 javax.mail.Authenticator 클래스 타입 변수 선언
	PasswordAuthentication passwordAuthentication;

	// 기본 생성자 정의
	public GoogleSMTPAuthenticator() {
		passwordAuthentication = new PasswordAuthentication("sdyeon95", "rchdhlhntdjdwdir");
	}

	// 인증 정보를 관리하는 PasswordAuthentication 객체를 외부로 리턴하는 getPasswordAuthentication() 메소드 오버라이딩
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
}