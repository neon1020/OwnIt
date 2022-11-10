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
                   <th colspan="4" style="border-left: none; border-right: none;">[공지사항] 11월 홈페이지 운영 일정 안내</th>
                 </tr>
                 <tr>
                   <td style="border-left: none; border-right: none;"> </td>
                   <td style="border-left: none; border-right: none;"> </td>
                   <th width="200px" style="border-left: none; border-right: none;">Date&nbsp;&nbsp;&nbsp;2022-10-31</th>
                   <th width="100px" style="border-left: none; border-right: none;">Read&nbsp;&nbsp;&nbsp;131</th>
                 </tr>
                 <tr>
                   <td colspan="4" style="border-left: none; border-right: none; text-align: left;">
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