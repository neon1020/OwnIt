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
    <link href="<%=request.getContextPath() %>/resources/admin/plugins/summernote/dist/summernote.css" rel="stylesheet">
	<style>
	</style>
</head>
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
	                        <div class="container-sm" style="width: 800px; margin: auto;">
	                            <form class="form-valide" action="admin_noticeWritePro" method="post" style="text-align: center;">
	                                <div class="row">
	                                    <div class="col-sm-2" style="margin-right: 0px; padding-right: 0px;">
	                                        <select name="notice_category" id="inputState" class="form-control" >
	                                            <option value="">카테고리</option>
	                                            <option value="[공지]">공지</option>
	                                            <option value="[이벤트]">이벤트</option>
	                                        </select>
	                                    </div>
	                                    <div class="col-sm-10" style="margin-left: 0px; padding-left: 0px;">
	                                        <input type="text" class="form-control" id="val-username" name="notice_subject" placeholder="제목을 입력하세요.">
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <div class="col-lg-12" style="margin-top: 30px;">
	                                        <textarea class="summernote" id="val-suggestions" name="notice_content" rows="5" style="height: 450px">
	                                        </textarea>
	                                    </div>
	                                </div>
	                                <button type="submit" class="btn btn-dark btn-primary" style="float: right;">등록</button>
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
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/summernote/dist/summernote.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/summernote/dist/summernote-init.js"></script>

</body>

</html>