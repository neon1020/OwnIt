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
$(document).on("click", ".product-action", function() {
	if(${not empty sessionScope.sId}) {
		var index = $(this).attr('id');
		$.ajax({
			url:'addCart',
			type:'GET',
			data:{
				product_idx:index
			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(result){
				if(result == 'Added') {
					$('#'+index+' > a').html(result).css('color', 'blue');
				} else {
					$('#'+index+' > a').html(result).css('color', 'red');
				}
			checkCart();
			}
		});
	} else alert("로그인 후 이용가능합니다");
});

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
				html += "<span class='product-action' id='"+ prd[index].product_idx +"' style='cursor: pointer;'>"
                html += "<a style='color: blue;'>장바구니에 추가</a></span>"
				html += "</div></div></div></div>";
			});
			$('#prdList').html(html);
		}
	});
});

// 메인 인기 리뷰
$(function() {
  pageNum = 1;
  keyword = "pop";
  $.ajax({
    type     : "GET",
    url      : "listChange?pageNum=" + pageNum,
    dataType : "json",
    data     : { 'keyword' : keyword },
    success  : function(reviewList) { // 요청 성공 시
      let result = "";
      for(var i = 0; i < 8; i++){
        result += "<div class='col-md-6 col-lg-4'><article class='card card-post'><figure class='equal equal-50'>";
        result += "<a class='image image-fade' href='review_detail?review_idx=" + reviewList[i].review_idx + "'>";
        result += "<img src='resources/img/review/" + reviewList[i].review_image1 + "'></a></figure><div class='card-body'>";
        result += "<a class='profile' href='review_mystyle?member_idx=" + reviewList[i].member_idx + "'>";
        result += "<img src='resources/img/member/" + reviewList[i].member_image + "'>";
        result += "<span class='eyebrow text-muted'>" + reviewList[i].member_nickname + "</span></a>";
        result += "<div class='like' id='divLike'>";
        result += "<img src='resources/img/review/like2.jpg'>" + reviewList[i].likeCount + "</div>";
        result += "</div></article></div>";
      }
    $("#reviewList").html(result);
    }
  });
});

//메인 배너 슬라이드 ------------------------------------------------------------------------------------
	var index = 0;   //이미지에 접근하는 인덱스
	window.onload = function(){
	  slideShow();
	}
	
	function slideShow() {
	  var i;
	  var x = document.getElementsByClassName("main_banner");  //slide1에 대한 dom 참조
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
	  }
	  index++;
	  if (index > x.length) {
	    index = 1;  //인덱스가 초과되면 1로 변경
	  }   
	  x[index-1].style.display = "block";  //해당 인덱스는 block으로
	  setTimeout(slideShow, 3000);   //함수를 3초마다 호출
	}
// -----------------------------------------------------------------------------------------------------

	function testOpen(URL) {
		window.open(URL, "_blank", "width=800,height=900");
	}

</script>

<style type="text/css">
  .col-lg-4 { flex: 0 0 25%; max-width: 25%; padding: 10px; }
  .card-post { height: 350px; }
  .card-post .card-body { width: 260px; }
  .title { float: left; font-size: 20px; font-weight: bold; color: #000000; letter-spacing: -1px; }
  .equal { height: 260px; width: 260px; border-radius: 0.5em; box-shadow: 5px 5px 10px grey; }
  .equal img { width: 100%; height: 100%; object-fit: cover; }
  .profile img { width: 30px; height: 30px; border-radius: 10em; margin: 5px 5px; }
  .eyebrow { text-transform: none; margin-left: 10px;}
  .card-post .card-title a:hover { color: #101010; }
  .like { float: right; margin: 5px 5px; }
  .like img { margin: 0 5px 0 0; }
  .hr1 { width: 1150px; margin-left: 20px;  }
</style>

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

	  <!-- banner -->
	  <br>
	  <br>
	  <div>
	    <ul>
	      <li><img class="main_banner" src="<%=request.getContextPath() %>/resources/img/banner_1.jpg"></li>
	      <li><img class="main_banner" src="<%=request.getContextPath() %>/resources/img/banner_3.jpg" onclick="testOpen('mbti_test')" style="cursor: pointer;"></li>      
	      <li><img class="main_banner" src="<%=request.getContextPath() %>/resources/img/banner_2.jpg" onclick="location.href='noticeDetail?notice_idx=10'" style="cursor: pointer;"></li>
	    </ul>
	  </div>

    <!-- latest products -->
    <section class="pt-0" style="margin-top: 100px;">
      <div class="container">
        <div class="row">
          <div class="col text-center">
            <img src="resources/img/mostPopular.png">
          </div>
        </div>
		<!-- 서성민 - 인기상품 4개  -->
        <div class="row gutter-2 gutter-md-3" id="prdList">
          <div class="col-6 col-lg-3">
            <div class="product">
              <figure class="product-image">
                <a href="">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-1.jpg" alt="Image">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-1-2.jpg" alt="Image">
                </a>
              </figure>
              <div class="product-meta">
                <h3 class="product-title"><a href="">Fawn Wool / Natural Mammoth Chair </a></h3>
                <div class="product-price">
                  <span>$2,268</span>
                  <span class="product-action">
                    <a href="">Add to cart</a>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
      
    <!-- ******************************* 인기 리뷰 목록 ******************************* -->
    <section class="pt-0" style="margin-bottom: 500px;">
      <div class="container">
        <div class="row">
          <img src="resources/img/stylePicks.png">
        </div>
        <div class="row masonry gutter-3" id="reviewList" style="margin-top: 50px;">
	        <div class="col-md-6 col-lg-4">
	          <article class="card card-post">
	            <figure class="equal equal-50">
	              <a class="image image-fade" href="">
	              <img src=""></a>
	            </figure>
	            <div class="card-body">
	              <a class="profile" href="">
	                <img src=""><span class="eyebrow text-muted"></span></a>
	              <div class="like" id="divLike">
	                <img src="">
	              </div>
	            </div>
	          </article>
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