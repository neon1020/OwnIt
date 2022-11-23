<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<link rel="stylesheet" href="resources/css/vendor.css" />
<link rel="stylesheet" href="resources/css/style.css" />
	<style type="text/css">
	.product-image > img { 
		width: 300px; 
		height: 300px;
	}
	#btn_remove {
		margin: 10px auto;
	 }
	  .col-lg-4 { flex: 0 0 25%; max-width: 25%; padding: 10px; }
      .card-post { height: 500px; }
      .card-post .card-body { width: 260px; }
      .equal { height: 260px; width: 260px; border-radius: 0.5em; }
      .equal img { width: 100%; height: 100%; object-fit: cover; }
      .profile img { width: 30px; height: 30px; border-radius: 10em; margin: 5px 5px; }
      .eyebrow { text-transform: none; margin-left: 10px;}
      .card-title img { width: 50px; height: 50px; border-radius: 1em; margin: 5px 5px; float: left; }
      .card-title a { font-size: 13px; font-weight: 600; }
      .card-post .card-title a:hover { color: #101010; }
      .card-title .subject { margin: 5px 5px; width: 190px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis; float: left; }
      .card-content { font-size: 14px; width: 100%; float: left; margin: 5px; text-overflow: ellipsis; overflow: hidden; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;}
      .like { width: 100%; float: left; margin: 10px 5px; }
      .like img { margin: 0 5px 0 0; }
      /* 상단 정렬 메뉴 버튼 */
      label { background-color: #FFF; border-color: #FFF; color: #101010; border-radius: 1em; font-size: 20px; font-weight: 700; padding: 6px 14px; }
      .btn-check { opacity: 0; }
      input[type=radio]:checked + label { background-color: #101010; border-color: #101010; color: #FFF; }
	</style>
</head>
<body>
	<!-- header -->
  <jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- /header -->    

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
	
								<!-- mypage_main -->
								<div class="row gutter-1">
								
									<!-- 프로필 시작-->
									<div class="col-md-12">
										<c:forEach var="mainProfile" items="${mainProfile }">
											<table>
												<tr>
													<td><img src="resources/img/member/${mainProfile.image_real_file1 }" width="100" height="100" style="border-radius: 10em; margin-right: 10px"></td>
													<td style="width: 600px; font-size: 1rem; font-weight: 510;">${mainProfile.member_nickname }<br>${mainProfile.member_id }</td>
													<td><input type="button" style="text-align: right;" value="내 스타일" class="btn btn-outline-dark btn-rounded btn-sm" onclick="location.href='review_mystyle?member_idx=${sessionScope.sIdx}'"></td>
												</tr>        
											</table>
										</c:forEach>
									</div>
									<!-- 프로필 끝-->	
									
									<!-- 구매내역 시작-->									
									<div class="col-md-12" style="margin-top: 40px; margin-top: 50px;">
										<h1 style="width: 600px; font-size: 1rem; font-weight: 550;">구매내역</h1>			
										<table style="text-align: center;" class="table table-hover">
											<tr>
												<td></td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">구매일</td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">구매가</td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">상태</td>
											</tr>
											<c:forEach var="mainOrder" items="${mainOrder }">
											<tr>
												<td style="text-align:left; font-size: 14px; width: 600px; float: left; padding: 3px 0px 3px 1px; text-overflow: ellipsis; overflow: hidden; white-space:nowrap;">
													<img src="resources/img/product/${mainOrder.image_real_file1 }" width="100" height="100" style="padding: 3px 0px 3px 1px">
													<a href="product_detail?product_idx=${mainOrder.product_idx }" style="color: black;">${mainOrder.product_name }</a>
												</td>
												<td style="font-size:14px; color: black; width: 90px; padding: 3px 0px 3px 3px; vertical-align:middle;">${mainOrder.order_buy_date }</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 3px; vertical-align:middle;">
													<fmt:formatNumber value="${mainOrder.product_buy_price }" pattern="#,###"/>원
												</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 0px; vertical-align:middle;">
                          <c:choose>
                          	<c:when test="${mainOrder.order_buy_gb == '0'}">
                          		<a href="#" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">배송대기</a>
                          	</c:when>
                          	<c:when test="${mainOrder.order_buy_gb == '1'}">
                          		<a href="#" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">배송  중</a>
                          	</c:when>
                          	<c:when test="${mainOrder.order_buy_gb == '2'}">
                          		<a href="#" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">배송완료</a>
                          	</c:when>
                          	<c:when test="${mainOrder.order_buy_gb == '3'}">
                          		<a href="#" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">구매확정</a>
                          	</c:when>              
                          </c:choose>										
												</td>
											</tr>
											</c:forEach>
										</table>		  
									</div>
									<!-- 구매내역 끝-->
									
									<!-- 판매내역 시작-->																				
									<div class="col-md-12" style="margin-top: 40px; margin-top: 50px;">
										<h1 style="width: 600px; font-size: 1rem; font-weight: 550;">판매내역</h1>			
										<table style="text-align: center;" class="table table-hover">
											<tr>
												<td></td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">판매일</td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">판매가</td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">상태</td>
											</tr>
											<c:forEach var="mainSell" items="${mainSell }">
											<tr>
												<td style="text-align:left; font-size: 14px; width: 600px; float: left; padding: 3px 0px 3px 1px; text-overflow: ellipsis; overflow: hidden; white-space:nowrap;">
													<img src="resources/img/product/${mainSell.image_real_file1 }" width="100" height="100" style="padding: 3px 0px 3px 1px">
													<a href="product_detail?product_idx=${mainSell.product_idx }" style="color: black;">${mainSell.product_name }</a>
												</td>
												<td style="font-size:14px; color: black; width: 90px; padding: 3px 0px 3px 3px; vertical-align:middle;">${mainSell.order_sell_date }</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 3px; vertical-align:middle;">
													<fmt:formatNumber value="${mainSell.product_sell_price }" pattern="#,###"/>원
												</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 0px; vertical-align:middle;">
                          <c:choose>
                          	<c:when test="${mainSell.order_sell_gb == '0'}">
                          		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수대기</a>
                          	</c:when>
                          	<c:when test="${mainSell.order_sell_gb == '1'}">
                          		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수  중</a>
                          	</c:when>
                          	<c:when test="${mainSell.order_sell_gb == '2'}">
                          		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수완료</a>
                          	</c:when>
                          	<c:when test="${mainSell.order_sell_gb == '3'}">
                          		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px; color: red;">판매반려</a>
                          	</c:when>                               	                                	                                	
                          </c:choose>										
												</td>
											</tr>
											</c:forEach>
										</table>		  
									</div>
									<!-- 판매내역 끝-->
												
									<!-- 위시리스트 시작-->		
<!-- 									<div class="col-lg-9"> -->
										<h1 style="width: 600px; font-size: 1rem; font-weight: 550; margin-top: 50px;">위시리스트</h1>	
										<hr><br>
										<hr>
										<div class="row gutter-2 gutter-lg-3">       
											<c:forEach var="mainWish" items="${mainWish }" varStatus="vs">
												<div class="col-6 col-md-4">
													<article class="card card-post">
							              <figure class="equal equal-50">
							                <a class="image image-fade" href="product_detail?product_idx=${mainWish.product_idx }"><img src="resources/img/product/${mainWish.image_real_file1 }"></a>
							              </figure>
							              <div class="card-body">
							                <h3 class="card-content">${mainWish.product_name }</h3>
							                <div class="like" style="text-align: right;">
														  	<button class="btn btn-outline-dark btn-sm btn-rounded" data-toggle="modal" data-target="#exampleModal-1${vs.index}">
															  	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
											  					<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
															  	</svg>
														  	</button>
														  	<button class="btn btn-outline-dark btn-sm btn-rounded" data-toggle="modal" data-target="#exampleModal-2${vs.index}">
															  	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
																  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
																  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
																	</svg>
														  	</button>      
							                </div>
							              </div>
													</article>
												</div>									
											</c:forEach>
										</div>
<!-- 									</div>    									 -->
									<!-- 위시리스트 끝-->										
															
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