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
	<script type="text/javascript">
	
	function isDelete() {
		confirm('삭제 하시겠습니까?');
	}

</script>
	
	
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
            <div class="container-fluid">
				<div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <td colspan="2" style="font-size: 20px;">${notice.notice_category }&nbsp;&nbsp;${notice.notice_subject }</td>
                                                <td width="200px"><b>Date</b>&nbsp;&nbsp;&nbsp;${notice.notice_date }</td>
                                                <td width="200px"><b>Read</b>&nbsp;&nbsp;&nbsp;${notice.notice_readcount }</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="4" style="font-size: 16px; line-height: 30px; height: 600px;">
                                                ${notice.notice_content }
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
<!--                                <button type="button" class="btn mb-1 btn-outline-secondary" onclick="isDelete()">삭제</button> -->
                                     <!-- 하이퍼링크에 사용할 글번호와 페이지번호는 URL 에 있는 파라미터 사용 -->
									<div style="text-align: center;">
                                     	<input type="button" value="수정" class="btn btn-dark" onclick="location.href='admin_noticeUpdate?notice_idx=${param.notice_idx }&pageNum=${param.pageNum}'">
                                     	<input type="button" value="삭제" class="btn btn-dark" data-toggle="modal" data-target="#basicModal">
                                     	<input type="button" value="목록" class="btn btn-dark" onclick="location.href='admin_noticeList?pageNum=${param.pageNum}'">
                                     
	                                    <!-- Modal -->
	                                    <div class="modal fade" id="basicModal">
	                                        <div class="modal-dialog" role="document">
	                                            <div class="modal-content">
	                                                <div class="modal-header">
<!-- 	                                                    <h5 class="modal-title">Modal title</h5> -->
	                                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
	                                                    </button>
	                                                </div>
	                                                <div class="modal-body">글을 삭제 하시겠습니까?</div>
	                                                <div class="modal-footer" style="text-align: center;">
	                                                    <button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
	                                                    <button type="button" class="btn btn-dark" onclick="location.href='admin_noticeDelete?notice_idx=${notice.notice_idx}'">삭제</button>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     </div>
                                </div>
                            </div>
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