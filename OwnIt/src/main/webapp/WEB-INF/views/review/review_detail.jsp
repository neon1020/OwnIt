<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>review_detail</title>
    
    <script type="text/javascript">
    	var cnt = 1;
    	function changeLike() {
    		var like_none = document.getElementById("like_none");
    		if(cnt%2==1) {
	    		like_none.src = "resources/img/review/like_b.jpg"
    		} else {
    			like_none.src = "resources/img/review/like_none_b.jpg"
    		}
    		cnt++;
    	}
    </script>
    
    <style type="text/css">
	    .hero[class*="-small"] { padding-bottom: 1em; }
	    article { flex: 0 0 50%; width: 800px; margin: 20px auto; }
	    .card-post .card-body { width: 100%; }
	    .equal { height: 800px; width: 800px; }
	    .equal-50.equal::before { padding-top: 0px; }
	    .image-detail { width: 800px; height: 800px; background-size: cover; }
	    .profile img { width: 50px; height: 50px; border-radius: 10em; margin: 10px 5px; }
	    .eyebrow { text-transform: none; margin-left: 10px; font-size: 18px; font-weight: 700; letter-spacing: 0; }
	    .card-title img { width: 60px; height: 60px; border-radius: 1em; margin: 5px 5px; float: left; }
	    .card-title a { font-size: 15px; font-weight: 600; }
	    .card-post .card-title a:hover { color: #101010; }
	    .card-title .subject { margin: 10px 5px; width: 350px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis; float: left; }
	    .card-content { font-size: 18px; width: 800px; float: left; margin: 10px 5px; }
	    .like { width: 100%; float: left; margin: 10px 5px; }
	    .like img { margin: 0 5px 0 0; width: 30px; }
	    /* ********************************* 등록,수정,삭제 버튼 ********************************* */
	    .btn-primary { background-color: #FFF; border-color: #FFF; color: #101010; font-size: 20px; font-weight: 700; padding: 6px 14px; margin-left: 5px; }
	    .btn-primary:hover { background-color: #FFF; border-color: #FFF; color: #101010; }
	    .btn-primary:focus { background-color: #101010; border-color: #101010; color: #FFF; }
	    .btn-primary:not(:disabled):not(.disabled):active { background-color: #FFF; border-color: #FFF; color: #101010; }
	    .btn-primary:disabled { background-color: #101010; border-color: #101010; color: #FFF; }
	    .btn-primary:active { background-color: #101010; border-color: #101010; color: #FFF; }
	    .btn-primary.on { background-color: #101010; border-color: #101010; color: #FFF; }
	    /* ********************************* 댓글 ********************************* */
	    #component-1 { width: 800px; padding-top: 10px; margin-bottom: 50px; }
	    .profile_reply img { width: 40px; height: 40px; border-radius: 10em; margin: 10px 5px; }
	    .profile_reply .eyebrow { text-transform: none; margin: 0 10px; font-size: 15px; font-weight: 800; letter-spacing: 0; }
	    .btn-reply { background-color: #FFF; border-color: #101010; color: #101010; font-size: 14px; margin-left: 0;  }
	    .form-control:focus { border-color: #101010; }
	    /* ********************************* 삭제 모달창 ********************************* */
	    .btn-modal1 { width: 100%; background-color: #A6A6A6; border-color: #A6A6A6; color: #101010; border-radius: 0; padding: 0.9375rem 2.5rem; font-size: 14px; }
	    .btn-modal2 { width: 100%; background-color: #101010; border-color: #101010; color: #FFF; border-radius: 0; padding: 0.9375rem 2.5rem; font-size: 14px; }
    </style>
    
  </head>
  <body>

    <!-- header -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <jsp:include page="../inc/cart_inTop.jsp"></jsp:include>

    <!-- ********************************* 리뷰 ********************************* -->
    <section class="pt-0" style="margin-top:150px; padding-bottom: 10px;">
	    <article class="card card-post">
	      <div>
		      <div style="float: left; width: 300px; display: inline-block;">
		        <a class="profile" href="review_mystyle"><img src="resources/img/review/max4pf.jpg"><span class="eyebrow text-muted">min.nicha</span></a>
		      </div>
		      <div style="float: right; width: 450px; display: inline-block;">
		        <h4 class="card-title" style="float: right;"><a href="post.html"><img src="resources/img/review/iphone1dt.jpg"><div class="subject">Apple iPhone 13 128GB Starlight (Korean Ver.)<br>934,000원</div></a></h4>
		      </div>
		     </div>
	      <figure class="equal equal-50">
	        <img class="image-detail" style="background-image: url(resources/img/review/iphone3.jpg)">
	      </figure>
	      <div class="card-body">
	        <div class="like"><img src="resources/img/review/like_none_b.jpg" id="like_none" onclick="changeLike()">128&nbsp;&nbsp;<img src="resources/img/review/reply_b.jpg">3</div>
	        <h3 class="card-content">오프라인에서는 구하기 힘든 모델인데 역시 온잇에는 있더라구요! 만족스럽게 잘 구매했습니다~</h3>
	      </div>
	    </article>
    </section>
    
    <!-- ********************************* 댓글 ********************************* -->
    <section id="component-1">
      <div class="component">
        <table style="width: 780px;">
        <!-- ********************************* 필요한 부분 ********************************* -->
          <tr>
            <td style="width: 180px;"><a class="profile_reply" href="review_mystyle"><img src="resources/img/review/max1pf.jpg"><span class="eyebrow text-muted">xxxjini</span></a></td>
            <td style="width: 470px;">너무 예뻐요ㅠㅠㅠ</td>
            <td> <!-- ************* 댓글쓴이에게만 보이는 버튼 ************* -->
            	<button type="button" class="btn btn-primary btn-rounded btn-reply">수정</button>
            	<button type="button" class="btn btn-primary btn-rounded btn-reply" data-toggle="modal" data-target="#exampleModal-2">삭제</button>
            </td>
          </tr>
        <!-- ********************************* 필요한 부분 ********************************* -->
        
        <!-- ********************************* 버릴 부분 시작 ********************************* -->
          <tr>
            <td><a class="profile_reply" href="review_mystyle"><img src="resources/img/review/zflip1pf.jpg"><span class="eyebrow text-muted">jaebum_555</span></a></td>
            <td>인스타 아이디 알려주세요!!</td>
          </tr>
          <tr>
            <td><a class="profile_reply" href="review_mystyle"><img src="resources/img/review/max3pf.jpg"><span class="eyebrow text-muted">cool_mj01</span></a></td>
            <td>케이스 정보 알 수 있을까요?</td>
          </tr>
        <!-- ********************************* 버릴 부분 끝 ********************************* -->
        </table>
        <div class="form-group">
          <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="댓글을 남겨주세요.">
        </div> <!-- ***************************** 리뷰 글쓴이에게만 보이는 버튼 ***************************** -->
        <button type="button" class="btn btn-primary btn-rounded on" style="float: right;" data-toggle="modal" data-target="#exampleModal-1">삭제</button>
        <button type="button" class="btn btn-primary btn-rounded on" style="float: right;" onclick="location.href='review_modifyForm'">수정</button>
      </div>
     </section>
     
     <!-- ********************************* 리뷰 삭제 모달 ********************************* -->
     <div class="modal fade" id="exampleModal-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="text-align: center;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">리뷰 삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	      </div>
	      <div class="modal-body" style="font-size: 16px; font-weight: 700;">
	        <p>리뷰를 삭제 하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <div class="container-fluid">
	          <div class="row gutter-0">
	            <div class="col">
	              <button type="button" class="btn btn-primary btn-modal1" data-dismiss="modal">취소</button>
	            </div>
	            <div class="col">
	              <button type="button" class="btn btn-primary btn-modal2">삭제</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- ********************************* 댓글 삭제 모달 ********************************* -->
     <div class="modal fade" id="exampleModal-2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="text-align: center;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">댓글 삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	      </div>
	      <div class="modal-body" style="font-size: 16px; font-weight: 700;">
	        <p>댓글을 삭제 하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <div class="container-fluid">
	          <div class="row gutter-0">
	            <div class="col">
	              <button type="button" class="btn btn-primary btn-modal1" data-dismiss="modal">취소</button>
	            </div>
	            <div class="col">
	              <button type="button" class="btn btn-primary btn-modal2">삭제</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
  </body>
</html>