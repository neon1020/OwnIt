<%@page import="com.teamone.ownit.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/vendor.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />
	<style type="text/css">
		table > tr, td {
			border-left: 0;
			border-right: 0;
		}
	</style>
    <title>Notice List</title>
	</head>
	<body>

	<!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

    <!-- listing -->
    <div class="py-10">
      <div class="container">
				<div class="row justify-content-between">

				<!-- sidebar -->
				<jsp:include page="../inc/sidebar_notice.jsp"></jsp:include>
         
        <!-- content -->  
				<div class="col-lg-9">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">
								<!-- 검색 --> 
								<form action="noticeList" method="get" style="margin-top: 30px;">
									<div class="input-group" style="float: right; width: 200px; height: 30px;">
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
								<!-- 검색 -->
								<!-- 공지사항 목록 --> 
								<table style="text-align: center;" class="table table-hover">
									<thead>
										<tr>
											<th scope="col" colspan="3" style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">제목</th>
											<th scope="col" width="200px" style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">작성일</th>
											<th scope="col" width="50px" style="font-size: 15px; color: black; padding-left: 0px; padding-right: 0px; vertical-align:middle;">조회</th>
										</tr>
									</thead>
									<!-- JSTL 과 EL 활용하여 글목록 표시 -->
									<tbody>
										<c:forEach var="notice" items="${noticeList }">
										<tr>
											<th scope="row" style="font-size:14px; color: black; width: 90px; padding-left: 0px; padding-right: 0px; vertical-align:middle;">${notice.notice_idx }</th>
											<th scope="col" style="font-size:14px; color: black; width: 90px; padding-left: 0px; padding-right: 0px; vertical-align:middle;">${notice.notice_category }</th>
											<td style="text-align:left; font-size: 14px; width: 600px; float: left; text-overflow: ellipsis; overflow: hidden; white-space:nowrap;">
												<a style="color: black;"href="noticeDetail?notice_idx=${notice.notice_idx }&pageNum=${pageInfo.pageNum}">${notice.notice_subject }</a>
											</td>
											<td style="font-size:14px; color: black; width: 90px; padding-left: 0px; padding-right: 0px; vertical-align:middle;">${notice.notice_date }</td>
											<td style="font-size:14px; color: black; width: 160px; padding-left: 0px; padding-right: 0px; vertical-align:middle;">${notice.notice_readcount }</td>
										</tr>
										</c:forEach>    
									</tbody>
								</table>
								<!-- 공지사항 목록 -->
							</div>
						</div>
					</div>
        </div>
        <!-- /content -->
        
				<!-- 페이징 태그 START -->
        <div class="row" style="margin-left: 680px;">
          <div class="col">
            <nav class="d-inline-block">
              <ul class="pagination">
              	<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
              	<li class="page-item active"><input class="page-link" type="button" value="&laquo;" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='noticeList?pageNum=${pageInfo.pageNum - 1}'"<%} %>></li>
									<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
										<c:choose>
											<c:when test="${i eq pageInfo.pageNum }"><li class="page-item"><a class="page-link">${i }</a></li></c:when>
											<c:otherwise><li class="page-item active"><a class="page-link" href="noticeList?pageNum=${i }">${i }<span class="sr-only">(current)</span></a></li></c:otherwise>
										</c:choose>
									</c:forEach>
								<li class="page-item active"><input class="page-link" type="button" value="&raquo;" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='noticeList?pageNum=${pageInfo.pageNum + 1}'"<%} %>></li>
              </ul>
            </nav>
          </div>
        </div>						
				<!-- 페이징 태그 END -->
						
    		</div>
    	</div>
    </div>
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>

	<script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
	</body>
</html>