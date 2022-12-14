<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 동의</title>
<style type="text/css">
	#disabled{
		background: black; 
		color: white;
		border: black;
		border-radius: 15px;
	}
	
	input[type=checkbox]{
	float: right; 
	width: 20px; 
	height: 20px;
	accent-color: #101010;
	border-color: #101010;
	}
	
	span1{
		font: bold; 
		color: black;
	}
	
</style>
<script src="resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">

//윈도우오픈
function func1(){
		var popupWidth = 600;
		var popupHeight = 600;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		window.open('notice_authPolicy', '검수과정', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}

function checkForm(){
var checked = false;
	$("#disabled").attr("disabled",true); 
	
	if($("#check1").is(":checked") && 
		$("#check2").is(":checked") && 
		$("#check3").is(":checked") && 
		$("#check4").is(":checked")){
		$("#disabled").removeAttr("disabled"); 
		checked = true;
		return checked;
	}
	return checked;
	
}

//전체동의	
$(document).ready(function() {
	$("#checkAll").click(function() {
		if($("#checkAll").is(":checked")) $("input[name=check-box]").prop("checked", true);
		else $("input[name=check-box]").prop("checked", false);
	});

	$("input[name=check-box]").click(function() {
		var total = $("input[name=check-box]").length;
		var checked = $("input[name=check-box]:checked").length;

		if(total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true); 
	});
});

</script>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body onload="checkForm()">

  <!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/cart_inTop.jsp"></jsp:include>
	
	 <section class="pt-5">
      <article class="container">
	
	 	<div class="row justify-content-center">
          <div class="col-md-10 col-lg-8">
          	<div style="margin-top: 150px;">
          	
          	
          	<form action="order_buyForm" name="buyForm" method="get">
          		<input type="hidden" name="cbChecked" value="${cbChecked }">
	          	<table class="table">
	          		<tr>
	          			<th style="font-size: 30px; font: bold; color: black; font-family: monospace;" colspan="2">
		          			<mark style="color: red; padding: 0em;">구매</mark>하시기 전에 꼭 확인하세요.
	          			</th>
	          		</tr>
	          		
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
	          				<input type="checkbox" id="check1" name="check-box" onchange="checkForm()">
		          			<span id="span1">구매하려는 상품이 맞습니다.</span><br>
		          			상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.
	          			</th>
	          		</tr>
	          		
	          		<tr>
	          			<th colspan="2">
	          				<input type="checkbox" id="check2" name="check-box" onchange="checkForm()">
		          				<span id="span1">국내에서 발매한 정품 · 새상품입니다.</span><br>
		          				모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다.<br>
		          				국내 발매 상품 여부는 확인드리지 않습니다.
	          				</th>
	          		</tr>
	          		
	          		<tr>
	          			<th colspan="2">
	          				<span id="span1">제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.</span><br>
	          				<input type="checkbox" id="check3" name="check-box" onchange="checkForm()">박스/패키지와 상품 컨디션에 민감하시다면 검수 기준을 반드시 확인하시기 바랍니다.<br>
	          				<a href="javascript:func1()"><span style="color: skyblue;">검수기준 보기</span></a>
	          			</th>
	          		</tr>
	          		
	          		<tr>
	          			<th colspan="2">
		          			<span>OwnIt의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.</span><br>
		          			<input type="checkbox" id="check4"  name="check-box" onchange="checkForm()">건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을<br> 확인했습니다.
		          		</th>
	          		</tr>
	          		<tr>
	          			<th colspan="2">
	          				<div style="margin-top: 30px;">
		          			<input type="checkbox" id="checkAll" onchange="checkForm()" >
		          			<span id="sell_span" style="font-size: 13px; color: gray;">
		          				전체동의
		          			</span>
		          			</div>
		          			<div style="margin-top: 20px;">
		          			<input type="submit" value="구매 계속" id="disabled" class="btn btn-lg btn-primary btn-block mt-1" style="background: black; color: white;">
		          			</div>
		          		</th>
	          		</tr>
	          	</table>
		      </form>
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