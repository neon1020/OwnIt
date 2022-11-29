<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#btn, #btnAll {
		background-color: #101010;
		border-color: #101010;
		color: white;
	}
	#btn:hover, #btnAll:hover {
		background-color: #353535;
		border-color: #353535;
	}
	#deleteAllCart {
		background-color: #101010;
		border-color: #101010;
		color: white;
	}
	#deleteAllCart:hover {
		background-color: #353535;
		border-color: #353535;
	}
	input[type=checkbox] {
	accent-color: #101010;
	border-color: #101010;
	}
</style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>Cart</title>
 <script src="resources/js/jquery-3.6.1.js"></script> 
 <script type="text/javascript">
// 템플릿과 중복으로 인한 오류해결을 위해 페이지 로드 시 실행되는 코드 
$(document).ready(function(){
	$.ajax({
		url:'loadCart',
		type:'POST',
		dataType:'json',
		success:function(result){
			var html = "";
				$.each(result, function(index) {
					var buyPrice = numberWithCommas(Number(result[index].product_buy_price));
					var countTimesPrice = numberWithCommas(Number(result[index].countTimesPrice));
					html += "<div class='cart-item'>";
					html += "<div class='row align-items-center'>";
					html += "<div class='col-12 col-lg-6'>";
					html += "<div class='media media-product'>";
					html += "<input type='checkbox' id='cb"+ result[index].product_idx +"' style='margin-right: 20px;'>"
					html += "<a><img src='resources/img/product/"+ result[index].image_real_file1 +"' alt='Image'></a>";
					html += "<div class='media-body'>";
					html += "<h5 class='media-title'>" + result[index].product_name + "</h5>";
					html += "<span class='small'>" + result[index].product_color  + "</span>";
					html += "</div></div></div>";
					html += "<div class='col-4 col-lg-2 text-center'>";
					html += "<span class='cart-item-price'>"+ buyPrice +"원</span>";
					html += "</div><div class='col-4 col-lg-2 text-center'><div class='counter'>";
					html += "<span class='counter-minus icon-minus' id='counter_"+ result[index].product_idx +"' onclick='modifyCartCount(this)' field='qty-"+ result[index].product_idx  +"'></span>";
					html += "<input type='text' name='qty-"+ result[index].product_idx +"' id='cartCount_"+ result[index].product_idx +"' readonly='readonly' class='counter-value' value='"+ result[index].cart_count +"'>";
					html += "<span class='counter-plus icon-plus' id='counter_"+ result[index].product_idx +"' onclick='modifyCartCount(this)' field='qty-"+ result[index].product_idx +"'></span>";
					html += "</div></div>";
					html += "<div class='col-4 col-lg-2 text-center'>";
					html += "<span class='cart-item-price' id='countTimesPrice_"+ result[index].product_idx +"'>"+ countTimesPrice +"원</span>";
					html += "</div><a class='cart-item-close' id='delCart_"+ result[index].product_idx +"' onclick='delFromCartInOrder(this)''><i class='icon-x'></i></a></div></div>";
				});
			$('#myCartItemsInOrder').html(html);
		}
	});
});
 
 
 
// 상품 수량 변경 시 수행되는 함수

function modifyCartCount(counter) {
	payTotal = 0;
	cbArr = [];
	$('.totalPrice').text(numberWithCommas(payTotal)+"원");
	document.getElementById("cbAll").checked = false;
	var idx = counter.id.split('_')[1];
	var plus = counter.className.indexOf('plus') > -1
	var cntVal = 0;
	if(plus) {
		cntVal = Number($('#cartCount_'+idx).val())+1;
	} else {
		cntVal = Number($('#cartCount_'+idx).val())-1;
		if(cntVal <= 0) {
			alert("구매수량 오류");
			cntVal = Number($('#cartCount_'+idx).val());
		}
	}
	
	$.ajax({
		url:'updateCartCount',
		type:'POST',
		data:{
			product_idx:idx,
			cart_count:cntVal
		},
		dataType:'json',
		success:function(result){
			debugger;
			var html = "";
			if(JSON.stringify(result).length > 100) {
				$.each(result, function(index) {
					var buyPrice = numberWithCommas(Number(result[index].product_buy_price));
					var countTimesPrice = numberWithCommas(Number(result[index].countTimesPrice));
					html += "<div class='cart-item'>";
					html += "<div class='row align-items-center'>";
					html += "<div class='col-12 col-lg-6'>";
					html += "<div class='media media-product'>";
					html += "<input type='checkbox' id='cb"+ result[index].product_idx +"' style='margin-right: 20px;'>"
					html += "<a><img src='resources/img/product/"+ result[index].image_real_file1 +"' alt='Image'></a>";
					html += "<div class='media-body'>";
					html += "<h5 class='media-title'>" + result[index].product_name + "</h5>";
					html += "<span class='small'>" + result[index].product_color  + "</span>";
					html += "</div></div></div>";
					html += "<div class='col-4 col-lg-2 text-center'>";
					html += "<span class='cart-item-price'>"+ buyPrice +"원</span>";
					html += "</div><div class='col-4 col-lg-2 text-center'><div class='counter'>";
					html += "<span class='counter-minus icon-minus' id='counter_"+ result[index].product_idx +"' onclick='modifyCartCount(this)' field='qty-"+ result[index].product_idx  +"'></span>";
					html += "<input type='text' name='qty-"+ result[index].product_idx +"' id='cartCount_"+ result[index].product_idx +"' readonly='readonly' class='counter-value' value='"+ result[index].cart_count +"'>";
					html += "<span class='counter-plus icon-plus' id='counter_"+ result[index].product_idx +"' onclick='modifyCartCount(this)' field='qty-"+ result[index].product_idx +"'></span>";
					html += "</div></div>";
					html += "<div class='col-4 col-lg-2 text-center'>";
					html += "<span class='cart-item-price' id='countTimesPrice_"+ result[index].product_idx +"'>"+ countTimesPrice +"원</span>";
					html += "</div><a class='cart-item-close' id='delCart_"+ result[index].product_idx +"' onclick='delFromCartInOrder(this)''><i class='icon-x'></i></a></div></div>";
				});
				$('#myCartItemsInOrder').html(html);
			} else {
				$('#cartCount_'+idx).val(cntVal-1);
				alert(result.err);
				$('input[type=checkbox]').prop("checked", false);
			}
		}
	});
}

// 장바구니 개별항목 삭제 시 수행되는 함수
function delFromCartInOrder(item) {
	payTotal = 0;
	cbArr = [];
	$('.totalPrice').text(numberWithCommas(payTotal)+"원");
	document.getElementById("cbAll").checked = false;
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
			if(result != 0) {
				$.each(result, function(index) {
					var buyPrice = numberWithCommas(Number(result[index].product_buy_price));
					var countTimesPrice = numberWithCommas(Number(result[index].countTimesPrice));
					html += "<div class='cart-item'>";
					html += "<div class='row align-items-center'>";
					html += "<div class='col-12 col-lg-6'>";
					html += "<div class='media media-product'>";
					html += "<input type='checkbox' id='cb"+ result[index].product_idx +"' style='margin-right: 20px;'>"
					html += "<a><img src='resources/img/product/"+ result[index].image_real_file1 +"' alt='Image'></a>";
					html += "<div class='media-body'>";
					html += "<h5 class='media-title'>" + result[index].product_name + "</h5>";
					html += "<span class='small'>" + result[index].product_color  + "</span>";
					html += "</div></div></div>";
					html += "<div class='col-4 col-lg-2 text-center'>";
					html += "<span class='cart-item-price'>"+ buyPrice +"원</span>";
					html += "</div><div class='col-4 col-lg-2 text-center'><div class='counter'>";
					html += "<span class='counter-minus icon-minus' id='counter_"+ result[index].product_idx +"' onclick='modifyCartCount(this)' field='qty-"+ result[index].product_idx  +"'></span>";
					html += "<input type='text' name='qty-"+ result[index].product_idx +"' id='cartCount_"+ result[index].product_idx +"' readonly='readonly' class='counter-value' value='"+ result[index].cart_count +"'>";
					html += "<span class='counter-plus icon-plus' id='counter_"+ result[index].product_idx +"' onclick='modifyCartCount(this)' field='qty-"+ result[index].product_idx +"'></span>";
					html += "</div></div>";
					html += "<div class='col-4 col-lg-2 text-center'>";
					html += "<span class='cart-item-price' id='countTimesPrice_"+ result[index].product_idx +"'>"+ countTimesPrice +"원</span>";
					html += "</div><a class='cart-item-close' id='delCart_"+ result[index].product_idx +"' onclick='delFromCartInOrder(this)''><i class='icon-x'></i></a></div></div>";
				});
				$('#myCartItemsInOrder').html(html);
			} else {
				$('#myCartItemsInOrder').html("<img src='resources/img/product/empty_cart.png' style='max-width: 70%;'>");
			}
		} // success
	}); // ajax
}

// 장바구니 전체삭제 시 수행되는 함수
$(document).on("click", "#deleteAllCart", function() {
	var isCertain = confirm("장바구니내의 모든 상품을 삭제하시겠습니까?");
	if(isCertain) {	
		$.ajax({
			url:'deleteAllCart',
			type:'POST',
			success:function() {
				$('#myCartItemsInOrder').html("<img src='resources/img/product/empty_cart.png' style='max-width: 70%;'>");
			}
		});
	}
});

//체크박스 전체선택
$(function() {
	$('#cbAll').click(function() {
		if($("#cbAll").is(":checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
});

// 체크박스 선택 시 해당 상품 가격의 총 합이 결제 정보에 출력되는 기능
var cbArr = [];
var payTotal = 0;
$(document).on("change", 'input[type=checkbox]', function() {
	var idx = $(this).attr('id').split('cb')[1];
	// 전체선택
	if(idx == 'All') {
		if($(this).is(":checked")){
			payTotal = 0;
			$('input[type=checkbox]:checked').each(function() {
			    let cbId = $(this).attr('id').split('cb')[1];
			    cbArr.push(cbId);
			});
			cbArr.shift();
			for(var i = 0; i < cbArr.length; i++) {
			   payTotal += Number(document.getElementById('countTimesPrice_'+cbArr[i]).innerText.split('원')[0].replaceAll(',',''));
			}
			$('.totalPrice').text(numberWithCommas(payTotal)+"원");
		} else {
			$('input[type=checkbox]').each(function() {
			    let cbId = $(this).attr('id').split('cb')[1];
			    cbArr.pop();
			});
			cbArr.shift();
			payTotal = 0;
			$('.totalPrice').text(payTotal + "원");
		}
		$('.totalPrice').text(numberWithCommas(payTotal)+"원");
	} else { // 개별 선택
		if($(this).is(":checked")){
			payTotal += Number(document.getElementById('countTimesPrice_'+idx).innerText.split('원')[0].replaceAll(',',''));
		} else {
			payTotal -= Number(document.getElementById('countTimesPrice_'+idx).innerText.split('원')[0].replaceAll(',',''));
		}
// 		document.getElementsByClassName("totalPrice").innerHtml = numberWithCommas(payTotal)+"원";
		$('.totalPrice').text(numberWithCommas(payTotal)+"원");
	}
});

// 전체, 선택 상품 주문 기능
function buySelectedItems(btn) {
	if(btn.id == "btnAll") {
		var isReal = confirm("장바구니의 모든 상품을 구매하시겠습니까?");
		if(isReal) {
			$("input[type=checkbox]").prop("checked", true);
			document.getElementById("cbAll").checked = false;
		} else return;
	} 
	var cbChecked = "";
	$('input[type=checkbox]:checked').each(function() {
		let id = $(this).attr('id').split('cb')[1];
		// cbChecked => product_idx:수량:금액/
		debugger;
		if(id == 'All') return true;
		cbChecked += id+":"+ $('#cartCount_'+id).val() + ":"+ document.getElementById('countTimesPrice_'+id).innerText.split('원')[0].replaceAll(',','') + "/";
	});
	if(cbChecked.length != 0) {
		location.href="order_buyAgree?cbChecked="+cbChecked;
		$("input[type=checkbox]").prop("checked", false);
		payTotal = 0;
		$('.totalPrice').text(numberWithCommas(payTotal)+"원");
	} else {
		alert("최소 1개 이상의 상품만 주문가능합니다");
	}
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
                    <span class="totalPrice">0원</span>
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
                    <span class="totalPrice">0원</span>
                  </li>
                </ul>
              </div>
            </div>
            <a class="btn btn-lg btn-primary btn-block mt-1" id="deleteAllCart">장바구니 비우기</a>
            <a class="btn btn-lg btn-primary btn-block mt-1" id="btn" onclick="buySelectedItems(this)">선택상품 주문</a>
            <a class="btn btn-lg btn-primary btn-block mt-1" id="btnAll" onclick="buySelectedItems(this)">전체상품 주문</a>
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