<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/정산</title>
<style type="text/css">
	input[type=checkbox]{
	float: right; 
	width: 20px; 
	height: 20px;
	}
	#sell_span{
		font-size: 18px; 
		color: black; 
		font-weight: 900;
	}
	#sell_span2{
		font-size: 18px; 
		color: black; 
		font-weight: 900;
	}
	span > a[href]{
		border: 1px solid #6c757d;
		color: #6c757d;
		padding: 5px 10px;
		border-radius: 8px;
	}
	#sellFormImage{
		width: 90px; 
		height: 90px; 
		float: left; 
		border-radius: 15px;
	}
</style>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<script type="text/javascript">
	//새 주소 추가
	function func1(){
		var popupWidth = 600;
		var popupHeight = 600;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		window.open('address', '새 주소', 
					'status=no, height=' + popupHeight  + ', width=' + popupWidth  +
					', left='+ popupX + ', top='+ popupY);
	}

	//주소 변경
	function func2(){
		var popupWidth = 600;
		var popupHeight = 600;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		window.open('address', '주소 변경', 
					'status=no, height=' + popupHeight  + ', width=' + popupWidth  + 
					', left='+ popupX + ', top='+ popupY);
	}

	//체크박스
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
<body onload="checkForm()">

  <!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	
	 <section class="pt-5">
      <article class="container">
	
	 	<div class="row justify-content-center">
          <div class="col-md-10 col-lg-8">
          	<div style="margin-top: 150px;">
          	
          	
          	
          	
          	<form action="order_sellDetail" method="get" >
          	
          		<input type="hidden" name="product_idx" value="${product.product_idx }">
          		
	          	<table class="table">
	          		<tr>
	          			<th style="font-size: 30px; font: bold; color: black;">
		          			<span style="color: skyblue;">판매</span>
		          			확인서
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<img src="resources/img/product/${image.image_original_file1 }" id="sellFormImage">
		          			<span id="sell_span" style="font: bold; color: black; font-size: 15px;">${product.product_brand }</span><br>
		          			 ${product.product_name }<br>
		          			 <span id="sell_span" style="font: bold; color: black; font-size: 15px;">${product.product_model_num }</span>
	          			 </th>
	          		</tr>
	          		<tr>
	          			<th><span id="sell_span">판매 정산계좌</span><br>
	          			<span id="sell_span2" style="float: right; font-size: 12px;"><a href="account" style="background-color: black; color: white;'">계좌 추가</a></span>
	          			은행 : ${member.account_bank}<br>
	          			계좌 : ${member.account_num }<br>
	          			예금주 : ${member.member_name }
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
		          			<span id="sell_span">
		          				반송 주소
		          			</span>
		          			<span id="sell_span" style="float: right; font-size: 11px;">
			          			<a href="javascript:func1()" style="border: none;">
			          				+ 새 주소 추가
			          			</a>
			          		</span><br>
			          		<span id="sell_span2" style="float: right; font-size: 13px;">
			          			<a href="javascript:func2()">
			          				변경
			          			</a>
			          		</span>
		          			받는분 : ${member.member_name }	<br>
		          			연락처 : ${member.member_phone }<br>
		          			배송주소 : ${member.address1 } ${member.address2 }<br>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span id="sell_span" style="font-size: 15px; ">
	          					즉시 판매가
	          				</span><br>
		          			정산금액
		          			<span style="float: right; font-size: 15px; color: #00A5FF;">
		          				<fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/> 원
		          			</span><br>
		          			검수비
		          			<span style="float: right;font-size: 15px; color: #6c757d;">
		          				무료
		          			</span><br>
		          			수수료
		          			<span style="float: right;font-size: 15px; color: #6c757d;">
		          				무료
		          			</span><br>
		          			배송비
		          			<span style="float: right;font-size: 15px; color: #6c757d;">
		          				선불/판매자 부담
		          			</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span id="sell_span">
	          					최종 판매 정보
	          				</span><br>
		          			거래금액<br>
		          			<span id="sell_span" style="float: right;color: #00A5FF;">
		          				+<fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/> 원
		          			</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check1" onchange="checkForm()">
	          				<span id="sell_span" style="font-size: 13px;">
		          				거래가 체결되면 일요일 · 공휴일을 제외하고 48시간 내에 KREAM으로 발송을 완료한 후<br>
		          				발송 정보를 정확히 입력해야 합니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check2" onchange="checkForm()">
	          				<span id="sell_span" style="font-size: 13px;">
	          					송장 번호 미기재·오입력 시 입고가 진행되지 않으며, 발송 후 5일(일요일·공휴일 제외) 내 미도착은 허위 정보 입력으로 간주하여 미입고 페널티를 부과합니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check3" onchange="checkForm()">
	          				<span id="sell_span" style="font-size: 13px;">
	          					검수 기준과 페널티 및 이용 정책을 다시 한번 확인하였습니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check4" onchange="checkForm()">
	          				<span id="sell_span" style="font-size: 13px;">
	          					‘바로 판매하기’ 를 선택하시면 즉시 거래가 체결되며, 단순 변심이나 실수에 의한 취소가 불가능합니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check5" onchange="checkForm()">
	          				<span id="sell_span" style="font-size: 13px;">
	          					판매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span style="color: black; font-size: 15px;">
	          					정산금액
	          				</span>
	          				<span style="float: right;color: #00A5FF;">
	          					<fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/> 원
	          				</span>
	          				<input type="submit" value="판매하기" id="disabled" class="btn btn-lg btn-primary btn-block mt-1" style="background: black; color: white;">
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