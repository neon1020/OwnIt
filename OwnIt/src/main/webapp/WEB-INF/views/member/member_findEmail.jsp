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

	<!-- member_findEmail -->
	<section id="component-1">
		<div class="container">
			<br>
			<br>
			<br>
			<br>
			<div style="text-align: center;">
				<h3>이메일 주소 찾기에 성공하였습니다.</h3>
				<hr>
				<br>
				<h5>이메일 주소</h5>
				<p>a***@naver.com</p>
				<div class="container-fluid">
	          		<div class="row gutter-0">
			            <div class="col-2" style="margin: auto;">
			              <button type="button" class="btn btn-dark btn-rounded" onclick="location.href='member_login'">로그인</button>
			            </div>
		            </div>
				</div>
            </div>
		</div>
	</section>
	<!-- /member_findEmail -->
	
    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- / footer -->

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html>