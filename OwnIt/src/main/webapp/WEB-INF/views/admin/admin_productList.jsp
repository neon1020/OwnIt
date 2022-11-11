<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	function func1() {
		confirm('삭제하시겠습니까?');
	}

</script>
<body>

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
	                        <!-- 검색기능 Start -->
	                        <form>
                                <div class="input-group mb-3" style="float: right; width: 250px;">
                                    <input type="text" class="form-control">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-dark" type="button">Search</button>
                                    </div>
                                </div>
                                <select class="form-control" style="float: right; width: 100px">
                                    <option selected="selected">전체</option>
                                    <option>브랜드</option>
                                    <option>상품명</option>
                                </select>
	                        </form>
	                        <!-- 검색기능 End -->
	                        <div class="table-responsive">
	                        <hr>
	                            <table class="table">
	                                <thead>
	                                    <tr>
	                                    	<th width="20px"></th>
	                                        <th style="width: 80px"></th>
	                                    	<th>모델번호</th>
	                                    	<th>브랜드</th>
	                                    	<th>카테고리</th>
	                                        <th>Name</th>
	                                        <th>재고수량</th>
	                                        <th>판매상태</th>
	                                        <th width="100px">#</th>
	                                        <th width="10px"></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                    	<td>
	                                    		<input type="checkbox" style="outline: 1px solid #000000">
	                                    	</td>
	                                        <td><img class="mr-3" src="<%=request.getContextPath() %>/resources/img/product/stylephone.png" width="80" height="80" alt=""></td>
	                                        <td>MQ1F3KH/A</td>
	                                        <td>Apple</td>
	                                        <td>스마트폰</td>
	                                        <td>Apple iPhone 14 Pro 128GB Deep Purple</td>
	                                        <td>
	                                        	<input type="number" style="width: 50px" class="form-control form-control-sm" value="1">
	                                        </td>
	                                        <td>
												<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                                    <option selected="selected">판매중</option>
                                                    <option value="1">판매중단</option>
<!--                                                     <option value="2">판매중단</option> -->
                                                </select>
											</td>
	                                        <td>
	                                        	<button type="button" class="btn mb-1 btn-dark">Apply</button>
	                                        </td>
	                                        <td onclick="location.href='admin_productUpdate'" style="cursor: pointer;">
	                                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
													<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
													<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
												</svg>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                    	<td>
	                                    		<input type="checkbox" style="outline: 1px solid #000000">
	                                    	</td>
	                                        <td><img class="mr-3" src="<%=request.getContextPath() %>/resources/img/product/AirPodsPro.jpg" width="80" height="80" alt=""></td>
	                                        <td>MLWK3KH/A</td>
	                                        <td>Apple</td>
	                                        <td>음향기기</td>
	                                        <td>Apple AirPods Pro with MagSafe Charging Case (Korean Ver.)</td>
	                                        <td>
	                                        	<input type="number" style="width: 50px" class="form-control form-control-sm" value="1">
	                                        </td>
	                                        <td>
												<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                                    <option selected="selected">판매중</option>
                                                    <option value="3">판매중단</option>
<!--                                                     <option value="2">판매중단</option> -->
                                                </select>
											</td>
	                                        <td>
	                                        	<button type="button" class="btn mb-1 btn-dark">Apply</button>
	                                        </td>
	                                        <td onclick="location.href='admin_productUpdate'" style="cursor: pointer;">
	                                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
													<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
													<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
												</svg>
	                                        </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                            <hr>
	                        </div>
	                        <button type="button" class="btn mb-1 btn-outline-dark" style="float: right" onclick="location.href='admin_productWriteForm'">+Product</button>
	                        <button type="button" class="btn mb-1 btn-outline-danger" style="float: right; margin: 0 5px" onclick="func1()">선택 삭제</button>
							<div class="bootstrap-pagination">
								<nav>
									<ul class="pagination justify-content-center">
	                                       <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a></li>
	                                       <li class="page-item"><a class="page-link" href="#">1</a></li>
	                                       <li class="page-item"><a class="page-link" href="#">2</a></li>
	                                       <li class="page-item"><a class="page-link" href="#">3</a></li>
	                                       <li class="page-item"><a class="page-link" href="#">Next</a></li>
									</ul>
								</nav>
							</div>
							
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