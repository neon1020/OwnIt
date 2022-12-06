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
  
<script src="resources/js/jquery-3.6.1.js"></script>
<script>
  // 좋아요가 있는지 확인한 값을 heartval에 저장
  var heartval = ${heart};
  $(document).ready(function(){
    // 좋아요가 되어 있을 때
    if(heartval > 0) {
      $("#like_none").prop("src", "resources/img/review/like2_b.jpg");
      $(".heart").prop('name', heartval)
    } else { // 좋아요가 안되어 있을 때
      $("#like_none").prop("src", "resources/img/review/like_none_b.jpg");
      $(".heart").prop('name', heartval)
    }  
    // 좋아요 버튼을 클릭 시 실행되는 코드
    $(".heart").on("click", function(){
      var that = $(".heart");
      var sendData = {'review_idx' : '${review.review_idx}', 'heart' : that.prop('name')};
      $.ajax({
        url     : 'heart',
        type    : 'POST',
        data    : sendData,
        success : function(data){
          that.prop('name',data);
          if(data == 1) {
            $("#like_none").prop("src", "resources/img/review/like2_b.jpg");
            $(".lcnt").load(location.href + " .lcnt");
          } else {
            $("#like_none").prop("src", "resources/img/review/like_none_b.jpg");
            $(".lcnt").load(location.href + " .lcnt");
          }
        }
      });
    });
  });
</script>
<script type="text/javascript">
  var sIdx = "${sessionScope.sIdx }";
  // 로그인 한 회원만 좋아요 가능
  function changeLike() {
    if(sIdx == "") {
      alert('로그인 후 이용 가능합니다.');
      return;
    }
  }
  // 회원만 댓글 작성 가능한 유효성 검사 & 회원이 댓글 등록 시 댓글 insert
  function forwardReply() {
    var content = $("#reply_content").val();
    if(sIdx == "") {
      alert('로그인 후 이용 가능합니다.');
      return;
    } else {
      if(content.length > 0) {
        $.ajax({
          url       : 'review_reply',
          data      : {
            'member_idx' : '${sessionScope.sIdx }',
            'review_idx' : '${review.review_idx }',
            'reply_content' : content
          },success : function(status) {
            if(status == "success") {
              selelctReplyList();
              $("#reply_content").val("");
            }
          }
        })
      }
    }
  }
  // 대댓글 입력창
  function reReply(ref) {
    var index = ref.id.split('_')[1];
    $("#reReply_"+index).css('display', 'table-cell');
  }
  // 대댓글 
  function reComment(ref) {
    var index = ref.id.split('_')[1];
    var content = $("#exampleInputEmail1_"+index).val();
    if(sIdx == "") {
      alert('로그인 후 이용 가능합니다.');
      return;
    } else {
      if(content.length > 0) {
        $.ajax({
          url       : 'review_replies',
          data      : {
            'member_idx'    : '${sessionScope.sIdx }',
            'review_idx'    : '${review.review_idx }',
            'reply_content' : content,
            'reply_re_ref'  : index
          },success : function(status) {
            if(status == "success") {
              $("#reply_content").val("");
              selelctReplyList();
            }
          }
        })
      }
    }
  }
  // 댓글 목록 조회
  function selelctReplyList() {
    $.ajax({
      type    : "GET",
      url     : 'replyList',
      dataType: "json",
      data    : { review_idx : ${review.review_idx } },
      success : function(reply) {
        let result = "";
        for(var i = 0; i < reply.length; i++){
          if((reply[i].reply_re_lev) > 0) {
            result += "<tr><td style='width: 230px;'><img id='replyImage' src='resources/img/review/reply_icon.jpg'>";
            result += "<a class='profile_reply' href='review_mystyle?member_idx="+reply[i].member_idx+"'><img src='resources/img/member/"+reply[i].image_real_file1+"'>";
            result += "<span class='eyebrow text-muted'>"+reply[i].member_nickname+"</span>";
            result += "</a></td><td style='width: 400px;'>"+reply[i].reply_content+"</td><td style='float: right;'>";
          } else {
            result += "<tr><td style='width: 230px;'><a class='profile_reply' href='review_mystyle?member_idx="+reply[i].member_idx+"'>";
            result += "<img src='resources/img/member/"+reply[i].image_real_file1+"'><span class='eyebrow text-muted'>"+reply[i].member_nickname+"</span>";
            result += "</a></td><td style='width: 400px;'>"+reply[i].reply_content+"</td>";
            result += "<td style='float: right;'><button type='button' id='reComment_"+reply[i].reply_re_ref+"' class='btn btn-primary btn-rounded btn-reply' onclick='reReply(this)'>답글</button></td>";
          }
          if((sIdx == reply[i].member_idx) && sIdx.length > 0) {
            result += "<td style='float: right;'><button type='button' class='btn btn-primary btn-rounded btn-reply' data-toggle='modal' data-target='#exampleModal-2"+reply[i].reply_re_ref+"'>삭제</button>";
          } 
          result += "<div class='modal fade' id='exampleModal-2"+reply[i].reply_re_ref+"' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'>";
          result += "<div class='modal-dialog' role='document'><div class='modal-content' style='text-align: center;'>";
          result += "<div class='modal-header'><h5 class='modal-title' id='exampleModalLabel'>댓글 삭제</h5>";
          result += "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>×</span></button></div>";
          result += "<div class='modal-body' style='font-size: 16px; font-weight: 700;'><p>댓글을 삭제 하시겠습니까?</p></div>";
          result += "<div class='modal-footer'><div class='container-fluid'><div class='row gutter-0'><div class='col'>";
          result += "<button type='button' class='btn btn-primary btn-modal1' data-dismiss='modal'>취소</button></div>";
          result += "<div class='col'><button type='button' class='btn btn-primary btn-modal2'";
          result += "onclick='location.href='review_replyDelete?review_idx="+reply[i].review_idx+'&reply_re_ref='+reply[i].reply_re_ref+"''>삭제</button>";
          result += "</div></div></div></div></div></div></div></td></tr>";
          result += "<tr><td id='reReply_"+reply[i].reply_re_ref+"' colspan='3' style='padding-left: 180px; display: none;'><div class='form-group'>";
          result += "<input type='text' class='form-control' id='exampleInputEmail1_"+reply[i].reply_re_ref+"' name='reReplyContent' style='width: 500px; float: left;' aria-describedby='emailHelp' placeholder='댓글을 남겨주세요.'>";
          result += "<button type='button' class='btn btn-primary btn-rounded btn-reply' id='reComment"+reply[i].reply_re_ref+"' style='float: left; margin: 7px auto;'>답글등록</button></div></td></tr>";
        }
        $("#replyList").html(result);
        location.reload();
      }
    });
  }
//    var content = document.getElementById("reply_content").value;
//    location.href = "review_reply?member_idx=${sessionScope.sIdx }&review_idx=${review.review_idx }&reply_content=" + content;
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
  .card-content { font-size: 18px; width: 800px; float: left; margin: 10px 5px; border: 1px solid #D5D5D5; padding: 30px 30px; }
  .like { width: 100%; float: left; margin: 10px 5px; }
  .like img { margin: 0 5px 0 0; width: 30px; }
  /* **************************** 등록, 수정, 삭제 버튼 ************************** */
  .btn-primary { background-color: #FFF; border-color: #FFF; color: #101010; 
                 font-size: 20px; font-weight: 700; padding: 6px 14px; margin-left: 5px; }
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
  .btn-reply { background-color: #FFF; border-color: #101010; color: #101010; font-size: 14px; margin-left: 0; margin: 7px auto; }
  .form-control:focus { border-color: #101010; }
  #replyImage { width: 40px; height: 40px; }
  /* ****************************** 삭제 모달창 ****************************** */
  .btn-modal1 { width: 100%; background-color: #A6A6A6; border-color: #A6A6A6; color: #101010; 
                border-radius: 0; padding: 0.9375rem 2.5rem; font-size: 14px; }
  .btn-modal2 { width: 100%; background-color: #101010; border-color: #101010; color: #FFF; 
                border-radius: 0; padding: 0.9375rem 2.5rem; font-size: 14px; }
</style>
  
</head>
<body>
  <!-- header -->
  <jsp:include page="../inc/top.jsp"></jsp:include>

  <!-- ********************************* 리뷰 ********************************* -->
  <section class="pt-0" style="margin-top:150px; padding-bottom: 10px;">
    <article class="card card-post">
      <div>
        <!-- ********************** 작성자 프로필 출력 *************************** -->
        <div style="float: left; width: 300px; display: inline-block;">
          <a class="profile" href="review_mystyle?member_idx=${review.member_idx }"><img src="resources/img/member/${review.member_image }"><span class="eyebrow text-muted">${review.member_nickname }</span></a>
        </div>
        <!-- *********************** 상품 정보 출력 **************************** -->
        <div style="float: right; width: 450px; display: inline-block;">
          <h4 class="card-title" style="float: right;"><a href="product_detail?product_idx=${review.product_idx }"><img src="resources/img/product/${review.product_image }"><div class="subject">${review.product_name }<br><fmt:formatNumber value="${review.product_buy_price}" pattern="#,###"/>&nbsp;원</div></a></h4>
        </div>
      </div>
      <!-- ************************* 리뷰 이미지 출력 *************************** -->
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
        <div class="like">
        <!-- ************************* 리뷰 좋아요 *************************** -->
          <a class="heart"><img src="" id="like_none" onclick="changeLike()"></a><span class="lcnt">${likeCount}</span>&nbsp;&nbsp;
          <img src="resources/img/review/reply_b.jpg">${replyCount}
        </div>
        <h3 class="card-content">${review.review_content }</h3>
      </div>
    </article>
  </section>

  <!-- ********************************* 댓글 ********************************* -->
  <section id="component-1">
    <div class="component">
      <table style="width: 780px;" id="replyList">
      <!-- *************************** 댓글 목록 출력 **************************** -->
      <c:forEach var="re" items="${reply }" varStatus="vs">
        <tr>
        <c:choose>
          <c:when test="${re.reply_re_lev > 0 }">
            <td style="width: 230px;">
              <img id="replyImage" src="resources/img/review/reply_icon.jpg">
              <a class="profile_reply" href="review_mystyle?member_idx=${re.member_idx }"><img src="resources/img/member/${re.image_real_file1 }">
              <span class="eyebrow text-muted">${re.member_nickname }</span></a>
            </td>
            <td style="width: 400px;">${re.reply_content }</td>
          </c:when>
          <c:otherwise>
            <td style="width: 230px;">
              <a class="profile_reply" href="review_mystyle?member_idx=${re.member_idx }"><img src="resources/img/member/${re.image_real_file1 }">
              <span class="eyebrow text-muted">${re.member_nickname }</span></a>
            </td>
            <td style="width: 400px;">${re.reply_content }</td>
            <td style="float: right;">
              <button type="button" id="reComment_${re.reply_re_ref }" class="btn btn-primary btn-rounded btn-reply" onclick="reReply(this)">답글</button>
            </td>
          </c:otherwise>
        </c:choose>
          <td style="float: right;"> <!-- ******************* 댓글쓴이에게만 보이는 버튼 ******************* -->
          <c:if test="${(sessionScope.sIdx == re.member_idx) && not empty sessionScope.sIdx }">
            <button type="button" class="btn btn-primary btn-rounded btn-reply" data-toggle="modal" data-target="#exampleModal-2${vs.index}">삭제</button>
          </c:if>
            <!-- ********************************* 댓글 삭제 모달 ********************************* -->
            <div class="modal fade" id="exampleModal-2${vs.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            onclick="location.href='review_replyDelete?review_idx=${review.review_idx}&reply_idx=${re.reply_idx }'">삭제</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </td>
        </tr>
        <tr><td id="reReply_${re.reply_re_ref }" colspan="3" style="padding-left: 180px; display: none;">
          <div class="form-group">
            <input type="text" class="form-control" id="exampleInputEmail1_${re.reply_re_ref }" name="reReplyContent" style="width: 500px; float: left;" aria-describedby="emailHelp" placeholder="댓글을 남겨주세요.">
            <button type="button" class="btn btn-primary btn-rounded btn-reply" id="reComment_${re.reply_re_ref }" onclick="reComment(this)" style="float: left; margin: 7px auto;">답글등록</button>
          </div>
        </td></tr>
      </c:forEach>
      <!-- **************************** 댓글 작성 ****************************** -->
      </table>
      <div class="form-group">
        <input type="text" class="form-control" id="reply_content" id="exampleInputEmail1" style="width: 680px; float: left; margin-right: 10px;" aria-describedby="emailHelp" placeholder="댓글을 남겨주세요.">
        <button type="button" class="btn btn-primary btn-rounded btn-reply" onclick="forwardReply()" style="float: left; margin: 10px auto;">댓글등록</button>
      </div> <!-- ******************* 리뷰 글쓴이에게만 보이는 버튼 ***************** -->
      <c:if test="${(sessionScope.sId == review.member_id) && not empty sessionScope.sId }">
        <button type="button" class="btn btn-primary btn-rounded on" style="float: right;" data-toggle="modal" data-target="#exampleModal-1">삭제</button>
        <button type="button" class="btn btn-primary btn-rounded on" style="float: right;" onclick="location.href='review_modifyForm?review_idx=${review.review_idx}&member_idx=${review.member_idx}'">수정</button>
      </c:if>
    </div>
  </section>
 
<!-- ********************************* 리뷰 삭제 모달 ********************************* -->
<div class="modal fade" id="exampleModal-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="text-align: center;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body" style="font-size: 16px; font-weight: 700;">
        <p>리뷰를 삭제 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <div class="container-fluid">
          <div class="row gutter-0">
            <div class="col">
              <button type="button" class="btn btn-block btn-outline-dark" data-dismiss="modal">취소</button>
            </div>
            <div class="col">
              <button type="button" class="btn btn-block btn-dark" onclick="location.href='review_delete?review_idx=${review.review_idx}'">삭제</button>
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