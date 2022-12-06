<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.js"></script>
  <link rel="stylesheet" href="resources/css/vendor.css" />
  <link rel="stylesheet" href="resources/css/style.css" />
  <style>
.profileMain { text-align: center;}
.profileMain img { width: 120px; height: 120px; border-radius: 10em; margin-bottom: 20px; }  
  </style>
	<script type="text/javascript">
		var isCorrectPassword = false;	
		var isEqualPassword = false;
		
    	// 패스워드 형식 확인 & 패스워드 안전도 점검
    	function checkPassword() {
    		var password = $('#password').val();
    		var passwordRegex = /^[\w!@#$%^&*]{8,16}$/;
    		
    		if(password === '') {
    			$('#passwordResult').html("");
    		} else {
				if(passwordRegex.exec(password)) {
					var upperCaseRegex = /[A-Z]/;
					var lowerCaseRegex = /[a-z]/;
					var numRegex = /[0-9]/;
					var specialCharRegex = /[!@#$%^&*_]/;
					
					var count = 0;
					
					if(upperCaseRegex.exec(password)) {
						count++;
					} 
					if(lowerCaseRegex.exec(password)) {
						count++;
					} 
					if(numRegex.exec(password)) {
						count++;
					} 
					if(specialCharRegex.exec(password)) {
						count++;
					}
					
					switch (count) {
					case 4: $("#passwordResult").html("안전도 : 상");
							$("#passwordResult").css("color", "blue");
							isCorrectPassword = true;
							break;
					case 3: $("#passwordResult").html("안전도 : 중");
							$("#passwordResult").css("color", "green");
							isCorrectPassword = true;
							break;
					case 2: $("#passwordResult").html("안전도 : 하");
							$("#passwordResult").css("color", "orange");
							isCorrectPassword = true;
							break;
					default: $("#passwordResult").html("영문 대소문자, 숫자, 특수기호 중 2가지 이상 사용");
							 $("#passwordResult").css("color", "red");
							 isCorrectPassword = false;
							 break;
					}
				} else {
					$("#passwordResult").html("8 ~ 16 자리 영문 대소문자, 숫자, 특수문자 입력");
					$("#passwordResult").css("color", "red");
					isCorrectPassword = false;
				}
    		}
		}
    	
    	// 패스워드 재확인 일치 여부
		function checkRePassword() {
			var password = $('#password').val();
			var rePassword = $('#rePassword').val();
			
			if(rePassword === '') {
				$("#password2Result").html("");
			} else {
	    		if(password == rePassword) {
	    			$("#password2Result").html("비밀번호 일치");
					$("#password2Result").css("color", "blue");
					isEqualPassword = true;
	    		} else {
	    			$("#password2Result").html("비밀번호 불일치");
					$("#password2Result").css("color", "red");
					isEqualPassword = false;
	    		}
			}
		}
    	
    	// 회원 탈퇴
    	function remove() {
    		var isRemove = confirm("탈퇴하시겠습니까?\n탈퇴하신 정보는 복구할 수 없습니다.");
    		
    		if(isRemove) {
    			location.href="member_remove";
    		}
    	}
	</script>   	 
</head>
<body>
		<!-- header -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- /header -->  
	<c:if test="${empty sessionScope.sId }"> 
		<script type="text/javascript">
			alert("잘못된 접근입니다!");
			location.href = "./";
		</script>
	</c:if>		 

  	<!-- listing -->
		<section class="pt-5" style="margin-top: 100px;">
			<div class="container">
				<div class="row gutter-4 justify-content-between">

				<!-- sidebar -->
				<jsp:include page="../inc/sidebar_mypage.jsp"></jsp:include>
				<!-- /sidebar -->

				<!-- content -->
				<div class="col-lg-9">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">

								<!-- mypage_revise -->
<!-- 									<div class="col-md-12"> -->
<!-- 										<div class="profileMain"> -->
<%-- 											<img class="profile" src="resources/img/member/${mypage.image_real_file1 }"> --%>
<!-- 											<input type="button" name="member_image" value="이미지 변경" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 											<input type="button" value="삭제" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 											<hr> -->
<!-- 										</div> -->
<!-- 									</div> -->
                 <div class="row">
                   <div class="col">
                     <h3 class="mb-0">비밀번호 변경</h3>
<%--                      <span class="eyebrow">${addressCount }개의 배송지가 있습니다.</span> --%>
                   </div>
                 </div>	              
								<form action="mypage_revisePro" method="post" id="joinForm"> 
									<div class="tab-pane fade show active" id="sidebar-1-1" role="tabpanel" aria-labelledby="sidebar-1-1">
										<div class="row mb-2">
										</div>
										<div class="row gutter-1">
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInput1">이메일 주소</label>
													<input id="exampleInput1" type="text" name="member_id" class="form-control" value="${mypage.member_id }" readonly="readonly">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInput2">닉네임</label>
													<input id="exampleInput2" type="text" class="form-control" name="member_nickname" value="${mypage.member_nickname }" readonly="readonly">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInput6">이름</label>
													<input id="exampleInput6" type="text" class="form-control" name="member_name" value="${mypage.member_name }" readonly="readonly">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInput7">휴대전화</label>
													<input id="exampleInput7" type="text" class="form-control" value="${mypage.member_phone }" readonly="readonly">
												</div>
											</div>
	<!-- 										<div class="col-md-3"> -->
	<!-- 											<div class="form-group"> -->
	<!-- 												<label for="exampleInput5">우편번호</label> -->
	<%-- 												<input id="exampleInput5" type="text" class="form-control" value="${mypage.address_zipcode }" readonly="readonly"> --%>
	<!-- 											</div> -->
	<!-- 										</div> -->
	<!-- 										<div class="col-md-3"> -->
	<!-- 											<div class="form-group"> -->
	<!-- 												<label for="exampleInput4">도로명주소</label> -->
	<%-- 												<input id="exampleInput4" type="text" class="form-control" value="${mypage.address1 }" readonly="readonly"> --%>
	<!-- 											</div> -->
	<!-- 										</div> -->
	<!-- 										<div class="col-md-6"> -->
	<!-- 											<div class="form-group"> -->
	<!-- 												<label for="exampleInput3">상세주소</label> -->
	<%-- 												<input id="exampleInput3" type="text" class="form-control" value="${mypage.address2 }" readonly="readonly"> --%>
	<!-- 											</div> -->
	<!-- 										</div> -->
										</div>
										<div class="row gutter-1">
											<div class="col-12">
												<div class="form-group">
													<label for="exampleInput8">기존 패스워드</label>
													<input id="exampleInput8" type="password" name="member_passwd" class="form-control" placeholder="Password">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInput9">새 패스워드</label>
													<input id="password" type="password" name="newPasswd" class="form-control" oninput="checkPassword()" placeholder="8 ~ 16 글자 (영문 대소문자, 숫자, 특수기호)">
													<span id="passwordResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInput10">새 패스워드 재확인</label>
													<input id="rePassword" type="password" name="newPasswd2" class="form-control" oninput="checkRePassword()" placeholder="8 ~ 16 글자 (영문 대소문자, 숫자, 특수기호)">
													<span id="password2Result"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
												</div>
											</div>
										</div>
	
										<div class="row">
											<div class="col" style="text-align: center;">
												<input type="submit" value="적용" class="btn btn-dark btn-rounded" >
												<input type="button" value="취소" onclick="history.back()" class="btn btn-dark btn-rounded">
												<input type="button" value="탈퇴" onclick="remove()" class="btn btn-outline-dark btn-rounded">								
											</div>
										</div>
									</div>
								</form>
								<!-- /mypage_revise -->
							
							</div>
						</div>
					</div>
				</div>
				<!-- /content -->

				</div>
			</div>
		</section>
    <!-- listing -->

    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- / footer -->

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html>