<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
	
	<c:if test="${not empty sessionScope.sId }">
		<script type="text/javascript">
			alert("잘못된 접근입니다!");
			location.href = "./";
		</script>
	</c:if> 
	
	<!-- member_findEmail --> 
	<section class="py-md-0">
		<form action="member_findEmailResult" method="post" id="findEmail">
			<div class="container">
				<div class="row justify-content-center align-items-center vh-md-100">
					<div class="col-md-10 col-lg-5">
						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">
								<div class="row mt-2">
									<p>가입 시 등록한 성함 및 휴대폰 번호를 입력 해주세요.</p>
									<div class="form-group col-12">
										<label for="exampleInputEmail1">Name</label>
										<input type="text" class="form-control" name="member_name" id="exampleInputEmail1">
									</div>
									<div class="form-group col-12 mt-1">
										<label for="exampleInputPassword1">Phone Number</label>
										<input type="text" class="form-control" name="member_phone" id="exampleInputPassword1">
									</div>
									<div class="col-12 mt-2">
										<button type="submit" class="btn btn-block btn-dark btn-rounded">아이디 찾기</button>
									</div>
									<!-- 이름과 전화번호가 일치하지 않을 때-->
									<c:if test="${check == 1}">
										<script>
											opener.document.findEmail.member_name.value = "";
											opener.document.findEmail.member_phone.value = "";
										</script>
										<label style="color: #DC143C; font-weight: 800; font-size: 15px; margin: auto; padding-top: 20px;">일치하는 정보가 존재하지 않습니다.</label>
										
									</c:if>
									
									<!-- 이름과 비밀번호가 일치하지 않을 때 -->
									<c:if test="${check == 0 }">
									<label style="color: #4169E1; font-weight: 800; font-size: 15px; margin: auto; padding-top: 20px;">찾으시는 아이디는' ${member_id}' 입니다.</label>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>	
	</section>
	<!-- /member_findEmail -->

    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- / footer -->

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html> 