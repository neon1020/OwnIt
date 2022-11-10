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
	span{
		font-size: 22px; 
		color: black; 
		font: bold;
	}
	span > a[href]{
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
	#margin-left{
		margin-left: 120px;"
	}
</style>
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
	          	<h2 align="center"><sapn style="color : #00A5FF;">정산</sapn> 정보</h2>
	          	<table class="table">
	          		<tr>
	          			<th>
	          				<img src="resources/img/product/${image.image_original_file1 }" id="sellFormImage" >
		          			<span id="span3"style="font: bold; color: black; font-size: 15px;">
		          			${product.product_brand }
		          			</span><br>
		          			${product.product_name }<br>
		          			 <span style="font: bold; color: black; font-size: 15px;">${product.product_model_num }</span>
	          			 </th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>진행상황</span>
	          				<div>
		          				<progress id="barr" value="20" max="100"></progress>
		          				<a id="margin-left">판매검수</a> 
		          				<a id="margin-left">판매반려</a> 
		          				<a id="margin-left">판매완료</a>
	          				</div>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th><span style="font-size: 15px; ">판매가</span><br>
		          			정산금액<span style="float: right; font-size: 15px; color: #00A5FF"><fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/></span><br>
		          			검수비<span style="float: right;font-size: 15px; color: #6c757d;">무료</span><br>
		          			수수료<span style="float: right;font-size: 15px; color: #6c757d;">무료</span><br>
		          			배송비<span style="float: right;font-size: 15px; color: #6c757d;">선불/판매자 부담</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>정산 금액</span><br>
	          				<span style="float: right;color: #00A5FF;">+<fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/></span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>거래 일시</span><br>
	          				<span style="float: right; font-size: 15px;">2022-10-31</span>
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>보내실 곳</span><br>
	          				<span style="font-size: 15px;">OwnIt 앞</span><br>
	          				부산광역시 해운대구 서면<br>
	          				1588-1588
	          			</th>
	          		</tr>
	          		<tr>
	          			<th>
	          				<span>정산일</span>
	          				<span style="float: right; font-size: 15px;">2022/11/31</span>
	          			</th>
	          		</tr>
	          	</table>
	          	<div>
		          	<a href="product_list" class="btn btn-lg btn-primary btn-block mt-1" style="background-color: black; border:balck; color: white;">
		          	SHOP 바로가기</a>
		          	<a href="" class="btn btn-lg btn-primary btn-block mt-1" style="background-color: black; border:balck; color: white;">
		          	판매 목록보기</a>
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