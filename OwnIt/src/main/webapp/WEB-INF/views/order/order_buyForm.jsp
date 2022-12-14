<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<style type="text/css">
	input[type=checkbox]{
	float: right;
	width: 15px; 
	height: 15px;
	accent-color: #101010;
	border-color: #101010;
	}
	span > a[href]{
		border: 1px solid #6c757d;
		color: #6c757d;
		padding: 5px 10px;
		border-radius: 8px;
	}
	#btn-address {
		background-color: #101010;
		border-color: #101010;
		width: 120px;
		height: 45px;
		padding: 10px 10px;
		border-radius: 0.375rem;
		float: right;
	}
	#btn-address:hover {
		background-color: #353535;
		border-color: #353535;
	}
	#btn-payment {
		background-color: #101010;
		border-color: #101010;
		width: 120px;
		height: 45px;
		padding: 10px 10px;
	}
</style>
<!-- 결제 API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
var IMP = window.IMP;
IMP.init("imp51126383");

function requestPay() {
	if(${empty member.addr}){
		alert("주소를 추가해주세요");
		return;
	} else {
		var obj = { // param
			pg: 'kcp',
			pay_method: 'card',
			merchant_uid: "OwnIt_${maxGroupIdx}",
			name: "${productList[0].product_name}",
			amount: ${countTimesPrice },
			buyer_email: "${member.member_id}",
			buyer_name: "${member.member_name}",
			buyer_tel: "${member.member_phone}",
			buyer_addr: "${member.addr}",
		};
		IMP.request_pay(obj, function (rsp) { // callback
			console.log(rsp);
			if (rsp.success) {
				$.ajax({
					url:'successOrder',
					type:'POST',
					data:{
						cbChecked:"${cbChecked}",
						maxGroupIdx:"${maxGroupIdx}"
					},
					success:function(){
						console.log("ajax통신 성공");
						location.href="orderComplete";
					}
				});
			} else {
			   console.log(rsp.error_msg);
			}
	// 	$("#btn-payment").submit();
	    });
	}
}

$(function() {
	$("#disabled").attr("disabled",true); 
});

function checkForm(){
	var checked = false;
	if($("#check1").is(":checked") && 
		$("#check2").is(":checked") && 
		$("#check3").is(":checked")) {
			$("#disabled").removeAttr("disabled"); 
			checked = true;
			return checked;
		}
	return checked;
}
</script>
<body>

  <!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/cart_inTop.jsp"></jsp:include>
	
	 <section class="pt-5">
      <article class="container">
	
	 	<div class="row justify-content-center">
          <div class="col-md-10 col-lg-8">
          	<div style="margin-top: 150px;">
	          	<h3 align="center" style="color: black; font-family: 맑은고딕;"><mark>주문확인서</mark></h3><br>
	          	<table class="table">
          			<c:forEach var="product" items="${productList }" varStatus="status">
		          		<tr> <!-- 이부분 폼 고치기 -->
		          			<th>
		          				<img src="resources/img/product/${product.image_real_file1 }" style="width: 90px; height: 90px; float: left; border-radius: 15px;">
		          				<span id="span1" style="font: bold; color: black; font-size: 15px;">${product.product_brand }</span><br> 
		          				${product.product_name }<br>
		          				<span id="span1">${product.product_model_num }</span>
		          			</th>
							<td style="padding-top: 50px;">${cartCount[status.index]}개 상품</td>
		          		</tr>
       				</c:forEach>
	          		<tr>
	          			<th colspan="2">
	          			<span id="sell_span" style="float: right; font-size: 11px;">
		          			<a href="address?member_idx=${sessionScope.sIdx }" target="_blank" style="color: black; border: 0px;"><b>
								+ 새 주소 추가
							</b></a>
		          		</span><br>
			          	</th>
	          		</tr>
	          		<tr>
	          			<th colspan="2">배송주소<span style="float: right;font-size: 15px; color: #6c757d;">${member.addr}</span><br>
		          			받는분<span style="float: right;font-size: 15px; color: #6c757d;">${member.member_name }</span><br>
		          			연락처<span style="float: right;font-size: 15px; color: #6c757d;">${member.member_phone }</span><br>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th colspan="2"><span>배송 방법</span><br>
	          			<span style="font-size: 15px; float: right;"><a style="border: none;">일반배송 무료</a></span><br>
	          		</tr>
	          		<tr>
	          			<th colspan="2">상품 금액<span style="float: right;font-size: 15px; color: #6c757d;"><fmt:formatNumber value="${countTimesPrice }" pattern="#,###"/> 원</span><br>
		          			검수비<span style="float: right;font-size: 15px; color: #6c757d;">무료</span><br>
		          			수수료<span style="float: right;font-size: 15px; color: #6c757d;">무료</span><br>
		          			배송비<span style="float: right;font-size: 15px; color: #6c757d;">무료</span><br>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th colspan="2">
	          				<span style="font-size: 15px; color: black;">총 결제금액</span>
	          				<span style="float: right; font-size: 18px;color: red;"><fmt:formatNumber value="${countTimesPrice }" pattern="#,###"/> 원</span>
	          			</th>
	          		</tr>
	          		<tr>
		 				<td colspan="2"><span style="font: bold; color: black; font-size: 13px;">판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우, 거래가 취소될 수 있습니다.</span><input type="checkbox" id="check1" onchange="checkForm()"></td>
		  				
		 			</tr>
		  			<tr>
		 				<td colspan="2"><span style="font: bold; color: black; font-size: 13px;">‘바로 결제하기’ 를 선택하시면 즉시 결제가 진행되며, 단순 변심이나 실수에 의한 취소가 불가능합니다.</span><input type="checkbox" id="check2" onchange="checkForm()"></td>
		  				
		 			</tr>		
		 			<tr>
		 				<td colspan="2"><span style="font: bold; color: black; font-size: 13px;">구매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</span><input type="checkbox" id="check3" onchange="checkForm()"></td>
		 			</tr> 			
	          	</table>
	          	<br>
	          	<div align="center">
		          	<input type="button" class="btn btn-primary" id="disabled" onclick="requestPay()" value="결제하기" style="background: #101010; color: white; border-color: #101010">
	          	</div>
	         </div>
          </div>
        </div>
	 </article>
    </section>
	
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html>
