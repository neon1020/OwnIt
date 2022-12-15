# Own It (온잇)
> 쇼핑몰 형태의 전자기기 중고 거래 플랫폼
<img src="https://user-images.githubusercontent.com/108676517/206972425-89a3f1b2-4698-4f46-8d33-9319d7aff008.JPG"  width="700" height="500">

## ERD
<img src="https://user-images.githubusercontent.com/108676517/206976445-743b3e53-83b3-4ee3-a6b0-03ce27a1732c.png"  width="700" height="500">

## 프로젝트 개요
- **개발 기간** : 2022.10.06 ~ 2022.12.07 (약 9주)
- **개발 인원** : 6명 (팀 프로젝트)
- **개발 환경**
  - 운영체제  : Window10
  - 개발 방식 : Spring MVC
  - 개발 툴   : Apache Tomcat v9.0, STS4, MySQL
  - 개발 언어 : Java, JavaScript, HTML5, CSS3, SQL, JSP
  - 프레임워크 : Spring, MyBatis
  - 형상 관리 : GitHub
  - Open API : Kakao 주소 API, 네이버 로그인 API
  
  
- **담당 구현 기능** : Spring Framework를 사용한 쇼핑몰 형태의 웹사이트 구현
  - 회원가입 : Kakao 주소 API, 구글 SMTP 사용한 메일 발송 기능 사용
  - 로그인 : 이메일 로그인 및 네이버 로그인 API 이용한 로그인 기능 구현
  - 로그아웃, 탈퇴
  - 비밀번호 찾기 : 메일 발송 기능 사용
  - 회원 마이페이지 : 구매 내역 관리, 판매 정산 계좌 관리
  - 게시판 : 댓글 및 대댓글 기능 구현
  - 관리자 : 회원 관리, 댓글 관리
  
  
## 구현 기능 설명
- 회원가입 및 로그인
<img src="https://user-images.githubusercontent.com/108676517/206977913-b1194c65-1bda-4661-aa3c-2b6107e50ded.JPG"  width="700" height="550">
<img src="https://user-images.githubusercontent.com/108676517/206977945-54452d41-c71b-45fd-9d7a-fc4d40f3b615.JPG"  width="700" height="550">
<img src="https://user-images.githubusercontent.com/108676517/206977984-efa93688-6eb4-4ed9-b362-07593e1e2ea1.JPG"  width="700" height="550">
<img src="https://user-images.githubusercontent.com/108676517/206978085-bbc5618d-7671-4a71-a883-53a8767ae3fe.JPG"  width="700" height="550">
<img src="https://user-images.githubusercontent.com/108676517/206978117-36b84eff-88b2-4cc1-ae92-d80615765f21.JPG"  width="700" height="550">

- 마이페이지
<img src="https://user-images.githubusercontent.com/108676517/206979653-d03e1c19-92fe-474d-b304-6b377802d05e.JPG"  width="700" height="550">
<img src="https://user-images.githubusercontent.com/108676517/206979686-6437f750-3e11-450e-ad55-8b97e51fc0d0.JPG"  width="700" height="550">

- 댓글 및 대댓글
<img src="https://user-images.githubusercontent.com/108676517/206979755-b73b0fcf-d8ee-48c9-911d-b65b56c9d2bd.JPG"  width="700" height="550">

- 관리자
<img src="https://user-images.githubusercontent.com/108676517/206979902-9c14f83f-7749-42b9-b058-b666a29b89cf.JPG"  width="700" height="550">
<img src="https://user-images.githubusercontent.com/108676517/206979942-4aff1a7b-5d59-4194-96f2-ec899018014f.JPG"  width="700" height="550">


## 느낀점
- GitHub 를 활용한 첫 협업이라 헤맸던 부분도 많았으나, 조장으로서 master 브랜치와 전체 코드를 관리할 수 있었던 좋은 경험이었음.
- 앞서 배웠던 Model1 과 Model2 방식을 Spring Framework 로 이식하는 부분에서 약간의 어려움이 있었지만, 꾸준한 작업을 통해 Spring 의 동작 원리를 이해하게 됨.
- 6명의 팀원을 이끌어가며 의견 조율, 취합 등 협업에 필요한 역량을 쌓을 수 있었음.

## 참고 사이트 : KREAM (https://kream.co.kr/)
