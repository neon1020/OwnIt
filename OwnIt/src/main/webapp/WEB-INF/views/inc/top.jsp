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
<script src="resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
$(function() {
	$('.cartInTop').click(function() {
		debugger;
		$.ajax({
			url:'checkCart',
			type:'POST',
			dataType:'json',
			success:function(cart) {
// 				alert(JSON.stringify(cart));
					var html = "";
				$.each(cart, function(index) {
// 					alert(JSON.stringify(cart[index]));
					
					html += "<div class='row gutter-3'>";
					html += "<div class='col-12' id='cartItems'>";
					html += "<div class='cart-item cart-item-sm'>";
					html += "<div class='row align-items-center'>";
					html += "<div class='col-lg-9'>"
					html += "<div class='media media-product'>";
					html += "<a href='product_detail?product_idx="+ cart[index].product_idx +"'><img src='resources/img/product/"+ cart[index].image_original_file1+"' alt='Image' style='width: 70px; height: 70px;'></a>";
					html += "<div class='media-body'>";
					html += "<h5 class='media-title'>" + cart[index].product_name + "</h5>";
					html += "<span class='media-subtitle'>" + cart[index].product_color + "</span>";
					html += "</div></div></div>";
					html += "<div class='col-lg-3 text-center text-lg-right'>";
					html += "<span class='cart-item-price'>"+ cart[index].product_buy_price +"원</span>";
					html += "</div><a href='#!' class='cart-item-close'><i class='icon-x'></i></a></div></div></div></div>";
				});
				
				$('.myCartItems').html(html);
			}
		});
	});
});

</script>
</head>
<body>
<header class="header header-dark bg-dark header-sticky">
      <div class="container">
        <div class="row">
          <nav class="navbar navbar-expand-lg navbar-dark">
            <a href="./" class="navbar-brand order-1 order-lg-2"><img src="<%=request.getContextPath() %>/resources/img/ownit_logo.png" alt="Logo"></a>
            <button class="navbar-toggler order-2" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse order-3 order-lg-1" id="navbarMenu">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="./">Home</a></li>
                <li class="nav-item dropdown megamenu">
                  <a class="nav-link dropdown-toggle" href="#!" id="navbarDropdown-4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Pages
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown-4">
                    <div class="row">
                    
                    <!-- PAGES -->
                      <ul class="col-6 col-md-3 col-lg-2">
                        <li><span class="megamenu-title">Home</span></li>
                        <li><a class="dropdown-item" href="./">Home</a></li>
                        <li><span class="megamenu-title">Shop</span></li>
                        <li><a class="dropdown-item" href="product_list">Listing</a></li>
                      </ul>
                      <ul class="col-6 col-md-3 col-lg-2">
                        <li><span class="megamenu-title">Product</span></li>
                        <li><a class="dropdown-item" href="product_detail">Product</a></li>
                        <li><span class="megamenu-title">Order</span></li>
                        <li><a class="dropdown-item" href="viewMyCart">Cart</a></li>
                      </ul>
                      <ul class="col-6 col-md-3 col-lg-2">
                        <li><span class="megamenu-title">MyPage</span></li>
                        <li><a class="dropdown-item" href="member_login">Log In</a></li>
                        <li><a class="dropdown-item" href="mypage">Profile</a></li>
                        <li><a class="dropdown-item" href="mypage_order">Orders</a></li>
                        <li><a class="dropdown-item" href="address">Addresses</a></li>
                        <li><a class="dropdown-item" href="account">Account</a></li>
                        <li><a class="dropdown-item" href="wishlist">Wishlist</a></li>
                        <li><a class="dropdown-item" href="mypage_sell">Sell</a></li>
                        <li><a class="dropdown-item" href="mypage_revise">Revise</a></li>
                        
                      </ul>
                      <ul class="col-6 col-md-3 col-lg-2">
                        <li><span class="megamenu-title">Review</span></li>
                        <li><a class="dropdown-item" href="review">Review</a></li>
                        <li><a class="dropdown-item" href="review_writeForm">Review Write</a></li>
                        <li><span class="megamenu-title">Customer Center</span></li>
                        <li><a class="dropdown-item" href="noticeList">Customer Center</a></li>
                        <li><span class="megamenu-title">Admin</span></li>
                        <li><a class="dropdown-item" href="admin">Admin</a></li>
                      </ul>
                      <div class="col-lg-4">
                        <div class="promo">
                          <span class="image image-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/background-3.jpg)"></span>
                          <div class="promo-footer p-4 text-white">
                            <h3 class="mb-0">New Collection</h3>
                            <a href="#!" class="eyebrow underline text-white">Shop Now</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
<!--                 <li class="nav-item"> -->
<!--                   <a class="nav-link" href="#">Docs</a> -->
<!--                 </li> -->
              </ul>
            </div>

            <div class="collapse navbar-collapse order-4 order-lg-3" id="navbarMenu2">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link" href="member_login">Log In</a>
                </li>
                
                
                <li class="nav-item cart">
                  <a data-toggle="modal" data-target="#cart" class="nav-link" ><span class="cartInTop">Cart</span><span>${cartCnt }</span></a>
                </li>
                
              </ul>
            </div>
          </nav>
        </div>
      </div>
    </header>
    
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
			<div class="myCartItems">
			<!-- 여기부터 데이터 쌓기 -->
            <div class="row gutter-3">
              <div class="col-12" id="cartItems">
                <div class="cart-item cart-item-sm">
                  <div class="row align-items-center">
                    <div class="col-lg-9">
                      <div class="media media-product">
                        <a href="#!"><img src="resources/img/product/${cart.image_original_file1 }" alt="Image" style="width: 70px; height: 70px;"></a>
                        <div class="media-body"	>
                          <h5 class="media-title">${cart.product_name }</h5>
                          <span class="media-subtitle">${cart.product_color }</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 text-center text-lg-right">
                      <span class="cart-item-price">${cart.product_buy_price }</span>
                    </div>
                    <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
                  </div>
                </div>
              </div>
            </div>
           </div> <!-- 여기까지 -->
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="row gutter-0">
              
              
              <!-- 장바구니 누르면 나오는 버튼 경로 -->
                <div class="col d-none d-md-block">
                  <a href="viewMyCart" class="btn btn-lg btn-block btn-secondary">장바구니 이동</a>
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