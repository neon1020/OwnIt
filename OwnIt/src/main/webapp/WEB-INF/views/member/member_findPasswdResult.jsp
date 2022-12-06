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

	<!-- member_findPasswd -->
	<section id="component-1">
		<div class="container">
			<br>
			<br>
			<br>
			<div style="text-align: center;">
				<h5>임시 비밀번호를 전송하였습니다. 전송 받은 임시 비밀번호로 로그인해주세요.</h5> 
				<br>
				<br>
				<div class="container-fluid">
	          		<div class="row gutter-0">
			            <div class="col-2" style="margin: auto;">
			              <button type="button" class="btn btn-dark btn-rounded" onclick="location.href='member_login'">로그인</button>
			              <br>
			              <br>
			              <br>
			              <br>
			              <br>
			              <br>
			            </div>
		            </div>
				</div>
            </div>
		</div>
	</section>
	<!-- /member_findPasswd -->

    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- / footer -->

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html>