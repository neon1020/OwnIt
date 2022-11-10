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
               <thead>
                 <tr>
                   <th scope="col" width="30px" style="border-left: none; border-right: none;">No</th>
                   <th scope="col" style="border-left: none; border-right: none;">Subject</th>
                   <th scope="col" width="150px" style="border-left: none; border-right: none;">Date</th>
                   <th scope="col" width="70px" style="border-left: none; border-right: none;">Read</th>
                 </tr>
               </thead>
               <tbody>
                 <tr>
                   <th scope="row" style="border-left: none; border-right: none;">3</th>
                   <td style="border-left: none; border-right: none; text-align: left;"><a href="noticeDetail" style="color: black;">[이벤트] 행운의 룰렛 돌리기 이벤트</a></td>
                   <td style="border-left: none; border-right: none;">2022-10-31</td>
                   <td style="border-left: none; border-right: none;">330</td>
                 </tr>
                 <tr>
                   <th scope="row" style="border-left: none; border-right: none;">2</th>
                   <td style="border-left: none; border-right: none; text-align: left;"><a href="noticeDetail" style="color: black;">[이벤트] 주간 출석체크 이벤트 당첨자 발표</a></td>
                   <td style="border-left: none; border-right: none;">2022-10-31</td>
                   <td style="border-left: none; border-right: none;">250</td>
                 </tr>
                 <tr>
                   <th scope="row" style="border-left: none; border-right: none;">1</th>
                   <td style="border-left: none; border-right: none; text-align: left;"><a href="noticeDetail" style="color: black;">[공지사항] 11월 홈페이지 운영 일정 안내</a></td>
                   <td style="border-left: none; border-right: none;">2022-10-31</td>
                   <td style="border-left: none; border-right: none;">131</td>
                 </tr>
               </tbody>
             </table>
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