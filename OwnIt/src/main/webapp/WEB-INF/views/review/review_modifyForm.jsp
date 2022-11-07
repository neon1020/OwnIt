<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>review_modify</title>
    
    <script src="resources/js/jquery-3.6.1.js"></script>
    <script>
	    $(document).ready(function (e){
		    $("#imageFile").on("change", function(event) {
		        var file = event.target.files[0];
		        var reader = new FileReader(); 
		        reader.onload = function(e) {
		            $("#preview").attr("src", e.target.result);
		        }
		        reader.readAsDataURL(file);
		    });
	    });  
    </script>
    
    <style type="text/css">
	    .pl-lg-5, .px-lg-5 { flex: 0 0 35%; padding: 0 !important; margin: 150px auto; }
	    .form-control { width: 600px; margin: 10px auto; }
	    .form-control:focus { border-color: #101010; }
	    #exampleInputEmail1 { width: 530px; height: 60px; }
	    /* 사진업로드 */
	    img #preview { width: 200px; height: 200px; }
	    input[type=file]::file-selector-button, .submit { background-color: #101010; border-color: #101010; color: #FFF; border-radius: 1em; font-size: 14px; padding: 6px 14px; }
    </style>
    
  </head>
  <body>

    <!-- header -->
    <jsp:include page="../inc/top.jsp"></jsp:include>

    <!-- 페이지 제목 -->
    <article class="col-lg-9 pl-lg-5" style="width: 600px;">
      <h1 class="mb-0">Review</h1>

      <!-- **************************** 리뷰 작성 부분 **************************** -->
      <section id="component-1">
        <div class="component">
          <div class="form-group">
          	<img src="resources/img/review/iphone1dt.jpg" id="itemdt" style="width: 60px; height: 60px; margin-right: 10px; float: left; background-size: cover;">
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Apple iPhone 13 128GB Starlight (Korean Ver.)" readonly="readonly">
            <textarea rows="10" cols="30" class="form-control" placeholder="오프라인에서는 구하기 힘든 모델인데 역시 온잇에는 있더라구요! 만족스럽게 잘 구매했습니다~"></textarea>
          </div>
          <div class="filebox clearfix">
		    <img src="resources/img/review/iphone3.jpg" id="preview" style="width: 120px; height: 120px; background-size: cover;">
			<input type="file" id="imageFile">
		  </div>
        </div>
      </section>
      	<div style="float: right;">
      	  <input type="submit" class="submit" value="리뷰수정">
      	</div>
      <!-- **************************** 리뷰 작성 부분 **************************** -->
	</article>
	
    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
  </body>
</html>