<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.teamone.ownit.vo.Order_sellVO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산 정보</title>
<style type="text/css">
	#disabled{
		background: black; 
		color: white;
		border: black;
		border-radius: 15px;
	}

	span1{
		font-size: 22px; 
		color: black; 
		font: bold;
	}
	span2{
		font-size: 22px; 
		font: bold;
		float: right;
		font-size: 15px; 
		color: #6c757d;
	}
	 
	span1 > a[href]{
		border: 1px solid #6c757d;
		color: #6c757d;
		padding: 5px 10px;
		border-radius: 8px;
	}
	#barr{
		width: 100%;
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



<body oncontextmenu="return false">
<body>


  <!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	
	 <section class="pt-5">
      <article class="container">
	
	 	<div class="row justify-content-center">
          <div class="col-md-10 col-lg-8">
          	<div style="margin-top: 150px; width: ">
	          	<h2 align="center"><span id="span1" style="color : #00A5FF;">정산</span> 정보</h2>
	          	<table class="table">
	          		<tr>
	          			<th>
	          				<img src="resources/img/product/${product.image_real_file1 }" id="sellFormImage" >
		          			<span id="span3"style="font: bold; color: black; font-size: 15px;">
		          				${product.product_brand }
		          			</span><br>
		          				${product.product_name }<br>
		          			 <span id="span1" style="font: bold; color: black; font-size: 15px;">
		          			 	${product.product_model_num }
		          			 </span>
	          			 </th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<c:choose>
          						<c:when test="${orderSell.order_sell_gb eq 3 }">
          							<span id="span1" style="color: red;">
			          					판매 반려
			          				</span>
          						</c:when>
          						<c:otherwise>
			          				<span id="span1">
			          					진행상황
			          				</span>
          						</c:otherwise>
    						</c:choose>
	          				<div>
	          					<c:choose>
	          						<c:when test="${orderSell.order_sell_gb eq 0 }">
	          						<progress id="barr" value="20" max="100" ></progress>
	          						</c:when>
	          						<c:when test="${orderSell.order_sell_gb eq 1 }">
	          						<progress id="barr" value="52" max="100" ></progress>
	          						</c:when>
	          						<c:when test="${orderSell.order_sell_gb eq 2 }">
	          						<progress id="barr" value="100" max="100" ></progress>
	          						</c:when>
	          						<c:when test="${orderSell.order_sell_gb eq 3 }">
	          						<progress id="barr" value="0" max="100"></progress>
	          						<div style="text-align: center;">
			          					   <a style="float: left; color: red;">반려 사유 : 우측하단 관리자 채팅을 통해 문의 부탁드립니다.</a> 
				          			</div>
	          						</c:when>
	          					</c:choose>
		          					<c:if test="${orderSell.order_sell_gb ne 3 }">
				          				<div style="text-align: center; color: black;">
					          					   <a style="float: left;">① 검수대기중</a> 
					          					   <a>② 검수중</a> 
					          					   <a style="float: right">③ 검수완료</a>
					          			</div>
		          					</c:if>
	          				</div>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span id="span1" style="font-size: 15px; ">
	          					판매가
	          				</span><br>
		          			정산금액<span id="span1" style="float: right; font-size: 15px; color: #00A5FF">
		          						<fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/>
		          					</span><br>
		          			검수비	<span id="span2">
		          						무료
		          					</span><br>
		          			수수료	<span id="span2">
		          						무료
		          					</span ><br>
		          			배송비	<span id="span2">
		          						선불/판매자 부담
		          					</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span id="span1">
	          					정산 금액
	          				</span><br>
	          				<span id="span1" tyle="float: right;color: #00A5FF;">
	          					+<fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/>
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span id="span1">
	          					거래 일시
	          				</span><br>
	          				<span id="span1" style="float: right; font-size: 15px;">
	          					${orderSell.order_sell_date }
	          				</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span id="span1">
	          					보내실 곳
	          				</span><br>
	          				<span id="span1" style="font-size: 15px;">
	          					OwnIt 앞
	          				</span><br>
	          				부산광역시 해운대구 서면<br>
	          				1588-1588
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span id="span1">
	          					정산일<span style="font-size: 15px; color: silver;">(약1개월 소요)</span>
	          				</span>
	          				<span id="span1" style="float: right; font-size: 15px;">
	          					<%
	          					   Order_sellVO orderSell = (Order_sellVO)request.getAttribute("orderSell");
	          					   SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	          					   Date date = sdf.parse(orderSell.getOrder_sell_date());
		          				   Calendar cal = Calendar.getInstance();
		         				   cal.setTime(date);
		         				   cal.add(Calendar.MONTH, 1);
	          					%>
	          					<%=sdf.format(cal.getTime()) %>
	          				</span>
	          			</th>
	          		</tr>
	          	</table>
	          	<div>
		          	<a href="product_list" id="disabled" class="btn btn-lg btn-primary btn-block mt-1">
		          		SHOP 바로가기
		          	</a>
		          	<a href="mypage_sell?member_idx=${orderSell.member_idx }" id="disabled" class="btn btn-lg btn-primary btn-block mt-1">
		          		판매 목록보기
		          	</a>
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