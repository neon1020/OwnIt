<%@page import="com.teamone.ownit.vo.ReplyPageInfo"%>
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
	<script src="resources/js/jquery-3.6.1.js"></script>
	<script type="text/javascript">
	
	// "답글 쓰기" 클릭 시 대댓글 입력창 추가
	function reply(idx, trIndex) {
		$("#reply_add" + trIndex).remove();
        
        //입력받는 창 등록
        var replyEditor = 
           '<tr id="reply_add" class="reply_reply" style="border-bottom: 1px solid #dddddd;">'+
           '   <td style="width: 20%; padding-bottom: 20px; padding-top: 20px;">'+
           '   </td>'+
           '   <td colspan="2" style="width: 760px; padding-bottom: 20px; padding-top: 20px;">'+
           '     <form action="writeEvent_re_Reply" method="post" style="width: 760px;">'+
           '	   <input type="hidden" name="member_idx" value="${sessionScope.sIdx }">'+
           '	   <input type="hidden" name="notice_idx" value="${notice.notice_idx }">'+
           '	   <input type="hidden" name="reply_re_ref" value="'+ idx +'">'+
           '	   <input type="hidden" name="replyListNum" value="${pageInfo.replyListNum }">'+
           '	   <input type="hidden" name="pageNum" value="${param.pageNum }">'+
           '       <input type="text" class="form-control" id="reply_content" name="reply_content" style="width: 590px; float: left;" aria-describedby="emailHelp" placeholder="댓글을 남겨주세요.">'+
           '       <button type="submit" name="add_re_Reply" style="width: 150px; margin-left: 20px; float: left;" class="btn btn-dark btn-rounded">답글 등록</button>'+
           '	 </form>'+
           '   </td>'+
           '</tr>';
             
            $('#reply_area tr:eq(' + trIndex + ')').after(replyEditor);
	}
	
	</script>
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
				<article class="col-lg-9 pl-lg-5">
					<h1 class="mb-0"></h1>
					<table class="table table-bordered" style="margin-top: 20px; text-align: center; border-left: none; border-right: none;">
						<tbody>
							<tr>
								<td style="border-left: none; border-right: none; font-size: 15px; font-weight: 550; color: black; text-align: left;">${notice.notice_category }&nbsp;&nbsp;&nbsp;${notice.notice_subject }</td>
								<th width="200px" style="font-size: 15px; color: black; border-left: none; border-right: none;">작성일&nbsp;&nbsp;&nbsp;${notice.notice_date }</th>
								<th width="150px" style="font-size: 15px; color: black; border-left: none; border-right: none;">조회&nbsp;&nbsp;&nbsp;${notice.notice_readcount }</th>
							</tr>
							<tr>
								<td colspan="4" style="border-left: none; border-right: none; text-align: left; height: 500px;">${notice.notice_content }</td>
							</tr>
						</tbody>
					</table>
					
					<!-- 이벤트 카테고리일 때 댓글 목록 출력 및 페이징 처리 -->
					<c:if test="${notice.notice_category eq '[이벤트]' }">
						<div class="form-group" style="width: 100%">
						    <!-- 댓글 등록 -->
						    <form action="writeEventReply" method="post">
						    	<input type="hidden" name="member_idx" value="${sessionScope.sIdx }">
						    	<input type="hidden" name="notice_idx" value="${notice.notice_idx }">
						    	<input type="hidden" name="replyListNum" value="${pageInfo.replyListNum }">
						    	<input type="hidden" name="pageNum" value="${param.pageNum }">
							    <input type="text" class="form-control" id="reply_content" name="reply_content" style="width: 82%; float: left;" aria-describedby="emailHelp" placeholder="댓글을 남겨주세요.">
							    <button type="submit" class="btn btn-dark btn-rounded" style="width: 150px; float: left; margin-left: 20px;">댓글 등록</button>
							</form>
						</div>
						
						<div class="component" style="margin-top: 80px; margin-bottom: 30px;">
							<!-- 댓글 목록 출력 -->
							<table id="reply_area">
								<c:choose>
									<c:when test="${listCount == 0 }">
										<tr>
											<td style="width: 1000px; text-align: center; padding-bottom: 20px; padding-top: 20px;">
												<b>작성된 댓글이 없습니다. 첫번째 댓글을 남겨주세요!</b>
											</td>
										</tr>
									</c:when>
									<c:when test="${listCount != 0 }">
										<c:forEach var="reply" items="${replyList }" varStatus="num">
											<tr style="border-bottom: 1px solid #dddddd;">
											  <td style="width: 20%; padding-bottom: 20px; padding-top: 20px;">
											  	<c:if test="${reply.reply_re_lev == 1 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ㄴ</c:if>
											    <a class="profile_reply" href="review_mystyle"><img src="resources/img/member/${reply.image_real_file1 }" width="25px" height="25px">
											    <span class="eyebrow text-muted" style="margin-left: 5px;">${reply.member_nickname }</span></a>
											  </td>
											  <td style="width: 590px; padding-bottom: 20px; padding-top: 20px;">${reply.reply_content }</td>
											  <td style="padding-bottom: 20px; padding-top: 20px;">
											  
											  	<!-- 본인 댓글일 때 삭제 버튼 표시 -->
											  	<c:if test="${reply.member_idx eq sessionScope.sIdx }">
												    <button type="button" name="writeReply" style="width: 150px; margin-left: 20px;" class="btn btn-outline-dark btn-rounded" data-toggle="modal" data-target="#exampleModal${num.index }">댓글 삭제</button>
												    
											    	<!-- modal 시작 -->
													<div class="modal fade" id="exampleModal${num.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <div class="modal-dialog" role="document">
													    <div class="modal-content" style="text-align: center;">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLabel">댓글 삭제</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
													      </div>
													      <div class="modal-body" style="font-size: 16px; font-weight: 700;">
													        <p>댓글을 삭제 하시겠습니까?</p>
													      </div>
													      <div class="modal-footer">
													        <div class="container-fluid">
													          <div class="row gutter-0">
													            <div class="col">
													              <button type="button" class="btn btn-block btn-outline-dark" data-dismiss="modal">취소</button>
													            </div>
													            <div class="col">
													              <button type="button" class="btn btn-block btn-dark" 
													                onclick="location.href='event_replyDelete?notice_idx=${notice.notice_idx }&pageNum=${param.pageNum }&replyListNum=${pageInfo.replyListNum }&reply_idx=${reply.reply_idx }'">댓글 삭제</button>
													            </div>
													          </div>
													        </div>
													      </div>
													    </div>
													  </div>
													</div>
													<!-- modal 끝 -->
												</c:if>
												
												<!-- 다른 사람 댓글일 때 답글 작성 버튼 표시 -->
												<c:if test="${reply.member_idx ne sessionScope.sIdx && reply.reply_re_lev != 1 }">
													<button type="button" id="reply_add" name="re_reply" onclick="reply('${reply.reply_re_ref }', '${num.index }'); this.onclick='';" style="width: 150px; margin-left: 20px;" class="btn btn-dark btn-rounded">답글 작성</button>
												</c:if>
											  </td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</table>
						</div>
						
						<!-- 페이징 태그 START -->
				        <div class="row" style="width: 945px;">
				          <div class="col" style="width: 945px;">
				            <nav class="d-inline-block" style="margin-left: 400px;">
				              <ul class="pagination">
				              	<%ReplyPageInfo pageInfo = (ReplyPageInfo)request.getAttribute("pageInfo"); %>
				              	<li class="page-item active"><input class="page-link" type="button" value="&laquo;" <%if(pageInfo.getReplyListNum() > pageInfo.getStartPage()) {%>onclick="location.href='noticeDetail?notice_idx=${notice.notice_idx }&pageNum=${param.pageNum }&replyListNum=${pageInfo.replyListNum - 1}'"<%} %>></li>
								<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
									<c:choose>
										<c:when test="${i eq pageInfo.replyListNum }"><li class="page-item"><a class="page-link">${i }</a></li></c:when>
										<c:otherwise><li class="page-item active"><a class="page-link" href="noticeDetail?notice_idx=${notice.notice_idx }&pageNum=${param.pageNum }&replyListNum=${i }">${i }<span class="sr-only">(current)</span></a></li></c:otherwise>
									</c:choose>
								</c:forEach>
								<li class="page-item active"><input class="page-link" type="button" value="&raquo;" <%if(pageInfo.getReplyListNum() < pageInfo.getMaxPage()) {%>onclick="location.href='noticeDetail?notice_idx=${notice.notice_idx }&pageNum=${param.pageNum }&replyListNum=${pageInfo.replyListNum + 1}'"<%} %>></li>
				              </ul>
				            </nav>
				          </div>
				        </div>
						<!-- 페이징 태그 END -->
					</c:if>
					
					<!-- 목록 버튼 -->
					<div style="text-align: center;">
						<input type="button" value="목록" class="btn btn-dark" onclick="location.href='noticeList?pageNum=${param.pageNum}'">
					</div>
				</article>
				<!-- content -->
				
				</div>
			</div>
		</div>

	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>

	<script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
	</body>
</html>