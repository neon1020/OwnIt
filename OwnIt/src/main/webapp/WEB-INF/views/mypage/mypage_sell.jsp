<%@page import="com.teamone.ownit.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<%--     <jsp:include page="../inc/cart_inTop.jsp"></jsp:include> --%>
	<!-- /header -->  

    <!-- hero -->
<!-- 	<section class="hero hero-small bg-purple text-white"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row gutter-2 gutter-md-4 align-items-end"> -->
<!-- 				<div class="col-md-6 text-center text-md-left"> -->
<!-- 					<h1 class="mb-0">김뽀얌이</h1> -->
<!-- 					<span class="text-muted">부산광역시, 대한민국</span> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-6 text-center text-md-right"> -->
<!-- 					<a href="#!" class="btn btn-sm btn-outline-white">Sign out</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->

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

							<!-- mypage_sell -->
							<div class="tab-pane fade show active" id="sidebar-1-2" role="tabpanel" aria-labelledby="sidebar-1-2">
								<div class="row">
									<div class="col-12">
										<h3 class="mb-0">판매내역</h3>
										<span class="eyebrow">${sellCount }개의 판매내역이 있습니다</span>
									</div>
								</div>
	
<!-- 								<div style="text-align: center;"> -->
<!-- 									<ul class="nav nav-tabs lavalamp" id="component-1" role="tablist"> -->
<!-- 										<li class="nav-item"> -->
<!-- 											<a class="nav-link active" data-toggle="tab" href="#component-1-1" role="tab" aria-controls="component-1-1" aria-selected="true">판매입찰</a> -->
<!-- 										</li> -->
<!-- 										<li class="nav-item"> -->
<!-- 											<a class="nav-link" data-toggle="tab" href="#component-1-2" role="tab" aria-controls="component-1-2" aria-selected="false">진행중</a> -->
<!-- 										</li> -->
<!-- 										<li class="nav-item"> -->
<!-- 											<a class="nav-link" data-toggle="tab" href="#component-1-3" role="tab" aria-controls="component-1-3" aria-selected="false">종료</a> -->
<!-- 										</li>   -->
<!-- 									</ul> -->
<!-- 								</div>	 -->

<!-- 								<div class="tab-content" id="component-1-content" style="margin-top: 30px;"> -->
<!-- 									<div class="tab-pane fade show active" id="component-1-1" role="tabpanel" aria-labelledby="component-1-1"> -->
<!-- 													<input type="button" value="최근 2개월" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 													<input type="button" value="4개월" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 													<input type="button" value="6개월" class="btn btn-outline-dark btn-rounded btn-sm"> -->
										<form style="float: right;">
											<input type="month" class="month">~<input type="month">
											<button type="submit" class="btn btn-dark btn-rounded btn-sm">					                        
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
												<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
												</svg>
											</button>
										</form>
<!-- 										<table style="width: 1000px; text-align: center;" class="table table-hover"> -->
										<table style="text-align: center;" class="table table-hover">
										<tr>
											<td></td>
											<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">판매일</td>
											<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">판매가</td>
											<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">상태</td>
										</tr>
										<c:forEach var="mysell" items="${mysell }">
											<tr>
												<td style="text-align:left; font-size: 14px; width: 600px; float: left; padding: 3px 0px 3px 1px; text-overflow: ellipsis; overflow: hidden; white-space:nowrap;">
													<img src="resources/img/product/${mysell.image_real_file1 }" width="100" height="100" style="padding: 3px 0px 3px 1px">
													<a href="product_detail?product_idx=${mysell.product_idx }" style="color: black;">${mysell.product_name }</a>
												</td>
												<td style="font-size:14px; color: black; width: 90px; padding: 3px 0px 3px 3px; vertical-align:middle;">${mysell.order_sell_date }</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 3px; vertical-align:middle;">
													<fmt:formatNumber value="${mysell.product_sell_price }" pattern="#,###"/>원
												</td>
												<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 0px; vertical-align:middle;">
					                                <c:choose>
					                                	<c:when test="${mysell.order_sell_gb == '0'}">
					                                		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수대기</a>
					                                	</c:when>
					                                	<c:when test="${mysell.order_sell_gb == '1'}">
					                                		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수  중</a>
					                                	</c:when>
					                                	<c:when test="${mysell.order_sell_gb == '2'}">
					                                		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수완료</a>
					                                	</c:when>
					                                	<c:when test="${mysell.order_sell_gb == '3'}">
					                                		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px; color: red;">판매반려</a>
					                                	</c:when>                               	                                	                                	
					                                </c:choose>										
												</td>
											</tr>
										</c:forEach>
<!-- 										<tr> -->
<!-- 											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td> -->
<!-- 											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td> -->
<!-- 											<td>2022.09.22</td> -->
<!-- 											<td>1,918,000원</td> -->
<!-- 											<td>입고완료</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td> -->
<!-- 											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td> -->
<!-- 											<td>2022.09.22</td> -->
<!-- 											<td>1,918,000원</td> -->
<!-- 											<td>검수합격</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td> -->
<!-- 											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td> -->
<!-- 											<td>2022.09.22</td> -->
<!-- 											<td>1,918,000원</td> -->
<!-- 											<td>정산완료 <input type="button" value="정산정보" class="btn btn-outline-dark btn-sm"></td> -->
<!-- 										</tr>				 -->
									</table>		  	
<!-- 								</div> -->
								
<!-- 								<div class="tab-pane fade" id="component-1-2" role="tabpanel" aria-labelledby="component-1-2"> -->
<!-- 								  	<table style="margin: auto;"> -->
<!-- 										<tr> -->
<!-- 											<td colspan="3"> -->
<!-- 												<input type="button" value="최근 2개월" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 												<input type="button" value="4개월" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 												<input type="button" value="6개월" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 												<input type="month">~<input type="month"> -->
<!-- 												<input type="submit" value="조회" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 									<table style="width: 1000px; text-align: center;" class="table table-hover"> -->
<!-- 										<tr> -->
<!-- 											<th colspan="2">상품정보</th> -->
<!-- 											<th>판매일자</th> -->
<!-- 											<th>판매금액</th> -->
<!-- 											<th>진행상황</th> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td> -->
<!-- 											<td style="text-align: left;"><a href="" style="color: black;">Apple AirPods Max Silver (Korean Ver.)</a></td> -->
<!-- 											<td>2022.10.04</td> -->
<!-- 											<td>647,000원</td> -->
<!-- 											<td>(크림으로)배송중</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td> -->
<!-- 											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td> -->
<!-- 											<td>2022.09.22</td> -->
<!-- 											<td>1,918,000원</td> -->
<!-- 											<td>검수중</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td> -->
<!-- 											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td> -->
<!-- 											<td>2022.09.22</td> -->
<!-- 											<td>1,918,000원</td> -->
<!-- 											<td>매입완료 <input type="button" value="정산정보" class="btn btn-outline-dark btn-sm"></td> -->
<!-- 										</tr> -->
<!-- 									</table>				 -->
<!-- 								</div> -->
								
<!-- 								<div class="tab-pane fade" id="component-1-3" role="tabpanel" aria-labelledby="component-1-3"> -->
<!-- 								  	<table style="margin: auto;"> -->
<!-- 										<tr> -->
<!-- 											<td colspan="3"> -->
<!-- 												<input type="button" value="최근 2개월" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 												<input type="button" value="4개월" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 												<input type="button" value="6개월" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 												<input type="month">~<input type="month"> -->
<!-- 												<input type="submit" value="조회" class="btn btn-outline-dark btn-rounded btn-sm"> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 									<table style="width: 1000px; text-align: center;" class="table table-hover"> -->
<!-- 										<tr> -->
<!-- 											<th colspan="2">상품정보</th> -->
<!-- 											<th>판매일자</th> -->
<!-- 											<th>판매금액</th> -->
<!-- 											<th>진행상황</th> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td> -->
<!-- 											<td style="text-align: left;"><a href="" style="color: black;">Apple AirPods Max Silver (Korean Ver.)</a></td> -->
<!-- 											<td>2022.10.04</td> -->
<!-- 											<td>647,000원</td> -->
<!-- 											<td>발송완료</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td> -->
<!-- 											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td> -->
<!-- 											<td>2022.09.22</td> -->
<!-- 											<td>1,918,000원</td> -->
<!-- 											<td>검수중</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td><img src="resources/img/member/ppoyam.jpg" width="60" height="60"></td> -->
<!-- 											<td style="text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td> -->
<!-- 											<td>2022.09.22</td> -->
<!-- 											<td>1,918,000원</td> -->
<!-- 											<td>매입완료 <input type="button" value="정산정보" class="btn btn-outline-dark btn-sm"></td> -->
<!-- 										</tr> -->
<!-- 									</table>		 -->
<!-- 								</div> -->
<!-- 							</div>       -->
							</div>
							<!-- mypage_sell -->
						</div>
					</div>
				</div>
			</div>
			<!-- /content -->
			<!-- 페이징 태그 START -->
	        <div class="row" style="margin-left: 680px;">
	          <div class="col">
	            <nav class="d-inline-block">
	              <ul class="pagination">
	              	<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
	              	<li class="page-item active"><input class="page-link" type="button" value="&laquo;" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='mypage_sell?member_idx=${sessionScope.sIdx }&pageNum=${pageInfo.pageNum - 1}'"<%} %>></li>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${i eq pageInfo.pageNum }"><li class="page-item"><a class="page-link">${i }</a></li></c:when>
							<c:otherwise><li class="page-item active"><a class="page-link" href="mypage_sell?member_idx=${sessionScope.sIdx }&pageNum=${i }">${i }<span class="sr-only">(current)</span></a></li></c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item active"><input class="page-link" type="button" value="&raquo;" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='mypage_sell?member_idx=${sessionScope.sIdx }&pageNum=${pageInfo.pageNum + 1}'"<%} %>></li>
	              </ul>
	            </nav>
	          </div>
	        </div>
			<!-- 페이징 태그 END -->
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