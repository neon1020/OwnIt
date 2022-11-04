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

							<!-- mypage_main -->
							<div class="row gutter-1">
								<div class="col-md-12">
									<table>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="100" height="100" style="border-radius: 10em"></td>
											<td style="width: 600px;">김뽀얌이<br>el****@naver.com</td>
											<td>
												<input type="button" value="프로필 수정" class="btn btn-outline-dark btn-rounded btn-sm" onclick="location.href='mypage_revise'">
												<input type="button" value="내 스타일" class="btn btn-outline-dark btn-rounded btn-sm" onclick="location.href='review_mystyle'">
											</td>
										</tr>        
									</table>
								</div>	
								<div class="col-md-12" style="margin-top: 40px;">
									<h5>구매내역</h5>			
									<table style="width: 1000px; text-align: center;" class="table table-hover">
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td><a href="">Apple AirPods Max Silver (Korean Ver.)</a></td>
											<td>2022.10.04</td>
											<td>647,000원</td>
											<td>배송중</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td><a href="">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>배송완료</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td><a href="">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>배송완료</td>
										</tr>
									</table>
								</div>
								<div class="col-md-12" style="margin-top: 40px;">
									<h5>판매내역</h5>		
									<table style="width: 1000px; text-align: center;" class="table table-hover">
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td><a href="">Apple AirPods Max Silver (Korean Ver.)</a></td>
											<td>2022.10.04</td>
											<td>647,000원</td>
											<td>발송완료</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td><a href="">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>입고완료</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td><a href="">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>검수합격</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- /mypage_main -->
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