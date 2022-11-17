<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
 <script src="resources/js/jquery-3.6.1.js"></script> 
 <script type="text/javascript">
 
 	function numberWithCommas(n) {
	    return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
 	$(function() {
 		$('#cbAll').click(function() {
 			if($("#cbAll").is(":checked")) {
 				$("input[type=checkbox]").prop("checked", true);
 			} else {
 				$("input[type=checkbox]").prop("checked", false);
 			}
 		});
 	});
 	
 	function delFromCartInOrder(item) {
 		var delIdx = item.id.split('_')[1];
 		$.ajax({
 			url:'delAndReloadCart',
 			type:'POST',
 			data: {
 				product_idx:delIdx
 			},
 			dataType:'json',
 			success:function(result) {
 				var html = "";
//  				location.reload();
 				$.each(cart, function(index) {
// 						alert(JSON.stringify(result[index]));
 					var buyPrice = numberWithCommas(result[index].product_buy_price);
 					html += "<div class='cart-item'>";
 					html += "<div class='row align-items-center'>";
 					html += "<div class='col-12 col-lg-6'>";
 					html += "<div class='media media-product'>";
 					html += "<input type='checkbox' id='cb"+ result[index].product_idx +"' style='margin-right: 20px;'>"
 					html += "<a><img src='resources/img/product/"+ result[index].image_real_file1 +"' alt='Image'></a>";
 					html += "<div class='media-body'>";
 					html += "<h5 class='media-title'>" + result[index].product_name + "</h5>";
 					html += "<span class='small'>" + result[index].product_color  + "</span>";
 					html += "<span class='media-subtitle'>" + result[index].product_color + "</span>";
 					html += "</div></div></div>";
 					html += "<div class='col-4 col-lg-2 text-center'>";
 					html += "<span class='cart-item-price'>"+ buyPrice +"원</span>";
 					html += "</div><div class='col-4 col-lg-2 text-center'><div class='counter'>";
 					html += "<span class='counter-minus icon-minus' field='qty-"+ result[index].product_idx  +"'></span>";
 					html += "<input type='text' name='qty-"+ result[index].product_idx +"' class='counter-value' value='"+ result[index].cart_count +"' min='1' max='5'>";
 					html += "<span class='counter-plus icon-plus' field='qty-"+ result[index].product_idx +"'></span>";
 					html += "</div></div>";
 					html += "<div class='col-4 col-lg-2 text-center'>";
 					html += "<span class='cart-item-price'>"+ result[index].countTimesPrice +"원</span>";
 					html += "</div><a class='cart-item-close' id='delCart_"+ result[index].product_idx +"' onclick='delFromCart(this)''><i class='icon-x'></i></a></div></div>";
 				});
 				
 				$('#myCartItemsInOrder').html(html);
 			}
 		});
 	}
 </script>
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
              <div class="col-lg-6"><input type="checkbox" id="cbAll" style="margin-right: 20px;"><span class="eyebrow">상품</span></div>
              <div class="col-lg-2 text-center"><span class="eyebrow">가격</span></div>
              <div class="col-lg-2 text-center"><span class="eyebrow">수량</span></div>
              <div class="col-lg-2 text-center"><span class="eyebrow">총 금액</span></div>
            </div>
          </div>
        </div>
        <div class="row gutter-2 gutter-lg-4 justify-content-end">

          <div class="col-lg-8 cart-item-list" id="myCartItemsInOrder">

            <!-- cart item -->
            <c:forEach var="cart" items="${cart }">
            <!-- 여기부터 -->
            <div class="cart-item">
              <div class="row align-items-center">
                <div class="col-12 col-lg-6">
                  <div class="media media-product">
                  <input type="checkbox" id="cb${cart.product_idx }" style="margin-right: 20px;">
                    <a href="#!"><img src="resources/img/product/${cart.image_real_file1 }" alt="Image"></a>
                    <div class="media-body">
                      <h5 class="media-title">${cart.product_name }</h5>
                      <span class="small">${cart.product_color }</span>
                    </div>
                  </div>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <span class="cart-item-price"><fmt:formatNumber value="${cart.product_buy_price }" pattern="#,###"/>원</span>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <div class="counter">
                    <span class="counter-minus icon-minus" field='qty-${cart.product_idx }'></span>
                    <input type='text' name='qty-${cart.product_idx }' class="counter-value" value="${cart.cart_count }" min="1" max="5">
                    <span class="counter-plus icon-plus" field='qty-${cart.product_idx }'></span>	
                  </div>
                </div>
                <div class="col-4 col-lg-2 text-center">
                  <span class="cart-item-price"><fmt:formatNumber value="${cart.countTimesPrice }" pattern="#,###"/>원</span>
                </div>
                <a class="cart-item-close" id="delCart_${cart.product_idx }" onclick="delFromCartInOrder(this)"><i class="icon-x"></i></a>
              </div>
            </div>
            <!-- 여기까지 -->
		   </c:forEach>
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
                    <span></span>
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