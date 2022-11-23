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
									<c:forEach var="myProfile" items="${myProfile }">
										<table>
											<tr>
												<td><img src="resources/img/member/${myProfile.member_image }" width="100" height="100" style="border-radius: 10em; margin-right: 10px"></td>
												<td style="width: 600px; font-size: 1rem; font-weight: 510;">${myProfile.member_nickname }<br>${myProfile.member_id }</td>
												<td><input type="button" style="text-align: right;" value="내 스타일" class="btn btn-outline-dark btn-rounded btn-sm" onclick="location.href='review_mystyle?member_idx=${sessionScope.sIdx}'"></td>
											</tr>        
										</table>
									</c:forEach>
									</div>
									<!-- 프로필 끝-->	
									
									<!-- 구매내역 시작-->									
									<div class="col-md-12" style="margin-top: 40px;">
										<h5 style="font-size: 1rem; font-weight: 510;">구매내역</h5>			
										<table style="text-align: center;" class="table table-hover">
											<tr>
												<td></td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">구매일</td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">구매가</td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">상태</td>
											</tr>
											<c:forEach var="myOrder" items="${myOrder }">
											<tr>
												<td style="text-align:left; font-size: 14px; width: 600px; float: left; padding: 3px 0px 3px 1px; text-overflow: ellipsis; overflow: hidden; white-space:nowrap;">
													<img src="resources/img/product/${myOrder.image_real_file1 }" width="100" height="100" style="padding: 3px 0px 3px 1px">
													<a href="product_detail?product_idx=${myOrder.product_idx }" style="color: black;">${myOrder.product_name }</a>
												</td>
												<td style="font-size:14px; color: black; width: 90px; padding: 3px 0px 3px 3px; vertical-align:middle;">${myOrder.order_buy_date }</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 3px; vertical-align:middle;">
													<fmt:formatNumber value="${myOrder.product_buy_price }" pattern="#,###"/>원
												</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 0px; vertical-align:middle;">
<%--                           <c:choose> --%>
<%--                           	<c:when test="${mysell.order_sell_gb == '0'}"> --%>
<%--                           		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수대기</a> --%>
<%--                           	</c:when> --%>
<%--                           	<c:when test="${mysell.order_sell_gb == '1'}"> --%>
<%--                           		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수  중</a> --%>
<%--                           	</c:when> --%>
<%--                           	<c:when test="${mysell.order_sell_gb == '2'}"> --%>
<%--                           		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수완료</a> --%>
<%--                           	</c:when> --%>
<%--                           	<c:when test="${mysell.order_sell_gb == '3'}"> --%>
<%--                           		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px; color: red;">판매반려</a> --%>
<%--                           	</c:when>                               	                                	                                	 --%>
<%--                           </c:choose>										 --%>
												</td>
											</tr>
											</c:forEach>
									</table>		  
									</div>
									<!-- 구매내역 끝-->
									
									<!-- 판매내역 시작-->																				
									<div class="col-md-12" style="margin-top: 40px;">
										<h5 style="font-size: 1rem; font-weight: 510;">판매내역</h5>			
										<table style="text-align: center;" class="table table-hover">
											<tr>
												<td></td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">구매일</td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">구매가</td>
												<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">상태</td>
											</tr>
											<c:forEach var="myOrder" items="${myOrder }">
											<tr>
												<td style="text-align:left; font-size: 14px; width: 600px; float: left; padding: 3px 0px 3px 1px; text-overflow: ellipsis; overflow: hidden; white-space:nowrap;">
													<img src="resources/img/product/${myOrder.image_real_file1 }" width="100" height="100" style="padding: 3px 0px 3px 1px">
													<a href="product_detail?product_idx=${myOrder.product_idx }" style="color: black;">${myOrder.product_name }</a>
												</td>
												<td style="font-size:14px; color: black; width: 90px; padding: 3px 0px 3px 3px; vertical-align:middle;">${myOrder.order_buy_date }</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 3px; vertical-align:middle;">
													<fmt:formatNumber value="${myOrder.product_buy_price }" pattern="#,###"/>원
												</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 0px; vertical-align:middle;">
<%--                           <c:choose> --%>
<%--                           	<c:when test="${mysell.order_sell_gb == '0'}"> --%>
<%--                           		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수대기</a> --%>
<%--                           	</c:when> --%>
<%--                           	<c:when test="${mysell.order_sell_gb == '1'}"> --%>
<%--                           		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수  중</a> --%>
<%--                           	</c:when> --%>
<%--                           	<c:when test="${mysell.order_sell_gb == '2'}"> --%>
<%--                           		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수완료</a> --%>
<%--                           	</c:when> --%>
<%--                           	<c:when test="${mysell.order_sell_gb == '3'}"> --%>
<%--                           		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px; color: red;">판매반려</a> --%>
<%--                           	</c:when>                               	                                	                                	 --%>
<%--                           </c:choose>										 --%>
												</td>
											</tr>
											</c:forEach>
									</table>		  
									</div>
									<!-- 판매내역 끝-->
												
									<!-- 위시리스트 시작-->		
									
									
									
																	
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