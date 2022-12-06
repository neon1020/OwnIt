<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mbti_style.css">
</head>
<body class="container">

	<!-- 테스트 시작 화면 -->
	<article class="start">
	
		<h1 class="main-title mt-5 text-center">MBTI로 알아보는 전자기기 사용유형</h1>
		<h2 class="sub-title mt-3 text-center">나는 전자기기를 어떻게 활용할까?</h2>
		
		<img class="updown-slash mt-5" src="<%=request.getContextPath() %>/resources/img/mbti/up-slash.png">
        <div class="start-cover mt-3 mb-3">
            <button type="button" class="btn-start btn btn-success" onclick="start();">테스트 시작하기</button>
        </div>
        <img class="updown-slash" src="<%=request.getContextPath() %>/resources/img/mbti/down-slash.png">
		
	</article>
	
	<!-- 문제 화면 -->
	<article class="question">
	
		<div class="progress mt-5">
			<div class="progress-bar progress-bar-striped bg-success" role="progressbar" aria-label="Success striped example" style="width: calc(100/12*1%)"></div>
		</div>
		
		<img class="mt-5 slash-element" src="<%=request.getContextPath() %>/resources/img/mbti/slash-element.png">
        <h2 id="title" class="question-content text-center mt-4 mb-4">문제</h2>
        <img class="slash-element" src="<%=request.getContextPath() %>/resources/img/mbti/slash-element.png">
        <input id="type" type="hidden" value="EI">
        
        <div class="rectangle mt-5"></div>
        
        <button id="A" type="button" class="btn-answer btn btn-primary pt-5 pb-5">대답A</button>
        <div class="mid-rectangle"></div>
        <button id="B" type="button" class="btn-answer btn btn-primary pt-5 pb-5">대답B</button>
        <div class="rectangle"></div>
		
	</article>
	
	<!-- 결과 화면 -->
	<article class="result">
		
		<img class="updown-slash mt-5" src="<%=request.getContextPath() %>/resources/img/mbti/dark-slash.png">
        <span class="result-message mt-4 mb-4">MBTI로 알아보는 전자기기 사용유형</span>
        <img class="updown-slash" src="<%=request.getContextPath() %>/resources/img/mbti/up-slash.png">
        
        <img id="img" class="rounded mt-5" src="">
        <h2 id="nickName" class="result-animal text-center mt-4 mb-4">이름</h2>
        
        <img class="updown-slash" src="<%=request.getContextPath() %>/resources/img/mbti/down-slash.png">
        <h3 id="explain" class="result-explain text-center mt-4">설명</h3>
        <div class="rectangle mt-4 mb-2"></div>
		
		<h4 id="product" class="result-animal text-center mt-4 mb-3">[OwnIt 추천 아이템]</h4>
		<h6 id="detail" class="result-animal text-center mb-2">당신</h6>
		<a id="link" href="" style="margin: 0 auto;"><img id="img_product" class="rounded mt-1" src="" style="width: 200px;"></a>
		
	</article>
	
	<!-- 점수 계산 -->
	<input type="hidden" id="EI" value="0">
	<input type="hidden" id="SN" value="0">
	<input type="hidden" id="TF" value="0">
	<input type="hidden" id="JP" value="0">

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

	<!-- 문제/결과 관련 js파일 불러오기 -->
	<script src="<%=request.getContextPath() %>/resources/js/mbti_text.js"></script>
	<script type="text/javascript">
		
		// 문제 번호	
		var num = 1;
	
		function start() {
			// 시작화면 사라지기
			$(".start").hide();
			// 문제 화면 나타나기
			$(".question").show();
			next();
		}
			
		$("#A").click(function() {
			// 문제 유형 가져오기(EI/SN/TF/JP)
			var type = $("#type").val();
			// 그 유형의 value 값
			var preValue = $("#" + type).val();
			// 그 유형의 value 값에 1 더해서 저장
			$("#" + type).val(parseInt(preValue) + 1);
			next();
		});
		
		$("#B").click(function() {
			next();
		});
		
		
		// 다음 문제로 넘어가는 함수
		function next() {
			
			if(num == 13){
				$(".question").hide();
                $(".result").show();
                
                var mbti = "";
                
                // 결과 계산
                ($("#EI").val() < 2) ? mbti += "I" : mbti += "E";
                ($("#SN").val() < 2) ? mbti += "N" : mbti += "S";
                ($("#TF").val() < 2) ? mbti += "F" : mbti += "T";
                ($("#JP").val() < 2) ? mbti += "P" : mbti += "J";
                
//                 alert(mbti);
                
                $("#img").attr("src", result[mbti]["img"]);
                $("#nickName").html(result[mbti]["nickName"]);
                $("#explain").html(result[mbti]["explain"]);
                $("#detail").html(result[mbti]["detail"]);
                $("#img_product").attr("src", result[mbti]["img_product"]);
                $("#link").attr("href", result[mbti]["link"]);
			} else{
				// 진행 바
				$(".progress-bar").attr('style', 'width: calc(100/12*' + num + '%)');
				
				$("#title").html(q[num]["title"]);
				$("#type").val(q[num]["type"]);
				$("#A").html(q[num]["A"]);
				$("#B").html(q[num]["B"]);
				num++;
				// console.log(num);
				
			}
			
		}
	
	</script>
</body>
</html>