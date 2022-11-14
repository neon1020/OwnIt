<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>
    <!-- header -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <jsp:include page="../inc/cart_inTop.jsp"></jsp:include>
	<!-- /header -->  
	
	<!-- member_login -->
	<section class="py-md-0">
		<form action="#" method="post" id="login">
			<div class="container">
				<div class="row justify-content-center align-items-center vh-md-100">
					<div class="col-md-10 col-lg-5">
						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">
								<div class="row mt-2">
									<div class="form-group col-12">
										<label for="exampleInputEmail1">Email address</label>
										<input type="email" class="form-control" id="exampleInputEmail1">
									</div>
									<div class="form-group col-12 mt-1">
										<label for="exampleInputPassword1">Password</label>
										<input type="password" class="form-control" id="exampleInputPassword1">
									</div>
									<div class="col-12" style="height: 25px; margin-top: 20px;">
										<div class="custom-control custom-checkbox mb-2" style="text-align: center;">
											<input type="checkbox" class="custom-control-input" id="customCheck2" name="agree2">
											<label class="custom-control-label" for="customCheck2">이메일 저장하기</label>
										</div>
									</div>
									<div class="col-12 mt-2">
										<button type="submit" class="btn btn-block btn-dark btn-rounded">Log In</button>
									</div>
								</div>
							</div>
						</div>
						<div style="text-align: center;">
							<a href="member_joinForm" style="color: black;">이메일 가입 |</a> <a href="member_findEmailForm" style="color: black;">이메일 찾기 |</a> <a href="#" data-toggle="modal" data-target="#exampleModal-2" style="color: black;">비밀번호 찾기</a>
							
<!-- 							<div class="modal fade" id="exampleModal-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 							  <div class="modal-dialog" role="document"> -->
<!-- 							    <div class="modal-content"> -->
<!-- 							      <div class="modal-header"> -->
<!-- 							        <h5 class="modal-title" id="exampleModalLabel">이메일 아이디 찾기</h5> -->
<!-- 							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 							          <span aria-hidden="true">×</span> -->
<!-- 							        </button> -->
<!-- 							      </div> -->
<!-- 							      <div class="modal-body"> -->
<!-- 							        <p>가입 시 등록한 휴대폰 번호를 입력하면 <br>이메일 주소의 일부를 알려드립니다.</p> -->
<!-- 							        <input id="exampleInput7" type="text" class="form-control" placeholder="전화번호 입력"> -->
<!-- 							      </div> -->
<!-- 							      <div class="modal-footer"> -->
<!-- 							        <div class="container-fluid"> -->
<!-- 							          <div class="row gutter-0"> -->
<!-- 							            <div class="col"> -->
<!-- 							              <button type="button" class="btn btn-block btn-dark btn-rounded" onclick="location='member_findEmail'">이메일 아이디 찾기</button> -->
<!-- 							            </div> -->
<!-- 							          </div> -->
<!-- 							        </div> -->
<!-- 							      </div> -->
<!-- 							    </div> -->
<!-- 							  </div> -->
<!-- 							</div>							 -->
							
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
							        <input id="exampleInput1" type="text" class="form-control" placeholder="예) ownit@ownit.com">
							      </div>
							      <div class="modal-footer">
							        <div class="container-fluid">
							          <div class="row gutter-0">
							            <div class="col">
							              <button type="button" class="btn btn-block btn-dark btn-rounded" onclick="location='member_findPasswd'">메일 발송하기</button>
							            </div>
							          </div>
							        </div>
							      </div>
							    </div>
							  </div>
							</div>									
						</div>
						<div style="text-align: center;">              
							<a href="#"><img src="resources/img/member/kakao.jpg"></a>
							<a href="#"><img src="resources/img/member/naver.jpg"></a>
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