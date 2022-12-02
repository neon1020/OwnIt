<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.media-title {
	   font-size: 1.2em;
	   line-height: 1.2;
	   -webkit-line-clamp: 2;
	}
	.btn-secondary {
		background-color: #101010; color: white;
	}
	.btn-secondary:hover {
		background-color: #353535; color: white;
	}
   
</style>
<script src="resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
function numberWithCommas(n) {
    return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function checkCart(){
	if(${not empty sessionScope.sId}) {
		$.ajax({
			url:'checkCart',
			type:'POST',
			dataType:'json',
			success:function(cart) {
	//				alert(JSON.stringify(cart));
					var html = "";
					var cnt = 0;
				$.each(cart, function(index) {
	//					alert(JSON.stringify(cart[index]));
					var buyPrice = numberWithCommas(cart[index].product_buy_price);
					cnt+=1;
					html += "<div class='row gutter-3'>";
					html += "<div class='col-12' id='cartItems'>";
					html += "<div class='cart-item cart-item-sm'>";
					html += "<div class='row align-items-center'>";
					html += "<div class='col-lg-9'>";
					html += "<div class='media media-product'>";
					html += "<a href='product_detail?product_idx="+ cart[index].product_idx +"&pageNum='><img src='resources/img/product/"+ cart[index].image_real_file1+"' alt='Image' style='width: 70px; height: 70px;'></a>";
					html += "<div class='media-body'>";
					html += "<h5 class='media-title' style='font-size: 0.9em;'>" + cart[index].product_name + "</h5>";
					html += "<span class='media-subtitle'>" + cart[index].product_color + "</span>";
					html += "</div></div></div>";
					html += "<div class='col-lg-3 text-center text-lg-right'>";
					html += "<span class='cart-item-price' style='font-size: 0.75em;'>"+ buyPrice +"원</span>";
					html += "</div><a class='cart-item-close' id='delCart_"+ cart[index].product_idx +"' onclick='delFromCart(this)'><i class='icon-x'></i></a></div></div></div></div>";
				});
				
				$('.myCartItems').html(html);
				$('.cnt').html(cnt);
			}
		});
	}
}

$(function() {
   checkCart();
   $('.cartInTop').click(checkCart);
});
   
// 로그아웃 수행
function logout() {
   let result = confirm("로그아웃 하시겠습니까?");
   
   if(result) {
      location.href = "member_logout";
   }
}

function delFromCart(item) {
	var delIdx = item.id.split('_')[1];
	$.ajax({
		url:'delAndReloadCart',
		type:'POST',
		data: {
			product_idx:delIdx
		},
		dataType:'json',
		success:function(cart) {
			var html = "";
			var cnt = 0;
			$.each(cart, function(index) {
//					alert(JSON.stringify(cart[index]));
				var buyPrice = numberWithCommas(cart[index].product_buy_price);
				cnt+= 1;
				html += "<div class='row gutter-3'>";
				html += "<div class='col-12' id='cartItems'>";
				html += "<div class='cart-item cart-item-sm'>";
				html += "<div class='row align-items-center'>";
				html += "<div class='col-lg-9'>";
				html += "<div class='media media-product'>";
				html += "<a href='product_detail?product_idx="+ cart[index].product_idx +"'><img src='resources/img/product/"+ cart[index].image_real_file1+"' alt='Image' style='width: 70px; height: 70px;'></a>";
				html += "<div class='media-body'>";
				html += "<h5 class='media-title' style='font-size: 0.9em;'>" + cart[index].product_name + "</h5>";
				html += "<span class='media-subtitle'>" + cart[index].product_color + "</span>";
				html += "</div></div></div>";
				html += "<div class='col-lg-3 text-center text-lg-right'>";
				html += "<span class='cart-item-price' style='font-size: 0.75em;'>"+ buyPrice +"원</span>";
				html += "</div><a class='cart-item-close' id='delCart_"+ cart[index].product_idx +"' onclick='delFromCart(this)'><i class='icon-x'></i></a></div></div></div></div>";
			});
			
			$('.myCartItems').html(html);
			$('.cnt').html(cnt);
		}
	});
}

</script>
</head>
<body>
	<!-- 수정 11-25 -->
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
	              
	                <li class="nav-item"><a class="nav-link" href="noticeList">Customer Center</a></li>
	                <li class="nav-item"><a class="nav-link" href="about_ownit">About</a></li>
	<!--                 <li class="nav-item"> -->
	<!--                   <a class="nav-link" href="#">Docs</a> -->
	<!--                 </li> -->
	              </ul>
	            </div>
	
	            <div class="collapse navbar-collapse order-4 order-lg-3" id="navbarMenu2">
	              <ul class="navbar-nav ml-auto">
	              
	              	<c:choose>
						<c:when test="${empty sessionScope.sId}">
							<li class="nav-item">
			                  <a class="nav-link" href="member_login">LOG IN</a>
			        </li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionScope.sId eq 'admin' }">
									<li class="nav-item">
					                  <a class="nav-link" href="admin">${sessionScope.sNick} 님</a>
					                </li>
								</c:when>
							<c:otherwise>
								<li class="nav-item">
				                  <a class="nav-link" href="mypage?member_idx=${sessionScope.sIdx }">${sessionScope.sNick} 님</a>
				                </li>
							</c:otherwise>
							</c:choose>
			                <li class="nav-item">
			                  <a class="nav-link" href="javascript:logout()">LOG OUT</a>
			                </li>
						</c:otherwise>
					</c:choose>
	                <li class="nav-item"><a class="nav-link" href="product_list">SHOP</a></li>
				    <li class="nav-item"><a class="nav-link" href="review">STYLE</a></li>
	                <c:choose>
	               		<c:when test="${sessionScope.sId eq 'admin' }"></c:when>
	               		<c:when test="${empty sessionScope.sId}"></c:when>
	                	<c:otherwise>
	                		  <li class="nav-item cart">
		                		 <a data-toggle="modal" data-target="#cart" class="nav-link" ><span class="cartInTop">CART</span><span class="cnt"></span></a>
		              		 </li>
	                	</c:otherwise>
	                	
	                </c:choose>
	              </ul>
	            </div>
	          </nav>
	        </div>
	      </div>
    </header>
    <!-- 수정 11-25 끝-->
    
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
                        <a href=""><img src="" alt="Image" style="width: 70px; height: 70px;"></a>
                        <div class="media-body"   >
                          <h5 class="media-title"></h5>
                          <span class="media-subtitle"></span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 text-center text-lg-right">
                      <span class="cart-item-price"></span>
                    </div>
                    <a class="cart-item-close"><i class="icon-x"></i></a>
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
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>