<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#btn {
		background-color: #101010;
		border-color: #101010;
	}
	#btn:hover {
		background-color: #353535;
		border-color: #353535;
	}
</style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>Cart</title>
  </head>
  <body>
   <jsp:include page="../inc/top.jsp"></jsp:include>
   <jsp:include page="../inc/cart_inTop.jsp"></jsp:include>
    <!-- hero -->
    <section class="hero">
      <div class="container">
        <div class="row">
          <div class="col text-center">
            <h1>Shopping Cart</h1>
          </div>
        </div>
      </div>
    </section>


    <section class="pt-0">
      <div class="container">
        <div class="row mb-1 d-none d-lg-flex">
          <div class="col-lg-8">
            <div class="row pr-6">
              <div class="col-lg-6"><input type="checkbox" id="cb1" style="margin-right: 20px;"><span class="eyebrow">상품</span></div>
              <div class="col-lg-2 text-center"><span class="eyebrow">가격</span></div>
              <div class="col-lg-2 text-center"><span class="eyebrow">수량</span></div>
              <div class="col-lg-2 text-center"><span class="eyebrow">총 금액</span></div>
            </div>
          </div>
        </div>
        <div class="row gutter-2 gutter-lg-4 justify-content-end">

          <div class="col-lg-8 cart-item-list">

            <!-- cart item -->
            <div class="cart-item">
              <div class="row align-items-center">
                <div class="col-12 col-lg-6">
                  <div class="media media-product">
                  <input type="checkbox" id="cb1" style="margin-right: 20px;">
                    <a href="#!"><img src="resources/img/demo/product-4.jpg" alt="Image"></a>
                    <div class="media-body">
                      <h5 class="media-title">Analog Magazine Rack</h5>
                      <span class="small">Red</span>
                    </div>
                  </div>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <span class="cart-item-price">$120</span>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <div class="counter">
                    <span class="counter-minus icon-minus" field='qty-1'></span>
                    <input type='text' name='qty-1' class="counter-value" value="2" min="1" max="10">
                    <span class="counter-plus icon-plus" field='qty-1'></span>
                  </div>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <span class="cart-item-price">$240</span>
                </div>
                <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
              </div>
            </div>

            <!-- cart item -->
            <div class="cart-item">
              <div class="row align-items-center">
                <div class="col-12 col-lg-6">
                  <div class="media media-product">
                    <a href="#!"><img src="resources/img/demo/product-24.jpg" alt="Image"></a>
                    <div class="media-body">
                      <h5 class="media-title">Closca helmet</h5>
                      <span class="small">Black</span>
                    </div>
                  </div>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <span class="cart-item-price">$132</span>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <div class="counter">
                    <span class="counter-minus icon-minus" field='qty-2'></span>
                    <input type='text' name='qty-2' class="counter-value" value="1" min="1" max="10">
                    <span class="counter-plus icon-plus" field='qty-2'></span>
                  </div>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <span class="cart-item-price">$132</span>
                </div>
                <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
              </div>
            </div>

            <!-- cart item -->
            <div class="cart-item">
              <div class="row align-items-center">
                <div class="col-12 col-lg-6">
                  <div class="media media-product">
                    <a href="#!"><img src="resources/img/demo/product-25.jpg" alt="Image"></a>
                    <div class="media-body">
                      <h5 class="media-title">Sigg Water Bottle</h5>
                      <span class="small">Gravel Black</span>
                    </div>
                  </div>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <span class="cart-item-price">$23</span>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <div class="counter">
                    <span class="counter-minus icon-minus" field='qty-3'></span>
                    <input type='text' name='qty-3' class="counter-value" value="2" min="1" max="10">
                    <span class="counter-plus icon-plus" field='qty-3'></span>
                  </div>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <span class="cart-item-price">$46</span>
                </div>
                <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
              </div>
            </div>

          </div>

          <div class="col-lg-4">
            <div class="card card-data bg-light">
              <div class="card-header py-2 px-3">
                <div class="row align-items-center">
                  <div class="col">
                    <h3 class="fs-18 mb-0">결제 정보</h3>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <ul class="list-group list-group-minimal">
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    상품 금액
                    <span>$418</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    배송비
                    <span>Free</span>
                  </li>
                </ul>
              </div>
              <div class="card-footer py-2">
                <ul class="list-group list-group-minimal">
                  <li class="list-group-item d-flex justify-content-between align-items-center text-dark fs-18">
                    총 금액
                    <span>$418</span>
                  </li>
                </ul>
              </div>
            </div>
            <a href="#" class="btn btn-lg btn-primary btn-block mt-1" id="btn">장바구니 비우기</a>
            <a href="member_buy_form" class="btn btn-lg btn-primary btn-block mt-1" id="btn">선택상품 주문</a>
            <a href="member_buy_form" class="btn btn-lg btn-primary btn-block mt-1" id="btn">전체상품 주문</a>
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