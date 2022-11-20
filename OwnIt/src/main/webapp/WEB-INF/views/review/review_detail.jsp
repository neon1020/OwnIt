<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      
      function forwardReply() {
<%--     	    <%if(sId != null) {%> --%>
   	      var content = document.getElementById("reply_content").value;
   	      location.href = "review_reply?member_idx=25&review_idx=${review.review_idx }&reply_content=" + content;
<%--     	    <%} else {%> --%>
//     	      alert("댓글은 로그인 후 사용 가능합니다!");
<%--     	    <%}%> --%>
    	  }
    </script>
    
    <style type="text/css">
      .hero[class*="-small"] { padding-bottom: 1em; }
      article { flex: 0 0 50%; width: 800px; margin: 20px auto; }
      .card-post .card-body { width: 100%; }
      .equal { height: 800px; width: 800px; }
      .equal-50.equal::before { padding-top: 0px; }
      .image-detail { width: 800px; height: 800px; object-fit: cover; }
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
            <a class="profile" href="review_mystyle?member_idx=${review.member_idx }&review_idx=${review.review_idx }"><img src="resources/img/member/${review.member_image }"><span class="eyebrow text-muted">${review.member_nickname }</span></a>
          </div>
          <div style="float: right; width: 450px; display: inline-block;">
            <h4 class="card-title" style="float: right;"><a href="product_detail?product_idx=${review.product_idx }"><img src="resources/img/product/${review.product_image }"><div class="subject">${review.product_name }<br><fmt:formatNumber value="${review.product_buy_price}" pattern="#,###"/>&nbsp;원</div></a></h4>
          </div>
        </div>
        <div class="owl-carousel text-center" data-nav="true" data-margin="20" data-loop="false" data-dots="true">
          <c:forEach var="image" items="${reviewImage }">
            <c:if test="${not empty image.review_image1 }">
	            <div class="equal equal-50">
	              <img class="image-detail" src="resources/img/review/${image.review_image1 }">
	            </div>
	          </c:if>
          </c:forEach>
        </div>
        <div class="card-body">
          <div class="like"><img src="resources/img/review/like_none_b.jpg" id="like_none" onclick="changeLike()">128&nbsp;&nbsp;<img src="resources/img/review/reply_b.jpg">${review.review_reply_count }</div>
          <h3 class="card-content">${review.review_content }</h3>
        </div>
      </article>
    </section>
    
    <!-- ********************************* 댓글 ********************************* -->
    <section id="component-1">
      <div class="component">
        <table style="width: 780px;">
        <!-- ********************************* 댓글 목록 ********************************* -->
        <c:forEach var="re" items="${reply }">
          <tr>
            <td style="width: 180px;"><a class="profile_reply" href="review_mystyle"><img src="resources/img/member/${re.image_real_file1 }"><span class="eyebrow text-muted">${re.member_nickname }</span></a></td>
            <td style="width: 470px;">${re.reply_content }</td>
            <td> <!-- ************* 댓글쓴이에게만 보이는 버튼 ************* -->
<%--             <c:if test="${(sessionScope.sIdx == re.member_idx) && not empty sessionScope.sIdx }"> --%>
              <button type="button" class="btn btn-primary btn-rounded btn-reply">수정</button>
              <button type="button" class="btn btn-primary btn-rounded btn-reply" data-toggle="modal" data-target="#exampleModal-2">삭제</button>
<%--             </c:if> --%>
            </td>
          </tr>
        </c:forEach>
        
        <!-- ********************************* 댓글 작성 ********************************* -->
        </table>
        <div class="form-group">
          <input type="text" class="form-control" id="reply_content" id="exampleInputEmail1" style="width: 700px; float: left;" aria-describedby="emailHelp" placeholder="댓글을 남겨주세요.">
          <button type="button" class="btn btn-primary btn-rounded btn-reply" onclick="forwardReply()" style="float: left; margin: 7px auto;">댓글등록</button>
        </div> <!-- ***************************** 리뷰 글쓴이에게만 보이는 버튼 ***************************** -->
        <c:if test="${(sessionScope.sId == review.member_id) && not empty sessionScope.sId }">
	        <button type="button" class="btn btn-primary btn-rounded on" style="float: right;" data-toggle="modal" data-target="#exampleModal-1">삭제</button>
	        <button type="button" class="btn btn-primary btn-rounded on" style="float: right;" onclick="location.href='review_modifyForm?review_idx=${review.review_idx}'">수정</button>
	      </c:if>
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
                <button type="button" class="btn btn-primary btn-modal2" onclick="location.href='review_delete?review_idx=${review.review_idx}'">삭제</button>
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