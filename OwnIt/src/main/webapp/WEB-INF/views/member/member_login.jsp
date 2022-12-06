<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript">
    
	 	// 이메일 저장 체크 여부
		document.addEventListener('DOMContentLoaded', () => {
	        const checkbox = document.querySelector('input[name="save_email"]');
		      checkbox.addEventListener('change', () => {
		        if (checkbox.checked){
		        	$('#save_email').val('Y');
		        } else {
		        	$('#save_email').val('N');
		        }
		    });
		});
	 	
	 	function modalData() {
	 		let data = $("#receive_email").val();
	 		location.href = "member_findPasswd?member_id=" + data;
	 	}
	 	function modalData2() {
	 		let data = $("#member_phone").val();
	 		location.href = "member_findEmail?member_phone=" + data;
	 	}
	 	
	 	// 네이버 로그인
// 		var naverLogin = new naver.LoginWithNaverId(
// 			{
// 				clientId: "e1NqYJZnZQcoVqr7LPpt",
// 				callbackUrl: "http://localhost:8081/ownit/member_naverCallBack",
// 				isPopup: false,
// 				loginButton: {color: "white", type: 3, height: 60}
// 			}
// 		);
// 		naverLogin.init();

    </script>
</head>
<body>
    <!-- header -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- /header -->  
	
	<c:if test="${not empty sessionScope.sId }">
		<script type="text/javascript">
			alert("잘못된 접근입니다!");
			location.href = "./";
		</script>
	</c:if>
	
	<!-- member_login -->
	<section class="py-md-0">
		<form action="member_loginPro" method="post" id="login">
			<div class="container">
				<div class="row justify-content-center align-items-center vh-md-100">
					<div class="col-md-10 col-lg-5">
						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">
								<div class="row mt-2">
									<div class="form-group col-12">
										<label for="exampleInputEmail1">Email</label>
										<input type="text" class="form-control" name="member_id" id="exampleInputEmail1" value="${cookie.cookieId.value}">
									</div>
									<div class="form-group col-12 mt-1">
										<label for="exampleInputPassword1">Password</label>
										<input type="password" class="form-control" name="member_passwd" id="exampleInputPassword1">
									</div>
									<div class="col-12" style="height: 25px; margin-top: 20px;">
										<div class="custom-control custom-checkbox mb-2" style="text-align: center;">
											<c:choose>
												<c:when test="${not empty cookie.cookieId.value }">
													<input type="checkbox" id="save_email" name="save_email" checked="checked"> 이메일 저장하기
												</c:when>
												<c:otherwise>
													<input type="checkbox" id="save_email" name="save_email"> 이메일 저장하기
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="col-12 mt-2">
										<button type="submit" class="btn btn-block btn-dark btn-rounded">Log In</button>
									</div>
								</div>
							</div>
						</div>
						<div style="text-align: center;">
							<a href="member_joinForm" style="color: black;">이메일 가입 |</a> <a href="#" data-toggle="modal" data-target="#exampleModal-1" style="color: black;">이메일 찾기 |</a> <a href="#" data-toggle="modal" data-target="#exampleModal-2" style="color: black;">비밀번호 찾기</a>
								
								<div class="modal fade" id="exampleModal-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">이메일 아이디 찾기</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">×</span>
								        </button>
								      </div>
								      <div class="modal-body">
								        <p>가입 시 등록한 휴대폰 번호를 입력 해주세요.</p>
										<input type="text" class="form-control" name="member_phone" id="member_phone" placeholder="Phone Number">
								      </div>
								      <div class="modal-footer">
								        <div class="container-fluid">
								          <div class="row gutter-0">
								            <div class="col">
								              <button type="button" class="btn btn-block btn-dark btn-rounded" onclick="modalData2()">이메일 아이디 찾기</button>
								            </div>
								          </div>
								        </div>
								      </div>
								    </div>
								  </div>
								</div>								
							
							<div class="modal fade" id="exampleModal-2" tabindex="-2" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">×</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <p>가입 시 등록하신 이메일을 입력하시면,<br>이메일로 임시 비밀번호를 전송해 드립니다.</p>
							        <input type="text" id="receive_email" name="receive_email" class="form-control" placeholder="예) ownit@ownit.com">
							      </div>
							      <div class="modal-footer">
							        <div class="container-fluid">
							          <div class="row gutter-0">
							            <div class="col">
							              <button type="button" class="btn btn-block btn-dark btn-rounded" onclick="modalData()">메일 발송하기</button>
							            </div>
							          </div>
							        </div>
							      </div>
							    </div>
							  </div>
							</div>									
						</div>
						<div style="text-align: center;">              
							<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=ee04e57ce1c4f35a3eafd3052e7156e0&redirect_uri=http://itwillbs16.cafe24.com/kakaoLogin&response_type=code">
								<img src="resources/img/member/kakao.jpg" alt="카카오계정 로그인">
							</a>
							<a href="${url}"><img src="resources/img/member/naver.jpg"></a>
							<!-- <div id="naver_id_login" style="text-align: center;"></div> -->
						</div>
					</div>
				</div>
			</div>
		</form>	
	</section>
	<!-- /member_login -->
	

    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- / footer -->

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html>