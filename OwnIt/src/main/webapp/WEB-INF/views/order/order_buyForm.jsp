<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 정보</title>
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
<script src="resources/js/jquery-3.6.1.js"></script>
<script  type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">
document.cookie = "safeCookie1=foo; SameSite=Lax"; 
document.cookie = "safeCookie2=foo";  
document.cookie = "crossCookie=bar; SameSite=None; Secure";

// $(document).ready(function(){
var IMP = window.IMP;
IMP.init("imp51126383");

function requestPay() {
	IMP.request_pay({ // param
	pg: "kakaopay",
	pay_method: "card",
	merchant_uid: 'merchant_' + new Date().getTime(),
	name: "노르웨이 회전 의자",
	amount: 64900,
	buyer_email: "gildong@gmail.com",
	buyer_name: "홍길동",
	buyer_tel: "010-4242-4242",
	buyer_addr: "서울특별시 강남구 신사동",
	buyer_postcode: "01181",
	m_redirect_url :'https://localhost:8080/order/order_sellComplete.jsp'
	}, function (rsp) { // callback
		console.log(rsp);
		if (rsp.success) {
		   alert("성공");
		} else {
		   alert(rsp.error_msg);
		}
// 	$("#btn-payment").submit();
    });
}
// });		
</script>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>

  <!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/cart_inTop.jsp"></jsp:include>
	
	 <section class="pt-5">
      <article class="container">
	
	 	<div class="row justify-content-center">
          <div class="col-md-10 col-lg-8">
          	<div style="margin-top: 150px; width: ">
	          	<h3 align="center" style="color: #6c757d;">주문확인서</h3>
	          	<table class="table">
	          		<tr>
	          		<c:forEach var="product" items="${productList }" begin="0" end="0">
	          			<th>
	          				<img src="resources/img/product/${product.image_real_file1 }" style="width: 90px; height: 90px; float: left; border-radius: 15px;">
		          			<span style="font: bold; color: black; font-size: 15px;">${product.product_brand }</span><br>
		          			 ${product.product_name }<br>
		          			 <span style="font: bold; color: black; font-size: 15px;">${product.product_model_num }</span>
	          			 </th>
	          			 <td><div style="margin:0 auto; padding-top: 35px;">외 ${cnt } 상품</div></td>
	          		</c:forEach>
	          		</tr>
	          		<tr>
	          			<td colspan="2"><a href="#" class="btn btn-lg btn-primary btn-block mt-1" id="btn-address">새 주소 추가</a></td>
	          		</tr>
	          		<tr>
	          			<th colspan="2">배송주소<span style="float: right;font-size: 15px; color: #6c757d;">부산시 부산진구 서전로 19, XXX</span><br>
		          			받는분<span style="float: right;font-size: 15px; color: #6c757d;">홍길동</span><br>
		          			연락처<span style="float: right;font-size: 15px; color: #6c757d;">010-1234-5678</span><br>
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
<!-- 	          		<tr> -->
<!-- 	          			<th><span>계좌 간편결제</span><br> -->
<!-- 	          			<span style="float: right; font-size: 12px;"><a href="#" style="background-color: black; color: white;'">계좌 추가</a></span> -->
<!-- 	          			등록된 판매 정산 계좌가 없습니다. <br> -->
<!-- 	          			새 계좌번호를 추가해주세요! -->
<!-- 	          			</th> -->
<!-- 	          		</tr> -->
<!-- 	          		<tr> -->
<!-- 	          			<th><span>카드 간편결제</span><br> -->
<!-- 	          			<span style="float: right; font-size: 12px;"><a href="#" style="background-color: black; color: white;'">카드 추가</a></span> -->
<!-- 	          			카드를 등록해주세요! -->
<!-- 	          			</th> -->
<!-- 	          		</tr> -->
	          		<tr>
	          			<th colspan="2">
	          				<span style="font-size: 15px; color: black;">총 결제금액</span><br>
	          				<span style="float: right; font-size: 18px;color: red;"><fmt:formatNumber value="${countTimesPrice }" pattern="#,###"/> 원</span>
	          			</th>
	          		</tr>
	          		<tr>
		 				<td colspan="2"><span style="font: bold; color: black; font-size: 13px;">판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우, 거래가 취소될 수 있습니다.</span><input type="checkbox"></td>
		  				
		 			</tr>
		  			<tr>
		 				<td colspan="2"><span style="font: bold; color: black; font-size: 13px;">‘바로 결제하기’ 를 선택하시면 즉시 결제가 진행되며, 단순 변심이나 실수에 의한 취소가 불가능합니다.</span><input type="checkbox"></td>
		  				
		 			</tr>		
		 			<tr>
		 				<td colspan="2"><span style="font: bold; color: black; font-size: 13px;">구매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</span><input type="checkbox"></td>
		 			</tr> 			
	          	</table>
	          	<br>
	          	<div align="center">
		          	<a href="" class="btn btn-primary" id="btn-payment" onclick="requestPay()">결제하기</a>
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