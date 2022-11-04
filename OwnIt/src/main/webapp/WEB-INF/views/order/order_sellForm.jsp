<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/정산</title>
<style type="text/css">
	input[type=checkbox]{
	float: right; 
	width: 15px; 
	height: 15px;
	}
	#sell_span{
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
</style>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>

  <!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	
	 <section class="pt-5">
      <article class="container">
	
	 	<div class="row justify-content-center">
          <div class="col-md-10 col-lg-8">
          	<div style="margin-top: 150px;">
	          	<table class="table">
	          		
	          		<tr>
	          			<th><img src="resources/img/product/productDetail1.png" style="width: 90px; height: 90px; float: left; border-radius: 15px;">
		          			<span id="sell_span" style="font: bold; color: black; font-size: 15px;">MQ103KH/A Apple iPhone 14 Pro 256GB Silver (Korean Ver.)</span><br>
		          			 애플 아이폰 14 프로 256기가 실버 (국내 정식 발매 제품)<br>
		          			 <span id="sell_span" style="font: bold; color: black; font-size: 15px;">ONE SIZE</span>
	          			 </th>
	          		</tr>
	          		<tr>
	          			<th><span id="sell_span">판매 정산계좌</span><br>
	          			<span style="float: right; font-size: 12px;"><a href="#" style="background-color: black; color: white;'">계좌 추가</a></span>
	          			계좌 : 1234-12-123456<br>
	          			에금주 : 박주닮
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          			<span id="sell_span">반송 주소</span>
	          			<span id="sell_span" style="float: right; font-size: 11px;">
		          			<a href="#" style="border: none;">+ 새 주소 추가</a></span><br>
		          			<span id="sell_span" style="float: right; font-size: 13px;"><a href="#">변경</a></span>
		          			받는분 : <br>
		          			연락처 : <br>
		          			배송주소 : <br>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th><span id="sell_span" style="font-size: 15px; ">즉시 판매가</span><br>
		          			정산금액<span style="float: right; font-size: 15px; color: #00A5FF;">280,000</span><br>
		          			검수비<span style="float: right;font-size: 15px; color: #6c757d;">무료</span><br>
		          			수수료<span style="float: right;font-size: 15px; color: #6c757d;">무료</span><br>
		          			배송비<span style="float: right;font-size: 15px; color: #6c757d;">선불/판매자 부담</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th><span id="sell_span">최종 판매 정보</span><br>
		          			거래금액<br>
		          			<span id="sell_span" style="float: right;color: #00A5FF;">+280,000</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th><input type="checkbox">
	          			<span id="sell_span" style="font-size: 13px;">거래가 체결되면 일요일 · 공휴일을 제외하고 48시간 내에 KREAM으로 발송을 완료한 후<br>
	          				발송 정보를 정확히 입력해야 합니다.</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th><input type="checkbox">
	          			<span id="sell_span" style="font-size: 13px;">송장 번호 미기재·오입력 시 입고가 진행되지 않으며, 발송 후 5일(일요일·공휴일 제외) 내 미도착은 허위 정보 입력으로 간주하여 미입고 페널티를 부과합니다.</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th><input type="checkbox">
	          			<span id="sell_span" style="font-size: 13px;">검수 기준과 페널티 및 이용 정책을 다시 한번 확인하였습니다.</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th><input type="checkbox">
	          			<span id="sell_span" style="font-size: 13px;">‘바로 판매하기’ 를 선택하시면 즉시 거래가 체결되며, 단순 변심이나 실수에 의한 취소가 불가능합니다.</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th><input type="checkbox">
	          			<span id="sell_span" style="font-size: 13px;">판매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th><span style="color: black; font-size: 15px;">정산금액</span><span style="float: right;color: #00A5FF;">280,000원</span>
	          				<a href="member_sell_detail" class="btn btn-lg btn-primary btn-block mt-1" style="background: black; color: white;">바로 판매하기</a>
	          			</th>
	          		</tr>
	          	</table>
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