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

	<!-- member_joinForm -->
	<section class="py-md-0">
		<form action="#" method="post" id="join">
			<div class="row justify-content-center align-items-center vh-md-100">
				<div class="col-md-10 col-lg-5">
					<div class="row gutter-1">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInput1">이메일 주소</label>
								<input id="exampleInput1" type="text" class="form-control" placeholder="예) ownit@ownit.com">
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInput2">닉네임</label>
								<input id="exampleInput2" type="text" class="form-control" placeholder="2~6글자">
							</div>
						</div>
	
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInput6">이름</label>
								<input id="exampleInput6" type="text" class="form-control" placeholder="이름">
							</div>
						</div>
	                      
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInput7">휴대전화</label>
								<input id="exampleInput7" type="text" class="form-control" placeholder="전화번호 입력">
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInput8">비밀번호</label>
								<input id="exampleInput8" type="password" class="form-control" placeholder="Password">
	                        </div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInput9">비밀번호 재확인</label>
								<input id="exampleInput9" type="password" class="form-control" placeholder="Password">
							</div>
						</div>                    
	                    
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInput5">우편번호</label>
								<input id="exampleInput5" type="text" class="form-control" placeholder="Zip">
							</div>
						</div>
						
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleInput4">도로명주소</label>
								<input id="exampleInput4" type="text" class="form-control" placeholder="Street">
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInput3">상세주소</label>
								<input id="exampleInput3" type="text" class="form-control" placeholder="Company">
							</div>
						</div>
						
						<div class="col-12" style="height: 25px; margin-top: 15px;">
							<div class="custom-control custom-checkbox mb-2" style="text-align: left;">
								<input type="checkbox" class="custom-control-input" id="customCheck1" name="agree1">
								<label class="custom-control-label" for="customCheck1">[필수] 이용 약관 동의</label>
								<button type="button" class="counter-plus icon-plus" style="background: white;" data-toggle="modal" data-target="#exampleModal-1"></button>
							</div>
						</div>
						
						<div class="col-12" style="height: 25px;">
							<div class="custom-control custom-checkbox mb-2" style="text-align: left;">
								<input type="checkbox" class="custom-control-input" id="customCheck2" name="agree2">
								<label class="custom-control-label" for="customCheck2">[선택] 광고성 정보 수신 동의</label>
							</div>
						</div>

						<div class="modal fade" id="exampleModal-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">이용약관</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">
										<p>제 1 조 (목적)<br>이 약관은 "회원" 개인 상호 간 또는 “제휴 사업자”와 “회원” 개인 간에 상품 등을 매매하는 것을 
										중개하고, "상품" 등에 관한 정보를 상호 교환할 수 있도록 크림 주식회사(이하 "회사"라 합니다)가 운영, 
										제공하는 KREAM 서비스(이하 "서비스")에 대한 것으로 본 약관에서는 "서비스"의 이용과 관련하여 "회사"와 "회원"과의 
										권리, 의무 및 책임사항, 기타 필요한 사항을 규정합니다.</p>
									</div>
								</div>
							</div>
						</div>		
						 <div class="col-12 mt-2">
							<button type="submit" class="btn btn-block btn-dark btn-rounded" onclick="location.href='member_login'">가입하기</button>
						</div>  
					</div>
				</div>
			</div>	
		</form>	
	</section>   
	<!-- /member_joinForm -->

    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- / footer -->

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html>