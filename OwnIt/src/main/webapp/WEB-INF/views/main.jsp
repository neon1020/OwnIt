<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/vendor.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />

    <title>Home - Minimal</title>
  </head>
  <body>


    <!-- header -->
	<jsp:include page="inc/top.jsp"></jsp:include>
	<jsp:include page="inc/cart_inTop.jsp"></jsp:include>

    <!-- slider -->
    <div class="swiper-container swiper-container-alt">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <div class="image image-overlay image-zoom" style="background-image:url(<%=request.getContextPath() %>/resources/img/background-4.jpg)"></div>
          <div class="container">
            <div class="row align-items-center justify-content-center vh-80">
              <div class="col-lg-8 text-white text-center" data-swiper-parallax-y="-100%">
                <h1 class="display-2 mb-2">Your <b>perfect workspace</b> is waiting for you.</h1>
                <a href="" class="btn btn-white">Shop Now</a>
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="image image-overlay image-zoom" style="background-image:url(<%=request.getContextPath() %>/resources/img/background-5.jpg)"></div>
          <div class="container">
            <div class="row align-items-center justify-content-center vh-80">
              <div class="col-lg-6 text-white text-center" data-swiper-parallax-y="-100%">
                <h1 class="display-2 mb-2">Transform your home with us.</h1>
                <a href="" class="btn btn-outline-white">Shop Now</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
    </div>


    <!-- categories -->
    <section class="pt-1">
      <div class="container-full">
        <div class="row masonry gutter-1">
          <div class="col-md-4">
            <span class="image image-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/card-1.jpg)"></span>
            <div class="card-body text-center text-white">
              <h3>Kitchen &amp; Dining</h3>
            </div>
          </div>
          <div class="col-md-4">
            <span class="image image-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/card-2.jpg)"></span>
            <div class="card-body text-center text-white">
              <h3>Living Room</h3>
            </div>
          </div>
          <div class="col-md-4">
            <span class="image image-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/card-3.jpg)"></span>
            <div class="card-body text-center text-white">
              <h3>Bathroom</h3>
            </div>
          </div>
        </div>
      </div>
    </section>


    <!-- latest products -->
    <section class="pt-0">
      <div class="container">
        <div class="row">
          <div class="col text-center">
            <h2>Latest Products</h2>
          </div>
        </div>
        <div class="row gutter-2 gutter-md-3">

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
                <a href="#!" class="product-like"></a>
              </div>
            </div>
          </div>
          <div class="col-6 col-lg-3">
            <div class="product">
               <figure class="product-image">
                <a href="#!">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-1.jpg" alt="Image">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-1-2.jpg" alt="Image">
                </a>
              </figure>
              <div class="product-meta">
                <h3 class="product-title"><a href="#!">Dark Stained NY11 Dining Chair</a></h3>
                <div class="product-price">
                  <span>$504</span>
                  <span class="product-action">
                    <a href="#!">Add to cart</a>
                  </span>
                </div>
                <a href="#!" class="product-like"></a>
              </div>
            </div>
          </div>
          <div class="col-6 col-lg-3">
            <div class="product">
              <figure class="product-image">
                <a href="#!">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-3.jpg" alt="Image">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-3-2.jpg" alt="Image">
                </a>
              </figure>
              <div class="product-meta">
                <h3 class="product-title"><a href="#!">Black IC Pendant Light</a></h3>
                <div class="product-price">
                  <span>$410</span>
                  <span class="product-action">
                    <a href="#!">Add to cart</a>
                  </span>
                </div>
                <a href="#!" class="product-like"></a>
              </div>
            </div>
          </div>

          <div class="col-6 col-lg-3">
            <div class="product">
              <figure class="product-image">
                <span class="product-promo">-25%</span>
                <a href="#!">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-4.jpg" alt="Image">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-4-2.jpg" alt="Image">
                </a>
              </figure>
              <div class="product-meta">
                <h3 class="product-title"><a href="#!">Red Analog Magazine Rack</a></h3>
                <div class="product-price">
                  <span>$120</span>
                  <span class="product-action">
                    <a href="#!">Add to cart</a>
                  </span>
                </div>
                <a href="#!" class="product-like"></a>
              </div>
            </div>
          </div>
          <div class="col-6 col-lg-3">
            <div class="product">
              <figure class="product-image">
                <a href="#!">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-5.jpg" alt="Image">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-5-2.jpg" alt="Image">
                </a>
              </figure>
              <div class="product-meta">
                <h3 class="product-title"><a href="#!">Black Piani Table Lamp</a></h3>
                <div class="product-price">
                  <span>$290</span>
                  <span class="product-action">
                    <a href="#!">Add to cart</a>
                  </span>
                </div>
                <a href="#!" class="product-like"></a>
              </div>
            </div>
          </div>
          <div class="col-6 col-lg-3">
            <div class="product">
              <figure class="product-image">
                <a href="#!">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-6.jpg" alt="Image">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-6-2.jpg" alt="Image">
                </a>
              </figure>
              <div class="product-meta">
                <h3 class="product-title"><a href="#!">Grey Pendant Bell Lamp</a></h3>
                <div class="product-price">
                  <span>$258</span>
                  <span class="product-action">
                    <a href="#!">Add to cart</a>
                  </span>
                </div>
                <a href="#!" class="product-like"></a>
              </div>
            </div>
          </div>
          <div class="col-6 col-lg-3">
            <div class="product">
              <figure class="product-image">
                <a href="#!">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-25.jpg" alt="Image">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-25-2.jpg" alt="Image">
                </a>
              </figure>
              <div class="product-meta">
                <h3 class="product-title"><a href="#!">Gravel Black Sigg Water Bottle</a></h3>
                <div class="product-price">
                  <span>$23</span>
                  <span class="product-action">
                    <a href="#!">Add to cart</a>
                  </span>
                </div>
                <a href="#!" class="product-like"></a>
              </div>
            </div>
          </div>
          <div class="col-6 col-lg-3">
            <div class="product">
              <figure class="product-image">
                <a href="#!">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-7.jpg" alt="Image">
                  <img src="<%=request.getContextPath() %>/resources/img/demo/product-7-2.jpg" alt="Image">
                </a>
              </figure>
              <div class="product-meta">
                <h3 class="product-title"><a href="#!">Garnet Must Sofa</a></h3>
                <div class="product-price">
                  <span>$4,668</span>
                  <span class="product-action">
                    <a href="#!">Add to cart</a>
                  </span>
                </div>
                <a href="#!" class="product-like"></a>
              </div>
            </div>
          </div>

        </div>
        <div class="row">
          <div class="col text-center">
            <a href="#!" class="btn btn-outline-secondary">Load More</a>
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