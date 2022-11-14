<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!--           	<h1 class="mb-0">Notice</h1> -->
			<table class="table table-bordered" style="margin-top: 20px; text-align: center; border-left: none; border-right: none;">
               <tbody>
                 <tr>
                   <td style="border-left: none; border-right: none; font-weight:bolder; text-align: left;">${notice.notice_category }&nbsp;&nbsp;&nbsp;${notice.notice_subject }</td>
                   <th width="200px" style="border-left: none; border-right: none;">Date&nbsp;&nbsp;&nbsp;${notice.notice_date }</th>
                   <th width="100px" style="border-left: none; border-right: none;">Read&nbsp;&nbsp;&nbsp;${notice.notice_readcount }</th>
                 </tr>
                 <tr>
                   <td colspan="4" style="border-left: none; border-right: none; text-align: left; height: 500px;">
					${notice.notice_content }
                   </td>
                 </tr>
               </tbody>
             </table>
				<div style="text-align: center;">
					<input type="button" value="목록" class="btn btn-dark" onclick="location.href='noticeList?pageNum=${param.pageNum}'">
				</div>
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