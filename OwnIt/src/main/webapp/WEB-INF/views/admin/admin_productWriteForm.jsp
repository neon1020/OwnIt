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

	<!-- Image 업로드용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
	<!-- Image 업로드용 -->

</head>

<!-- <script src="resources/js/jquery-3.6.1.js"></script> -->
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
    
    
    function changeCategory(category) {
		// 선택된 브랜드 값을 brand 의 value 값으로 변경
		document.productWriteForm.category.value = category;
		
		// 단, 선택된 브랜드가 "직접입력"이 아닐 경우 brand 입력창 잠금(readOnly 속성 적용)
		if(category == "") {
			document.productWriteForm.category.readOnly = false;
			document.productWriteForm.category.focus();
		} else {
			document.productWriteForm.category.readOnly = true;
		}
	}
    
    
    function changeBrand(brand) {
		// 선택된 브랜드 값을 brand 의 value 값으로 변경
		document.productWriteForm.brand.value = brand;
		
		// 단, 선택된 브랜드가 "직접입력"이 아닐 경우 brand 입력창 잠금(readOnly 속성 적용)
		if(brand == "") {
			document.productWriteForm.brand.readOnly = false;
			document.productWriteForm.brand.focus();
		} else {
			document.productWriteForm.brand.readOnly = true;
		}
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
				<!-- Form Start -->
				<div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2>Product Write Form</h2>
                            <br>
                            <div class="basic-form">
                                <form action="ProductWritePro" method="post" name="productWriteForm">
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
                                    	<div class="form-group col-md-3">
                                     		<label>Category</label>
                                            <input type="text" class="form-control" name="category">
                                        </div>
                                     	<div class="form-group col-md-3">
                                     		<label>&nbsp;</label>
                                            <select id="inputState" class="form-control" onchange="changeCategory(this.value)">
                                                <option selected="selected" value="">직접입력</option>
                                                <option value="노트북">노트북</option>
                                                <option value="스마트워치">스마트워치</option>
                                                <option value=스마트폰>스마트폰</option>
                                                <option value="이어폰">이어폰</option>
                                                <option value="태블릿">태블릿</option>
                                                <option value="헤드폰">헤드폰</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-row">
                                    	<div class="form-group col-md-3">
                                     		<label>Brand</label>
                                            <input type="text" class="form-control" name="brand">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>&nbsp;</label>
                                            <select id="inputState" class="form-control" onchange="changeBrand(this.value)">
                                                <option selected="selected" value="">직접입력</option>
                                                <option value="APPLE">APPLE</option>
                                                <option value="BOSE">BOSE</option>
                                                <option value="LG">LG</option>
                                                <option value="SAMSUNG">SAMSUNG</option>
                                                <option value="SONY">SONY</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                   	<div class="form-row">
                                   		<div class="form-group col-md-8">
	                                        <label>Name</label>	
	                                        <input type="text" class="form-control">
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