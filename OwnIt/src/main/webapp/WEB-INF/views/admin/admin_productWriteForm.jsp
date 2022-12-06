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
	var isDuplicateProductName = true;
	var isDuplicateModelNum = true;

	
	// 제품명 중복확인
	function checkProductName() {
		var productName = $('#productName').val();
		
		if(productName === '') {
			$('#productNameResult').html('');
		} else {
			$.ajax({
				async: true,
    			type: 'POST',
    			data: productName,
    			url: 'checkProductName',
    			dataType: 'json',
    			contentType: 'application/json; charset=UTF-8',
    			success : function(data){
    				if(data.cnt > 0) {
    					$('#productNameResult').html("이미 등록된 제품명입니다.");
    					$('#productNameResult').css("color", "red");
    					$('#productName').focus();
    					isDuplicateProductName = false;
    				}
    			}
			});
			
		}
	}
	
	
	// 제품 번호 중복확인
	function checkModelNum() {
		var modelNum = $('#modelNum').val();
		
		if(modelNum === '') {
			$('#modelNumResult').html('');
		} else {
			$.ajax({
				async: true,
    			type: 'POST',
    			data: modelNum,
    			url: 'checkModelNum',
    			dataType: 'json',
    			contentType: 'application/json; charset=UTF-8',
    			success : function(data){
    				if(data.cnt > 0) {
    					$('#modelNumResult').html("이미 등록된 제품번호입니다.");
    					$('#modelNumResult').css("color", "red");
    					$('#modelNum').focus();
    					isDuplicateModelNum = false;
    				}
    			}
			});
			
		}
	}
	
	
	// 폼 제출 시 전체 확인
	function checkAll() {
		if(!isDuplicateProductName) {
			alert("제품명 중복 확인 필수");
			$("#productName").select();
			return false;
		} else if(!isDuplicateModelNum) {
			alert("제품번호 중복 확인 필수");
			$("#modelNum").select();
			return false;
		}
		return true;
	}
	
	

	// 이미지 갯수 확인
    $(document).ready(function (e){
	    $("#imageFile").on("change", function(event) {
	        var file = event.target.files[0];
	        var files = event.target.files; 
	        var reader = new FileReader();
	        
	        if(files.length != 3){
        	  alert('이미지 갯수 확인! (3장 업로드 필수)');
              $("#imageFile").val("");  //파일 초기화
              $("#preview").attr("src", "resources/img/review/blank.jpg");
              return false;
          }
	        
	        reader.onload = function(e) {
	            $("#preview").attr("src", e.target.result);
	        }
	        reader.readAsDataURL(file);
	    });
    });  
    
    
    function changeType(product_type) {
		// 선택된 타입 값을 type 의 value 값으로 변경
		document.productWriteForm.product_type.value = product_type;
		
		// 단, 선택된 타입이 "직접입력"이 아닐 경우 type 입력창 잠금(readOnly 속성 적용)
		if(product_type == "") {
			document.productWriteForm.product_type.readOnly = false;
			document.productWriteForm.product_type.focus();
		} else {
			document.productWriteForm.product_type.readOnly = true;
		}
	}
    
    
    function changeBrand(product_brand) {
		// 선택된 브랜드 값을 brand 의 value 값으로 변경
		document.productWriteForm.product_brand.value = product_brand;
		
		// 단, 선택된 브랜드가 "직접입력"이 아닐 경우 brand 입력창 잠금(readOnly 속성 적용)
		if(product_brand == "") {
			document.productWriteForm.product_brand.readOnly = false;
			document.productWriteForm.product_brand.focus();
		} else {
			document.productWriteForm.product_brand.readOnly = true;
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
                            <h2>Product Write Form</h2>
                            <br>
                            <div class="basic-form">
                                <form action="admin_productWritePro" method="post" name="productWriteForm" onsubmit="return checkAll()" enctype="multipart/form-data">
                                	<!-- Start Col -->
                                	<div class="row">
			                            <div class="col-md-8 col-lg-4">
			                                <div class="card">
			                                    <div class="card-body">
			                                    	<label>Image<span class="text-danger"> *</span></label>
			                                    	<div class="filebox clearfix">
														<img src="resources/img/review/blank.jpg" class="mr-3" id="preview" style="background-size: cover; width: 350px; height: 350px">		                                    	
			                                    	</div>
			                                    </div>
			                                    <div class="card-footer">
		                                        
			                                        <div class="input-group mb-3">
					                                	<input type="file" name="files" class="form-control-file" id="imageFile" multiple="multiple" required>
<!-- 			                                        	<input type="file" name="file" class="form-control-file" id="imageFile" required> -->
			                                        </div>
		                                        
			                                    </div>
			                                </div>
			                            </div>
			                            <!-- End Col -->
			                        </div>
                                    <div class="form-row">
                                    	<div class="form-group col-md-3">
                                     		<label>Type<span class="text-danger"> *</span></label>
                                            <input type="text" class="form-control" name="product_type" required>
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
                                            <input type="text" class="form-control" name="product_brand" required>
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
	                                        <label>Name<span class="text-danger"> *</span></label><span id="productNameResult" style="margin-left: 20px;"></span>	
	                                        <input type="text" class="form-control" id="productName" name="product_name" oninput="checkProductName()" required>
										</div>
                                   	</div>
                                    <div class="form-row">
                                   		<div class="form-group col-md-6">
                                            <label>Model Number<span class="text-danger"> *</span></label><span id="modelNumResult" style="margin-left: 20px;"></span>
                                            <input type="text" class="form-control" id="modelNum" name="product_model_num" oninput="checkModelNum()" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Color<span class="text-danger"> *</span></label>
                                            <input type="text" class="form-control" name="product_color" required>
                                        </div>
                                    </div>
                                   	<div class="form-row">
                                   		<div class="form-group col-md-4">
                                            <label>Release Price<span class="text-danger"> *</span></label>
                                            <div class="input-group-prepend"><span class="input-group-text">￦</span>
                                            <input type="number" min="0" class="form-control" name="product_release_price" required></div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Buy Price<span class="text-danger"> *</span></label>
                                            <div class="input-group-prepend"><span class="input-group-text">￦</span>
                                            <input type="number" min="0" id="number" class="form-control" name="product_buy_price" required></div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Sell Price<span class="text-danger"> *</span></label>
                                            <div class="input-group-prepend"><span class="input-group-text">￦</span>
                                            <input type="number" min="0" id="number" class="form-control" name="product_sell_price" required></div>
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