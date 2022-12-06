<%@page import="java.util.List"%>
<%@page import="com.teamone.ownit.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>OwnIt</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath() %>/resources/admin/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="<%=request.getContextPath() %>/resources/admin/css/style.css" rel="stylesheet">

</head>

<script type="text/javascript">

	function funClose() {
	    window.close();
	}

</script>

<body>
	
	<c:if test="${sessionScope.sId eq null or sessionScope.sId ne'admin'}">
		<script>
			alert("잘못된 접근입니다!");
			location.href = "./";
		</script>
	</c:if>


	<div class="card">
        <div class="card-body">
            <div class="media align-items-center mb-4">
                <img class="mr-3" src="resources/img/member/${memberInfo[0].image_real_file1}" width="80" height="80" style="border-radius: 30%">
                <div class="media-body">
                    <h3 class="mb-0">${memberInfo[0].member_name }</h3>
                    <p class="text-muted mb-0">${memberInfo[0].address_zipcode }&nbsp;${memberInfo[0].address1 }&nbsp;${memberInfo[0].address2 }</p>
                    <c:set var="date" value="${memberInfo[0].order_buy_date }" />
                    <p class="text-muted mb-0">주문일&nbsp; ${fn:substring(date, 0, 8 ) }</p>
                </div>
            </div>
            <hr>
			<table class="table">
				<thead>
					<tr>
						<th style="width: 20px">No.</th>
						<th style="width: 80px">이미지</th>
						<th>상품명</th>
						<th style="width: 80px">수량</th>
						<th style="width: 150px">가격</th>
						<th style="width: 150px">상태</th>
					</tr>
				</thead>
	           	<tbody>
<%-- 	           	<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }"> --%>
	           	<c:forEach var="buyList" items="${buyList }">
	                <tr>
	                	<td>${buyList.num}</td>
	                   	<td onclick="location.href='product_detail?product_idx=${buyList.product_idx }'" style="cursor: pointer;">
	                   		<img class="mr-3" src="resources/img/product/${buyList.image_real_file1}" style="border-radius: 30%; width: 80px; width: 80px;">
	                   	</td>
	                    <td onclick="location.href='product_detail?product_idx=${buyList.product_idx }'" style="cursor: pointer;">
	                    	${buyList.product_name }
	                    </td>
	                    <td>${buyList.order_buy_count }개</td>
	                    <td>
                        	<fmt:formatNumber value="${buyList.order_buy_price }" pattern="#,###"/>원
                       </td>
	                    <td>
		                    <c:choose>
		                     		<c:when test="${buyList.order_buy_gb eq '0'}">
		                 				주문접수
		                     		</c:when>
		                     		<c:when test="${buyList.order_buy_gb eq '1'}">
		                 				배송중
		                     		</c:when>
		                     		<c:when test="${buyList.order_buy_gb eq '2'}">
		                 				배송완료
		                     		</c:when>
		                     		<c:when test="${buyList.order_buy_gb eq '3' || buyList.order_buy_gb eq '4'}">
		                 				구매확정
		                     		</c:when>
		                    </c:choose>
						</td>
				</c:forEach>
				</tbody>
			</table>
			<hr>
			<div style="text-align: center;">
				<button type="button" class="btn mb-1 btn-dark" style="width: 80px; margin: 0 auto;" onclick="funClose()">Close</button>
			</div>
        </div>
    </div> 
	
	
	
	
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/styleSwitcher.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>

</body>

</html>