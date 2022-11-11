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
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
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
				$("#check4").is(":checked") &&
				$("#check5").is(":checked")){
				$("#disabled").removeAttr("disabled"); 
				checked = true;
				return checked;
			}
			return checked;
			
		}
</script>
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
          	<form action="member_sell_form" name="sellForm" method="get">
	          	<table class="table">
	          		<tr>
	          			<th style="font-size: 30px; font: bold; color: black;">
		          			<span style="color: skyblue;">판매</span>
		          			하시기 전에 꼭 확인하세요.
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<img src="resources/img/product/productDetail1.png" style="width: 90px; height: 90px; float: left; border-radius: 15px;">
	          				<span>MQ103KH/A Apple iPhone 14 Pro 256GB Silver (Korean Ver.)</span><br>
	          				 애플 아이폰 14 프로 256기가 실버 (국내 정식 발매 제품)<br>
	          				 <span>ONE SIZE</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
		          			<input type="checkbox" id="check1" onchange="checkForm()">
		          			<span>판매하려는 상품이 맞습니다.</span><br>
		          			상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>국내에서 발매한 정품 · 새상품입니다.</span><br>
	          				<input type="checkbox" id="check2" onchange="checkForm()">
	          				모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다.<br>
	          				 중고품 판매는 불가능합니다.
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>박스/패키지의 상태를 확인합니다.</span><br>
	          				<input type="checkbox" id="check3" onchange="checkForm()">박스/패키지 상태에 따른 검수 기준을 확인했습니다.<br>
	          				<a href="javascript:func1()"><span style="color: skyblue;">검수기준 보기</span></a>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>이중 포장하여 선불 발송합니다.</span><br>
	          				<input type="checkbox" id="check4" onchange="checkForm()">
	          				반드시 이중 포장하여 택배 상자에 담아 선불 발송합니다. 합배송은 권장하지 않으며 이로 인한 박스/패키지 훼손은 판매자의 책임입니다.
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>OwnIt의 최신 이용정책을 모두 확인하였으며, 판매를 계속합니다.</span><br>
	          				<input type="checkbox" id="check5" onchange="checkForm()">
	          				건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.<br>
	          				<input type="submit" value="판매 계속" id="disabled" class="btn btn-lg btn-primary btn-block mt-1" style="background: black; color: white;">
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