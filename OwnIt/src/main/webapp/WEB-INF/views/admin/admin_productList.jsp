<%@page import="com.teamone.ownit.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<!-- 체크박스 전체선택, 전체해제 -->
	function checkAll(){
	    if( $("#th_checkAll").is(':checked') ){
	      $("input[name=deleteList]").prop("checked", true);
	    }else{
	      $("input[name=deleteList]").prop("checked", false);
	    }
	}

	
	<!-- 삭제(체크박스된 것 전부) -->
	function deleteAction(){
		  
		var deleteList = "";
		$( "input[name='deleteList']:checked" ).each (function (){
			deleteList = deleteList + $(this).val()+",";
		});
		
		deleteList = deleteList.substring(0,deleteList.lastIndexOf( ",")); //맨끝 콤마 지우기
		
		if(deleteList == ''){
			alert("삭제할 상품을 선택하세요.");
			return false;
		}
		
		if(confirm("상품을 삭제 하시겠습니까?")){
			alert(deleteList);
		    location.href="admin_productDelete?deleteList=" + deleteList + "&pageNum=" + ${param.pageNum};
// 		    return deleteList;
		}
	}
	


</script>
<body>

	<c:if test="${sessionScope.sId eq null or sessionScope.sId ne'admin'}">
		<script>
// 			alert("잘못된 접근입니다!");
// 			location.href = "./";
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
				<!-- table start -->
				<div class="col-lg-12">
	                <div class="card">
	                    <div class="card-body">
	                        <div class="card-title">
	                            <h2>Product List</h2>
	                        </div>
<!-- 							전체 | 판매중 | 판매중단 -->
	                        <!-- 검색기능 Start -->
	                        <form action="admin_productList" method="get">
                                <div class="input-group mb-3" style="float: right; width: 250px;">
                                    <input type="text" name="keyword" class="form-control">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-dark" type="submit">Search</button>
                                    </div>
                                </div>
                                <select class="form-control" name="searchType" style="float: right; width: 100px">
                                    <option value="all" selected="selected">전체</option>
                                    <option value="brand">Brand</option>
                                    <option value="type">Type</option>
                                    <option value="name">상품명</option>
                                </select>
	                        </form>
	                        <!-- 검색기능 End -->
	                        <div class="table-responsive">
	                        <hr>
	                            <table class="table">
	                                <thead>
	                                    <tr>
	                                    	<th width="20px">
	                                    		<input id="th_checkAll" type="checkbox" name="checkAll" onclick="checkAll();" style="outline: 1px solid #000000">
	                                    	</th>
	                                        <th style="width: 80px"></th>
	                                    	<th>모델번호</th>
	                                    	<th>Brand</th>
	                                    	<th>Type</th>
	                                        <th>상품명</th>
	                                        <th>재고수량</th>
	                                        <th>판매상태</th>
	                                        <th width="100px"></th>
	                                        <th width="10px"></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach var="product" items="${productList }">
		                                    <tr>
		                                    	<td>
		                                    		<input type="checkbox" name="deleteList" value="${product.product_idx}" style="outline: 1px solid #000000">
		                                    	</td>
	                                        	<td>
	                                        		<img class="mr-3" src="resources/img/product/${product.image_real_file1}" width="80" height="80">
	                                        	</td>
		                                        <td>${product.product_model_num }</td>
		                                        <td>${product.product_brand }</td>
		                                        <td>${product.product_type }</td>
		                                        <td>${product.product_name }</td>
			                                    <form action="admin_productLeftCountModify" method="post">
			                                    <input type="hidden" name="product_idx" value="${product.product_idx }" />
	                                            <input type="hidden" name="pageNum" value="${param.pageNum }" />
			                                        <td>
			                                        	<input type="number" min="0" style="width: 50px" class="form-control form-control-sm" name="product_left_count" value="${product.product_left_count }">
			                                        </td>
			                                        <td>
			                                        	<c:choose>
			                                        		<c:when test="${product.product_left_count eq '0'}">
			                                        			<i class="fa fa-close text-danger mr-2"></i>판매중단
			                                        		</c:when>
			                                        		<c:otherwise>
			                                        			<i class="fa fa-circle-o text-info  mr-2"></i>판매중
			                                        		</c:otherwise>
			                                        	</c:choose>
													</td>
			                                        <td>
			                                        	<button type="submit" class="btn mb-1 btn-dark">Apply</button>
			                                        </td>
			                                    </form>
		                                        <td onclick="location.href='admin_productModifyForm?product_idx=${product.product_idx }&pageNum=${pageInfo.pageNum}'" style="cursor: pointer;">
		                                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
														<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
														<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
													</svg>
		                                        </td>
		                                    </tr>
	                                    </c:forEach>
	                                    
	                                </tbody>
	                            </table>
	                            <hr>
	                        </div>
	                        <button type="button" class="btn mb-1 btn-outline-dark" style="float: right" onclick="location.href='admin_productWriteForm'">+Product</button>
	                        <button type="button" class="btn mb-1 btn-outline-danger" style="float: right; margin: 0 5px" onclick="deleteAction()">선택 삭제</button>
							
							<!-- 페이징 처리 Start -->
							<div class="bootstrap-pagination">
							<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
								<nav>
									<ul class="pagination justify-content-center">
										
									<%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>
										<li class="page-item">
											<a class="page-link" href="admin_productList?pageNum=${pageInfo.pageNum - 1}">Previous</a>
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
													<a class="page-link" href="admin_productList?pageNum=${i }">${i }</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>
										<li class="page-item">
											<a class="page-link" href="admin_productList?pageNum=${pageInfo.pageNum + 1}">Next</a>
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