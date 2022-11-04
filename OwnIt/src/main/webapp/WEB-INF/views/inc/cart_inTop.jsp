<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#btn-pay {
		background-color: #101010;
		border-color: #101010;
	}
	#btn-pay:hover {
		background-color: #353535;
		border-color: #353535;
	}
</style>
</head>
<body>
	<!-- Cart -->
     <div class="modal fade sidebar" id="cart" tabindex="-1" role="dialog" aria-labelledby="cartLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="cartLabel">장바구니</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <div class="row gutter-3">
              <div class="col-12">
                <div class="cart-item cart-item-sm">
                  <div class="row align-items-center">
                    <div class="col-lg-9">
                      <div class="media media-product">
                        <a href="#!"><img src="resources/img/demo/product-3.jpg" alt="Image"></a>
                        <div class="media-body">
                          <h5 class="media-title">Black IC Pendant Light</h5>
                          <span class="media-subtitle">Black, Steel</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 text-center text-lg-right">
                      <span class="cart-item-price">$90</span>
                    </div>
                    <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="cart-item cart-item-sm">
                  <div class="row align-items-center">
                    <div class="col-lg-9">
                      <div class="media media-product">
                        <a href="#!"><img src="resources/img/demo/product-4.jpg" alt="Image"></a>
                        <div class="media-body">
                          <h5 class="media-title">Red Analog Magazine Rack</h5>
                          <span class="media-subtitle">Red</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 text-center text-lg-right">
                      <span class="cart-item-price">$120</span>
                    </div>
                    <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="cart-item cart-item-sm">
                  <div class="row align-items-center">
                    <div class="col-lg-9">
                      <div class="media media-product">
                        <a href="#!"><img src="resources/img/demo/product-24.jpg" alt="Image"></a>
                        <div class="media-body">
                          <h5 class="media-title">Closca Helmet</h5>
                          <span class="media-subtitle">Black</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 text-center text-lg-right">
                      <span class="cart-item-price">$132</span>
                    </div>
                    <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="row gutter-0">
              
              
              <!-- 장바구니 누르면 나오는 버튼 경로 -->
                <div class="col d-none d-md-block">
                  <a href="cart" class="btn btn-lg btn-block btn-secondary">장바구니 이동</a>
                </div>
                
                <div class="col">
                  <a href="#" class="btn btn-lg btn-block btn-primary" id="btn-pay">결제하기</a>
                </div>
                
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>