<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html lang="en">
  <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/vendor.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />
<title>OwnIt</title>
<script src="resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
// 메인에 인기 상품 4개 보여주는 코드
$(function() {
	$.ajax({
		url:'listToMain',		
		type:'POST',
		dataType:'json',
		success:function(prd) {
			var html = "";
			$.each(prd, function(index) {
				var buyPrice = numberWithCommas(prd[index].product_buy_price);
				html += "<div class='col-6 col-lg-3'><div class='product'><figure class='product-image'>";
				html += "<a href='product_detail?product_idx="+ prd[index].product_idx +"'>";
				html += "<img src='resources/img/product/"+ prd[index].image_real_file1+"' alt='Image' width='261.66px' height='261.66px'>";
				html += "<img src='resources/img/product/"+ prd[index].image_real_file2+"' alt='Image' width='261.66px' height='261.66px'>";
				html += "</a></figure><div class='product-meta' style='width: 261.66px; height: 160.72px'>";
				html += "<h3 class='product-title'><a href='product_detail?product_idx="+ prd[index].product_idx +"'><b>"+prd[index].product_brand+"</b></a></h3>";
				html += "<h3 class='product-title' style='height: 63px'><a href='product_detail?product_idx="+ prd[index].product_idx +"'>"+prd[index].product_name+" </a></h3>";
				html += "<div class='product-price'>";
				html += "<span>"+ buyPrice+"원</span>";
				html += "</div></div></div></div>";
			});
			$('#prdList').html(html);
		}
	});
});
</script>
</head>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.js"></script>
<body>

    <!-- header -->
	<jsp:include page="inc/top.jsp"></jsp:include>
	<jsp:include page="inc/cart_inTop.jsp"></jsp:include>

    <!-- slider -->
    <div class="swiper-container swiper-container-alt">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <div class="image image-overlay image-zoom" style="background-image:url('<%=request.getContextPath() %>/resources/img/main_1.jpg')"></div>
          <div class="container">
            <div class="row align-items-center justify-content-center vh-80">
              <div class="col-lg-8 text-white text-center" data-swiper-parallax-y="-100%">
<!--                 <h1 class="display-2 mb-2">Your <b>perfect workspace</b> is waiting for you.</h1> -->
<!--                 <a href="" class="btn btn-white">Shop Now</a> -->
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="image image-overlay image-zoom" id="main2" style="background-image:url('<%=request.getContextPath() %>/resources/img/main_2.jpg')"></div>
          <div class="container">
            <div class="row align-items-center justify-content-center vh-80">
              <div class="col-lg-6 text-white text-center" data-swiper-parallax-y="-100%">
<!--                 <h1 class="display-2 mb-2">Transform your home with us.</h1> -->
<!--                 <a href="" class="btn btn-outline-white">Shop Now</a> -->
              </div>
            </div>
          </div>
        </div>
      </div>
	    <div class="swiper-button-prev"></div>
	    <div class="swiper-button-next"></div>
    </div>

	
    <!-- categories -->
<!--     <section class="pt-1"> -->
<!--       <div class="container-full"> -->
<!--         <div class="row masonry gutter-1"> -->
<!--           <div class="col-md-4"> -->
<%--             <span class="image image-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/card-1.jpg)"></span> --%>
<!--             <div class="card-body text-center text-white"> -->
<!--               <h3>Kitchen &amp; Dining</h3> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-md-4"> -->
<%--             <span class="image image-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/card-2.jpg)"></span> --%>
<!--             <div class="card-body text-center text-white"> -->
<!--               <h3>Living Room</h3> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-md-4"> -->
<%--             <span class="image image-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/card-3.jpg)"></span> --%>
<!--             <div class="card-body text-center text-white"> -->
<!--               <h3>Bathroom</h3> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </section> -->


    <!-- latest products -->
    <section class="pt-0" style="margin-top: 200px;">
      <div class="container">
        <div class="row">
          <div class="col text-center">
            <h2>인기 상품</h2>
          </div>
        </div>
		<!-- 서성민 - 인기상품 4개  -->
        <div class="row gutter-2 gutter-md-3" id="prdList">
          <div class="col-6 col-lg-3">
            <div class="product">
              <figure class="product-image">
                <a href="#!">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-1.jpg" alt="Image">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-1-2.jpg" alt="Image">
                </a>
              </figure>
              <div class="product-meta">
                <h3 class="product-title"><a href="#!">Fawn Wool / Natural Mammoth Chair </a></h3>
                <div class="product-price">
                  <span>$2,268</span>
                  <span class="product-action">
                    <a href="#!">Add to cart</a>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        <!-- 김진숙 - 인기 리뷰 4개 -->
<!--         <div class="container"> -->
<!--         <div class="row"> -->
<!--           <div class="col text-center"> -->
<!--             <h2>인기 상품</h2> -->
<!--           </div> -->
<!--         </div> -->
<!-- 		<!-- 서성민 - 인기상품 4개  --> -->
<!--         <div class="row gutter-2 gutter-md-3"> -->
<!--           <div class="col-6 col-lg-3"> -->
<!--             <div class="product"> -->
<!--               <figure class="product-image"> -->
<!--                 <a href="#!"> -->
<%--                   <img src="<%=request.getContextPath() %>/resources/img/demo/product-1.jpg" alt="Image"> --%>
<%--                   <img src="<%=request.getContextPath() %>/resources/img/demo/product-1-2.jpg" alt="Image"> --%>
<!--                 </a> -->
<!--               </figure> -->
<!--               <div class="product-meta"> -->
<!--                 <h3 class="product-title"><a href="#!">Fawn Wool / Natural Mammoth Chair </a></h3> -->
<!--                 <div class="product-price"> -->
<!--                   <span>$2,268</span> -->
<!--                   <span class="product-action"> -->
<!--                     <a href="#!">Add to cart</a> -->
<!--                   </span> -->
<!--                 </div> -->
<!--                 <a href="#!" class="product-like"></a> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--      </div> -->
    </section>

    <!-- footer -->
	<jsp:include page="inc/footer.jsp"></jsp:include>
	
    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
  </body>
</html>