<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>review_mystyle</title>
    
    <style type="text/css">
	    /* 상단 프로필 */
	    .profileMain { text-align: center; margin-top: 150px; }
	    .profileMain img { width: 120px; height: 120px; border-radius: 10em; margin-bottom: 20px; }
	    /* 목록 */
	    .col-lg-4 { flex: 0 0 25%; max-width: 25%; }
	    .card-post { height: 500px; }
	    .card-post .card-body { width: 260px; }
	    .equal { height: 260px; width: 260px; border-radius: 0.5em; }
	    .profile img { width: 30px; height: 30px; border-radius: 10em; margin: 5px 5px; }
	    .eyebrow { text-transform: none; margin-left: 10px;}
	    .card-title img { width: 50px; height: 50px; border-radius: 1em; margin: 5px 5px; float: left; }
	    .card-title a { font-size: 13px; font-weight: 600; }
	    .card-post .card-title a:hover { color: #101010; }
	    .card-title .subject { margin: 5px 5px; width: 190px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis; float: left; }
	    .card-content { font-size: 14px; width: 100%; float: left; margin: 5px; text-overflow: ellipsis; overflow: hidden; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;}
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
      <img class="profile" src="resources/img/review/max4pf.jpg">
      <h4 class="userName">min.nicha</h4>
      <h5 style="margin-top: 20px; font-size: 14px;">게시물&nbsp;<span style="font-weight: 700;">6</span></h5>
    </div>

    <!-- ********************************* 리뷰 목록 ********************************* -->
    <section class="pt-0" style="margin-top: 80px; width: 1350px; padding: 100px 100px 100px 100px;">
      <div class="container">
        <div class="row masonry gutter-3">
        <!-- *************************** 데이터 넣을 부분 *************************** -->
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/iphone3.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="review_detail"><img src="resources/img/review/max4pf.jpg"><span class="eyebrow text-muted">min.nicha</span></a>
                <h3 class="card-content">오프라인에서는 구하기 힘든 모델인데 역시 온잇에는 있더라구요! 만족스럽게 잘 구매했습니다~</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">128&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">3</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/iphone1dt.jpg"><div class="subject">Apple iPhone 13 128GB Starlight (Korean Ver.)<br>934,000원</div></a></h4>
              </div>
            </article>
          </div>
          <!-- *************************** 데이터 넣을 부분 *************************** -->
          <!-- *************************** 버릴 부분 시작 *************************** -->
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/max2.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/max4pf.jpg"><span class="eyebrow text-muted">min.nicha</span></a>
                <h3 class="card-content">기분 좋아♬</h3>
                <div class="like"><img src="resources/img/review/like.jpg">268&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">5</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/max2dt.jpg"><div class="subject">Samsung Galaxy Z Flip4 512GB Purple<br>1,110,000원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/sony1.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/max4pf.jpg"><span class="eyebrow text-muted">min.nicha</span></a>
                <h3 class="card-content">물건 상태 좋고 음질도 기대한만큼 좋네요. 믿고 구매하는 온잇! 이번에도 실망시키지 않네요!! 감사합니다</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">36&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">8</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/sony1dt.jpg"><div class="subject">Sony WH-1000XM4 Black (Korean Ver.)<br>354,000원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/max4.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/max4pf.jpg"><span class="eyebrow text-muted">min.nicha</span></a>
                <h3 class="card-content">너무 맘에 듭니다♥</h3>
                <div class="like"><img src="resources/img/review/like.jpg">67&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">1</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/max1dt.jpg"><div class="subject">Apple AirPods Max Silver (Korean Ver.)<br>639,000원원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/zflip2.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/max4pf.jpg"><span class="eyebrow text-muted">min.nicha</span></a>
                <h3 class="card-content">굳굳굳</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">143&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">8</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/zflip2dt.jpg"><div class="subject">Samsung Galaxy Z Flip4 512GB Graphite<br>1,029,000원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/max5.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/max4pf.jpg"><span class="eyebrow text-muted">min.nicha</span></a>
                <h3 class="card-content">음질도 만족스럽고 일단 어디에나 잘 어울리는 컬러라 맘에 듭니다!!!</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">50&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">3</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/max1dt.jpg"><div class="subject">Apple AirPods Max Silver (Korean Ver.)<br>639,000원</div></a></h4>
              </div>
            </article>
          </div>
          <!-- *************************** 버릴 부분 끝 *************************** -->
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