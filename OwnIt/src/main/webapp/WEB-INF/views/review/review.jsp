<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
<link rel="stylesheet" href="resources/css/vendor.css" />
<link rel="stylesheet" href="resources/css/style.css" />

<title>review</title>

<script src="resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
  var sIdx = "${sessionScope.sIdx }";
  // 로그인 한 회원만 좋아요 가능
  function changeLike(idx) {
    if(sIdx == "") {
      alert('로그인 후 이용 가능합니다.');
      return;
    }
    var that = 1;
    if(idx.name != 1) {
    	that = 0;
    }
    var index = idx.id.split('_')[1];
    var sendData = {'review_idx' : index, 'heart' : that };
    $.ajax({
      url     : 'heart',
      type    : 'POST',
      data    : sendData,
      success : function(data){
    	  if(data == 1) {
    		  var a = $('#like_' + index);
					a.removeClass('heart_None');
					a.addClass('heart_Full');
					a.attr('name', '1');
					$('#like_' + index).html("<img src='resources/img/review/like2.jpg'>");
					likeCount(index);
        } else {
					var a = $('#like_' + index);
					a.removeClass('heart_Full');
					a.addClass('heart_None');
					a.attr('name', null);
					$('#like_' + index).html("<img src='resources/img/review/like_none.jpg'>");
					likeCount(index);
        }
      }
    });
  }
  function likeCount(index) {
	  $.ajax({
      url     : 'cnt',
      type    : 'GET',
      data    : { 'review_idx' : index },
      success : function(cnt){
    	  $('#lid_' + index).html(cnt);
      }
	  });
  }
</script>

<script type="text/javascript">
  // 무한스크롤
  let pageNum = 1;
  var keyword = "new"; 
  
  $(function() {
	  load_list();
	  $("#btnradio1").on("click", function() { // 최신순
      pageNum = 1;
      keyword = "new";
      $("#reviewList").html("");
      load_list();
	  });
    $("#btnradio2").on("click", function() { // 인기순
      pageNum = 1;
      keyword = "pop";
      $("#reviewList").html("");
      load_list();
    });
	  
    $(window).scroll(function() {
      let scrollTop = $(window).scrollTop(); 
      let windowHeight = $(window).height(); 
      let documentHeight = $(document).height(); 
      
      if(scrollTop + windowHeight + 0.5 >= documentHeight) {
        pageNum++;
        load_list();
      }
    });
  });
  
  // 리뷰 목록 호출
  function load_list() {
    $.ajax({
      type     : "GET",
      url      : "listChange",
      dataType : "json",
   	  data     : { 
   		  'pageNum' : pageNum,
   		  'keyword' : keyword 
 		  },
      success  : function(reviewList) { // 요청 성공 시
    	  let result = "";
    	  for(var i = 0; i < reviewList.length; i++){
	        let productPrice = reviewList[i].product_buy_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	        result += "<div class='col-md-6 col-lg-4'><article class='card card-post'><figure class='equal equal-50'>";
	        result += "<a class='image image-fade' href='review_detail?review_idx=" + reviewList[i].review_idx + "'>";
	        result += "<img src='resources/img/review/" + reviewList[i].review_image1 + "'></a></figure><div class='card-body'>";
	        result += "<a class='profile' href='review_mystyle?member_idx=" + reviewList[i].member_idx + "'>";
	        result += "<img src='resources/img/member/" + reviewList[i].member_image + "'>";
	        result += "<span class='eyebrow text-muted'>" + reviewList[i].member_nickname + "</span></a>";
	        result += "<h3 class='card-content'>" + reviewList[i].review_content + "</h3><div class='like' id='divLike'>";
	        if(reviewList[i].heartImg == 'like_none.jpg'){
	          result += "<a class='heart_None' id='like_" + reviewList[i].review_idx + "' name='" + reviewList[i].num + "' onclick='changeLike(this)'>";
	          result += "<img src='resources/img/review/" + reviewList[i].heartImg + "'></a>";
	          result += "<span id='lid_" + reviewList[i].review_idx + "'>" + reviewList[i].likeCount + "</span>";
	        } else {
	          result += "<a class='heart_Full' id='like_" + reviewList[i].review_idx + "' name='" + reviewList[i].num + "' onclick='changeLike(this)'>";
	          result += "<img src='resources/img/review/" + reviewList[i].heartImg + "'></a>";
	          result += "<span id='lid_" + reviewList[i].review_idx + "'>" + reviewList[i].likeCount + "</span>";
	        }
	        result += "&nbsp;&nbsp;<img src='resources/img/review/reply.jpg'>" + reviewList[i].replyCount + "</div>";
	        result += "<h4 class='card-title'><a href='product_detail?product_idx=" + reviewList[i].product_idx + "'>";
	        result += "<img src='resources/img/product/" + reviewList[i].product_image + "'><div class='subject'>" + reviewList[i].product_name + "<br>";
	        result += productPrice + "&nbsp;원</div></a></h4></div></article></div>";
    	  }
    	  $("#reviewList").append(result);
      }
    });
  }  
</script>

<style type="text/css">
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
	.card-content { font-size: 14px; width: 100%; float: left; margin: 5px; text-overflow: ellipsis; overflow: hidden; 
	                display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;}
	.like { width: 100%; float: left; margin: 10px 5px; }
	.like img { margin: 0 5px 0 0; }
	.likecount { width: 20px; height: 20px; }
	/* 상단 정렬 메뉴 버튼 */
	label { background-color: #FFF; border-color: #FFF; color: #101010; border-radius: 1em; 
          font-size: 20px; font-weight: 700; padding: 6px 14px; }
	.btn-check { opacity: 0; }
	input[type=radio]:checked + label { background-color: #101010; border-color: #101010; color: #FFF; }
</style>
  
</head>
<body>
  <!-- header -->
  <jsp:include page="../inc/top.jsp"></jsp:include>
  <jsp:include page="../inc/cart_inTop.jsp"></jsp:include>

  <!-- *************************** 상단 정렬 메뉴 *************************** -->
	<section class="hero hero-small">
		<div class="container">
			<div class="row">
				<div class="col text-center">
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" checked>
				  <label for="btnradio1">최신</label>
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" >
				  <label for="btnradio2">인기</label>
				</div>
			</div>
		</div>
	</section>
  
  <!-- ******************************* 리뷰 목록 ******************************* -->
	<section class="pt-0" style="width: 1350px; padding: 100px 100px 100px 100px;">
		<div class="container">
			<div class="row masonry gutter-3" id="reviewList">
			<!-- *************************** 데이터 넣을 부분 *************************** -->
			<c:forEach var="review" items="${reviewList }">
			  <div class="col-md-6 col-lg-4">
			    <article class="card card-post">
			      <figure class="equal equal-50">
              <!-- ********************* 리뷰 이미지 출력 ************************* -->
			        <a class="image image-fade" href="review_detail?review_idx=${review.review_idx }">
			        <img src="resources/img/review/${review.review_image1 }"></a>
			      </figure>
			      <div class="card-body">
              <!-- ********************* 작성자 프로필 출력 ************************* -->
			        <a class="profile" href="review_mystyle?member_idx=${review.member_idx }">
			        <img src="resources/img/member/${review.member_image }"><span class="eyebrow text-muted">${review.member_nickname }</span></a>
			        <!-- ********************** 리뷰 내용 출력 *************************** -->
			        <h3 class="card-content">${review.review_content }</h3>
			        <div class="like" id="divLike">
                <a class="heart"><img src="resources/img/review/${review.heartImg} " class="lclass_${review.likeCount}" id="likeNone_${review.review_idx }" name="${review.num }" onclick="changeLike(this)"></a>
                <span id="lcount_${review.review_idx }"></span>&nbsp;&nbsp;
                <img src="resources/img/review/reply.jpg">${review.replyCount }
			        </div>
			        <!-- ********************** 상품 정보 출력 *************************** -->
			        <h4 class="card-title"><a href="product_detail?product_idx=${review.product_idx }">
			        <img src="resources/img/product/${review.product_image }"><div class="subject">${review.product_name }<br>
			        <fmt:formatNumber value="${review.product_buy_price}" pattern="#,###"/>&nbsp;원</div></a></h4>
			      </div>
			    </article>
			  </div>
			</c:forEach>
			</div>
		</div>
	</section>

  <!-- footer -->
<%--     <jsp:include page="../inc/footer.jsp"></jsp:include> --%>
  
  <script src="resources/js/vendor.min.js"></script>
  <script src="resources/js/app.js"></script>
</body>
</html>