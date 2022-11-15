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
	}
	#sell_span{
		font-size: 18px; 
		color: black; 
		font-weight: 900;
	}
	#sell_span2{
		font-size: 15px;
		color : black; 
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
	.modal-content{
		height: 700px;
	}
</style>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<script type="text/javascript">
// 	//새 주소 추가
// 	function func1(){
// 		var popupWidth = 600;
// 		var popupHeight = 600;
// 		var popupX = (window.screen.width / 2) - (popupWidth / 2);
// 		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
// 		window.open('address', '새 주소', 
// 					'status=no, height=' + popupHeight  + ', width=' + popupWidth  +
// 					', left='+ popupX + ', top='+ popupY);
// 	}

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
	
	function checkAll(){
		if($(".checkAccount").text().length == 0){
		  alert("계좌를 추가해주세요!");
		  $("#account").focus();
		  return false;
		}
		if($(".checkAddress").text().length == 0){
		  alert("주소를 입력해주세요!");
		  $("#address2").focus();
		  return false;
		}
		return true;
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
          	
          	
          	
          	
          	<form action="order_sellDetail" method="post" onsubmit="return checkAll()">
          	
          		<input type="hidden" name="product_idx" value="${product.product_idx }">
          		<input type= "hidden" name="member_idx" value="${member.member_idx }">
          		<input type= "hidden" name="account_idx" value="${member.account_idx }">
          		
	          	<table class="table">
	          		<tr>
	          			<th style="font-size: 30px; font: bold; color: black;">
		          			<span style="color: skyblue;">판매</span>
		          			확인서
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<img src="resources/img/product/${product.image_original_file1 }" id="sellFormImage">
		          			<span id="sell_span" style="font: bold; color: black; font-size: 15px;">${product.product_brand }</span><br>
		          			 ${product.product_name }<br>
		          			 <span id="sell_span" style="font: bold; color: black; font-size: 15px;">${product.product_model_num }</span>
	          			 </th>
	          		</tr>
	          		<tr>
	          			<th><span id="sell_span">판매 정산계좌</span><br>
	          			<span id="sell_span2" style="float: right; font-size: 12px;"><a id="account" href="account" style="color: black; border: dashed 1px;">계좌 추가</a></span>
	          			은행 : <span id="sell_span2" class="checkAccount">${member.account_bank}</span><br>
	          			계좌 : <span id="sell_span2">${member.account_num }</span><br>
	          			예금주 : <span id="sell_span2">${member.member_name }</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
		          			<span id="sell_span">
		          				반송 주소
		          			</span>
		          			<span id="sell_span" style="float: right; font-size: 11px;">
			          			<a id="address2" href="#" data-toggle="modal" data-target="#exampleModal-1" style="color: black; border: 0px;">
									+ 새 주소 추가
								</a>
			          		</span><br>
			          		<span id="sell_span2" style="float: right; font-size: 13px;">
			          			<a href="javascript:func2()"  style="color: black; border: 1px dashed;">
			          				변경
			          			</a>
			          		</span>
			          		주소별칭 : <span id="sell_span2">${member.address_nickname }</span><br>
		          			배송주소 : <span id="sell_span2" class="checkAddress">${member.address1 } ${member.address2 }</span><br>
		          			받는분 : <span id="sell_span2">${member.member_name }</span>	<br>
		          			연락처 : <span id="sell_span2">${member.member_phone }</span><br>
		          			
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
	          				<input type="submit" value="판매하기" id="disabled" class="btn btn-lg btn-primary btn-block mt-1">
	          			</th>
	          		</tr>
	          	</table>
	          </form>
	         </div>
          </div>
        </div>
		<!-- 다음 주소 api 사용을 위한 코드 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById("address_zipcode").value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
                document.getElementById("address2").focus();
                
            }
        }).open();
    }
</script>
							<form action="order_sellForm" method="post">
								<div class="modal fade" id="exampleModal-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">새 주소 추가</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">×</span>
								        </button>
								      </div>
								      <div class="modal-body">
								      	<input type="hidden" name="member_idx" value="${member.member_idx }">
								      	<input type="hidden" name="product_idx" value="${product.product_idx }">
								        <a>주소별칭</a>
								        <input id="address_nickname" name="address_nickname" type="text" class="form-control" placeholder="주소의 별칭"><br>
								        
								        <a>우편번호<input type="button" class="btn" onclick="execDaumPostcode()"value="우편번호" style="color:black; float: right; border: solid 1px black; padding: 3px; border-radius: 10px;"></a>
								        <input id="address_zipcode" name="address_zipcode" type="text" class="form-control" placeholder="우편번호를 검색하세요"><br>
								        
								        <a>주소</a>
								        <input id="address1" name="address1" type="text" class="form-control" placeholder="우편번호 검색후 자동입력됩니다" ><br>
								        <a>상세주소</a>
								        <input id="address2" name="address2" type="text" class="form-control" placeholder="건물,아파트,동/호수 입력" ><br>
								      </div>
								      <div class="modal-footer">
								        <div class="container-fluid">
								          <div class="row gutter-0">
								            <div class="col">
								              <input type="submit" class="btn btn-block btn-dark btn-rounded" value="저장하기">
								            </div>
								          </div>
								        </div>
								      </div>
								    </div>
								  </div>
								</div>							
							</form>
							
							
	
	 </article>
    </section>
	
	
	
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	 <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html>