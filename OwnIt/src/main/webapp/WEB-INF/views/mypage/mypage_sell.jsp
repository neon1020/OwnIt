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

							<!-- mypage_sell -->
							<div class="tab-pane fade show active" id="sidebar-1-2" role="tabpanel" aria-labelledby="sidebar-1-2">
								<div class="row">
									<div class="col-12">
										<h3 class="mb-0">판매내역</h3>
										<span class="eyebrow">${sellCount }개의 판매내역이 있습니다.</span>
									</div>
								</div>
							
								<c:if test="${sellCount > 0}">
								<form action="mypage_sell" method="get" style="float: right;">
								<input type="hidden" name="member_idx" value="${sessionScope.sIdx }">
									<input style="font-size: 14px;" type="date" id="date1" name="date1" required="required">  ~  <input style="font-size: 14px;" type="date" id="date2" name="date2" required="required">
									
									<button type="submit" class="btn btn-dark btn-rounded btn-sm">					                        
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
										<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
										</svg>
									</button>
								</form>
								<table style="text-align: center;" class="table table-hover">
									<tr>
										<td style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">상품명</td>
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
                      		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}&order_sell_idx=${mysell.order_sell_idx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수대기</a>
                      	</c:when>
                      	<c:when test="${mysell.order_sell_gb == '1'}">
                      		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}&order_sell_idx=${mysell.order_sell_idx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수  중</a>
                      	</c:when>
                      	<c:when test="${mysell.order_sell_gb == '2'}">
                      		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}&order_sell_idx=${mysell.order_sell_idx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수완료</a>
                      	</c:when>
                      	<c:when test="${mysell.order_sell_gb == '3'}">
                      		<a href="order_sellDetail?product_idx=${mysell.product_idx }&member_idx=${sessionScope.sIdx}&order_sell_idx=${mysell.order_sell_idx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px; color: red;">판매반려</a>
                      	</c:when>                               	                                	                                	
                      </c:choose>										
										</td>
									</tr>
									</c:forEach>
								</table>		
							</c:if>  	
							</div>
							<!-- mypage_sell -->
							</div>
						</div>
					</div>
				</div>
				<!-- /content -->
					<!-- 페이징 태그 START -->
					<c:if test="${sellCount > 0}">
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
					</c:if>
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