<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>Listing</title>
  </head>
  <style>
  .items {
  	 display: block;
	 width: 867px;
	 padding-right: 15px;
	 padding-left: 5px;
	 height: 60px;
	 
  }
  .items > a {
  	margin-right: 41px;
  	color: black;
  	font-size: 0.8em;
  	
  }
  .items > a#laptop {
  	margin-right: 0px;
  	color: black;
  	font-size: 0.8em;
  	
  }
  .items > a > img {
  	width: 60px;
  	height: 60px;
  }
  .btn btn-outline-secondary btn-sm dropdown-toggle {
  	 width: 867px;
  }
  .style_icon {
  -webkit-transition: all 0.2s;
  -moz-transition: all 0.2s;
  transition: all 0.2s;
  -webkit-transition-delay: 0s;
  -moz-transition-delay: 0s;
  transition-delay: 0s;
  position: absolute;
  top: 0;
  right: 0;
  display: block;
  width: 1.875rem;
  height: 1.875rem;
  text-align: right;
  color: #6c757d; }
  
  </style>
  <body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/cart_inTop.jsp"></jsp:include>
    <!-- 페이지 레벨 / breadcrumbs -->
    <section class="breadcrumbs separator-bottom">
      <div class="container">
        <div class="row">
          <div class="col">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Listing</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>

    <!-- 상품 목록 위 카테고리 관련 / listing -->
    <section class="pt-6">
      <div class="container">
        <div class="row justify-content-end">
          <div class="col-lg-9">
            <div class="row gutter-2 align-items-end">
              <div class="col-md-6">
                <h1 class="mb-0">Tech</h1>
                <span class="eyebrow">(총 개수) products</span>
              </div>
              <div class="items">
			   	<a href="#GetMapping~~" id="phone">
			   		<img src="./resources/img/product/phone1.png" alt="휴대폰">휴대폰
			   	</a>
			   	<a href="#" id="tablet">
			   		<img src="./resources/img/product/tablet1.png">태블릿
			   	</a>
			   	<a href="#" id="watch">
			   		<img src="./resources/img/product/watch1.png">스마트워치
			   	</a>
			   		<a href="#" id="earphone">
			   		<img src="./resources/img/product/earphone1.jpeg">이어폰
			   	</a>
			   	<a href="#" id="headphone">
			   		<img src="./resources/img/product/head1.png">헤드폰
			   	</a>
			   	<a href="#" id="laptop">
			   		<img src="./resources/img/product/mac1.png">노트북
			   	</a>
		     </div>
            </div>
          </div>
         <div class="col-md-6 text-md-right" style="margin-top: 25px">
           <div class="dropdown">
             <a class="btn btn-outline-secondary btn-sm dropdown-toggle" href="#!" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               인기순
             </a>
             <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
               <a class="dropdown-item" href="#!">인기순</a><br>
               <a class="dropdown-item" href="#!">가격높은순</a><br>
               <a class="dropdown-item" href="#!">가격낮은순</a><br>
               <a class="dropdown-item" href="#!">신제품</a>
             </div>
           </div>
         </div>
       </div>
        <div class="row gutter-4">
		<!-- sidebar -->
        <jsp:include page="../inc/sidebar_product.jsp"></jsp:include>
        
          <!-- 상품 목록 리스팅 코드 / content -->
          <div class="col-lg-9">
            <div class="row gutter-2 gutter-lg-3">
              <div class="col-6 col-md-4">
                <div class="product">
                  <figure class="product-image">
                    <a href="product_detail">
                      <img src="resources/img//product/phone2.png" alt="Image">
                      <img src="resources/img//product/phone3.png" alt="Image">
                    </a>
                  </figure>
                  <div class="product-meta">
                  <h3 class="product-title"><a href="#!"><b>Apple</b></a></h3>
                    <h3 class="product-title"><a href="#!">Apple iPhone 14 Pro 256GB Space Black (Korean Ver.) </a></h3>
                    <div class="product-price">
                      <span>1,540,000원</span>
                      <span class="product-action">
                        <a href="#!">장바구니에 추가</a>
                      </span>
                    </div>
                    <a href="#!" class="product-like"></a>
                    <a href="#!" class="style-icon"><img src="resources/img/product/review_icon.png">Review</a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-4">
                <div class="product">
                  <figure class="product-image">
                    <div class="owl-carousel" data-nav="true" data-loop="true">
                      <a href="#!">
                        <img src="resources/img/demo/product-2.jpg" alt="Image">
                      </a>
                      <a href="#!">
                        <img src="resources/img/demo/product-2-2.jpg" alt="Image">
                      </a>
                      <a href="#!">
                        <img src="resources/img/demo/product-2-3.jpg" alt="Image">
                      </a>
                    </div>
                  </figure>
                  <div class="product-meta">
                    <h3 class="product-title"><a href="#!">Dark Stained NY11 Dining Chair</a></h3>
                    <div class="product-price">
                      <span>$504</span>
                      <span class="product-action">
                        <a href="#!">장바구니에 추가</a>
                      </span>
                    </div>
                    <a href="#!" class="product-like"></a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-4">
                <div class="product">
                  <figure class="product-image">
                    <a href="#!">
                      <img src="resources/img/demo/product-3.jpg" alt="Image">
                      <img src="resources/img/demo/product-3-2.jpg" alt="Image">
                    </a>
                  </figure>
                  <div class="product-meta">
                    <h3 class="product-title"><a href="#!">Black IC Pendant Light</a></h3>
                    <div class="product-price">
                      <span>$410</span>
                      <span class="product-action">
                        <a href="#!">장바구니에 추가</a>
                      </span>
                    </div>
                    <a href="#!" class="product-like"></a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-4">
                <div class="product">
                  <figure class="product-image">
                    <a href="#!">
                      <img src="resources/img/demo/product-24.jpg" alt="Image">
                      <img src="resources/img/demo/product-24-2.jpg" alt="Image">
                    </a>
                  </figure>
                  <div class="product-meta">
                    <h3 class="product-title"><a href="#!">Black Closca Helmet</a></h3>
                    <div class="product-price">
                      <span>$132</span>
                      <span class="product-action">
                        <a href="#!">장바구니에 추가</a>
                      </span>
                    </div>
                    <a href="#!" class="product-like"></a>
                  </div>
                </div>
              </div>


              <div class="col-6 col-md-4">
                <div class="product">
                  <figure class="product-image">
                    <a href="#!">
                      <img src="resources/img/demo/product-25.jpg" alt="Image">
                      <img src="resources/img/demo/product-25-2.jpg" alt="Image">
                    </a>
                  </figure>
                  <div class="product-meta">
                    <h3 class="product-title"><a href="#!">Gravel Black Sigg Water Bottle</a></h3>
                    <div class="product-price">
                      <span>$23</span>
                      <span class="product-action">
                        <a href="#!">장바구니에 추가</a>
                      </span>
                    </div>
                    <a href="#!" class="product-like"></a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-4">
                <div class="product">
                  <figure class="product-image">
                    <a href="#!">
                      <img src="resources/img/demo/product-4.jpg" alt="Image">
                      <img src="resources/img/demo/product-4-2.jpg" alt="Image">
                    </a>
                  </figure>
                  <div class="product-meta">
                    <h3 class="product-title"><a href="#!">Red Analog Magazine Rack</a></h3>
                    <div class="product-price">
                      <span>$120</span>
                      <span class="product-action">
                        <a href="#!">장바구니에 추가</a>
                      </span>
                    </div>
                    <a href="#!" class="product-like"></a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-4">
                <div class="product">
                  <figure class="product-image">
                    <a href="#!">
                      <img src="resources/img/demo/product-5.jpg" alt="Image">
                      <img src="resources/img/demo/product-5-2.jpg" alt="Image">
                    </a>
                  </figure>
                  <div class="product-meta">
                    <h3 class="product-title"><a href="#!">Black Piani Table Lamp</a></h3>
                    <div class="product-price">
                      <span>$290</span>
                      <span class="product-action">
                        <a href="#!">장바구니에 추가</a>
                      </span>
                    </div>
                    <a href="#!" class="product-like"></a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-4">
                <div class="product">
                  <figure class="product-image">
                    <a href="#!">
                      <img src="resources/img/demo/product-6.jpg" alt="Image">
                      <img src="resources/img/demo/product-6-2.jpg" alt="Image">
                    </a>
                  </figure>
                  <div class="product-meta">
                    <h3 class="product-title"><a href="#!">Grey Pendant Bell Lamp</a></h3>
                    <div class="product-price">
                      <span>$258</span>
                      <span class="product-action">
                        <a href="#!">장바구니에 추가</a>
                      </span>
                    </div>
                    <a href="#!" class="product-like"></a>
                  </div>
                </div>
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

        </div>
      </div>
    </section>


    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>


    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
  </body>
</html>