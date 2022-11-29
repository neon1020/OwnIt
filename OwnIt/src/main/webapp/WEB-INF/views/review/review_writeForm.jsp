<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
<link rel="stylesheet" href="resources/css/vendor.css" />
<link rel="stylesheet" href="resources/css/style.css" />

<title>review_write</title>
  
<script src="resources/js/jquery-3.6.1.js"></script>
<script>
	$(function(){
    // 업로드 이미지 미리보기
		$("#AddImgs").change(function(e){
		  $('#Preview').empty();
		  var files = e.target.files;
		  var arr = Array.prototype.slice.call(files);
		  // 유효성 검사
		  for(var i = 0; i < files.length; i++){
			  // 파일형식 체크하는 checkExtension()함수 호출
	      if(!checkExtension(files[i].name)){
          return false;
	      }
			  // 파일 갯수 체크
	      if(files.length > 3){
    	    alert('업로드 파일은 3개를 초과할 수 없습니다.');
          $("#AddImgs").val("");  //파일 초기화
          return false;
	      }
		  }
		  preview(arr);
		  // 파일형식 체크
		  function checkExtension(fileName){
	      var regex = new RegExp("(.*?)\.(exe|hwp|zip|alz|txt)$");
	      if(regex.test(fileName)){
          alert('파일형식을 확인해주세요.');
          $("#AddImgs").val(""); // 파일 초기화
          return false;
	      }
	      return true;
		  }
		  // 미리보기 구현
			function preview(arr){
				var fileNum = 0;
				arr.forEach(function(f){
					// div에 이미지 추가
					var str = '<li class="ui-state-default">';
					if(f.type.match('image.*')){
						// 파일을 읽기 위한 FileReader객체 생성
						var reader = new FileReader(); 
						arr.push(f);
						reader.onload = function(e){ 
						// 파일 읽어들이기 성공시 호출되는 이벤트 핸들러
						  str += '<img src="'+e.target.result+'" id="img' + fileNum +'" title="'+f.name+'" width=80 height=80>';
						  str += '<span class="delBtn" id="file' + fileNum + '" onclick="delImg(\'file' + fileNum + '\')">x</span>';
						  str += '</li>';
						  $(str).appendTo('#Preview');
						  fileNum++;
						}
					reader.readAsDataURL(f);
					} 
				});
			}
		});
	});
	//이미지 삭제
	function delImg(fileNum){
		var dataTransfer = new DataTransfer();
		var no = fileNum.replace(/[^0-9]/g, "");
    var files = $('#AddImgs')[0].files;
    var arr = Array.prototype.slice.call(files);
    arr.splice(fileNum, 1);
    arr.forEach(files => { dataTransfer.items.add(files); });
    $('#AddImgs')[0].files = dataTransfer.files;
    $('#' + fileNum).remove();
    $('#img' + no).remove();
	};
</script>
  
<style type="text/css">
	.pl-lg-5, .px-lg-5 { flex: 0 0 35%; padding: 0 !important; margin: 150px auto; }
	.form-control { width: 600px; margin: 10px auto; }
	.form-control:focus { border-color: #101010; }
	#exampleInputEmail1 { width: 530px; height: 60px; }
	.itemdt { width: 60px; height: 60px; margin-right: 10px; float: left; background-size: cover; }
	.submit { background-color: #101010; border-color: #101010; color: #FFF; border-radius: 1em; font-size: 14px; padding: 6px 14px; }
  /* 사진업로드 */
  input[type=file]::file-selector-button { display: none; }
  .inputFile, #Preview, #Preview li { float:left }
	.inputFile { margin-bottom: 10px; width: 100px; }
	.addImgBtn { text-align: center; width: 80px; height: 80px; line-height: 71px; background-color: #fff; 
	             color: #b7b7b7; border: 2px solid #b7b7b7; font-size: 35px; padding: 0; }
	#Preview { margin-left: 20px; width: 300px; }
	#Preview li { margin-left: 10px; margin-bottom: 10px; position: relative; border: 1px solid #ececec; cursor:move }
	.delBtn { position: absolute; top: 0; right: 0; font-size: 13px; background-color: #000; color: #fff; width: 18px; height: 18px;
            line-height: 16px; display: inline-block; text-align: center; cursor: pointer; }    
</style>
  
</head>
<body>
	<!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

  <!-- ********************************* 페이지 제목 ********************************* -->
	<article class="col-lg-9 pl-lg-5" style="width: 600px;">
	<h1 class="mb-0">Review</h1>
	  <!-- ******************************* 리뷰 작성 부분 ****************************** -->
		<form action="review_WritePro" method="post" enctype="multipart/form-data">
      <input type="hidden" name="product_idx" value="${product.product_idx }" />
      <input type="hidden" name="member_idx" value="${product.member_idx }" />
      <input type="hidden" name="order_buy_idx" value="${param.order_buy_idx }" />
      
			<section id="component-1">
				<div class="component">
					<div class="form-group">
            <!-- ************************ 상품 정보 출력 **************************** -->
						<img src="resources/img/product/${product.product_image }" class="itemdt">
						<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="${product.product_name }" readonly>
						<!-- ************************ 리뷰 내용 작성 **************************** -->
						<textarea rows="10" cols="30" name="review_content" class="form-control" placeholder="내용을 입력하세요" required></textarea>
					</div>
					<div class="filebox clearfix">
            <!-- *********************** 파일 업로드 버튼 *************************** -->
						<div class="inputFile">
							<label for="AddImgs" class="addImgBtn">+</label>
							<input type="file" name="files" id="AddImgs" class="upload-hidden" accept=".jpg, .png, .gif" multiple required>
						</div>
						<!-- ********************** 파일 이미지 미리보기 ************************** -->
            <ul id="Preview" class="sortable"></ul>
					</div>
        </div>
			</section>
			<div style="float: right;">
        <input type="submit" class="submit" value="리뷰등록">
			</div>
		</form>
	</article>

  <!-- footer -->
  <jsp:include page="../inc/footer.jsp"></jsp:include>

  <script src="resources/js/vendor.min.js"></script>
  <script src="resources/js/app.js"></script>
</body>
</html>