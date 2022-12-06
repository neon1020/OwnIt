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
	input[type=file]::file-selector-button { display: none; }
  </style>
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
	              <div class="row">
	                <div class="col">
	                  <h3 class="mb-0">프로필 정보</h3>
	                  <span class="eyebrow">온잇 대표 프로필과 닉네임을 수정 하실 수 있습니다.</span>
	                </div>
	              </div>	 
								<!-- mypage_revise -->
								
								<form action="mypage_modifyProfile" method="post" enctype="multipart/form-data"> 
									<input type="hidden" name="member_idx" value="${mypage.member_idx }" />
									<table class="table">
										<tr>
											<td class="table-active" style="vertical-align:middle; text-align: center; color: black; padding-left: 0px; padding-right: 0px;">프로필 사진</td>
											<td>
												<img src="resources/img/member/${mypage.image_real_file1 }" style="width: 120px; height: 120px; border-radius: 10em; margin-bottom: 20px; margin-left: 90px;"><br>
												<input type="file" name="file" class="btn btn-outline-secondary btn-sm" style="text-align: center;" required="required"><br>
											</td>
										</tr>
										<tr>
											<td class="table-active" style="vertical-align:middle; text-align: center; color: black; padding-left: 0px; padding-right: 0px;">닉네임</td>
											<td >
												<input type="text" class="form-control form-control-sm" name="member_nickname" style="width: 303px;" value="${mypage.member_nickname }" required="required">
											</td>
										</tr>
										<tr>
											<td class="table-active" style="vertical-align:middle; text-align: center; color: black; padding-left: 0px; padding-right: 0px;">휴대전화</td>
											<td >
												<input type="text" class="form-control form-control-sm" name="member_phone" style="width: 303px;" value="${mypage.member_phone }" required="required">
											</td>
										</tr>
									</table>
									
									<div class="row">
										<div class="col" style="text-align: center;">
											<input type="submit" value="적용" class="btn btn-dark btn-rounded" >
											<input type="button" value="취소" onclick="history.back()" class="btn btn-outline-dark btn-rounded">
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