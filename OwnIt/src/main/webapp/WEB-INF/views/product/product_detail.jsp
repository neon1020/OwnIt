<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
    <title>Product</title>
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
                  <figure class="equal">
                    <a class="image" href="resources/img/demo/product-1.jpg" 
                      style="background-image: url(resources/img/product/productDetail1.png);">
                    </a>
                  </figure>
                  <figure class="equal">
                    <a class="image" href="resources/img/demo/product-1.jpg" 
                      style="background-image: url(resources/img/product/productDetail2.png);">
                    </a>
                  </figure>
                  <figure class="equal">
                    <a class="image" href="resources/img/demo/product-1.jpg" 
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
               <button type="button" class="btn"  onclick="location.href=''" style="background: black; color: white; width: 195px;">
                	Add to Cart
                </button>
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


    <section class="pt-0">
      <div class="container">
        <div class="row masonry gutter-3">
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="post.html" style="background-image: url(resources/img/news-1.jpg)"></a>
              </figure>
              <div class="card-body">
                <span class="eyebrow text-muted">22 March 2019</span>
                <h4 class="card-title"><a href="post.html">The Shoes That will Instantly Update Any Outfit</a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal">
                <a class="image image-fade" href="post.html" style="background-image: url(resources/img/news-2.jpg)"></a>
              </figure>
              <div class="card-body">
                <span class="eyebrow text-muted">22 March 2019</span>
                <h4 class="card-title"><a href="post.html">The Shoes That will Instantly Update Any Outfit</a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="post.html" style="background-image: url(resources/img/news-3.jpg)"></a>
              </figure>
              <div class="card-body">
                <span class="eyebrow text-muted">22 March 2019</span>
                <h4 class="card-title"><a href="post.html">The Shoes That will Instantly Update Any Outfit</a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal">
                <a class="image image-fade" href="post.html" style="background-image: url(resources/img/news-4.jpg)"></a>
              </figure>
              <div class="card-body">
                <span class="eyebrow text-muted">22 March 2019</span>
                <h4 class="card-title"><a href="post.html">The Shoes That will Instantly Update Any Outfit</a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal">
                <a class="image image-fade" href="post.html" style="background-image: url(resources/img/news-5.jpg)"></a>
              </figure>
              <div class="card-body">
                <span class="eyebrow text-muted">22 March 2019</span>
                <h4 class="card-title"><a href="post.html">The Shoes That will Instantly Update Any Outfit</a></h4>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="post.html" style="background-image: url(resources/img/news-6.jpg)"></a>
              </figure>
              <div class="card-body">
                <span class="eyebrow text-muted">22 March 2019</span>
                <h4 class="card-title"><a href="post.html">The Shoes That will Instantly Update Any Outfit</a></h4>
              </div>
            </article>
          </div>
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