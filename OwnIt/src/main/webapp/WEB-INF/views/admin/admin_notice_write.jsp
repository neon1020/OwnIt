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
	<style>
	</style>
</head>
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

				<!-- Table start -->
				<div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title" style="margin-left: 350px;">
	                            <h2>Write Notice</h2>
	                        </div>
	                        <div class="form-validation">
	                            <form class="form-valide" action="#" method="post">
	                                <div class="form-group row">
	                                    <label class="col-lg-4 col-form-label" for="val-username" style="text-align: right;">Category <span class="text-danger">*</span>
	                                    </label>
	                                    <div class="form-group col-md-4">
	                                        <select id="inputState" class="form-control">
	                                            <option selected="selected">Choose</option>
	                                            <option>공지사항</option>
	                                            <option>이벤트</option>
	                                        </select>
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <label class="col-lg-4 col-form-label" for="val-username" style="text-align: right;">Subject <span class="text-danger">*</span>
	                                    </label>
	                                    <div class="col-lg-6">
	                                        <input type="text" class="form-control" id="val-username" name="val-username" placeholder="제목을 입력하세요.">
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <label class="col-lg-4 col-form-label" for="val-suggestions" style="text-align: right;">Content <span class="text-danger">*</span>
	                                    </label>
	                                    <div class="col-lg-6">
	                                        <textarea class="form-control" id="val-suggestions" name="val-suggestions" rows="5" placeholder="내용을 입력하세요." style="height: 450px"></textarea>
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <div class="col-lg-8 ml-auto">
	                                        <button type="submit" class="btn btn-primary" style="width: 200px;">Write</button>
	                                    </div>
	                                </div>
	                            </form>
	                        </div>
				<!-- table end -->
						</div>
					</div>
				</div>				
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
    
    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>

</body>

</html>