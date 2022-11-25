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
    console.log(that);
    $.ajax({
      url     : 'heart',
      type    : 'POST',
      data    : sendData,
      success : function(data){
        if(data == 1) {
          $(".heart").prop("src", "resources/img/review/like.jpg");
          location.reload();
// 	        $("#divLike").load(location.href + " #divLike");
        } else {
          $(".heart").prop("src", "resources/img/review/like_none.jpg");
          location.reload();
//           $("#divLike").load(location.href + " #divLike");
        }
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
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2">
				  <label for="btnradio2">인기</label>
				</div>
			</div>
		</div>
	</section>
  
  <!-- ******************************* 리뷰 목록 ******************************* -->
	<section class="pt-0" style="width: 1350px; padding: 100px 100px 100px 100px;">
		<div class="container">
			<div class="row masonry gutter-3">
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
                <a class="heart"><img src="resources/img/review/${review.heartImg} " id="likeNone_${review.review_idx }" name="${review.num }" onclick="changeLike(this)"></a>${review.likeCount}&nbsp;&nbsp;
                <img src="resources/img/review/reply.jpg">${review.review_reply_count }
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
		  <div class="row">
		    <div class="col">
		      <nav class="d-inline-block">
		        <ul class="pagination">
		          <li class="page-item active"><a class="page-link" href="#!">1 <span class="sr-only">(current)</span></a></li>
		          <li class="page-item" aria-current="page"><a class="page-link" href="#!">2</a></li>
		          <li class="page-item"><a class="page-link" href="#!">3</a></li>
		          <li class="page-item"><a class="page-link" href="#!">4</a></li>
		        </ul>
		      </nav>
		    </div>
		  </div>
		</div>
	</section>

  <!-- footer -->
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
  <script src="resources/js/vendor.min.js"></script>
  <script src="resources/js/app.js"></script>
</body>
</html>