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

<title>review_mystyle</title>

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
  
<style type="text/css">
	/* 상단 프로필 */
	.profileMain { text-align: center; margin-top: 150px; }
	.profileMain img { width: 120px; height: 120px; border-radius: 10em; margin-bottom: 20px; }
	/* 목록 */
	.col-lg-4 { flex: 0 0 25%; max-width: 25%; }
	.card-post { height: 500px; }
	.card-post .card-body { width: 260px; }
	.equal { height: 260px; width: 260px; border-radius: 0.5em; }
	.image-fade img { width: 100%; height: 100%; object-fit: cover; }
	.profile img { width: 30px; height: 30px; border-radius: 10em; margin: 5px 5px; }
	.eyebrow { text-transform: none; margin-left: 10px;}
	.card-title img { width: 50px; height: 50px; border-radius: 1em; margin: 5px 5px; float: left; }
	.card-title a { font-size: 13px; font-weight: 600; }
	.card-post .card-title a:hover { color: #101010; }
	.card-title .subject { margin: 5px 5px; width: 190px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis; float: left; }
	.card-content { font-size: 14px; width: 100%; float: left; margin: 5px; text-overflow: ellipsis; overflow: 
	                hidden; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;}
	.like { width: 100%; float: left; margin: 10px 5px; }
	.like img { margin: 0 5px 0 0; }
</style>
  
</head>
<body>
  <!-- header -->
  <jsp:include page="../inc/top.jsp"></jsp:include>
  <jsp:include page="../inc/cart_inTop.jsp"></jsp:include>

  <!-- ********************************* 상단 프로필 ********************************* -->
	<div class="profileMain">
		<img class="profile" src="resources/img/member/${profile.member_image }">
		<h4 class="userName">${profile.member_nickname }</h4>
		<h5 style="margin-top: 20px; font-size: 14px;">게시물&nbsp;<span style="font-weight: 700;">${reviewCount }</span></h5>
	</div>
  <!-- ********************************* 리뷰 목록 ********************************* -->
	<section class="pt-0" style="margin-top: 80px; width: 1350px; padding: 100px 100px 100px 100px;">
		<div class="container">
			<div class="row masonry gutter-3">
			<!-- *************************** 데이터 넣을 부분 *************************** -->
			<c:forEach var="myStyle" items="${mystyleList }">
			  <div class="col-md-6 col-lg-4">
			    <article class="card card-post">
			      <figure class="equal equal-50">
              <!-- ********************* 리뷰 이미지 출력 ************************* -->
			        <a class="image image-fade" href="review_detail?review_idx=${myStyle.review_idx }">
			        <img src="resources/img/review/${myStyle.review_image1 }"></a>
			      </figure>
			      <div class="card-body">
              <!-- ********************* 작성자 프로필 출력 ************************* -->
			        <a class="profile" href="review_mystyle?member_idx=${myStyle.member_idx }">
			        <img src="resources/img/member/${myStyle.member_image }"><span class="eyebrow text-muted">${myStyle.member_nickname }</span></a>
			        <!-- ********************** 리뷰 내용 출력 *************************** -->
			        <h3 class="card-content">${myStyle.review_content }</h3>
		          <div class="like" id="divLike">
			        <c:choose>
			          <c:when test="${myStyle.heartImg == 'like_none.jpg'}">
					        <a class="heart_None" id="like_${myStyle.review_idx }" name="${myStyle.num}" onclick="changeLike(this)">
					        <img src="resources/img/review/${myStyle.heartImg}"></a>
	                <span class="lclass_${myStyle.likeCount }" id="lid_${myStyle.review_idx }">${myStyle.likeCount }</span>&nbsp;&nbsp;
                </c:when>
	              <c:otherwise>
	                <a class="heart_Full" id="like_${myStyle.review_idx }" name="${myStyle.num}" onclick="changeLike(this)">
	                <img src="resources/img/review/${myStyle.heartImg}"></a>
	                <span class="lclass_${myStyle.likeCount }" id="lid_${myStyle.review_idx }">${myStyle.likeCount }</span>&nbsp;&nbsp;
	              </c:otherwise>
              </c:choose>
                <img src="resources/img/review/reply.jpg">${myStyle.replyCount }
              </div>
			        <!-- ********************** 상품 정보 출력 *************************** -->
			        <h4 class="card-title"><a href="product_detail?product_idx=${myStyle.product_idx }">
			        <img src="resources/img/product/${myStyle.product_image }"><div class="subject">${myStyle.product_name }<br>
			        <fmt:formatNumber value="${myStyle.product_buy_price}" pattern="#,###"/>&nbsp;원</div></a></h4>
			      </div>
			    </article>
			  </div>
			</c:forEach>
			</div>
		</div>
	</section>

  <!-- footer -->
  <jsp:include page="../inc/footer.jsp"></jsp:include>

  <script src="resources/js/vendor.min.js"></script>
  <script src="resources/js/app.js"></script>
</body>
</html>