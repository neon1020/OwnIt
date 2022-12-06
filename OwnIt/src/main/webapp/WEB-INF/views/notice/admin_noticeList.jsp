<%@page import="com.teamone.ownit.vo.PageInfo"%>
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
                            <!-- !!검색 Form 시작!! -->
	                        <form action="admin_noticeList" method="get">
                                <div class="input-group mb-3" style="float: right; width: 200px; height: 30px;">
                                    <input type="text" name="keyword" class="form-control">
                                    <div class="input-group-append">
                                        <button class="btn btn-dark btn-primary" type="submit">
					                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
												<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
											</svg>
                                        </button>
                                    </div>
                                </div>
                                <select class="form-control" name="searchType" style="float: right; width: 100px">
                                    <option value="subject_content" selected="selected">전체</option>
                                    <option value="subject">제목</option>
                                    <option value="content">내용</option>
                                </select>
	                        </form>
	                        <!-- !!검색 Form 끝!! -->
                            <div class="table-responsive">
                            	<!-- !!글목록 시작!! -->
                                <table class="table table-hover" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th scope="col" colspan="3" style="vertical-align: middle; width: 600px;">제목</th>
                                            <th scope="col" style="vertical-align: middle; width: 100px;">작성일</th>
                                            <th scope="col" style="vertical-align: middle; width: 100px;">조회</th>
                                        </tr>
                                    </thead>
                                    <!-- JSTL 과 EL 활용하여 글목록 표시 -->
                                    <tbody>
                                    <c:forEach var="notice" items="${noticeList }">
                                        <tr>
                                            <td style="vertical-align: middle; width: 50px;">${notice.notice_idx }</td>
                                            <td style="vertical-align: middle; width: 100px;">${notice.notice_category }</td>
                                            <td style="vertical-align: middle; text-align: left;"><a href="admin_noticeDetail?notice_idx=${notice.notice_idx }&pageNum=${pageInfo.pageNum}">${notice.notice_subject }</a></td>
                                            <td style="vertical-align: middle;">${notice.notice_date }</td>
                                            <td style="vertical-align: middle;">${notice.notice_readcount }</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- !!글목록 끝!! -->
                                <a href="admin_noticeWrite"><button type="button" class="btn btn-dark btn-primary" style="float: right;">글쓰기</button></a>
	                        </div>
							<!-- 페이징 태그 START -->
							<div class="bootstrap-pagination" style="text-align: center;">
									<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
									<input type="button" class="btn btn-light btn-sm" value="&laquo;" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='admin_noticeList?pageNum=${pageInfo.pageNum - 1}'"<%} %>>
									<!-- 시작페이지(startPage) 부터 끝페이지(endPage) 까지 페이지 번호 표시 -->
									&nbsp;
									<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
										<!-- 현재 페이지 번호와 i 값이 같을 경우 하이퍼링크 없이 페이지 번호 표시 -->
										<!-- 아니면, pageNum 파라미터를 i 값으로 설정하여 BoardList.bo 서블릿 주소 링크 -->
										<c:choose>
											<c:when test="${i eq pageInfo.pageNum }">${i }</c:when>
											<c:otherwise><a href="admin_noticeList?pageNum=${i }">${i }</a></c:otherwise>
										</c:choose>
										&nbsp;
									</c:forEach>
								<!-- 현재 페이지번호가 끝 페이지번호보다 작을 때 현재 페이지번호 + 1 값으로 페이지 이동 -->
								<input type="button" class="btn btn-light btn-sm" value="&raquo;" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='admin_noticeList?pageNum=${pageInfo.pageNum + 1}'"<%} %>>
							</div>	
							<!-- 페이징 태그 END -->
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
    
    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>

</body>

</html>