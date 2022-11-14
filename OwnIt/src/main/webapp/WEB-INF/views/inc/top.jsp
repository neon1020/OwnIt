<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                        <li><a class="dropdown-item" href="cart">Cart</a></li>
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
                
                
                <li class="nav-item cart" onclick="location.href='checkCart'">
                  <a data-toggle="modal" data-target="#cart" class="nav-link" ><span>Cart</span><span>2</span></a>
                </li>
                
              </ul>
            </div>
          </nav>
        </div>
      </div>
    </header>
</body>
</html>