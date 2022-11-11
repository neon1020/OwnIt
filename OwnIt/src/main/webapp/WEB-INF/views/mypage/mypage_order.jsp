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

							<!-- mypage_order -->
							<div class="tab-pane fade show active" id="sidebar-1-2" role="tabpanel" aria-labelledby="sidebar-1-2">
								<div class="row">
									<div class="col-12">
										<h3 class="mb-0">구매내역</h3>
										<span class="eyebrow">8 Items</span>
									</div>
								</div>
	
								<div style="text-align: center;">
									<ul class="nav nav-tabs lavalamp" id="component-1" role="tablist">
										<li class="nav-item">
											<a class="nav-link active" data-toggle="tab" href="#component-1-1" role="tab" aria-controls="component-1-1" aria-selected="true">결제완료</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#component-1-2" role="tab" aria-controls="component-1-2" aria-selected="false">배송중</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#component-1-3" role="tab" aria-controls="component-1-3" aria-selected="false">배송완료</a>
										</li>  
										<li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#component-1-4" role="tab" aria-controls="component-1-4" aria-selected="false">구매확정</a>
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
												<th>주문일자</th>
												<th>주문금액</th>
												<th>주문상태</th>
											</tr>
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
												<td>배송완료 <input type="button" value="구매확정" class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#exampleModal-1"></td>
											</tr>
											<tr>
												<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
												<td><a href="">Apple AirPods Pro with MagSafe Charging Case (Korean Ver.)</a></td>
												<td>2022.08.19</td>
												<td>250,000원</td>
												<td>구매확정 <input type="button" value="리뷰작성" class="btn btn-outline-dark btn-sm" onclick="location.href='../style/reviewWriteForm.jsp'"></td>
											</tr>
											<tr>
												<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
												<td><a href="">Apple AirPods Pro with MagSafe Charging Case (Korean Ver.)</a></td>
												<td>2022.08.19</td>
												<td>250,000원</td>
												<td>구매확정 <input type="button" value="작성한 리뷰" class="btn btn-outline-dark btn-sm" onclick="location.href='../style/style_detail.jsp'"></td>
											</tr>
										</table>	
										
										<div class="modal fade" id="exampleModal-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">구매확정을 진행해 주세요.</h5>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">×</span>
														</button>
													</div>
													<div class="modal-body">
														<p>구매확정 이후에는 반품/교환이 불가능하므로<br>반드시 상품을 받으신 후 진행해 주세요.</p>
													</div>
													<div class="modal-footer">
														<div class="container-fluid">
															<div class="row gutter-0">
																<div class="col">
																	<button type="button" class="btn btn-block btn-primary">확인</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>	
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
												<th>주문일자</th>
												<th>주문금액</th>
												<th>주문상태</th>
											</tr>
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
												<td>배송완료 <input type="button" value="구매확정" class="btn btn-outline-dark btn-sm"></td>
											</tr>
											<tr>
												<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
												<td><a href="">Apple AirPods Pro with MagSafe Charging Case (Korean Ver.)</a></td>
												<td>2022.08.19</td>
												<td>250,000원</td>
												<td>구매확정 <input type="button" value="리뷰작성" class="btn btn-outline-dark btn-sm" onclick="location.href='../style/reviewWriteForm.jsp'"></td>
											</tr>
											<tr>
												<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
												<td><a href="">Apple AirPods Pro with MagSafe Charging Case (Korean Ver.)</a></td>
												<td>2022.08.19</td>
												<td>250,000원</td>
												<td>구매확정 <input type="button" value="작성한 리뷰" class="btn btn-outline-dark btn-sm" onclick="location.href='../style/style_detail.jsp'"></td>
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
												<th>주문일자</th>
												<th>주문금액</th>
												<th>주문상태</th>
											</tr>
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
												<td>배송완료 <input type="button" value="구매확정" class="btn btn-outline-dark btn-sm"></td>
											</tr>
											<tr>
												<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
												<td><a href="">Apple AirPods Pro with MagSafe Charging Case (Korean Ver.)</a></td>
												<td>2022.08.19</td>
												<td>250,000원</td>
												<td>구매확정 <input type="button" value="리뷰작성" class="btn btn-outline-dark btn-sm" onclick="location.href='../style/reviewWriteForm.jsp'"></td>
											</tr>
											<tr>
												<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
												<td><a href="">Apple AirPods Pro with MagSafe Charging Case (Korean Ver.)</a></td>
												<td>2022.08.19</td>
												<td>250,000원</td>
												<td>구매확정 <input type="button" value="작성한 리뷰" class="btn btn-outline-dark btn-sm" onclick="location.href='../style/style_detail.jsp'"></td>
											</tr>
										</table>	
									</div>
			  
									<div class="tab-pane fade" id="component-1-4" role="tabpanel" aria-labelledby="component-1-4">
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
												<th>주문일자</th>
												<th>주문금액</th>
												<th>주문상태</th>
											</tr>
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
												<td>배송완료 <input type="button" value="구매확정" class="btn btn-outline-dark btn-sm"></td>
											</tr>
											<tr>
												<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
												<td><a href="">Apple AirPods Pro with MagSafe Charging Case (Korean Ver.)</a></td>
												<td>2022.08.19</td>
												<td>250,000원</td>
												<td>구매확정 <input type="button" value="리뷰작성" class="btn btn-outline-dark btn-sm" onclick="location.href='../style/reviewWriteForm.jsp'"></td>
											</tr>
											<tr>
												<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td>
												<td><a href="">Apple AirPods Pro with MagSafe Charging Case (Korean Ver.)</a></td>
												<td>2022.08.19</td>
												<td>250,000원</td>
												<td>구매확정 <input type="button" value="작성한 리뷰" class="btn btn-outline-dark btn-sm" onclick="location.href='../style/style_detail.jsp'"></td>
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
							<!-- /mypage_order -->
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