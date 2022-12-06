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
<script type="text/javascript">
	
	function removeMember(member_idx, pageNum, searchType, keyword) {
		let isRemove = confirm("해당 회원을 탈퇴처리 하시겠습니까?");
		
		if(isRemove) {
			location.href = "removeMember?member_idx=" + member_idx + "&pageNum=" + pageNum + "&searchType=" + searchType + "&keyword=" + keyword;
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

				<!-- Table start -->
				<div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
	                            <h2>Member List</h2>
	                        </div>
	                        
                            <!-- 검색기능 Start -->
	                        <form action="admin_memberList" method="get">
	                        	<input type="hidden" name="pageNum" value="1">
                                <div class="input-group mb-3" style="float: right; width: 250px;">
                                    <input type="text" name="keyword" class="form-control" value="${keyword }">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-dark" type="submit">Search</button>
                                    </div>
                                </div>
                                <select name="searchType" class="form-control" style="float: right; width: 100px">
                                    <option value="all" <c:if test="${searchType eq 'all'}">selected</c:if>>전체</option>
                                    <option value="name" <c:if test="${searchType eq 'name'}">selected</c:if>>이름</option>
                                    <option value="id" <c:if test="${searchType eq 'id'}">selected</c:if>>아이디</option>
                                    <option value="nickname" <c:if test="${searchType eq 'nickname'}">selected</c:if>>닉네임</option>
                                </select>
	                        </form>
	                        <!-- 검색기능 End -->
	                        
                            <div class="table-responsive">
                            <hr>
                                <table class="table header-border" style="text-align: center;">
                                	<c:if test="${listCount ne 0 }">
	                                    <thead>
	                                        <tr>
	                                            <th scope="col">No</th>
	                                            <th scope="col">Name</th>
	                                            <th scope="col">ID</th>
	                                            <th scope="col">Nickname</th>
	                                            <th scope="col">Phone</th>
	                                            <th scope="col">Join Date</th>
	                                            <th scope="col">Ad Agree</th>
	                                            <th scope="col"></th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach var="member" items="${memberList }" >
		                                        <tr>
		                                            <td>${member.member_idx }</td>
		                                            <td>${member.member_name }</td>
		                                            <td>${member.member_id }</td>
		                                            <td>${member.member_nickname }</td>
		                                            <td>${member.member_phone }</td>
		                                            <td>${member.member_join_date }</td>
		                                            <td>
		                                            	<c:choose>
		                                            		<c:when test="${member.member_agree == '0' }">
		                                            			No
		                                            		</c:when>
		                                            		<c:when test="${member.member_agree == '1' }">
		                                            			Yes
		                                            		</c:when>
		                                            	</c:choose>
		                                            </td>
		                                            <td>
		                                            	<button type="button" class="btn mb-1 btn-outline-dark" onclick="removeMember('${member.member_idx}', '${pageInfo.pageNum }', '${searchType }', '${keyword }')">Remove</button>
		                                            </td>
		                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
                                    </c:if>
                                    
                                    <c:if test="${listCount eq 0 }">
                                   		<tr height="100px">
                                   			<td>
                                   				<h3>조회 결과가 없습니다.</h3>
                                   			</td>
                                   		</tr>
                                    </c:if>
                                </table>
	                        </div>
	                        
							<!-- 페이징 태그 START -->
							<div class="bootstrap-pagination">
							<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
								<nav>
									<ul class="pagination justify-content-center">
										
									<%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>
										<li class="page-item">
											<a class="page-link" href="admin_memberList?searchType=${searchType }&keyword=${keyword }&pageNum=${pageInfo.pageNum - 1}">Previous</a>
										</li>
									<%} else{ %>
										<li class="page-item disabled">
											<a class="page-link" href="javascript:void(0)">Previous</a>
										</li>
									<%} %>
									
									<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
										<c:choose>
											<c:when test="${i eq pageInfo.pageNum }">
												<li class="page-item active">
													<a class="page-link" href="javascript:void(0)">${i } <span class="sr-only">(current)</span></a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="page-item">
													<a class="page-link" href="admin_memberList?searchType=${searchType }&keyword=${keyword }&pageNum=${i }">${i }</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>
										<li class="page-item">
											<a class="page-link" href="admin_memberList?searchType=${searchType }&keyword=${keyword }&pageNum=${pageInfo.pageNum + 1}">Next</a>
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

</body>

</html>