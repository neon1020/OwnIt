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
    
    
    function changeType(product_type) {
		// 선택된 타입 값을 type 의 value 값으로 변경
		document.productModifyForm.product_type.value = product_type;
		
		// 단, 선택된 타입이 "직접입력"이 아닐 경우 type 입력창 잠금(readOnly 속성 적용)
		if(product_type == "") {
			document.productModifyForm.product_type.readOnly = false;
			document.productModifyForm.product_type.focus();
		} else {
			document.productModifyForm.product_type.readOnly = true;
		}
	}
    
    
    function changeBrand(product_brand) {
		// 선택된 브랜드 값을 brand 의 value 값으로 변경
		document.productModifyForm.product_brand.value = product_brand;
		
		// 단, 선택된 브랜드가 "직접입력"이 아닐 경우 brand 입력창 잠금(readOnly 속성 적용)
		if(product_brand == "") {
			document.productModifyForm.product_brand.readOnly = false;
			document.productModifyForm.product_brand.focus();
		} else {
			document.productModifyForm.product_brand.readOnly = true;
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
				<!-- Form Start -->
				<div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2>Product Modify Form</h2>
                            <br>
                            <div class="basic-form">
                                <form action="admin_productModify" method="post" name="productModifyForm" enctype="multipart/form-data">
                                	<input type="hidden" name="product_idx" value="${product.product_idx }" />
									<input type="hidden" name="pageNum" value="${param.pageNum }" />
									<!-- 기존 파일명도 함께 전달 -->
									<input type="hidden" name="image_real_file1" value="${product.image_real_file1 }" />
									<input type="hidden" name="image_real_file2" value="${product.image_real_file2 }" />
									<input type="hidden" name="image_real_file3" value="${product.image_real_file3 }" />
									<input type="hidden" name="image_original_file1" value="${product.image_original_file1 }" />
									<input type="hidden" name="image_original_file2" value="${product.image_original_file2 }" />
									<input type="hidden" name="image_original_file3" value="${product.image_original_file3 }" />	
                                	
                                	
                                	<!-- Start Col -->
                                	<div class="row">
			                            
			                            <div class="col-md-8 col-lg-4">
			                                <div class="card">
			                                    <div class="card-body">
			                                    	<label>Image<span class="text-danger"> *</span></label>
			                                    	<div class="filebox clearfix">
														<img src="resources/img/product/${product.image_real_file1 }" class="mr-3" id="preview" style="background-size: cover; width: 350px; height: 350px">		                                    	
			                                    	</div>
			                                    </div>
			                                </div>
			                            </div>
			                            <!-- End Col -->
			                            
			                        <!-- 이미지 수정 Start -->   
			                        <div class="basic-form" style="margin: auto 0; width: 500px">
                                        <label><span class="text-danger"> *</span> 이미지 수정 시 선택하세요</label>
                                        
                                        <div class="form-group">
                                        	<label>&nbsp;File - 1</label>
											<div class="fallback">
												<input class="l-border-1" name="file1" type="file" id="imageFile">
												현재파일 : ${product.image_original_file1 }
											</div>
										</div>
                                        
<!--                                         <div class="input-group mb-3"> -->
<!--                                             <div class="input-group-prepend"><span class="input-group-text">File 1</span> -->
<!--                                             </div> -->
<!--                                             <div class="custom-file"> -->
<!--                                                 <input type="file" name="file1" id="imageFile" class="custom-file-input"> -->
<%--                                                 <label class="custom-file-label">${product.image_original_file1 }</label> --%>
<!--                                             </div> -->
<!--                                         </div> -->
                                        
                                        <div class="form-group">
                                        	<label>&nbsp;File - 2</label>
											<div class="fallback">
												<input class="l-border-1" name="file2" type="file">
												현재파일 : ${product.image_original_file2 }
											</div>
										</div>
                                    
                                        <div class="form-group">
                                        	<label>&nbsp;File - 3</label>
											<div class="fallback">
												<input class="l-border-1" name="file3" type="file">
												현재파일 : ${product.image_original_file3 }
											</div>
										</div>
                                	</div>
                                	<!-- 이미지 수정 End -->
			                        </div>
									
                                    <div class="form-row">
                                    	<div class="form-group col-md-3">
                                     		<label>Type<span class="text-danger"> *</span></label>
                                            <input type="text" class="form-control" name="product_type" value="${product.product_type }" required>
                                        </div>
                                     	<div class="form-group col-md-3">
                                     		<label>&nbsp;</label>
                                            <select id="inputState" class="form-control" onchange="changeType(this.value)">
                                                <option selected="selected" value="">직접입력</option>
                                                <option value="노트북">노트북</option>
                                                <option value="스마트워치">스마트워치</option>
                                                <option value="스마트폰">스마트폰</option>
                                                <option value="이어폰">이어폰</option>
                                                <option value="태블릿">태블릿</option>
                                                <option value="헤드폰">헤드폰</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-row">
                                    	<div class="form-group col-md-3">
                                     		<label>Brand<span class="text-danger"> *</span></label>
                                            <input type="text" class="form-control" name="product_brand" value="${product.product_brand }" required>
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
	                                        <label>Name<span class="text-danger"> *</span></label>	
	                                        <input type="text" class="form-control" name="product_name" value="${product.product_name }" required>
										</div>
                                   	</div>
                                    <div class="form-row">
                                   		<div class="form-group col-md-6">
                                            <label>Model Number<span class="text-danger"> *</span></label>
                                            <input type="text" class="form-control" name="product_model_num" value="${product.product_model_num }" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Color<span class="text-danger"> *</span></label>
                                            <input type="text" class="form-control" name="product_color" value="${product.product_color }" required>
                                        </div>
                                    </div>
                                   	<div class="form-row">
                                   		<div class="form-group col-md-4">
                                            <label>Release Price<span class="text-danger"> *</span></label>
                                            <div class="input-group-prepend"><span class="input-group-text">￦</span>
                                            <input type="number" min="0" class="form-control" name="product_release_price" value="${product.product_release_price }" required></div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Buy Price<span class="text-danger"> *</span></label>
                                            <div class="input-group-prepend"><span class="input-group-text">￦</span>
                                            <input type="number" min="0" id="number" class="form-control" name="product_buy_price" value="${product.product_buy_price }" required></div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Sell Price<span class="text-danger"> *</span></label>
                                            <div class="input-group-prepend"><span class="input-group-text">￦</span>
                                            <input type="number" min="0" id="number" class="form-control" name="product_sell_price" value="${product.product_sell_price }" required></div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-dark" style="float: right;">Submit</button>
                                    <button type="reset" class="btn btn-dark" style="float: right; margin: 0 5px;">Reset</button>
                               		<button type="button" class="btn btn-dark" style="float: right" onclick="history.back()">Cancel</button>
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