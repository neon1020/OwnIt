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

							<!-- mypage_sell -->
							<div class="tab-pane fade show active" id="sidebar-1-2" role="tabpanel" aria-labelledby="sidebar-1-2">
								<div class="row">
									<div class="col-12">
										<h3 class="mb-0">판매내역</h3>
										<span class="eyebrow">8 Items</span>
									</div>
								</div>
	
								<div style="text-align: center;">
									<ul class="nav nav-tabs lavalamp" id="component-1" role="tablist">
										<li class="nav-item">
											<a class="nav-link active" data-toggle="tab" href="#component-1-1" role="tab" aria-controls="component-1-1" aria-selected="true">판매입찰</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#component-1-2" role="tab" aria-controls="component-1-2" aria-selected="false">진행중</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#component-1-3" role="tab" aria-controls="component-1-3" aria-selected="false">종료</a>
										</li>  
									</ul>
								</div>	

								<div class="tab-content" id="component-1-content" style="margin-top: 30px;">
								
									<div class="tab-pane fade show active" id="component-1-1" role="tabpanel" aria-labelledby="component-1-1">
									  	<table style="margin: auto;">
											<tr>
												<td colspan="3">
													<input type="button" value="최근 2개월" class="btn btn-outline-dark btn-rounded btn-sm">
													<input type="button" value="4개월" class="btn btn-outline-dark btn-rounded btn-sm">
													<input type="button" value="6개월" class="btn btn-outline-dark btn-rounded btn-sm">
													<input type="month">~<input type="month">
													<input type="submit" value="조회" class="btn btn-outline-dark btn-rounded btn-sm">
												</td>
											</tr>
										</table>
										<table style="width: 1000px; text-align: center;" class="table table-hover">
										<tr>
											<th colspan="2">상품정보</th>
											<th>판매일자</th>
											<th>판매금액</th>
											<th>진행상황</th>
										</tr>
										<tr>
											<td><img src="resources/img/product/${mysell.image_real_file1 }" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">${mysell.product_name }</a></td>
											<td>${mysell.order_sell_date }</td>
											<td>${mysell.product_sell_price }</td>
											<td>${mysell.order_sell_gb }</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>입고완료</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>검수합격</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>정산완료 <input type="button" value="정산정보" class="btn btn-outline-dark btn-sm"></td>
										</tr>				
									</table>		  	
								</div>
								
								<div class="tab-pane fade" id="component-1-2" role="tabpanel" aria-labelledby="component-1-2">
								  	<table style="margin: auto;">
										<tr>
											<td colspan="3">
												<input type="button" value="최근 2개월" class="btn btn-outline-dark btn-rounded btn-sm">
												<input type="button" value="4개월" class="btn btn-outline-dark btn-rounded btn-sm">
												<input type="button" value="6개월" class="btn btn-outline-dark btn-rounded btn-sm">
												<input type="month">~<input type="month">
												<input type="submit" value="조회" class="btn btn-outline-dark btn-rounded btn-sm">
											</td>
										</tr>
									</table>
									<table style="width: 1000px; text-align: center;" class="table table-hover">
										<tr>
											<th colspan="2">상품정보</th>
											<th>판매일자</th>
											<th>판매금액</th>
											<th>진행상황</th>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">Apple AirPods Max Silver (Korean Ver.)</a></td>
											<td>2022.10.04</td>
											<td>647,000원</td>
											<td>(크림으로)배송중</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>검수중</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>매입완료 <input type="button" value="정산정보" class="btn btn-outline-dark btn-sm"></td>
										</tr>
									</table>				
								</div>
								
								<div class="tab-pane fade" id="component-1-3" role="tabpanel" aria-labelledby="component-1-3">
								  	<table style="margin: auto;">
										<tr>
											<td colspan="3">
												<input type="button" value="최근 2개월" class="btn btn-outline-dark btn-rounded btn-sm">
												<input type="button" value="4개월" class="btn btn-outline-dark btn-rounded btn-sm">
												<input type="button" value="6개월" class="btn btn-outline-dark btn-rounded btn-sm">
												<input type="month">~<input type="month">
												<input type="submit" value="조회" class="btn btn-outline-dark btn-rounded btn-sm">
											</td>
										</tr>
									</table>
									<table style="width: 1000px; text-align: center;" class="table table-hover">
										<tr>
											<th colspan="2">상품정보</th>
											<th>판매일자</th>
											<th>판매금액</th>
											<th>진행상황</th>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">Apple AirPods Max Silver (Korean Ver.)</a></td>
											<td>2022.10.04</td>
											<td>647,000원</td>
											<td>발송완료</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>검수중</td>
										</tr>
										<tr>
											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
											<td>2022.09.22</td>
											<td>1,918,000원</td>
											<td>매입완료 <input type="button" value="정산정보" class="btn btn-outline-dark btn-sm"></td>
										</tr>
									</table>		
								</div>
									  
							</div>      
	   			         	
							<div class="row">
								<div class="col">
									<ul class="pagination">
										<li class="page-item active"><a class="page-link" href="#!">1 <span class="sr-only">(current)</span></a></li>
										<li class="page-item" aria-current="page"><a class="page-link" href="#!">2</a></li>
										<li class="page-item"><a class="page-link" href="#!">3</a></li>
										<li class="page-item"><a class="page-link" href="#!">4</a></li>
									</ul>
								</div>
							</div>
                  
							</div>
							<!-- mypage_sell -->
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