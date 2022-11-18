<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/vendor.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/> -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%--     <jsp:include page="../inc/cart_inTop.jsp"></jsp:include> --%>
    <!-- hero -->
<!--     <section class="hero hero-small bg-purple text-white"> -->
<!--       <div class="container"> -->
<!--         <div class="row gutter-2 gutter-md-4 align-items-end"> -->
<!--           <div class="col-md-6 text-center text-md-left"> -->
<!--             <h1 class="mb-0">Michael Campbell</h1> -->
<!--             <span class="text-muted">New York, USA</span> -->
<!--           </div> -->
<!--           <div class="col-md-6 text-center text-md-right"> -->
<!--             <a href="#!" class="btn btn-sm btn-outline-white">Sign out</a> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </section> -->



    <!-- listing -->
    <section class="pt-5" style="margin-top: 100px;">
      <div class="container">
        <div class="row gutter-4 justify-content-between">

          <!-- sidebar -->
          <jsp:include page="../inc/sidebar_mypage.jsp"></jsp:include>
          <!-- / sidebar -->
          <!-- content -->
			<div class="col-lg-9">
				<div class="row gutter-2 gutter-lg-3">       
					 <c:forEach var="wishlist" items="${wishlist }">
			          <div class="col-6 col-md-4">
			            <article class="card card-post">
			              <figure class="equal equal-50">
			                <a class="image image-fade" href="product_detail?product_idx=${wishlist.product_idx }"><img src="resources/img/product/${wishlist.image_real_file1 }"></a>
			              </figure>
			              <div class="card-body">
			                <h3 class="card-content">${wishlist.product_name }</h3>
			                <div class="like" style="text-align: right;">
							  <button class="btn btn-outline-dark btn-sm btn-rounded">
								  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
				  					<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
								  </svg>
							  </button>
							  <button class="btn btn-outline-dark btn-sm btn-rounded">
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
			</div>       
          <!-- / content -->
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