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

	function finalCheck() {
		if(confirm('변경하시겠습니까?')) {
			return true;
		}
		return false;
	}

</script>
<body>

	<c:if test="${sessionScope.sId eq null or sessionScope.sId ne'admin'}">
		<script>
			alert("잘못된 접근입니다!");
			location.href = "./";
		</script>
	</c:if>
	


    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="index.html">
                    <b class="logo-abbr"><img src="<%=request.getContextPath() %>/resources/admin/images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="<%=request.getContextPath() %>/resources/admin//images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <img src="<%=request.getContextPath() %>/resources/admin/images/logo-text.png" alt="">
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <jsp:include page="../inc/top.jsp"></jsp:include>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
		<jsp:include page="../inc/sidebar_admin.jsp"></jsp:include>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body" >

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->
			<br>
            <div class="container-fluid">

				<!-- Table start -->
				<div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
	                            <h2>Sell Product</h2>
	                        </div>
	                        
	                        <div style="text-align: center;">
	                        	<c:if test="${param.status eq '0' }">
		                        	<div class="progress mb-3" style="height: 13px; width: 300px; margin: auto;">
	                                    <div class="progress-bar bg-primary active progress-bar-striped" style="width: 20%;" role="progressbar"><span class="sr-only">60% Complete</span></div>
	                                </div>
								</c:if>
								<c:if test="${param.status eq '1' }">
		                        	<div class="progress mb-3" style="height: 13px; width: 300px; margin: auto;">
	                                    <div class="progress-bar bg-primary active progress-bar-striped" style="width: 55%;" role="progressbar"><span class="sr-only">60% Complete</span></div>
	                                </div>
								</c:if>
								<c:if test="${param.status eq '2' }">
		                        	<div class="progress mb-3" style="height: 13px; width: 300px; margin: auto;">
	                                    <div class="progress-bar bg-primary active progress-bar-striped" style="width: 100%;" role="progressbar"><span class="sr-only">60% Complete</span></div>
	                                </div>
								</c:if>
								<button type="button" class="btn mb-1 btn-rounded btn-outline-primary" onclick="location.href='admin_productSellList?status=0'">검수대기중</button>
								<button type="button" class="btn mb-1 btn-rounded btn-outline-primary" onclick="location.href='admin_productSellList?status=1'" style="margin: 0 5px">검수중</button>
								<button type="button" class="btn mb-1 btn-rounded btn-outline-primary" onclick="location.href='admin_productSellList?status=2'">검수완료</button>
		          			</div>
	                        
                            <!-- 검색기능 Start -->
	                        <form action="admin_productSellList" method="get">
                                <div class="input-group mb-3" style="float: right; width: 250px;">
                                    <input type="text" name="keyword" class="form-control">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-dark" type="submit">Search</button>
                                    </div>
                                </div>
                                <select class="form-control" name="searchType" style="float: right; width: 100px">
                                    <option value="all" selected="selected">전체</option>
                                    <option value="order_sell_idx">주문번호</option>
                                    <option value="member_name">고객명</option>
                                     <option value="account_owner_name">예금주명</option>
                                    <option value="product_name">상품명</option>
                                </select>
<%--                                 <input type="hidden" name="status" value="${param.status }"> --%>
<%--                                 <input type="hidden" name="pageNum" value="${pageInfo.pageNum }"> --%>
	                        </form>
	                        <!-- 검색기능 End -->
                            <div class="table-responsive">
                            <hr>
                                <table class="table header-border">
                                    <thead>
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">고객명</th>
                                            <th scope="col" width="450px">상품명</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">정산계좌</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Status</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="sellList" items="${sellList }">
	                                        <tr>
	                                            <td>${sellList.order_sell_idx }</td>
	                                            <td>${sellList.member_name }</td>
	                                            <td style="width: 400px; display: block; line-height:3em; text-overflow:ellipsis; white-space: nowrap; overflow:hidden; cursor: pointer;" title="${sellList.product_name }"
	                                            	onclick="location.href='product_detail?product_idx=${sellList.product_idx }'">
	                                            	${sellList.product_name }
	                                            </td>
	                                            <td>
	                                             	<fmt:formatNumber value="${sellList.product_sell_price }" pattern="#,###"/>원
	                                            </td>
	                                            <td>${sellList.account_bank }&nbsp;${sellList.account_owner_name }<br>${sellList.account_num }</td>
	                                            <c:set var="date" value="${sellList.order_sell_date }" />
	                                            <td>${fn:substring(date, 0, 8 ) }</td>
	                                            <form action="admin_orderSellModify" method="post" onsubmit="return finalCheck();">
	                                            <input type="hidden" name="product_idx" value="${sellList.product_idx }" />
	                                            <input type="hidden" name="order_sell_idx" value="${sellList.order_sell_idx }" />
	                                            <input type="hidden" name="pageNum" value="${pageInfo.pageNum }" />
	                                            <input type="hidden" name="status" value="${param.status }" />
		                                            <td>
		                                            	<select class="custom-select col-9" id="inlineFormCustomSelect" name="order_sell_gb">
		                                                    <option value="0" ${sellList.order_sell_gb == '0' ? 'selected="selected"' : ''}>검수대기중</option>
		                                                    <option value="1" ${sellList.order_sell_gb == '1' ? 'selected="selected"' : ''}>검수중</option>
		                                                    <option value="2" ${sellList.order_sell_gb == '2' ? 'selected="selected"' : ''}>검수완료</option>
		                                                    <option value="3" ${sellList.order_sell_gb == '3' ? 'selected="selected"' : ''}>반려</option>
		                                                </select>
		                                            </td>
		                                            <td>
		                                            	<button type="submit" class="btn mb-1 btn-outline-dark">Apply</button>
		                                            </td>
	                                            </form>
	                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
	                            <hr>
	                        </div>
	                        
							<!-- 페이징 처리 Start -->
							<div class="bootstrap-pagination">
							<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
								<nav>
									<ul class="pagination justify-content-center">
										
									<%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>
										<li class="page-item">
											<a class="page-link" href="admin_productSellList?keyword=${param.keyword }&searchType=${param.searchType }&status=${param.status }&pageNum=${pageInfo.pageNum - 1}">Previous</a>
										</li>
									<%} else{ %>
										<li class="page-item disabled">
											<a class="page-link" href="javascript:void(0)">Previous</a>
										</li>
									<%} %>
									
									<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
										<c:choose>
											<c:when test="${i eq pageInfo.pageNum }">
												<li class="page-item active">
													<a class="page-link" href="javascript:void(0)">${i } <span class="sr-only">(current)</span></a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="page-item">
													<a class="page-link" href="admin_productSellList?keyword=${param.keyword }&searchType=${param.searchType }&status=${param.status }&pageNum=${i }">${i }</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>
										<li class="page-item">
											<a class="page-link" href="admin_productSellList?keyword=${param.keyword }&searchType=${param.searchType }&status=${param.status }&pageNum=${pageInfo.pageNum + 1}">Next</a>
										</li>
									<%} else{ %>
										<li class="page-item disabled">
											<a class="page-link" href="javascript:void(0)">Next</a>
										</li>
									<%} %>
									</ul>
								</nav>
							</div>
							<!-- 페이징 처리 End -->
							<button type="button" style="float: right;" class="btn mb-1 btn-danger btn-sm" onclick="location.href='admin_productSellList?status=3'">반려리스트</button>
	                    </div>
	                </div>
	            </div>
				<!-- table end -->
				
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/styleSwitcher.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>

</body>

</html>