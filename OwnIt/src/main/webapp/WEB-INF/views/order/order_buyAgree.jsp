<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 동의</title>
<style type="text/css">
	input[type=checkbox]{
	float: right; 
	width: 15px; 
	height: 15px;
	}
	span{
		font: bold; 
		color: black;
	}
	
</style>
<script type="text/javascript">

//윈도우오픈
function func1(){
		var popupWidth = 600;
		var popupHeight = 600;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		window.open('notice_authPolicy', '검수과정', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}

var checked = false;

function checkForm(){
	return $("#check1").is(":checked");
}
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
          	<div style="margin-top: 150px;">
          	<form action="member_buy_form" name="sellForm" onsubmit="return checkForm()">
	          	<table class="table">
	          		<tr>
	          			<th style="font-size: 30px; font: bold; color: black;">
		          			<span style="color: red;">구매</span>
		          			하시기 전에 꼭 확인하세요.
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<img src="resources/img/product/productDetail1.png" style="width: 90px; height: 90px; float: left; border-radius: 15px;">
	          				<span >MQ103KH/A Apple iPhone 14 Pro 256GB Silver (Korean Ver.)</span><br> 
	          				애플 아이폰 14 프로 256기가 실버 (국내 정식 발매 제품)<br>
	          				<span>ONE SIZE</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check1">
		          			<span>구매하려는 상품이 맞습니다.</span><br>
		          			상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check2">
		          				<span>국내에서 발매한 정품 · 새상품입니다.</span><br>
		          				모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다.<br>
		          				국내 발매 상품 여부는 확인드리지 않습니다.
	          				</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.</span><br>
	          				<input type="checkbox" id="check3">박스/패키지와 상품 컨디션에 민감하시다면 검수 기준을 반드시 확인하시기 바랍니다.<br>
	          				<a href="javascript:func1()"><span style="color: skyblue;">검수기준 보기</span></a>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
		          			<span>OwnIt의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.</span><br>
		          			건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.<br>
		          			<a href="#"><span style="color: skyblue;">이용정책 보기</span></a>
		          			<input type="submit" value="구매 계속" class="btn btn-lg btn-primary btn-block mt-1" style="background: black; color: white;">
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