<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<style type="text/css">
	input[type=checkbox]{
	float: right;
	width: 15px; 
	height: 15px;
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
	#home, #myPage {
		background-color: #101010;
		border-color: #101010;
		width: 120px;
		height: 45px;
		padding: 10px 10px;
		margin-top: 150px;
	}
	#home:hover, #myPage:hover {
		background-color: #353535;
		border-color: #353535;
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
          <div class="col-md-10 col-lg-8" style="margin-top: 100px;">
          	 <div align="center">
	          	<img src="resources/img/product/orderComplete.png" style="max-width: 70%;">
	         </div>
	         <div align="center">
		         <a href="./" class="btn btn-primary" id="home" style="margin-top: 0px;">홈으로</a>&nbsp;&nbsp;&nbsp;
	          	 <a href="mypage?member_idx=${sessionScope.sIdx }" class="btn btn-primary" id="myPage" style="margin-top: 0px;">마이페이지</a>
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