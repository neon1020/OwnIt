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

    <!-- hero -->
	<section class="hero hero-small bg-purple text-white">
		<div class="container">
			<div class="row gutter-2 gutter-md-4 align-items-end">
				<div class="col-md-6 text-center text-md-left">
					<h1 class="mb-0">김뽀얌이</h1>
					<span class="text-muted">부산광역시, 대한민국</span>
				</div>
				<div class="col-md-6 text-center text-md-right">
					<a href="#!" class="btn btn-sm btn-outline-white">Sign out</a>
				</div>
			</div>
		</div>
	</section>

    <!-- listing -->
	<section class="pt-5">
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
                 			<form action="#" method="post" id="join">
								<div class="tab-pane fade show active" id="sidebar-1-1" role="tabpanel" aria-labelledby="sidebar-1-1">
									<div class="row mb-2">
									</div>
									<div class="row gutter-1">
										<div class="col-md-12">
											<img src="resources/img/member/ppoyam.jpg" width="100" height="100" style="border-radius: 10em">
											<input type="button" value="이미지 변경" class="btn btn-outline-dark btn-rounded btn-sm">
											<input type="button" value="삭제" class="btn btn-outline-dark btn-rounded btn-sm">
											<hr>
										</div>
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
									</div>
									<div class="row gutter-1">
										<div class="col-12">
											<div class="form-group">
												<label for="exampleInput8">새 패스워드</label>
												<input id="exampleInput8" type="password" class="form-control" placeholder="Password">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput9">새 패스워드</label>
												<input id="exampleInput9" type="password" class="form-control" placeholder="Password">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput10">새 패스워드 재확인</label>
												<input id="exampleInput10" type="password" class="form-control" placeholder="Password">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col" style="text-align: center;">
											<input type="submit" value="변경하기" class="btn btn-dark btn-rounded">
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