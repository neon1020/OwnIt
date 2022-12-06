<%@page import="com.teamone.ownit.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/vendor.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />
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
  <!-- header -->
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
          <!-- / sidebar -->
          
          <!-- content -->
					<div class="col-lg-9">
						<div class="row">
							<div class="col-12">
								<h3 class="mb-0">관심상품</h3>
									<span class="eyebrow">${listCount }개의 관심상품이 있습니다</span>
							</div>
						</div>     
						<div class="row gutter-2 gutter-lg-3">  
							<c:forEach var="wishlist" items="${wishlist }" varStatus="vs">
								<div class="col-6 col-md-4">
									<article class="card card-post">
			              <figure class="equal equal-50">
			                <a class="image image-fade" href="product_detail?product_idx=${wishlist.product_idx }"><img src="resources/img/product/${wishlist.image_real_file1 }"></a>
			              </figure>
			              <div class="card-body">
			                <h3 class="card-content">${wishlist.product_name }</h3>
			                <div class="like" style="text-align: right;">
										  	<button class="btn btn-outline-dark btn-sm btn-rounded" data-toggle="modal" data-target="#exampleModal-1${vs.index}">
											  	<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
							  					<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
											  	</svg>
										  	</button>
										  	<button class="btn btn-outline-dark btn-sm btn-rounded" data-toggle="modal" data-target="#exampleModal-2${vs.index}">
											  	<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
												  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
												  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
													</svg>
										  	</button>      
			                </div>
			              </div>
									</article>
								</div>
					          
								<div class="modal fade" id="exampleModal-1${vs.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
				            <form action="mypage_addCart" method="post"> 
				            <input type="hidden" name="member_idx" value="${wishlist.member_idx }" />
				            <input type="hidden" name="product_idx" value="${wishlist.product_idx }" />
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel"></h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">×</span>
								        </button>
								      </div>
								      <div class="modal-body">
								        <p style="text-align: center;">해당 제품을 장바구니에 추가 하시겠습니까?</p>
								      </div>
								      <div class="modal-footer">
								        <div class="container-fluid">
								          <div class="row gutter-0">
								            <div class="col">
								              <button type="submit" class="btn btn-block btn-dark" onclick="location.href='mypage_addCart?member_idx=${sessionScope.sIdx }&product_idx=${wishlist.product_idx}'">Yes</button>
								            </div>
								            <div class="col">
								              <button type="button" class="btn btn-block btn-outline-dark" data-dismiss="modal">No</button>
								            </div>
								          </div>
								        </div>
								      </div>
				            </form>
								    </div>
								  </div>
								</div>				          
					          
								<div class="modal fade" id="exampleModal-2${vs.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel"></h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">×</span>
								        </button>
								      </div>
								      <div class="modal-body">
								        <p style="text-align: center;">해당 제품을 위시리스트에서 삭제 하시겠습니까?</p>
								      </div>
								      <div class="modal-footer">
								        <div class="container-fluid">
								          <div class="row gutter-0">
								            <div class="col">
								              <button type="button" class="btn btn-block btn-dark" onclick="location.href='deleteWishlist?member_idx=${sessionScope.sIdx }&product_idx=${wishlist.product_idx}'">Yes</button>
								            </div>
								            <div class="col">
								              <button type="button" class="btn btn-block btn-outline-dark" data-dismiss="modal">No</button>
								            </div>
								          </div>
								        </div>
								      </div>
								    </div>
								  </div>
								</div>
														          
							</c:forEach>
						</div>
					</div>       
          <!-- / content -->
					<!-- 페이징 태그 START -->
					<c:if test="${listCount > 0}">
	        <div class="row" style="margin-left: 680px;">
	          <div class="col">
	            <nav class="d-inline-block">
	              <ul class="pagination">
	              	<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
	              	<li class="page-item active"><input class="page-link" type="button" value="&laquo;" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='wishlist?member_idx=${sessionScope.sIdx }&pageNum=${pageInfo.pageNum - 1}'"<%} %>></li>
										<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
											<c:choose>
												<c:when test="${i eq pageInfo.pageNum }"><li class="page-item"><a class="page-link">${i }</a></li></c:when>
												<c:otherwise><li class="page-item active"><a class="page-link" href="wishlist?member_idx=${sessionScope.sIdx }&pageNum=${i }">${i }<span class="sr-only">(current)</span></a></li></c:otherwise>
											</c:choose>
										</c:forEach>
									<li class="page-item active"><input class="page-link" type="button" value="&raquo;" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='wishlist?member_idx=${sessionScope.sIdx }&pageNum=${pageInfo.pageNum + 1}'"<%} %>></li>
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

    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
  </body>
</html>