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
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.js"></script>
  </head>
  <body>


    <!-- header -->
	<jsp:include page="inc/top.jsp"></jsp:include>


    <!-- lookbook -->
    <section class="hero bg-purple text-white" style="background-color: #101010;">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <h1 class="mb-2" style="text-align: center;">Hello, We are Own It!</h1><br>
            <p class="lead" style="text-align: center; color: white;">대한민국 최고의 중고 전자기기 거래 플랫폼 온잇에 오신 것을 환영합니다.</p><br>
            <p class="lead" style="text-align: center; color: white;">전문가 감정으로 보증된 정품 인증, 번거로움 없이 확실한 구매/판매 중개 서비스,<br>
            	 온잇이 제안하는 합리적인 가격으로 나만의 IT를 Own!</p><br>
            <p class="lead" style="text-align: center; color: white;">온잇러들의 감각적인 스타일 리뷰까지 즐겨보세요!</p><br>
          </div>
        </div>
        <div class="row gutter-1 masonry gallery collage mb-10">
          <div class="col-6">
            <figure class="equal equal-75">
              <a class="image image-scale" href="resources/img/about_1.jpg" 
                style="background-image: url(resources/img/about_1.jpg);">
              </a>
            </figure>
          </div>
          <div class="col-6">
            <figure class="equal equal-125">
              <a class="image image-scale" href="resources/img/about_5.jpg" 
                style="background-image: url(resources/img/about_5.jpg);">
              </a>
            </figure>
          </div>
          <div class="col-6">
            <figure class="equal equal-50">
              <a class="image image-scale" href="resources/img/about_3.jpg" 
                style="background-image: url(resources/img/about_3.jpg);">
              </a>
            </figure>
          </div>
        </div>
        <div class="row gutter-4">
          <div class="col-md-4">
            <div class="text-center px-2">
              <i class="icon-Guard fs-40 mb-2"></i>
              <h4 class="eyebrow d-block text-white">Choice Goods Guarantee</h4>
              <p>전문 검수를 통한 완벽한 정품 보증</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="text-center px-2">
              <i class="icon-Truck fs-40 mb-2"></i>
              <h4 class="eyebrow d-block text-white">Free Delivery</h4>
              <p>Own It 은 전상품 무료배송</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="text-center px-2">
              <i class="icon-Money---Alt fs-40 mb-2"></i>
              <h4 class="eyebrow d-block text-white">Reasonable Commission</h4>
              <p>2% 의 합리적인 수수료</p>
            </div>
          </div>
        </div>
      </div>
    </section>



    <!-- text -->
    <section style="padding: 50px;">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8">
            <p class="lead" style="text-align: center; font-size: 30px;">
              Hello, We Are Own It Developers!
            </p>
          </div>
        </div>
      </div>
    </section>


    <!-- numbers -->
    <section style="padding: 20px;">
      <div class="container">
        <div class="row gutter-2 gutter-md-4" style="text-align: center;">
          <div class="col-md-6 col-lg-4">
			<!-- <span class="h1 font-weight-bold">50</span> -->
			<span><img src="resources/img/face1.png" width="120px" height="120px" style="margin-bottom: 20px;"></span>
            <p>Kim Sohee<br>hiyayeah502@gmail.com</p>
          </div>
          <div class="col-md-6 col-lg-4">
            <span><img src="resources/img/face2.png" width="120px" height="120px" style="margin-bottom: 20px;"></span>
            <p>Kim Jinsook<br>jim584800@gmail.com</p>
          </div>
          <div class="col-md-6 col-lg-4">
            <span><img src="resources/img/face3.png" width="120px" height="120px" style="margin-bottom: 20px;"></span>
            <p>Ryu Hyejee<br>hyejee92@gmail.com</p>
          </div>
          <div class="col-md-6 col-lg-4">
            <span><img src="resources/img/face4.png" width="120px" height="120px" style="margin-bottom: 20px;"></span>
            <p>Park Judalm<br>wnekfa1004@naver.com</p>
          </div>
          <div class="col-md-6 col-lg-4">
            <span><img src="resources/img/face5.png" width="120px" height="120px" style="margin-bottom: 20px;"></span>
            <p>Seo Seongmin<br>blussm@kakao.com</p>
          </div>
          <div class="col-md-6 col-lg-4">
            <span><img src="resources/img/face6.png" width="120px" height="120px" style="margin-bottom: 20px;"></span>
            <p>Jeong Chaeyeon<br>neo3111@naver.com</p>
          </div>
        </div>
      </div>
    </section>



    <!-- footer -->
    <jsp:include page="inc/footer.jsp"></jsp:include>
	
    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
  </body>
</html>