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


	function finalCheck() {
		if(confirm('변경하시겠습니까?')) {
			return true;
		}
		return false;
	}


	
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
		    location.href="admin_productDelete?deleteList=" + deleteList + "&pageNum=" + '${param.pageNum}'
		}
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
				<!-- table start -->
				<div class="col-lg-12">
	                <div class="card">
	                    <div class="card-body">
	                        <div class="card-title">
	                            <h2>Product List</h2>
	                        </div>
							<div style="text-align: center;">
								<a href="admin_productList?status=0" style="cursor: pointer;"><i class="fa fa-circle-o text-info  mr-2"></i>
									<c:choose>
										<c:when test="${param.status eq '0' }">
											<button type="button" class="btn mb-1 btn-outline-primary btn-sm">판매중</button>
										</c:when>
										<c:otherwise>판매중</c:otherwise>
									</c:choose>
								</a>
									&nbsp;|&nbsp;
								<a href="admin_productList?status=1" style="cursor: pointer;"><i class="fa fa-close text-danger mr-2"></i>
									<c:choose>
										<c:when test="${param.status eq '1' }">
											<button type="button" class="btn mb-1 btn-outline-danger btn-sm">판매중단</button>
										</c:when>
										<c:otherwise>판매중단</c:otherwise>
									</c:choose>
								</a>
							</div>
	                        <!-- 검색기능 Start -->
	                        <form action="admin_productList" method="get">
                                <div class="input-group mb-3" style="float: right; width: 250px;">
                                    <input type="text" name="keyword" class="form-control" list="depList">
                                    <datalist id="depList">
								        <option value="APPLE"></option>
								        <option value="BOSE"></option>
								        <option value="LG"></option>
								        <option value="SAMSUNG"></option>
								        <option value="SONY"></option>
								        <option value="노트북"></option>
								        <option value="스마트워치"></option>
								        <option value="스마트폰"></option>
								        <option value="이어폰"></option>
								        <option value="태블릿"></option>
								        <option value="헤드폰"></option>
								    </datalist>
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
	                                    	<th width="10px">
	                                    		<input id="th_checkAll" type="checkbox" name="checkAll" onclick="checkAll();" style="outline: 1px solid #000000">
	                                    	</th>
	                                        <th style="width: 80px"></th>
	                                    	<th>모델번호</th>
	                                    	<th>Brand</th>
	                                    	<th style="width: 100px">Type</th>
	                                        <th style="width: 480px">상품명</th>
	                                        <th>재고수량</th>
	                                        <th>판매상태</th>
	                                        <th width="90px"></th>
	                                        <th width="10px"></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach var="product" items="${productList }">
		                                    <tr>
		                                    	<td>
		                                    		<input type="checkbox" name="deleteList" value="${product.product_idx}" style="outline: 1px solid #000000">
		                                    	</td>
	                                        	<td onclick="location.href='product_detail?product_idx=${product.product_idx }'" style="cursor: pointer;">
	                                        		<img class="mr-3" src="resources/img/product/${product.image_real_file1}" width="80" height="80">
	                                        	</td>
		                                        <td>${product.product_model_num }</td>
		                                        <td>${product.product_brand }</td>
		                                        <td>${product.product_type }</td>
		                                        <td onclick="location.href='product_detail?product_idx=${product.product_idx }'" style="cursor: pointer;">
		                                        	${product.product_name }
		                                       	</td>
			                                    <form action="admin_productLeftCountModify" method="post" onsubmit="return finalCheck();">
			                                    <input type="hidden" name="product_idx" value="${product.product_idx }" />
	                                            <input type="hidden" name="pageNum" value="${param.pageNum }" />
												<input type="hidden" name="status" value="${param.status }" />                                        
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
		                                        	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
												  		<path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
												  	</svg>
		                                        </td>
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
											<a class="page-link" href="admin_productList?keyword=${param.keyword }&searchType=${param.searchType }&status=${param.status }&pageNum=${pageInfo.pageNum - 1}">Previous</a>
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
													<a class="page-link" href="admin_productList?keyword=${param.keyword }&searchType=${param.searchType }&status=${param.status }&pageNum=${i }">${i }</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>
										<li class="page-item">
											<a class="page-link" href="admin_productList?keyword=${param.keyword }&searchType=${param.searchType }&status=${param.status }&pageNum=${pageInfo.pageNum + 1}">Next</a>
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
							<button type="button" class="btn mb-1 btn-outline-dark" style="float: right" onclick="location.href='admin_productWriteForm'">+Product</button>
	                        <button type="button" class="btn mb-1 btn-outline-danger" style="float: right; margin: 0 5px" onclick="deleteAction()">선택 삭제</button>
							
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