package com.teamone.ownit.auth;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class SendMail {
	
	public boolean sendMail(String receiver, String title, String content) {
		
		boolean isSendSuccess = false; 
		
		String sender = "admin@ownit.co.kr";

		try {
			// 메일 전송에 필요한 설정 작업
			Properties properties = System.getProperties();

			// 메일 전송에 필요한 정보를 Properties 객체(서버 속성 정보)에 추가
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.ssl.protocols", "TLSv1.2");

			// 메일 전송에 사용할 메일 서버 지정
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587");

			// 메일 서버에 대한 인증 정보를 관리하는 사용자 정의 클래스(GoogleSMTPAuthenticator)의 인스턴스 생성
			Authenticator authenticator = new GoogleSMTPAuthenticator();

			// 자바 메일의 기본 전송 단위를 javax.mail.Session 객체 단위로 관리
			Session mailSession = Session.getDefaultInstance(properties, authenticator);

			// 메일 발송 정보를 관리할 javax.mail.internet.MimeMessage 객체 생성
			Message mailMessage = new MimeMessage(mailSession);

			// ------------------------------------------------------------------------------------------------------

			// 전송할 메일에 대한 발송 정보 설정
			// 1. 발신자 정보 설정 (발신자 정보를 주소 형태로 관리하는 InternetAddress 객체 생성)
			Address sender_address = new InternetAddress(sender, "OwnIt");

			// 2. 수신자 정보 설정 (InternetAddress 객체 사용하여 수신자 주소 설정)
			Address receiver_address = new InternetAddress(receiver);

			// 3. 위에서 생성한 Message 객체 활용하여 전송할 메일 정보 설정
			// 3 - 1) 메일 헤더 정보 설정
			mailMessage.setHeader("content-type", "text/html; charset=UTF-8");

			// 3 - 2) 발신자 정보 설정
			mailMessage.setFrom(sender_address);

			// 3 - 3) 수신자 정보 설정
			mailMessage.addRecipient(RecipientType.TO, receiver_address);

			// 3 - 4) 메일 제목 설정
			mailMessage.setSubject(title);

			// 3 - 5) 메일 본문 설정 (본문과 함께 본문의 컨텐츠타입 전달)
			mailMessage.setContent(content, "text/html; charset=UTF-8");

			// 3 - 6) 메일 전송 날짜 및 시각 정보 설정 (java.util.Date 객체 활용하여 현재 서버의 시각 정보 전달)
			mailMessage.setSentDate(new Date());

			// 4. 메일 전송
			// javax.mail.Transport 클래스의 static 메소드 send() 호출
			Transport.send(mailMessage);

			System.out.println("메일이 정상적으로 전송되었습니다.");
			isSendSuccess = true;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("SMTP 서버 설정 또는 서비스 문제 발생");
		}
		
		return isSendSuccess;
	}
}
