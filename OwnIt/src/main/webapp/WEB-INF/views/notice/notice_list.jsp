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
    <jsp:include page="../inc/cart_inTop.jsp"></jsp:include>

    <!-- listing -->
    <div class="py-10">
      <div class="container">
        <div class="row justify-content-between">


          <!-- sidebar -->
          <jsp:include page="../inc/sidebar_notice.jsp"></jsp:include>


          <!-- content -->
          <article class="col-lg-9 pl-lg-5">
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
			<table class="table table-bordered" style="margin-top: 20px; text-align: center; border-left: none; border-right: none;">
               <thead>
                 <tr>
                   <th scope="col" width="30px" style="border-left: none; border-right: none;">No</th>
                   <th scope="col" width="30px" style="border-left: none; border-right: none;">Category</th>
                   <th scope="col" style="border-left: none; border-right: none;">Subject</th>
                   <th scope="col" width="150px" style="border-left: none; border-right: none;">Date</th>
                   <th scope="col" width="70px" style="border-left: none; border-right: none;">Read</th>
                 </tr>
               </thead>
               <!-- JSTL 과 EL 활용하여 글목록 표시 -->
               <tbody>
               		<c:forEach var="notice" items="${noticeList }">
		                 <tr>
		                   <th scope="row" style="border-left: none; border-right: none;">${notice.notice_idx }</th>
		                   <th scope="col" width="30px" style="border-left: none; border-right: none;">${notice.notice_category }</th>
		                   <td style="border-left: none; border-right: none; text-align: left;"><a style="color: black;"href="noticeDetail?notice_idx=${notice.notice_idx }&pageNum=${pageInfo.pageNum}">${notice.notice_subject }</a></td>
		                   <td style="border-left: none; border-right: none;">${notice.notice_date }</td>
		                   <td style="border-left: none; border-right: none;">${notice.notice_readcount }</td>
		                 </tr>
               		</c:forEach>    
               </tbody>
             </table>
				<!-- 페이징 태그 START -->
				<div class="bootstrap-pagination" style="text-align: center;">
					<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
					<input type="button" class="btn btn-light btn-sm" value="&laquo;" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='noticeList?pageNum=${pageInfo.pageNum - 1}'"<%} %>>
					<!-- 시작페이지(startPage) 부터 끝페이지(endPage) 까지 페이지 번호 표시 -->
					&nbsp;
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						<!-- 현재 페이지 번호와 i 값이 같을 경우 하이퍼링크 없이 페이지 번호 표시 -->
						<!-- 아니면, pageNum 파라미터를 i 값으로 설정하여 BoardList.bo 서블릿 주소 링크 -->
						<c:choose>
							<c:when test="${i eq pageInfo.pageNum }">${i }</c:when>
							<c:otherwise><a href="noticeList?pageNum=${i }">${i }</a></c:otherwise>
						</c:choose>
										&nbsp;
					</c:forEach>
					<!-- 현재 페이지번호가 끝 페이지번호보다 작을 때 현재 페이지번호 + 1 값으로 페이지 이동 -->
					<input type="button" class="btn btn-light btn-sm" value="&raquo;" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='noticeList?pageNum=${pageInfo.pageNum + 1}'"<%} %>>
				</div>	
				<!-- 페이징 태그 END -->
          </article>

        </div>
      </div>
    </div>


    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
  </body>
</html>