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
      .card-post { height: 300px; }
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
      /* 상단 프로필 */
	    .profileMain { text-align: center; }
	    .profileMain img { width: 120px; height: 120px; border-radius: 10em; margin-bottom: 20px; }
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
	
								<!-- mypage_main -->
<!-- 								<div class="row gutter-1"> -->
								
									<!-- 프로필 시작-->
									  <div class="profileMain">
<%-- 									  <input type="hidden" name="member_idx" value="${mainProfile.member_idx }" /> --%>
										  <c:forEach var="mainProfile" items="${mainProfile }" begin="0" end="0">
										  	<img class="profile" src="resources/img/member/${mainProfile.image_real_file1 }">
										  	
										  	<h5 style="font-size: 18px;">${mainProfile.member_nickname }님
											  	<a href="mypage_profile?member_idx=${sessionScope.sIdx}" style="color: black;">
											  		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
												  	<path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
												  	</svg>
											  	</a>
										  	</h5>
										  	<h5 style="font-size: 15px;">${mainProfile.member_id }</h5>
										  </c:forEach>
											<input type="button" style="" value="내 스타일" class="btn btn-outline-dark btn-sm" onclick="location.href='review_mystyle?member_idx=${sessionScope.sIdx}'">
											<input type="button" style="width: 97.13px;" value="내 정보" class="btn btn-outline-dark btn-sm" onclick="location.href='mypage_revise?id=${sessionScope.sId }'">
									  </div>
									<!-- 프로필 끝-->	
									
									<!-- 구매내역 시작-->									
									<div class="col-md-12" style="margin-top: 40px;">
										<table style="text-align: center;" class="table table-hover">
											<tr>
												<td colspan="3" style="width: 600px; font-size: 1rem; font-weight: 550; color: black; text-align: left; padding-left: 0px;">구매내역</td>
												<td style="padding-right: 20px; text-align: right;">
													<a href="mypage_order?member_idx=${sessionScope.sIdx }" style="font-size: 0.75rem; font-weight: 550; color: gray;">더보기
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
													  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
													  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
														</svg>
													</a>												
												</td>
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
                        		배송 대기
                        	</c:when>
                        	<c:when test="${mainOrder.order_buy_gb == '1'}">
                        		배송 중
                        	</c:when>
                        	<c:when test="${mainOrder.order_buy_gb == '2'}">
                        		배송완료 <input type="button" value="구매확정" class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#buy_fix${num.index }">
                        	</c:when>
                        	<c:when test="${mainOrder.order_buy_gb == '3'}">
                        		구매확정 <input type="button" value="리뷰작성" class="btn btn-outline-dark btn-sm" onclick="location.href='review_writeForm?order_buy_idx=${mainOrder.order_buy_idx}&member_idx=${mainOrder.member_idx }'">
                        	</c:when>
                        	<c:when test="${mainOrder.order_buy_gb == '4'}">
                        		구매확정 <input type="button" value="리뷰보기" class="btn btn-outline-dark btn-sm" onclick="location.href='goReview?product_idx=${mainOrder.product_idx}&member_idx=${mainOrder.member_idx }'">
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
															<input type="hidden" name="member_idx" value="${mainOrder.member_idx }">
															<input type="hidden" name="order_buy_idx" value="${mainOrder.order_buy_idx }">
															<div class="modal-body">
																<p><span style="color: #FF6666;">구매확정 이후에는 반품 및 교환이 불가능하므로<br>반드시 상품을 받으신 후 진행해 주세요.</span><br><br>
																구매확정을 진행하시겠습니까?</p>
															</div>
															<div class="modal-footer">
																<div class="container-fluid">
																	<div class="row gutter-0">
																		<div class="col">
																			<button type="submit" class="btn btn-block btn-dark btn-rounded">확인</button>
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
									</div>
									<!-- 구매내역 끝-->
									
									<!-- 판매내역 시작-->																				
									<div class="col-md-12" style="margin-top: 40px;">
										<table style="text-align: center;" class="table table-hover">
											<tr>
												<td colspan="3" style="width: 600px; font-size: 1rem; font-weight: 550; color: black; text-align: left; padding-left: 0px;">판매내역</td>
												<td style="padding-right: 20px; text-align: right;">
													<a href="mypage_sell?member_idx=${sessionScope.sIdx }" style="font-size: 0.75rem; font-weight: 550; color: gray;">더보기
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
													  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
													  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
														</svg>
													</a>												
												</td>
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
                          		<a href="order_sellDetail?product_idx=${mainSell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수대기</a>
                          	</c:when>
                          	<c:when test="${mainSell.order_sell_gb == '1'}">
                          		<a href="order_sellDetail?product_idx=${mainSell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수  중</a>
                          	</c:when>
                          	<c:when test="${mainSell.order_sell_gb == '2'}">
                          		<a href="order_sellDetail?product_idx=${mainSell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px;">검수완료</a>
                          	</c:when>
                          	<c:when test="${mainSell.order_sell_gb == '3'}">
                          		<a href="order_sellDetail?product_idx=${mainSell.product_idx }&member_idx=${sessionScope.sIdx}" class="btn btn-outline-dark btn-sm" style="width: 93.2px; color: red;">판매반려</a>
                          	</c:when>                               	                                	                                	
                          </c:choose>										
												</td>
											</tr>
											</c:forEach>
										</table>		  
									</div>
									<!-- 판매내역 끝-->
												
									<!-- 위시리스트 시작-->
									<div class="row">
									<div class="col-md-6" style="margin-top: 50px;">
										<h1 style="width: 600px; font-size: 1rem; font-weight: 550; padding-left: 15px;">관심상품</h1>	
									</div>
									<div class="col-md-6" style="margin-top: 50px; text-align: right; padding-right: 50px;">
										<a href="wishlist?member_idx=${sessionScope.sIdx }" style="font-size: 0.75rem; font-weight: 550; color: gray;">더보기
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
										  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
											</svg>
										</a>
									</div>
									</div>
									<div class="row gutter-2 gutter-lg-3">       
										<c:forEach var="mainWish" items="${mainWish }" varStatus="vs">
											<div class="col-6 col-md-4" >
												<article class="card card-post">
						              <figure class="equal equal-50">
						                <a class="image image-fade" href="product_detail?product_idx=${mainWish.product_idx }">
						                	<img src="resources/img/product/${mainWish.image_real_file1 }">
						                </a>
						              </figure>
						              <div class="card-body">
						                <h3 class="card-content">${mainWish.product_name }</h3>
						              </div>
												</article>
											</div>									
										</c:forEach>
									</div>
									<!-- 위시리스트 끝-->										
															
<!-- 								</div> -->
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