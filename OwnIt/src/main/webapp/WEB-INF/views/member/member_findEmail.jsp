<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<!-- member_findEmail -->
	<section id="component-1">
		<div class="container">
			<br> <br> <br> <br>
			<div style="text-align: center;">
				<c:choose>
					<c:when test="${member.member_id eq null }">
						<h3>찾으시는 아이디가 없습니다.</h3>
						<br>
						<br>
						<br>
						<br>
						<br>
						<div class="container-fluid">
							<div class="row gutter-0">
								<div class="col-2" style="margin: auto;">
									<button type="button" class="btn btn-dark btn-rounded"
										onclick="location.href='member_joinForm'">가입하기</button>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<h3>이메일 주소 찾기에 성공하였습니다.</h3>
						<br>
						<br>
						<h5>${member.member_id }</h5>
						<br>
						<div class="container-fluid">
							<div class="row gutter-0">
								<div class="col-2" style="margin: auto;">
									<button type="button" class="btn btn-dark btn-rounded"
										onclick="location.href='member_login'">로그인</button>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
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