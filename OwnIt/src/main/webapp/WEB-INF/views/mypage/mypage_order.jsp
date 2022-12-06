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
	<!-- /header -->
	
	<c:if test="${empty sessionScope.sIdx }">
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
		
							<!-- mypage_order -->
							<div class="tab-pane fade show active" id="sidebar-1-2" role="tabpanel" aria-labelledby="sidebar-1-2">
								<div class="row">
									<div class="col-12">
										<h3 class="mb-0">구매내역</h3>
										<span class="eyebrow">${listCount }개의 구매내역이 있습니다.</span>
									</div>
								</div>
		
		
							<c:if test="${listCount > 0}">							
								<form action="mypage_order" method="get" style="float: right;">
									<input type="hidden" name="member_idx" value="${sessionScope.sIdx }">
									<input type="date" id="date1" name="date1" required="required">  ~  <input type="date" id="date2" name="date2" required="required">
									<button type="submit" class="btn btn-dark btn-rounded btn-sm">					                        
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
										<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
										</svg>
									</button>
								</form>
								
								
								<table style="text-align: center;" class="table table-hover">
									<tr>
										<td>상품명</td>
										<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">구매일</td>
										<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">구매가</td>
										<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">상태</td>
									</tr>
									<c:forEach var="order" items="${orderList }" varStatus="num">
										<tr>
											<td style="text-align:left; font-size: 14px; width: 600px; float: left; padding: 3px 0px 3px 1px; text-overflow: ellipsis; overflow: hidden; white-space:nowrap;">
												<img src="resources/img/product/${order.image_real_file1 }" width="100" height="100" style="padding: 3px 0px 3px 1px;">
												<a href="product_detail?product_idx=${order.product_idx }" style="color: black;">${order.product_name }</a>
											</td>
											<td style="font-size:14px; color: black; width: 90px; padding: 3px 0px 3px 3px; vertical-align:middle;">${order.order_buy_date }</td>
											<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 3px; vertical-align:middle;">
												<fmt:formatNumber value="${order.product_buy_price }" pattern="#,###"/>원
											</td>
											<td style="font-size:14px; color: black; width: 160px; padding: 3px 0px 3px 0px; vertical-align:middle;">
												<c:choose>
				                                	<c:when test="${order.order_buy_gb == '0'}">
				                                		배송 대기
				                                	</c:when>
				                                	<c:when test="${order.order_buy_gb == '1'}">
				                                		배송 중
				                                	</c:when>
				                                	<c:when test="${order.order_buy_gb == '2'}">
				                                		배송완료 <input type="button" value="구매확정" class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#buy_fix${num.index }">
				                                	</c:when>
				                                	<c:when test="${order.order_buy_gb == '3'}">
				                                		구매확정 <input type="button" value="리뷰작성" class="btn btn-outline-dark btn-sm" onclick="location.href='review_writeForm?order_buy_idx=${order.order_buy_idx}'">
				                                	</c:when>
				                                	<c:when test="${order.order_buy_gb == '4'}">
				                                		구매확정 <input type="button" value="리뷰보기" class="btn btn-outline-dark btn-sm" onclick="location.href='goReview?product_idx=${order.product_idx}&member_idx=${order.member_idx }'">
				                                	</c:when>
				                                </c:choose>
				                                
				                                <!-- modal 창 시작 -->
												<div class="modal fade" id="buy_fix${num.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">구매확정</h5>
																<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">×</span>
																</button>
															</div>
															<form action="buyFix" method="post">
																<input type="hidden" name="member_idx" value="${order.member_idx }">
																<input type="hidden" name="order_buy_idx" value="${order.order_buy_idx }">
																<div class="modal-body">
																	<p><span style="color: #FF6666;">구매확정 이후에는 반품 및 교환이 불가능하므로<br>반드시 상품을 받으신 후 진행해 주세요.</span><br><br>
																	구매확정을 진행하시겠습니까?</p>
																</div>
																<div class="modal-footer">
																	<div class="container-fluid">
																		<div class="row gutter-0">
																			<div class="col">
																				<button type="submit" class="btn btn-block btn-primary">확인</button>
																			</div>
																		</div>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
												<!-- modal 창 끝 -->
											</td>
										</tr>
									</c:forEach>
								</table>
							  </c:if>  		
							</div>
							<!-- 테이블 div 끝 -->
						</div>
					</div>
				</div>
			</div>			
					
			<!-- 페이징 태그 START -->
			<c:if test="${listCount > 0}">
		       <div class="row" style="margin-left: 680px;">
		         <div class="col">
		           <nav class="d-inline-block">
		             <ul class="pagination">
		             	<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
		             	<li class="page-item active"><input class="page-link" type="button" value="&laquo;" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='mypage_order?member_idx=${sessionScope.sIdx }&pageNum=${pageInfo.pageNum - 1}'"<%} %>></li>
						<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
							<c:choose>
								<c:when test="${i eq pageInfo.pageNum }"><li class="page-item"><a class="page-link">${i }</a></li></c:when>
								<c:otherwise><li class="page-item active"><a class="page-link" href="mypage_order?member_idx=${sessionScope.sIdx }&pageNum=${i }">${i }<span class="sr-only">(current)</span></a></li></c:otherwise>
							</c:choose>
						</c:forEach>
						<li class="page-item active"><input class="page-link" type="button" value="&raquo;" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='mypage_order?member_idx=${sessionScope.sIdx }&pageNum=${pageInfo.pageNum + 1}'"<%} %>></li>
		             </ul>
		           </nav>
		         </div>
		       </div>
		    </c:if>
			<!-- 페이징 태그 END -->
	  	</div>
  	</div>
	<!-- /content -->
</section>
   <!-- listing -->

    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- / footer -->

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html>