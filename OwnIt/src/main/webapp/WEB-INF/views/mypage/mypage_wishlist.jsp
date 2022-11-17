<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/vendor.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />
	<link
	  rel="stylesheet"
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
	/>
	<style type="text/css">
		.product-image > img {
			width: 300px;
			height: 300px;
		}
		
		#btn_remove {
	  	margin: 10px auto;
	  }
	</style>
    <title>Profile</title>
  </head>
  <body>

    <!-- header -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
<%--     <jsp:include page="../inc/cart_inTop.jsp"></jsp:include> --%>

    <!-- hero -->
<!--     <section class="hero hero-small bg-purple text-white"> -->
<!--       <div class="container"> -->
<!--         <div class="row gutter-2 gutter-md-4 align-items-end"> -->
<!--           <div class="col-md-6 text-center text-md-left"> -->
<!--             <h1 class="mb-0">Michael Campbell</h1> -->
<!--             <span class="text-muted">New York, USA</span> -->
<!--           </div> -->
<!--           <div class="col-md-6 text-center text-md-right"> -->
<!--             <a href="#!" class="btn btn-sm btn-outline-white">Sign out</a> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </section> -->



    <!-- listing -->
    <section class="pt-5" style="margin-top: 100px;">
      <div class="container">
        <div class="row gutter-4 justify-content-between">


          <!-- sidebar -->
          <jsp:include page="../inc/sidebar_mypage.jsp"></jsp:include>
          <!-- / sidebar -->

          <!-- content -->
		  <table class="table table-hover" style="width: 900px; text-align: center;">
			  <tr>
				  <th colspan="3">WishList</th>
			  </tr>
			  <tr>
				  <td style="width: 200px;"><img src="<%=request.getContextPath() %>/resources/img/demo/product-1.jpg" width="150" height="150"></td>
				  <td style="width: 500px; vertical-align: middle; text-align: left;"><a href="" style="color: black;">Apple AirPods Max Silver (Korean Ver.)</a></td>
				  <td style="width: 200px; vertical-align: middle;">
				    <input type="button" value="Add to Cart" class="btn btn-outline-dark btn-sm" style="width: 125px;">
				    <input type="button" id="btn_remove" value="Remove" class="btn btn-outline-dark btn-sm" style="width: 125px;">
				  </td>
			  </tr>
			  <tr>
				  <td style="width: 200px;"><img src="<%=request.getContextPath() %>/resources/img/demo/product-1.jpg" width="150" height="150"></td>
				  <td style="width: 500px; vertical-align: middle; text-align: left;"><a href="" style="color: black;">Apple iPhone 14 Pro Max 256GB Silver (Korean Ver.)</a></td>
				  <td style="width: 200px; vertical-align: middle;"">
				    <input type="button" value="Add to Cart" class="btn btn-outline-dark btn-sm" style="width: 125px;">
				    <input type="button" id="btn_remove" value="Remove" class="btn btn-outline-dark btn-sm" style="width: 125px;">
				  </td>
			  </tr>
		  </table>
          <!-- / content -->
        </div>
      </div>
    </section>
    <!-- listing -->



    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
  </body>
</html>