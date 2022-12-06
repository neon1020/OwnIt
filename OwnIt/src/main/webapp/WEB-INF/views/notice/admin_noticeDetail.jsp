<%@page import="com.teamone.ownit.vo.ReplyPageInfo"%>
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
	<script type="text/javascript">
	
	function isDelete() {
		confirm('삭제 하시겠습니까?');
	}

</script>
	
	
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
                                    
                                    <c:if test="${notice.notice_category eq '[이벤트]' }">
	                                    <table class="table">
	                                    	<thead>
	                                            <tr style="text-align: center">
	                                                <td width="20%">닉네임</td>
	                                                <td width="60%">댓글 내용</td>
	                                                <td width="20%">관리</td>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:choose>
	                                        		<c:when test="${listCount == 0 }">
	                                        			<tr>
	                                        				<td colspan="3">작성된 댓글이 없습니다.</td>
	                                        			</tr>
	                                        		</c:when>
	                                        		<c:when test="${listCount != 0 }">
			                                        	<c:forEach var="reply" items="${replyList }" varStatus="num">
			                                        		<tr style="text-align: center">
			                                        			<td>${reply.member_nickname }</td>
			                                        			<td style="text-align: left;">
			                                        				<c:if test="${reply.reply_re_lev == 1 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;&nbsp;&nbsp;</c:if>${reply.reply_content }
			                                        			</td>
			                                        			<td>
			                                        				<input type="button" value="삭제" class="btn btn-dark" data-toggle="modal" data-target="#deleteReply${num.index }">
			                                        			
			                                        				<!-- Modal -->
								                                    <div class="modal fade" id="deleteReply${num.index }">
								                                        <div class="modal-dialog" role="document">
								                                            <div class="modal-content">
								                                                <div class="modal-header">
								                                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
								                                                    </button>
								                                                </div>
								                                                <div class="modal-body">해당 댓글을 삭제 하시겠습니까?</div>
								                                                <div class="modal-footer" style="text-align: center;">
								                                                    <button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
								                                                    <button type="button" class="btn btn-dark" onclick="location.href='event_replyDelete?notice_idx=${notice.notice_idx }&pageNum=${param.pageNum }&replyListNum=${pageInfo.replyListNum }&reply_idx=${reply.reply_idx }&board=admin'">삭제</button>
								                                                </div>
								                                            </div>
								                                        </div>
								                                    </div>
								                                    <!-- Modal 끝 -->
			                                        			</td>
			                                        		</tr>
			                                        	</c:forEach>
	                                        		</c:when>
	                                        	</c:choose>
	                                        </tbody>
	                                    </table>
	                                    
	                                    <!-- 페이징 태그 START -->
										<div class="bootstrap-pagination">
										<%ReplyPageInfo pageInfo = (ReplyPageInfo)request.getAttribute("pageInfo"); %>
											<nav>
												<ul class="pagination justify-content-center">
													
												<%if(pageInfo.getReplyListNum() > pageInfo.getStartPage()) {%>
													<li class="page-item">
														<a class="page-link" href="admin_noticeDetail?notice_idx=${notice.notice_idx }&pageNum=${param.pageNum }&replyListNum=${pageInfo.replyListNum - 1}">Previous</a>
													</li>
												<%} else{ %>
													<li class="page-item disabled">
														<a class="page-link" href="javascript:void(0)">Previous</a>
													</li>
												<%} %>
												
												<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
													<c:choose>
														<c:when test="${i eq pageInfo.replyListNum }">
															<li class="page-item active">
																<a class="page-link" href="javascript:void(0)">${i } <span class="sr-only">(current)</span></a>
															</li>
														</c:when>
														<c:otherwise>
															<li class="page-item">
																<a class="page-link" href="admin_noticeDetail?notice_idx=${notice.notice_idx }&pageNum=${param.pageNum }&replyListNum=${i }">${i }</a>
															</li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<%if(pageInfo.getReplyListNum() < pageInfo.getMaxPage()) {%>
													<li class="page-item">
														<a class="page-link" href="admin_noticeDetail?notice_idx=${notice.notice_idx }&pageNum=${param.pageNum }&replyListNum=${pageInfo.replyListNum + 1}">Next</a>
													</li>
												<%} else{ %>
													<li class="page-item disabled">
														<a class="page-link" href="javascript:void(0)">Next</a>
													</li>
												<%} %>
												</ul>
											</nav>
										</div>
										<!-- 페이징 태그 END -->
                                    </c:if>
                                    
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
	                                    <!-- Modal 끝 -->
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