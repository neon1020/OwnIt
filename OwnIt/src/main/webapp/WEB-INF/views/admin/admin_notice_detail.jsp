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
			confirm("해당 게시물을 삭제하시겠습니까?");
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
                                    <table class="table" style="text-align: center; width: 1200px; margin-left: auto; margin-right: auto;">
                                        <thead>
                                            <tr>
                                                <th colspan="4"><span class="badge badge-primary px-2">공지사항</span>&nbsp;&nbsp;&nbsp;<span style="font-size: 20px;">11월 홈페이지 운영 일정 안내</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td> </td>
                                                <td> </td>
                                                <td width="200px"><b>Date</b>&nbsp;&nbsp;&nbsp;2022-10-31</td>
                                                <td width="200px"><b>Read</b>&nbsp;&nbsp;&nbsp;220</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="font-size: 16px; line-height: 30px;">
                                                	안녕하세요. Own It 입니다.<br>
                                                	11월 운영 일정 안내드립니다.<br><br>
                                                	◎ 거래 일정<br>
                                                	- 발송 마감기한 : 체결 일시로부터 48시간<br>
                                                	- 입고 마감기한 : 발송 일시로부터 5일<br><br>
                                                	◎ 출고 일정<br>
                                                	- 일반 구매 : 11월 1일, 11월 4일 출고 불가<br>
                                                	* 공휴일 전후 택배사 물량 집중으로 인하여 배송이 지연될 수 있습니다.<br><br>
                                                	◎ 오프라인 접수<br>
                                                	- 쇼룸 휴무 일정 : 11월 6일 (기존 휴무와 동일)<br>
                                                	- 커먼그라운드 휴무 일정 : 정상 운영<br><br>
                                                	◎ 고객센터<br>
                                                	- 휴무 일정 : 11월 6일<br><br>
                                                	감사합니다.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> </td>
                                                <td> </td>
                                                <td colspan="2">
                                                	<a href="noticeUpdate"><button type="button" class="btn mb-1 btn-secondary">UPDATE</button></a>
                                                	<button type="button" class="btn mb-1 btn-outline-secondary" onclick="isDelete()">DELETE</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
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