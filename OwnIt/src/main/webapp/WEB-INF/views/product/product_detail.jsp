<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
    <title>Product</title>
    <style type="text/css">
		.col-lg-4 { flex: 0 0 25%; max-width: 25%; padding: 10px; }
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
	    /* 상단 정렬 메뉴 버튼 */
	    label { background-color: #FFF; border-color: #FFF; color: #101010; border-radius: 1em; font-size: 20px; font-weight: 700; padding: 6px 14px; }
	    .btn-check { opacity: 0; }
	    input[type=radio]:checked + label { background-color: #101010; border-color: #101010; color: #FFF; }
    </style>
  </head>
  <body>

    <!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/cart_inTop.jsp"></jsp:include>

    <!-- breadcrumbs -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="row">
          <div class="col">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="./">Home</a></li>
                <li class="breadcrumb-item"><a href="product_list">Shop</a></li>
                <li class="breadcrumb-item active" aria-current="page">Product</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>


   <!-- product -->
    <section class="hero pt-5">
      <div class="container">
        <div class="row gutter-2 gutter-md-4 justify-content-between">

          <div class="col-lg-7">
            <div class="row gutter-1 justify-content-between">
              <div class="col-lg-10 order-lg-2">
                <div class="owl-carousel gallery" data-slider-id="1" data-thumbs="true" data-nav="true">
                  <figure class="equal" style="width:100%; height: 100%">
                    <a class="image" href="resources/img/product/productDetail1.png" 
                      style="background-image: url(resources/img/product/productDetail1.png);">
                    </a>
                  </figure>
                  <figure class="equal" style="width:100%; height: 100%">
                    <a class="image" href="resources/img/product/productDetail2.png" 
                      style="background-image: url(resources/img/product/productDetail2.png);">
                    </a>
                  </figure>
                  <figure class="equal" style="width:100%; height: 100%">
                    <a class="image" href="resources/img/product/productDetail3.png" 
                      style="background-image: url(resources/img/product/productDetail3.png);">
                    </a>
                  </figure>
                </div>
              </div>
              
              <div class="col-lg-2 text-center text-lg-left order-lg-1">
                <div class="owl-thumbs" data-slider-id="1">
                    <span class="owl-thumb-item"><img src="resources/img/product/productDetail1.png" alt=""></span>
                    <span class="owl-thumb-item"><img src="resources/img/product/productDetail2.png" alt=""></span>
                    <span class="owl-thumb-item"><img src="resources/img/product/productDetail3.png" alt=""></span>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-5 mb-5 mb-lg-0">
            <div class="row">
              <div class="col-12">
                <h4 class="item-title">Apple</h4>
                <p>Apple iPhone 14 Pro 256GB Deep Purple (Korean Ver.)</p>
                <!-- 구매 판매 버튼 -->
                <button type="button" class="btn"  onclick="location.href='member_buy_agree'" style="background: #F06464; border-radius: 15px; color: white; width: 220px;">
                	<p>구매 | 1,755,000원</p>
                </button>
				<button type="button" class="btn" onclick="location.href='member_sell_agree'" style="background: #46BD7B; border-radius: 15px; color: white; width: 220px;">
					<p>판매 | 1,600,000원</p>
				</button>
				<!-- 구매 판매 버튼 끝 -->
              </div>
            </div>
            <div class="row">
              <div class="col-12">
              
              <!--  모델번호 가격 -->
               <table class="table">
					<tr>
						<td><span style="font-size: 12px;">모델번호</span><br><span>MQ1F3KH/A</span></td>
						<td><span style="font-size: 12px;">컬러<br></span><span>DEEP PURPLE</span></td>
						<td><span style="font-size: 12px;">발매가<br></span><span>1,700,000</span></td>
					</tr>
				</table>
				
				
				<!-- 오른쪽 버튼 -->
				<div>
			      <div class="container">
			        <div class="row gutter-2 gutter-md-4">
			          <div class="col-md-12 col-lg-12">
			            <div class="accordion accordion-minimal" id="accordion-2">
			              <div class="card">
			                <div class="card-header" id="heading-2-1">
			                  <h2 class="mb-0">
			                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-2-1" aria-expanded="false" aria-controls="collapse-2-1">
			                      <span style="font-size: 12px;">배송 기간 안내</span>
			                    </button>
			                  </h2>
			                </div>
			                <div id="collapse-2-1" class="collapse" aria-labelledby="heading-2-1" data-parent="#accordion-2">
			                  <div class="card-body" style="font-size: 12px;">
			                 	 OwnIt은 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다.
			                 	 <br>배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는 속도에 따라 차이가 있습니다.<br>
							     <br>[빠른배송 구매]
								 <br>- 판매자가 보관 신청한 상품 중 검수에 합격한 상품을 KREAM의 전용 창고에 보관합니다. 보관 상품에 한하여 바로 구매와 95점 구매가 가능합니다.
								 <br>- 오늘(오후 11:59까지) 결제하면 내일 바로 출고되어 빠른 배송이 가능합니다. (연휴 및 공휴일, 천재지변, 택배사 사유 등 예외적으로 출고일이 변경될 수 있습니다. 빠른배송 안내
			                  </div>
			                </div>
			              </div>
			              <div class="card">
			                <div class="card-header" id="heading-2-2">
			                  <h2 class="mb-0">
			                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-2" aria-expanded="false" aria-controls="collapse-2-2">
			                      <span style="font-size: 12px;">검수 안내</span>
			                    </button>
			                  </h2>
			                </div>
			                <div id="collapse-2-2" class="collapse" aria-labelledby="heading-2-2" data-parent="#accordion-2">
			                  <div class="card-body" style="font-size: 12px;">
			                    판매자의 상품이 검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.
			                    <br>- 검수센터에서는 정가품 여부를 확인하기 위하여, 지속적으로 데이터를 쌓고 분석하여 기록하고 있습니다.
								<br>- 업계 전문가로 구성된 검수팀은 박스와 상품의 라벨에서 바느질, 접착, 소재 등 모든 것을 검수합니다.
			                  </div>
			                </div>
			              </div>
			              <div class="card">
			                <div class="card-header" id="heading-2-3">
			                  <h2 class="mb-0">
			                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-3" aria-expanded="false" aria-controls="collapse-2-3">
			                      <span style="font-size: 12px;">구매 환불/취소/교환 안내</span>
			                    </button>
			                  </h2>
			                </div>
			                <div id="collapse-2-3" class="collapse" aria-labelledby="heading-2-3" data-parent="#accordion-2">
			                  <div class="card-body" style="font-size: 12px;">
			                     OwnIt은 익명 거래를 기반으로 판매자가 판매하는 상품을 구매자가 실시간으로 구매하여 거래를 체결합니다.
								<br>- 단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 
								<br>- 상품을 원하지 않으시는 경우 언제든지 OwnIt에서 재판매를 하실 수 있습니다.
								<br>- 상품 수령 후, 이상이 있는 경우 OwnIt 고객센터로 문의해주시기 바랍니다.
			                  </div>
			                </div>
			              </div>
			            </div> 
			          </div>
			        </div>
			      </div>
			    </div>
			    <!--  오른쪽 버튼 끝 -->
    
              </div>
            </div>
            
            
            <div>
              <div class="col-lg-12">
                	<a data-toggle="modal" data-target="#cart" class="btn" style="background: black; color: white; width: 195px;">Add to Cart</a>
				<button type="button" class="btn" onclick="location.href=''" style="background: black; color: white; width: 195px;">
					Add to wishlist
				</button>
              </div>
              <img src="resources/img/product/productDetailNotice.png">
              <div class="col-12 mt-1">
                <ul class="nav nav-actions">
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Share this product</a>
                    <ul class="dropdown-menu">
                      <li>
                        <a class="dropdown-item" href="#">Facebook</a>
                      </li>
                      <li>
                        <a class="dropdown-item" href="#">Twitter</a>
                      </li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            
          </div>

        </div>
      </div>
    </section>
	
	<hr>
	
	<!-- STYLE 시작 -->
	 <section class="hero hero-small">
      <div class="container">
        <div class="row">
          <div class="col text-center">
            <h3>Style <span style="font-size: 15px;">(257)</span></h3>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Style</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>
	 <!-- *************************** 상단 정렬 메뉴 *************************** -->
    <section class="hero hero-small">
      <div class="container">
        <div class="row">
          <div class="col text-center">
          	<input type="radio" class="btn-check" name="btnradio" id="btnradio1" checked>
           	<label for="btnradio1">인기</label>
           	<input type="radio" class="btn-check" name="btnradio" id="btnradio2">
 			<label for="btnradio2">최신</label>
          </div>
        </div>
      </div>
    </section>
    <!-- *************************** 상단 정렬 메뉴 *************************** -->
    
    <!-- *************************** 리뷰 목록 *************************** -->
    <section class="pt-0" style="width: 1350px; padding: 100px 100px 100px 100px;">
      <div class="container">
        <div class="row masonry gutter-3">
        <!-- *************************** 데이터 넣을 부분 *************************** -->
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/iphone3.jpg)"></a>
              </figure>
              <div class="card-body">
              	<a class="profile" href="review_mystyle"><img src="resources/img/review/max4pf.jpg"><span class="eyebrow text-muted">min.nicha</span></a>
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
                <a class="profile" href="post.html"><img src="resources/img/review/max2pf.jpg"><span class="eyebrow text-muted">noodle.zip</span></a>
                <h3 class="card-content">기분 좋아♬</h3>
                <div class="like"><img src="resources/img/review/like.jpg">268&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">5</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/max2dt.jpg"><div class="subject">Samsung Galaxy Z Flip4 512GB Purple<br>1,110,000원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/zflip1.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/zflip1pf.jpg"><span class="eyebrow text-muted">hoseok123</span></a>
                <h3 class="card-content">맘에듭니다! 많이 파세요</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">38&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">2</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/zflip1dt.jpg"><div class="subject">Apple iPhone 14 Pro 256GB Silver (Korean Ver.)<br>1,445,000원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/sony1.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/sony1pf.jpg"><span class="eyebrow text-muted">kkk_86</span></a>
                <h3 class="card-content">물건 상태 좋고 음질도 기대한만큼 좋네요. 믿고 구매하는 온잇! 이번에도 실망시키지 않네요!! 감사합니다</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">36&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">8</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/sony1dt.jpg"><div class="subject">Sony WH-1000XM4 Black (Korean Ver.)<br>354,000원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/max3.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/max3pf.jpg"><span class="eyebrow text-muted">hojiiin</span></a>
                <h3 class="card-content">보스 음질 좋은거야 당연하고 색상도 맘에 듭니다♥</h3>
                <div class="like"><img src="resources/img/review/like.jpg">67&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">1</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/max3dt.jpg"><div class="subject">Bose QC45 White Smoke (Korean Ver.)<br>1,445,000원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/zflip2.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/zflip2pf.jpg"><span class="eyebrow text-muted">realsaaamk</span></a>
                <h3 class="card-content">굳굳굳</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">143&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">8</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/zflip2dt.jpg"><div class="subject">Samsung Galaxy Z Flip4 512GB Graphite<br>1,029,000원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/max1.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/max1pf.jpg"><span class="eyebrow text-muted">karikarina</span></a>
                <h3 class="card-content">음질도 만족스럽고 일단 어디에나 잘 어울리는 컬러라 맘에 듭니다!!!</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">50&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">3</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/max1dt.jpg"><div class="subject">Apple AirPods Max Silver (Korean Ver.)<br>639,000원</div></a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail" style="background-image: url(resources/img/review/iphone2.jpg)"></a>
              </figure>
              <div class="card-body">
                <a class="profile" href="post.html"><img src="resources/img/review/iphone2pf.jpg"><span class="eyebrow text-muted">hiiiiiii</span></a>
                <h3 class="card-content">영롱한 실버...ㅠㅠ</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">50&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">3</div>
                <h4 class="card-title"><a href="post.html"><img src="resources/img/review/iphone2dt.jpg"><div class="subject">Apple iPhone 14 Pro 256GB Silver (Korean Ver.)<br>1,445,000원</div></a></h4>
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


   <jsp:include page="../inc/footer.jsp"></jsp:include>





    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
  </body>
</html>