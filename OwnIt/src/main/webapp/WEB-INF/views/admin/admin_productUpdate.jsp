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

	<!-- Image 업로드용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
	<!-- Image 업로드용 -->
	
</head>
<script src="resources/js/jquery-3.6.1.js"></script>
    <script>
    $(document).ready(function (e){
	    $("#imageFile").on("change", function(event) {
	        var file = event.target.files[0];
	        var reader = new FileReader(); 
	        reader.onload = function(e) {
	            $("#preview").attr("src", e.target.result);
	        }
	        reader.readAsDataURL(file);
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
				<!-- Form Start -->
				<div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2>Product Update Form</h2>
                            <br>
                            <div class="basic-form">
                                <form>
                                	<!-- Start Col -->
                                	<div class="row">
			                            <div class="col-md-6 col-lg-3">
			                                <div class="card">
			                                    <div class="card-body">
			                                    	<label>Image</label>
			                                    	<div class="filebox clearfix">
														<img src="resources/img/review/blank.jpg" class="mr-3" id="preview" style="background-size: cover; width: 300px; height: 300px">		                                    	
			                                    	</div>
			                                    </div>
			                                    <div class="card-footer">
		                                        
			                                        <div class="input-group mb-3">
					                                	<input type="file" class="form-control-file" id="imageFile">
			                                        </div>
		                                        
			                                    </div>
			                                </div>
			                            </div>
			                            <!-- End Col -->
			                        </div>
                                    <div class="form-row">
                                     	<div class="form-group col-md-6">
                                            <label>Category</label>
                                            <select id="inputState" class="form-control">
                                                <option selected="selected">선택하세요</option>
                                                <option>스마트폰</option>
                                                <option>태블릿</option>
                                                <option>기타</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Brand</label>
                                            <select id="inputState" class="form-control">
                                                <option selected="selected">선택하세요</option>
                                                <option>Apple</option>
                                                <option>SAMSUNG</option>
                                                <option>SONY</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                   		<div class="form-group col-md-6">
                                            <label>Model Number</label>
                                            <input type="text" class="form-control" >
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Color</label>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                   	<div class="form-group">
                                        <label>Name</label>
                                        <input type="text" class="form-control">
                                   	</div>
                                   	<div class="form-row">
                                   		<div class="form-group col-md-4">
                                            <label>Price</label>
                                            <input type="number" class="form-control" >
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Buy Price</label>
                                            <input type="number" class="form-control">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Sell Price</label>
                                            <input type="number" class="form-control" >
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-dark" style="float: right">Submit</button>
                                    <button type="reset" class="btn btn-dark" style="float: right; margin: 0 5px">Reset</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- Form End -->
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