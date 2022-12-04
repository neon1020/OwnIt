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
	accent-color: #101010;
    border-color: #101010;
	}
	#R-1500A5{
		 float: right; 
		 font-size: 15px; 
		 	color: #00A5FF;"
	}
	#R-156C75{
		float: right;
		font-size: 15px; 
		color: #6c757d;"
	}
	
	
	#sell_span{
		font-size: 18px; 
		color: black; 
		font-weight: 900;
	}
	#sell_spanFont13{
		font-size: 13px; 
		color: black; 
		font-weight: 900;
	}
	
	#sell_span3{
		font: bold; 
		color: black; 
		font-size: 15px;
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
	
	.addressChange:hover{
		background-color:#dcdcdc;
		cursor: pointer;
	}
	
	.addressChange > th{
		border-bottom: 1px solid gray;
	}
	.accountChange:hover{
		background-color:#dcdcdc;
		cursor: pointer;
	}
	.accountChange > th{
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		color: #5a5a5a;
		font-size: 13px;
	}
	.addressChangeTable:first-child tr:first-child th {
		color: black;
	}
	
	#titleAddress{
		font: bold; 
		font-size: 20px;
		color: black;
	}
	#emptySpan{
		font: bold;
		font-size: 20px;
		color: skyblue;
	}
</style>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<script src="resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">

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
	
	function checkAccAdd(){
		debugger;
		var account = "${member.account_num }";
		var address = "${member.address1 }";
		if(account.length <= 0){
		  alert("계좌를 추가해주세요!");
		  $("#account").focus();
		  return false;
		}
		if(address.length <= 0){
		  alert("주소를 추가해주세요!");
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
          	
          	
          	
          	
          	<form action="order_sellDetail" method="post" onsubmit="return checkAccAdd()">
          		<input type="hidden" name="product_idx" value="${product.product_idx }">
          		<input type= "hidden" name="member_idx" value="${member.member_idx }">
          		<input type= "hidden" name="account_idx" value="${member.account_idx }">
          		
	          	<table class="table">
	          		<tr>
	          			<th style="font-size: 30px; font: bold; color: black; border-top: none;">
		          			<span style="color: skyblue;">판매</span>
		          			확인서
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<img src="resources/img/product/${product.image_real_file1 }" id="sellFormImage">
		          			<span id="sell_span3">
		          				${product.product_brand }
		          			</span><br>
		          			 	${product.product_name }<br>
		          			 <span id="sell_span3">
		          			 	${product.product_model_num }
		          			 </span>
	          			 </th>
	          		</tr>
	          		<tr>
	          			<th><span id="sell_span">판매 정산계좌</span>
	          			<span id="sell_span" style="float: right; font-size: 11px;">
	          				<a id="account" href="#" data-toggle="modal" data-target="#exampleModal-3" style="color: black; border: 0px;">
	          					+ 새 계좌 추가
	          				</a>
	          			</span><br>
	          			<c:if test="${not empty member.account_num }">
          				<span id="sell_span2" style="float: right; font-size: 13px;">
		          			<a id="address2" href="#" data-toggle="modal" data-target="#exampleModal-4" style="color: black; ">
								변경
							</a>
		          		</span>
		          		</c:if>
		          		<c:choose>
		          			<c:when test="${empty member.account_num }">
		          				<div style="text-align: center;">
		          					<span id="emptySpan">계좌를 추가해주세요 !</span>
		          				</div>
		          			</c:when>
		          			<c:otherwise>
		        				계좌별칭 : <span id="sell_span2">
			          							${member.account_nickname}
			          				  	   </span><br>
			          			은행 : 	   <span id="sell_span2" class="checkAccount">
			          							${member.account_bank}
			          				   	   </span><br>
			          			계좌번호 : 	   <span id="sell_span2">
			          							${member.account_num }
			          				   	   </span><br>
			          			예금주 :   <span id="sell_span2">
			          							${member.account_owner_name }
			          					   </span>
		          			</c:otherwise>
		          		</c:choose>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
		          			<span id="sell_span">
		          				반송 주소
		          			</span>
		          			<span id="sell_span" style="float: right; font-size: 11px;">
			          			<a href="#" data-toggle="modal" data-target="#exampleModal-1" style="color: black; border: 0px;">
									+ 새 주소 추가
								</a>
			          		</span><br>
		          			<c:if test="${not empty member.address1 }">
			          		<span id="sell_span2" style="float: right; font-size: 13px;">
			          			<a id="address2" href="#" data-toggle="modal" data-target="#exampleModal-2" style="color: black; ">
									변경
								</a>
			          		</span>
			          		</c:if>
			          		<c:choose>
			          			<c:when test="${empty member.address1 }">
			          			<div style="text-align: center;">
			          				<span id="emptySpan">주소를 추가해주세요 !</span>
			          			</div>
			          			</c:when>
			          			<c:otherwise>
					          		주소별칭 : <span id="sell_span2">${member.address_nickname }</span><br>
				          			받는분 : <span id="sell_span2">${member.address_recipient }</span>	<br>
				          			연락처 : <span id="sell_span2">${member.member_phone }</span><br>
				          			반송주소 : <span id="sell_span2" class="checkAddress">${member.address1 },${member.address2 }</span><br>
			          			</c:otherwise>
		          			</c:choose>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span id="sell_span" style="font-size: 15px; ">
	          					즉시 판매가
	          				</span><br>
		          			정산금액
		          			<span id="R-1500A5">
		          				<fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/> 원
		          			</span><br>
		          			검수비
		          			<span id="R-156C75">
		          				무료
		          			</span><br>
		          			수수료
		          			<span id="R-156C75">
		          				무료
		          			</span><br>
		          			배송비
		          			<span id="R-156C75" >
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
	          				<input type="checkbox" id="check1" name="check-box" onchange="checkForm()">
	          				<span id="sell_spanFont13">
		          				거래가 체결되면 일요일 · 공휴일을 제외하고 48시간 내에 OwnIt으로 발송을 완료한 후<br>
		          				발송 정보를 정확히 입력해야 합니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check2" name="check-box" onchange="checkForm()">
	          				<span id="sell_spanFont13">
	          					송장 번호 미기재·오입력 시 입고가 진행되지 않으며, 발송 후 5일(일요일·공휴일 제외) 내 미도착은 허위 정보 입력으로 간주하여 미입고 페널티를 부과합니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check3" name="check-box" onchange="checkForm()">
	          				<span id="sell_spanFont13">
	          					검수 기준과 페널티 및 이용 정책을 다시 한번 확인하였습니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check4" name="check-box" onchange="checkForm()">
	          				<span id="sell_spanFont13">
	          					‘바로 판매하기’ 를 선택하시면 즉시 거래가 체결되며, 단순 변심이나 실수에 의한 취소가 불가능합니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<input type="checkbox" id="check5" name="check-box" onchange="checkForm()">
	          				<span id="sell_spanFont13">
	          					판매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
							<input type="checkbox"  id="checkAll" onchange="checkForm()">
	          				<span id="sell_span" style="font-size: 13px; color: gray;">
	          					전체 동의
	          				</span>
	          				<br><br>
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
	//다음 우편번호 api
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
	
	// 계좌추가 submit시 호출되는 함수 
	function checkAccount(){
		var bank = $("#account_bank option:selected").val();
		
		if(bank == ""){
			alert("은행을 선택해주세요.");
			return false;
		}
		
		
		
		return true;
	}

</script>

			<!--  계좌 추가 버튼 클릭시 나오는 모달창 -->
			<form action="insertAccount" method="post" onsubmit="return checkAccount()">
				<div class="modal fade" id="exampleModal-3" tabindex="-3" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">계좌 추가</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">×</span>
				        </button>
				      </div>
				      <div class="modal-body">
					      	<input type="hidden" name="member_idx" value="${member.member_idx }">
					      	<input type="hidden" name="product_idx" value="${product.product_idx }">
					      	<input type="hidden" name="address_idx" value="${member.address_idx }">
					      	<div class="form-group">
		                         <label for="cardNumber">계좌별칭</label>
		                         <input type="text" name="account_nickname"class="form-control" placeholder="계좌별칭" required="required">
	                       </div>
					        <div class="form-group">
				                  <label for="cardNumber">은행명</label>
				                    <select id="account_bank" name="account_bank" class="custom-select">
				                      <option value="">은행 선택</option>
				                      <option value="국민">국민</option>
				                      <option value="기업">기업</option>
				                      <option value="농협">농협</option>
				                      <option value="신한">신한</option>
				                      <option value="우리">우리</option>
				                      <option value="하나">하나</option>
				                      <option value="카카오뱅크">카카오뱅크</option>
				                      <option value="경남">경남</option>
				                      <option value="부산">부산</option>
				                    </select>
				               </div>
		                       <div class="form-group">
		                         <label for="cardNumber">계좌번호</label>
		                         <input type="text" name="account_num" class="form-control" placeholder="계좌번호" required="required">
		                       </div>
		                       <div class="form-group">
		                          <label for="cardNumber">예금주</label>
		                          <input type="text" name="account_owner_name"class="form-control" placeholder="예금주 명을 정확히 입력하세요" required="required">
		                        </div>
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
	
	
			<!--  주소 추가 버튼 클릭시 나오는 모달창 -->
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
					      	<input type="hidden" name="account_idx" value="${member.account_idx }">
				        <a>주소별칭</a>
				        <input id="address_nickname" name="address_nickname" type="text" class="form-control" required="required" placeholder="주소의 별칭"><br>
				        
				        <a>받는분</a>
				        <input id=address_recipient name="address_recipient" type="text" class="form-control" required="required" placeholder="받는분 성함"><br>
				        
				        <a>우편번호<input type="button" class="btn" onclick="execDaumPostcode()"value="우편번호" style="color:black; float: right; border: solid 1px black; padding: 3px; border-radius: 10px;"></a>
				        <input id="address_zipcode" name="address_zipcode" type="text" class="form-control" required="required" placeholder="우편번호를 검색하세요"><br>
				        
				        <a>주소</a>
				        <input id="address1" name="address1" type="text" class="form-control" required="required" placeholder="우편번호 검색후 자동입력됩니다" ><br>
				        <a>상세주소</a>
				        <input id="address2" name="address2" type="text" class="form-control" required="required" placeholder="건물,아파트,동/호수 입력" ><br>
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
	
	
			<!--  주소 변경 버튼 클릭시 나오는 모달창 -->
			<div class="modal fade" id="exampleModal-2" tabindex="-2" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document" style="max-width: 550px;">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">주소록</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">×</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<table class="addressChangeTable">
			      	<c:forEach var="address" items="${addressList }" >
		          		<tr class="addressChange" height="150px" onclick="location.href='order_sellForm?product_idx=${product.product_idx}&address_idx=${address.address_idx}&account_idx=${member.account_idx }'">
		          			<th>
		          				<c:if test="${address.address_gb eq '0' }">
		          				<span id="titleAddress" >(대표주소)</span><br>
		          				</c:if>
				          		<span id="sell_span2">${address.address_nickname }</span><br>
			          			받는분 : <span id="sell_span2">${address.member_name }</span><br>
			          			연락처 : <span id="sell_span2">${address.member_phone }</span><br>
			          			반송주소 : <span id="sell_span2" class="checkAddress" style="font-size: 15px;">${address.address1 }, ${address.address2 }</span><br>
		          			</th>
		          		</tr>      	
			      	</c:forEach>
			      	</table>
			      </div>
			    </div>
			  </div>
			</div>							
							
			<!--  계좌 변경 버튼 클릭시 나오는 모달창 -->
			<div class="modal fade" id="exampleModal-4" tabindex="-4" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document" style="width: 600px; max-width: 600px;">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">내 계좌</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">×</span>
			        </button>
			      </div>
			      <div class="modal-body" >
			      	<table class="addressChangeTable" >
			      		<tr>
			      			<th width="150px;">
			      				계좌별칭
			      			</th>
			      			<th width="100px;">
			      				은행
			      			</th>
			      			<th width="200px;">
			      				계좌번호
			      			</th>
			      			<th width="100px;">
			      				예금주
			      			</th>
			      		</tr>
			      		
			      	<c:forEach var="account" items="${accountList }" >
		          		<tr class="accountChange" height="150px" onclick="location.href='order_sellForm?product_idx=${product.product_idx}&address_idx=${member.address_idx}&account_idx=${account.account_idx }'">
				          		<th>
	          						<c:if test="${account.account_gb eq '0' }">
		          						<span id="titleAddress" >(대표 계좌)</span><br>
		          					</c:if>
	          						${account.account_nickname }
		          				</th>
			          			<th>${account.account_bank }</th>
			          			<th>${account.account_num }</th>
			          			<th>${account.account_owner_name}</th>
		          		</tr>      	
			      	</c:forEach>
			      	</table>
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