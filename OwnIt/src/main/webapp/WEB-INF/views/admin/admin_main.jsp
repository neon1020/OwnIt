<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    <!-- Pignose Calender -->
    <link href="<%=request.getContextPath() %>/resources/admin/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">    
    <!-- Custom Stylesheet -->
    <link href="<%=request.getContextPath() %>/resources/admin/css/style.css" rel="stylesheet">

</head>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">

	$(function() {
		
		$.ajax({
			type: "GET",
	        url: "orderSell_productTop5_image",
	        dataType: "json"
		})
		.done(function(dataList) { // 요청 성공 시
	
			for(let image of dataList) {
				
				let result =    "<div style='float: left; width: 20%'>"
	                        	+ "<img src='resources/img/product/" 
	                        	+ image.image_real_file1 
	                        	+ "' style='width: 80px; height: 80px; border-radius: 60%;'>" 
	                        	+ "</div>"
	                        	;
	            				
				$("#imageDiv1").append(result);
			}
		})
		.fail(function() { // 요청 실패 시
			alert("orderSelll_productTop5_실패!!");
		});
				
		
		$.ajax({
			type: "GET",
	        url: "orderBuy_productTop5_image",
	        dataType: "json"
		})
		.done(function(dataList) { // 요청 성공 시
	
			for(let image of dataList) {
				
				let result =    "<div style='float: left; width: 20%'>"
	                        	+ "<img src='resources/img/product/" 
	                        	+ image.image_real_file1 
	                        	+ "' style='width: 80px; height: 80px; border-radius: 60%;'>" 
	                        	+ "</div>"
	                        	;
	            				
				$("#imageDiv2").append(result);
			}
		})
		.fail(function() { // 요청 실패 시
			alert("실패!!");
		});
		
		
	});
	

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
			<!-- !!!!!Content 내용 여기!!!!! -->
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-1">
                            <div class="card-body">
                                <h3 class="card-title text-white" >거래</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">${salesCount }건</h2>
                                    <p class="text-white mb-0">Jan - Dec 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body">
                                <h3 class="card-title text-white">매출액</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">￦<fmt:formatNumber value="${salesMoney }" pattern="#,###"/></h2>
                                    <p class="text-white mb-0">Jan - Dec 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-3">
                            <div class="card-body">
                                <h3 class="card-title text-white">회원</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">${memberCount }명</h2>
                                    <p class="text-white mb-0">Jan - Dec 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-4">
                            <div class="card-body">
                                <h3 class="card-title text-white">리뷰</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">${reviewCount }건</h2>
                                    <p class="text-white mb-0">Jan - Dec 2022</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                 <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">판매 TOP5 상품</h4>
                                <canvas id="singelBarChart1" width="500" height="300"></canvas>
	                            <div style="padding-left: 55px" id="imageDiv1">    
                            	</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">구매 TOP5 상품</h4>
                                <canvas id="singelBarChart2" width="500" height="300"></canvas>
	                            <div style="padding-left: 55px" id="imageDiv2">    
                            	</div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                
                <div class="row">
                
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">월별 매출액</h4>
                                <div id="stacked-bar-chart" class="ct-chart ct-golden-section"></div>
                            </div>
                        </div>
                    </div>
                    
	                <div class="col-lg-6">
	                    <div class="card">
	                        <div class="card-body">
	                            <h4 class="card-title">구매 제품 비중</h4>
	                            <canvas id="pieChart" width="500" height="500"></canvas>
	                        </div>
	                    </div>
	                </div>
	                
				</div>
           
        	
<!-- 	        	<div class="col-lg-6"> -->
<!-- 	                <div class="card"> -->
<!-- 	                    <div class="card-body"> -->
<!-- 	                        <h4 class="card-title">Line chart with area</h4> -->
<!-- 	                        <div id="chart-with-area" class="ct-chart ct-golden-section"></div> -->
<!-- 	                    </div> -->
<!-- 	                </div> -->
<!-- 	            </div> -->
            <!-- #/ container -->
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



	
	<!-- Chartjs -->
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/d3v3/index.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/topojson/topojson.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/raphael/raphael.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/moment/moment.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/chartist/js/chartist.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/plugins-init/chartjs-init.js"></script>
	<script src="<%=request.getContextPath() %>/resources/admin/js/plugins-init/chartist.init.js"></script>
	
    <script src="<%=request.getContextPath() %>/resources/admin/js/dashboard/dashboard-1.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
    
</body>
</html>