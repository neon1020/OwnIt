<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.js"></script>
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
    <script type="text/javascript">
    	var isDuplicateEmail = true; // 이메일 중복 여부 : true(사용불가), false(사용가능) => o
    	var isCorrectEmail = false; // 이메일 형식 확인 여부 : true(사용가능), false(사용불가) => o
    	var isCorrectName = false; // 이름 형식 확인 여부 : true(사용가능), false(사용불가) => o
    	var isDuplicateNickname = true; // 닉네임 중복 여부 : true(사용불가), false(사용가능) => o
    	var isCorrectNickname = false; // 닉네임 형식 확인 여부 : true(사용가능), false(사용불가) => o
    	var isCorrectPhone = false; // 전화번호 형식 확인 여부 : true(사용가능), false(사용불가) => o
    	var isCorrectPassword = false; // 비밀번호 형식 확인 여부 : true(사용가능), false(사용불가) => o
    	var isEqualPassword = false; // 재확인 비밀번호 일치 여부 : true(사용가능), false(사용불가) => o
    	
    	var isAgree1Checked = false;
    	
		// ------------------------------------------------------------------------------------------------
    	
    	// 이메일 중복 확인 & 이메일 형식 확인
    	function checkEmail() {
    		var email = $('#email').val();
    		// var emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    		var emailRegex = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
    		if(email === '') {
    			$('#emailResult').html('');
    		} else {
	    		$.ajax({
	    			async: true,
	    			type: 'POST',
	    			data: email,
	    			url: 'checkEmail',
	    			dataType: 'json',
	    			contentType: 'application/json; charset=UTF-8',
	    			success : function(data) {
	    				if(data.cnt > 0) {
	    					$('#emailResult').html("이미 사용중인 이메일입니다.");
	    					$('#emailResult').css("color", "orange");
	    					$('#email').focus();
	    					isDuplicateEmail = true;
	    				} else {
	    					if(!emailRegex.exec(email)) {
	    						$('#emailResult').html("이메일 형식을 확인해주세요.");
		    					$('#emailResult').css("color", "orange");
		    					$('#email').focus();
		    					isCorrectEmail = false;
	    					} else {
		    					$('#emailResult').html("사용 가능한 이메일입니다.");
		    					$('#emailResult').css("color", "blue");
		    					isDuplicateEmail = false;
		    					isCorrectEmail = true;
	    					}
	    				}
	    			}
	    		});
    		}
    	}
    	
    	// ------------------------------------------------------------------------------------------------
    	
    	// 이름 형식 확인
    	function checkName() {
    		var name = $('#memberName').val();
    		var nameRegex = /^[가-힣]{2,10}$/;
    		
    		if(name === '') {
    			$('#nameResult').html("");
    		} else {
	    		if(!nameRegex.exec(name)) {
	    			$('#nameResult').html("2 ~ 10 글자 한글만 입력 가능합니다.");
					$('#nameResult').css("color", "orange");
					isCorrectName = false;
	    		} else {
	    			$('#nameResult').html("");
	    			isCorrectName = true;
	    		}
    		}
    	}
    	
    	// ------------------------------------------------------------------------------------------------
    	
    	// 닉네임 중복 확인 & 닉네임 형식 확인
    	function checkNickname() {
    		var nickname = $('#nickname').val();
    		var nicknameRegex = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,12}$/;
    		if(nickname === '') {
    			$('#nicknameResult').html('');
    		} else {
	    		$.ajax({
	    			async: true,
	    			type: 'POST',
	    			data: nickname,
	    			url: 'checkNickname',
	    			dataType: 'json',
	    			contentType: 'application/json; charset=UTF-8',
	    			success : function(data) {
	    				if(data.cnt > 0) {
	    					$('#nicknameResult').html("이미 사용중인 닉네임입니다.");
	    					$('#nicknameResult').css("color", "orange");
	    					$('#nickname').focus();
	    					isDuplicateNickname = true;
	    				} else {
	    					if(!nicknameRegex.exec(nickname)) {
	    						$('#nicknameResult').html("2 ~ 12 글자 한글, 영문, 숫자만 입력 가능합니다.");
		    					$('#nicknameResult').css("color", "orange");
		    					$('#nickname').focus();
		    					isCorrectNickname = false;
	    					} else {
		    					$('#nicknameResult').html("사용 가능한 닉네임입니다.");
		    					$('#nicknameResult').css("color", "blue");
		    					isDuplicateNickname = false;
		    					isCorrectNickname = true;
	    					}
	    				}
	    			}
	    		});
    		}
    	}
    	
    	// ------------------------------------------------------------------------------------------------
    	
    	// 전화번호 형식 확인
    	function checkPhone() {
    		var phone = $('#phone').val();
    		var phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
    		
    		if(phone === '') {
    			$('#phoneResult').html("");
    		} else {
	    		if(!phoneRegex.exec(phone)) {
	    			$('#phoneResult').html("입력하신 번호를 확인해주세요.");
					$('#phoneResult').css("color", "orange");
					isCorrectPhone = false;
	    		} else {
	    			$('#phoneResult').html("");
	    			isCorrectPhone = true;
	    		}
    		}
    	}
    	
    	// ------------------------------------------------------------------------------------------------
    	
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
    	
    	// ------------------------------------------------------------------------------------------------
    	
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
    	
    	// ------------------------------------------------------------------------------------------------
    	
    	// 필수 동의 약관 체크 여부
    	document.addEventListener('DOMContentLoaded', () => {
	      const checkbox = document.querySelector('input[name="agree1"]');
		      checkbox.addEventListener('change', () => {
		        if (checkbox.checked) {
		        	isAgree1Checked = true;	
		        } else {
		        	isAgree1Checked = false;
		        }
		      });
		});
		
    	// 선택 동의 약관 체크 여부
		document.addEventListener('DOMContentLoaded', () => {
	      const checkbox = document.querySelector('input[name="member_agree"]');
		      checkbox.addEventListener('change', () => {
		        if (checkbox.checked){
		        	$('#agree2').val('1');
		        } else {
		        	$('#agree2').val('0');
		        }
		      });
		});
		
		// ------------------------------------------------------------------------------------------------
    	
    	function checkAll() {
    		if(isDuplicateEmail) {
    			alert("이메일 중복 확인 필수");
    			$("#email").select();
    			return false;
    		} else if (!isCorrectEmail) {
    			alert("이메일 형식 확인 필수");
    			$("#email").select();
    			return false;
    		} else if (!isCorrectName) {
    			alert("이름 형식 확인 필수");
    			$("#memberName").select();
    			return false;
    		} else if (isDuplicateNickname) {
    			alert("닉네임 중복 확인 필수");
    			$("#nickname").select();
    			return false;
    		} else if (!isCorrectNickname) {
    			alert("닉네임 형식 확인 필수");
    			$("#nickname").select();
    			return false;
    		} else if (!isCorrectNickname) {
    			alert("닉네임 형식 확인 필수");
    			$("#nickname").select();
    			return false;
    		} else if (!isCorrectPhone) {
    			alert("전화번호 형식 확인 필수");
    			$("#phone").select();
    			return false;
    		} else if (!isCorrectPassword) {
    			alert("패스워드 형식 확인 필수");
    			$("#password").select();
    			return false;
    		} else if (!isEqualPassword) {
    			alert("패스워드 재확인 필수");
    			$("#rePassword").select();
    			return false;
    		} else if (!isAgree1Checked) {
    			alert("필수 이용 약관에 동의해주세요.");
    			return false;
    		}
    		
    		return true;
    	}
    </script>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 & 주소 검색 API
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                $("#zipCode").val(data.zonecode); // 우편번호
	                $("#address1").val(data.roadAddress); // 주소
	                $("#address2").focus(); // 상세주소에 focus 요청
	            }
	        }).open();
	    }
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

	<!-- member_joinForm -->
	<section class="py-md-0">
		<form action="member_joinPro" method="post" id="join" name="join" onsubmit="return checkAll()">
			<div class="row justify-content-center align-items-center vh-md-100" style="height: 1500px;">
				<div class="col-md-10 col-lg-5" style="height: 1000px;">
					<div class="row gutter-1">
						<div class="col-md-12">
							<label for="email">E-Mail</label>
							<div class="form-group">
								<input id="email" name="member_id" type="text" class="form-control" placeholder="ownit@ownit.com" required="required" oninput="checkEmail()" style="width: 400px; float:left;">
								<div style="float: left; height:53px; display: inline-block; position: relative; line-height: 53px;"><span id="emailResult" style="margin-left: 20px;"></span></div>
							</div>
						</div>
						
						<div class="col-md-12">
							<label for="memberName">Name</label>
							<div class="form-group">
								<input id="memberName" name="member_name" type="text" class="form-control" placeholder="이름 (2 ~ 10 글자 한글)" required="required" oninput="checkName()" style="width: 400px; float:left;">
								<div style="float: left; height:53px; display: inline-block; position: relative; line-height: 53px;"><span id="nameResult" style="margin-left: 20px;"></span></div>
							</div>
						</div>
	
						<div class="col-md-12">
							<label for="nickname">Nickname</label>
							<div class="form-group">
								<input id="nickname" name="member_nickname" type="text" class="form-control" placeholder="별명 (2 ~ 12 글자 한글, 영문, 숫자)" required="required" oninput="checkNickname()" style="width: 400px; float:left;">
								<div style="float: left; height:53px; display: inline-block; position: relative; line-height: 53px;"><span id="nicknameResult" style="margin-left: 20px;"></span></div>
							</div>
						</div>
	                      
						<div class="col-md-12">
							<label for="phone">Phone</label>
							<div class="form-group">
								<input id="phone" name="member_phone" type="text" class="form-control" placeholder="- 를 포함하여 입력 (xxx - xxxx - xxxx)" required="required" oninput="checkPhone()" style="width: 400px; float:left;">
								<div style="float: left; height:53px; display: inline-block; position: relative; line-height: 53px;"><span id="phoneResult" style="margin-left: 20px;"></span></div>
							</div>
						</div>
						
						<div class="col-md-12">
							<label for="password">Password</label>
							<div class="form-group">
								<input id="password" name="member_passwd" type="password" class="form-control" placeholder="8 ~ 16 글자 (영문 대소문자, 숫자, 특수기호)" required="required" oninput="checkPassword()" style="width: 400px; float:left;">
								<div style="float: left; height:53px; display: inline-block; position: relative; line-height: 53px;"><span id="passwordResult" style="margin-left: 20px;"></span></div>
							</div>
						</div>
							<div style="margin-left: 15px; color: #9999CC;">사용 가능 특수문자 : !, @, #, $, %, ^, &, *, _</div>
						
						<div class="col-md-12">
							<label for="rePassword">Retype Password</label>
							<div class="form-group">
								<input id="rePassword" type="password" class="form-control" placeholder="비밀번호 재확인" required="required" oninput="checkRePassword()" style="width: 400px; float:left;">
								<div style="float: left; height:53px; display: inline-block; position: relative; line-height: 53px;"><span id="password2Result" style="margin-left: 20px;"></span></div>
							</div>
						</div>
	                    
						<div class="col-md-3">
							<div class="form-group">
								<label for="zipCode">Zipcode</label>
								<input id="zipCode" name="address_zipcode" type="text" class="form-control" placeholder="클릭하여 우편번호 입력" required="required" onclick="execDaumPostcode()">
							</div>
						</div>
						
						<div class="col-md-9">
							<div class="form-group">
								<label for="address1">Address</label>
								<input id="address1" name="address1" type="text" class="form-control" placeholder="도로명 주소" required="required">
							</div>
						</div>
						
						<div class="col-md-12">
							<div class="form-group">
								<label for="address2">Address Detail</label>
								<input id="address2" name="address2" type="text" class="form-control" placeholder="상세 주소" required="required">
							</div>
						</div>
						
						<div class="col-12" style="height: 25px; margin-top: 10px;">
							<div class="custom-control custom-checkbox mb-2" style="text-align: center;">
								<input type="checkbox" id="agree1" name="agree1" value=""> [필수] 이용 약관 동의
								<button type="button" class="counter-plus icon-plus" style="background: white;" data-toggle="modal" data-target="#exampleModal-1"></button>
							</div>
						</div>
						
						<div class="col-12" style="height: 25px; margin-top: 10px;">
							<div class="custom-control custom-checkbox mb-2" style="text-align: center;">
								<input type="checkbox" id="agree2" name="member_agree" value="0"> [선택] 광고성 정보 수신 동의
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
							<button type="submit" class="btn btn-block btn-dark btn-rounded">가입하기</button>
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