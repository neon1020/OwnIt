<%@page import="com.teamone.ownit.vo.Product_DetailPageInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
      <!-- meta -->
      <link rel="shortcut icon" href="">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
    <script src="resources/js/jquery-3.6.1.js"></script>
    <title>Product</title>
    <style type="text/css">
    	.like > a {
    		color : black;
    	}
    	#btntext{
    		font-size: 15px;
    	}
    	#btnimg {
    		width: 45px;
    		height: 45px;
    	}
		.col-lg-4 { 
			flex: 0 0 25%; 
			max-width: 25%; 
			padding: 10px; 
		}
		.card-post { 
			height: 500px; 
		}
		.card-post .card-body { 
			width: 260px; 
		}
 	    .equal { 
 	    	height: 260px; width: 260px; border-radius: 0.5em; 
 	    }
	    .profile img { 
	   	 	width: 30px; height: 30px; border-radius: 10em; margin: 5px 5px; 
	    }
	    .eyebrow { 
	  	  	text-transform: none; margin-left: 10px;
	    }
	    .card-title img { 
	   	 	width: 50px; height: 50px; border-radius: 1em; margin: 5px 5px; float: left; 
	    }
	    .card-title a { 
	   	 	font-size: 13px; font-weight: 600; 
	    }
	    .card-post .card-title a:hover { 
	   	 	color: #101010; 
	    }
	    .card-title .subject { 
		    margin: 5px 5px; 
		    width: 190px; 
		    white-space: nowrap; 
		    overflow:hidden; 
		    text-overflow: ellipsis; 
		    float: left; 
	    }
	    .card-content { 
		    font-size: 14px; 
		    width: 100%; 
		    float: left; 
		    margin: 5px; 
		    text-overflow: ellipsis; 
		    overflow: hidden; 
		    display: -webkit-box; 
		    -webkit-box-orient: vertical; 
		    -webkit-line-clamp: 2;
	    }
	    .like { 
		    width: 100%; 
		    float: left; 
		    margin: 10px 5px; 
	    }
	    .like img { 
	   	 	margin: 0 5px 0 0; 
	    }
	    /* ?????? ?????? ?????? ?????? */
	    label { 
		     background-color: #FFF;
		     border-color: #FFF; 
		     color: #101010; 
		     border-radius: 1em; 
		     font-size: 20px; 
		     font-weight: 700; 
		     padding: 6px 14px; 
	     }
	    .btn-check { 
	    	opacity: 0; 
	    }
	    input[type=radio]:checked + label {
		     background-color: #101010; 
		     border-color: #101010; 
		     color: #FFF; 
	     }
	    span{
	    	font-size: 14px;
	    }
	    #title1{
	    	font-size: 13px; font: bold;
	    }
	    #title2{
	    	font-size: 13px; font: bold;
	    	padding: 5px;
	    }
	    #btn1{
	   		background: #F06464; 
	   		border-radius: 15px; 
	   		color: white; 
	   		width: 210px;
	    }
	    #btn2{
	    	background: #46BD7B; 
	    	border-radius: 15px; 
	    	color: white; 
	    	width: 210px;
	    	margin-left: 10px;
	    }
	    #btn3{
	    	background: white; 
	    	border: 0.5px black solid;
	    	border-radius: 15px; 
	    	color: black;
	    	width: 210px;
	    	margin-top: 15px;
	    	
	    }
	    #btn4{
	    	background: white; 
	    	border: 0.5px black solid;
	    	border-radius: 15px; 
	    	color: black;
	    	width: 210px;
	    	margin-top: 15px;
	    	margin-left: 10px;
	    }
	    .product_cart > a:hover {
			cursor: pointer;
		}
/*  	    #btn4:hover{  */
/*  	    	background: black;  */
/* 	    	color: white;  */
/* 	    }  */
	    #btnimg:hover{
	    	cursor: pointer;
	    
	    }
	    #detailNotice{
	    	font: bold;
	    	color: black;
	    }
	    #noticeImg{
	    	width: 35px;
	    	height: 35px;
	    	float: left;
	    }
	    #noticePadding{
	    
	    }
    </style>
  </head>
<!-- kakao sdk ?????? -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


<script type="text/javascript">
  var cbChecked = "${product.product_idx}:1:${product.product_buy_price}/";
  // SDK??? ????????? ?????????. ????????? ?????? JavaScript ?????? ????????? ?????????.
  Kakao.init('1782262d4bfba22efdc59a399005f94e');

  // SDK ????????? ????????? ???????????????.
  console.log(Kakao.isInitialized());
  function kakaoShare() {
	  Kakao.Link.sendDefault({
	      objectType: 'feed',
	      content: {
	        title: '${product.product_brand}',
	        description: '${product.product_name}',
	        imageUrl:
	          'http://itwillbs16.cafe24.com/resources/img/product/${product.image_real_file1}',
	        link: {
	          mobileWebUrl: 'http://itwillbs16.cafe24.com/product_detail?product_idx=${product.product_idx}',
	          webUrl: 'http://itwillbs16.cafe24.com/product_detail?product_idx=${product.product_idx}',
	        },
	      },
	      social: {
	        likeCount: ${wishCount},  //???????????? ????????????
	        commentCount: ${listCount},  //?????? ??????
	      },
	      buttons: [
	        {
	          title: '????????? ??????',  //??? ?????? ?????? 
	          link: {
	            mobileWebUrl: 'http://itwillbs16.cafe24.com/product_detail?product_idx=${product.product_idx}',  //?????? ?????? ??? ?????? ??????
	            webUrl: 'http://itwillbs16.cafe24.com/product_detail?product_idx=${product.product_idx}',
	          },
	        },
	      ],
	    })
  }
  
  // ???????????? ??????
  function cartVTN(idx){
		if(${empty sessionScope.sId}) {
			alert("????????? ??? ?????????????????????");
			return;
		} else {
			debugger;
			var index = idx.id;
			$.ajax({
				url:'addCart',
				type:'GET',
				data:{
					product_idx:index,
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(result){
					if(result.length == 5 || result == 'Added' ) {
						alert("??????????????? ????????? ???????????????.");
					} else {
						alert("?????? ??????????????? ?????? ???????????????.");
					}
				checkCart();
				return;
				}
			});
		}
  }
  function emptySid(){
		  location.href="member_login";
  }
</script>
  <body>

    <!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

   <!-- product  ?????? ??????????????? -->
    <section class="hero pt-5" style="margin-top: 150px;">
      <div class="container">
        <div class="row gutter-2 gutter-md-4 justify-content-between">
			
          <div class="col-lg-7">
            <div class="row gutter-1 justify-content-between">
              <div class="col-lg-10 order-lg-2">
                <div class="owl-carousel gallery" data-slider-id="1" data-thumbs="true" data-nav="true">
                  <figure class="equal" style="width:100%; height: 100%">
                  <!-- ????????? ???????????? ?????? ????????? -->
                    <a class="image" href="resources/img/product/${product.image_real_file1 }" 
                      style="background-image: url(resources/img/product/${product.image_real_file1 });">
                    </a>
                  </figure>
                  <figure class="equal" style="width:100%; height: 100%">
                    <a class="image" href="resources/img/product/${product.image_real_file2 }" 
                      style="background-image: url(resources/img/product/${product.image_real_file2 });">
                    </a>
                  </figure>
                  <figure class="equal" style="width:100%; height: 100%">
                    <a class="image" href="resources/img/product/${product.image_real_file3 }" 
                      style="background-image: url(resources/img/product/${product.image_real_file3 });">
                    </a>
                  </figure>
                </div>
              </div>
              
              <!--  ?????? ?????? ?????? ????????? 3??? -->
              <div class="col-lg-2 text-center text-lg-left order-lg-1">
                <div class="owl-thumbs" data-slider-id="1">
                    <span class="owl-thumb-item"><img src="resources/img/product/${product.image_real_file1 }" alt=""></span>
                    <span class="owl-thumb-item"><img src="resources/img/product/${product.image_real_file2 }" alt=""></span>
                    <span class="owl-thumb-item"><img src="resources/img/product/${product.image_real_file3 }" alt=""></span>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-5 mb-5 mb-lg-0">
            <div class="row">
              <div class="col-12">
                <h4 class="item-title">${product.product_brand }</h4>
              <div style="float: right;">
                <ul>
                  <li class="nav-item dropdown">
                    <a data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                   		<img id="btnimg" src="https://cdn-icons-png.flaticon.com/512/2894/2894457.png" style="width: 30px; height: 30px;">
                    </a>
                    <ul class="dropdown-menu" style="width: 50px;">
                      <li>
                        <a href="javascript:kakaoShare()" id="kakaotalk-sharing-btn">
                        <img id="btnimg" src="resources/img/product/detailKakao.png"><span style="font-size: 13px; color: black;"> ???????????? ??????</span></a>
                      </li>
                    </ul>
                  </li>
                </ul>
                </div>
                    
             					    <p>${product.product_name }</p>
                
                <!-- ?????? ?????? ??????-->
                <c:choose>
                	<c:when test="${product.product_left_count == 0 or product.product_left_count.equals('') }">
               		   <button id="btn1" type="button" disabled="disabled" class="btn" onclick="location.href='order_buyAgree?product_idx=${product.product_idx}'" >
		                	<p>
		                		???????????? | ??????
		                	</p>
		                </button>
                	</c:when>
                	<c:otherwise>
	                	<button id="btn1" type="button" class="btn" onclick="location.href='order_buyAgree?cbChecked=${product.product_idx}:1:${product.product_buy_price}/'" >
		                	<p>
		                		?????? | <fmt:formatNumber value="${product.product_buy_price }" pattern="#,###"/> ???
		                	</p>
		                </button>
                	</c:otherwise>
                </c:choose>
                <c:choose>
                	<c:when test="${empty sessionScope.sId }">
                		<button id="btn2" type="button" class="btn" onclick="emptySid()" >
							<p>
								?????? | <fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/> ???
							</p>
						</button>
                	</c:when>
                	<c:otherwise>
						<button id="btn2" type="button" class="btn" onclick="location.href='order_sellAgree?product_idx=${product.product_idx}'" >
							<p>
								?????? | <fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/> ???
							</p>
						</button>
                	</c:otherwise>
                </c:choose>
				
		            </div>
           		 </div>
				
            <div class="row">
              <div class="col-12">
              
              <!--  ???????????? ?????? -->
               <table class="table">
					<tr>
						<td>
							<span id="title1">
								????????????
							</span><br>
							<span>
								${product.product_model_num }
							</span>
						</td>
						<td>
							<span id="title1">
								??????<br>
							</span>
							<span>
								${product.product_color }
							</span>
						</td>
						<td>
							<span id="title1">
								?????????<br>
							</span>
							<span>
								<fmt:formatNumber value="${product.product_release_price }" pattern="#,###"/> ???
							</span>
						</td>
					</tr>
				</table>
				
				
				<!-- ????????? ?????? -->
				<div>
			      <div class="container">
			        <div class="row gutter-2 gutter-md-4">
			          <div class="col-md-12 col-lg-12">
			            <div class="accordion accordion-minimal" id="accordion-2">
			              <div class="card">
			                <div class="card-header" id="heading-2-1">
			                  <h2 class="mb-0">
			                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-2-1" aria-expanded="false" aria-controls="collapse-2-1">
			                      <span id="title1">?????? ?????? ??????</span>
			                    </button>
			                  </h2>
			                </div>
			                <div id="collapse-2-1" class="collapse" aria-labelledby="heading-2-1" data-parent="#accordion-2">
			                  <div class="card-body"  id="title1" >
			                 	 OwnIt??? ????????? ????????? ?????? ????????? ???????????? ?????? ???????????? ????????????.
			                 	 <br>?????? ????????? ???????????? ????????? ????????? ????????? ??????????????? ????????? ????????? ?????? ????????? ????????????.<br>
							     <br>[???????????? ??????]<br>
								 <br>- ???????????? ?????? ????????? ?????? ??? ????????? ????????? ????????? Ownit??? ?????? ????????? ???????????????. ?????? ????????? ????????? ?????? ????????? 95??? ????????? ???????????????.<br>
								 <br>- ??????(?????? 11:59??????) ???????????? ?????? ?????? ???????????? ?????? ????????? ???????????????. (?????? ??? ?????????, ????????????, ????????? ?????? ??? ??????????????? ???????????? ????????? ??? ????????????. ???????????? ??????
			                  </div>
			                </div>
			              </div>
			              <div class="card">
			                <div class="card-header" id="heading-2-2">
			                  <h2 class="mb-0">
			                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-2" aria-expanded="false" aria-controls="collapse-2-2">
			                      <span id="title1">?????? ??????</span>
			                    </button>
			                  </h2>
			                </div>
			                <div id="collapse-2-2" class="collapse" aria-labelledby="heading-2-2" data-parent="#accordion-2">
			                  <div class="card-body" id="title1">
			                    ???????????? ????????? ??????????????? ???????????? ?????? ???????????? ????????? ????????? ????????? ????????? ????????? ???????????????.<br>
			                    <br>- ????????????????????? ????????? ????????? ???????????? ?????????, ??????????????? ???????????? ?????? ???????????? ???????????? ????????????.<br>
								<br>- ?????? ???????????? ????????? ???????????? ????????? ????????? ???????????? ?????????, ??????, ?????? ??? ?????? ?????? ???????????????.
			                  </div>
			                </div>
			              </div>
			              <div class="card">
			                <div class="card-header" id="heading-2-3">
			                  <h2 class="mb-0">
			                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-3" aria-expanded="false" aria-controls="collapse-2-3">
			                      <span id="title1">?????? ??????/??????/?????? ??????</span>
			                    </button>
			                  </h2>
			                </div>
			                <div id="collapse-2-3" class="collapse" aria-labelledby="heading-2-3" data-parent="#accordion-2">
			                  <div class="card-body" id="title1">
			                     OwnIt??? ?????? ????????? ???????????? ???????????? ???????????? ????????? ???????????? ??????????????? ???????????? ????????? ???????????????.<br>
								<br>- ?????? ???????????? ????????? ?????? ??????/??????/????????? ??????????????????.<br>
								<br>- ????????? ????????? ???????????? ?????? ???????????? OwnIt?????? ???????????? ?????? ??? ????????????.<br>
								<br>- ?????? ?????? ???, ????????? ?????? ?????? OwnIt ??????????????? ?????????????????? ????????????.
			                  </div>
			                </div>
			              </div>
			              <div class="card-body" id="title2">
			              		<div style="display: block; width: 50px; height: 255px; float: left; margin-top: 15px;">
			              			<img id="noticeImg" src="https://cdn-icons-png.flaticon.com/512/6811/6811217.png">
			              			<img id="noticeImg" src="https://cdn-icons-png.flaticon.com/512/46/46389.png" style="margin-top: 50px;">
			              			<img id="noticeImg" src="https://cdn-icons-png.flaticon.com/512/3363/3363959.png" style="margin-top: 50px;">
			              		</div>
			                     <span id="detailNotice">100% ?????? ??????</span>
								<br>
								<span id="detailNotice">Ownit</span>?????? ????????? ????????? ????????? ?????? ??????, ???????????? 3?????? ???????????????.
								<br><br>
								<span id="detailNotice">????????? ?????? ??????</span>
								<br>
								?????? ????????? ??????????????? ????????? ???, ????????? ????????? ????????? ???????????? ???????????? ?????? ????????? ???????????????.
								<br>
								<br><br>
								<span id="detailNotice">?????? ?????? ?????????</span>
								<br>
								????????? ????????? ????????? ????????? <span id="detailNotice">Ownit</span>??? ?????? ?????? ???????????? ????????? ????????? ???????????????.
		                  </div>
			            </div> 
			          </div>
			        </div>
			      </div>
			    </div>
			    <!--  ????????? ?????? ??? -->
    			
    			<!-- ??????????????? ?????? ??????(??????) -->
				<div>
					<div style="display: inline;"class="product_cart" onclick="cartVTN(this)" id="${product.product_idx }">
					<button id="btn4" class="btn">
						<p>
							<span >
		                      ??????????????? ??????
		                    </span>
						</p>
					</button>
					</div>
					<form action="mypage_addWish" method="post" style="width: 220px; display: inline; margin-left: 10px;">
					<c:if test="${not empty sessionScope.sId }">
						<input type="hidden" name="member_idx" value="${sessionScope.sIdx }" />
					</c:if>
					  <input type="hidden" name="member_idx" value="0" />	
					  <input type="hidden" name="product_idx" value="${product.product_idx }" />
							<button id="btn3" type="submit" class="btn">
								<p>
									<c:choose>
										<c:when test="${isContainedInWish eq 0 }">
											<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
					  					<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/></svg>
										</c:when>
										<c:otherwise>
											<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
											<path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/></svg>							
										</c:otherwise>
									</c:choose>
									???????????? | <fmt:formatNumber value="${wishCount }" pattern="#,###"/>
								</p>
							</button>
						</form>
							
	              </div>
              </div>
            </div>
            
         
            
          </div>
        </div>
      </div>
    </section>
	<hr>
	
	

    <script type="text/javascript">
//     ?????? ??????????????? ????????? ?????? / ?????? ?????? ????????? keyword ???????????? ajax ??????
    	function onclick1(pageNum){ // ????????? ???????????????
    		let keyword = ""; // string ?????? ?????????
    		if($("#btnradio1").is(":checked")){ 		// ?????????
    			keyword = "new";
    		}else if($("#btnradio2").is(":checked")){	//?????????
    			keyword = "reply";
    		}else if($("#btnradio3").is(":checked")){	//?????????
    			keyword = "star";
    		}
    		$.ajax({
    			url: 'reviewChange',
    			type: 'get',
    			contentType:'application/json;charset=utf-8',
    			dataType:'json',
    			data: {'keyword' : keyword,
    				   'product_idx' : ${product.product_idx},
    				   'pageNum2' : pageNum },
    			success : function(review) { // ????????? ?????? ?????????
    				var changeR = "";
    				var changePage = "";
    				var page = review[0].pageNum2;
    				var start = review[0].startPage;
    				var end = review[0].endPage;
    				var max = review[0].maxPage;
			  		 changePage += "<nav class='d-inline-block'><ul class='pagination'>";
			  		 if(page > start){
			  			 changePage += "<li class='page-item active'><input class='page-link' type='button' value='??????' onclick='onclick1("+ (page - 1) +")'></li>";
			  		 } else{
			  			changePage += "<li class='page-item active'><input class='page-link' type='button' value='??????'></li>";
			  		 }
					  for(var i = start; i < (end + 1); i++){
						  if(i == page){
							  changePage +=	"<li class='page-item'><a class='page-link'>"+i+"<span class='sr-only'>(current)</span></a></li>";
						  }else{
							  changePage +=	"<li class='page-item active'><a class='page-link' href='javascript:onclick1("+(i)+")'>"+i+"<span class='sr-only'>(current)</span></a></li>";
						  }
					  }
				  	  if(page < max	){
				  		  changePage += "<li class='page-item active'><input class='page-link' type='button' value='??????' onclick='onclick1("+ (page + 1)+")'></li>";
				  	  }else{
				  		changePage += "<li class='page-item active'><input class='page-link' type='button' value='??????'></li>";
				  	  }
			  		changePage +="</ul></nav>";
			  		
			  		for(var i = 1; i < review.length; i++){
					let link = "javascript:onclick2('"+ review[i].review_idx + "," + review[i].heartImg + "," + review[i].style_like_count +","+page+"')";
    				var buyprice = review[i].product_buy_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						changeR +="<div class='col-md-6 col-lg-4'><article class='card card-post'><figure class='equal equal-50'>";
						changeR +="<a class='image image-fade' href='review_detail?review_idx="+review[i].review_idx+"'><img src='resources/img/review/"+review[i].review_image1+"'>";
						changeR +="</a></figure><div class='card-body'>";
						changeR +="<a class='profile' href='review_mystyle?member_idx="+review[i].member_idx+"&review_idx="+review[i].review_idx+"'>";
						changeR +="<img src='resources/img/member/"+review[i].member_image+"'>";
						changeR +="<span class='eyebrow text-muted'>"+review[i].member_nickname+"</span></a>";
						changeR +="<h3 class='card-content'>"+review[i].review_content+"</h3>";
						changeR += "<div class='like'id='change"+review[i].review_idx+"'><a href="+link+"><img src='resources/img/review/" + review[i].heartImg + "'>" + review[i].style_like_count + "&nbsp;&nbsp;</a>";
						changeR +="<img src='resources/img/review/reply.jpg'>"+review[i].review_reply_count+"</div><h4 class='card-title'>";
						changeR +="<a href='product_detail?product_idx="+review[i].product_idx+"'>";
						changeR +="<img src='resources/img/product/"+review[i].product_image+"'>";
						changeR +="<div class='subject'>"+review[i].product_name+"<br>"+ buyprice +"&nbsp;???</div></a>";
						changeR +="</h4></div></article></div>";
			  		}
					$("#reviewchange").html(changeR);
					$("#pageChange").html(changePage);
    			}  // ????????? =review
    		});// ajax
    	}
    	
    	// ?????? ????????? ?????????
    	function onclick2(heartImgReviewIdx){
    		var sIdx = "${sessionScope.sIdx }";
    		if(sIdx == "") {
    		      alert('????????? ??? ?????? ???????????????.');
    		      return;
    		}
			var review_idx = heartImgReviewIdx.split(',')[0];
			var heartImg = heartImgReviewIdx.split(',')[1];
			var style_like_count = heartImgReviewIdx.split(',')[2];
			var page = heartImgReviewIdx.split(',')[3];
			$.ajax({
				url: 'heartChange',
    			type: 'get',
    			contentType:'application/json;charset=utf-8',
    			dataType:'json',
    			data: {'heartImg' : heartImg,
    				   'review_idx' : review_idx,
    				   'style_like_count' : style_like_count},
    			success : function(review) {
					onclick1(page)
    			}
			});
			
    	}
    	
    </script>
    
    <c:if test="${not empty reviewList}">
    <!-- STYLE ?????? -->
	 <section class="hero hero-small" id="review">
      <div class="container">
        <div class="row">
          <div class="col text-center">
            <h3>&nbsp;&nbsp; review<span style="font-size: 15px;">(${listCount })</span></h3>
          </div>
        </div>
      </div>
      <br>
    <!-- ?????? ?????? -->
      <div class="container" >
        <div class="row">
          <div class="col text-center">
           	<input type="radio" class="btn-check" name="btnradio" id="btnradio1"  checked onclick="onclick1(1)">
 			<label id="btntext" for="btnradio1">??????</label>
          	<input type="radio" class="btn-check" name="btnradio" id="btnradio3" onclick="onclick1(1)">
           	<label id="btntext" for="btnradio3">??????</label>
 			<!-- ????????? ?????? 11-23 -->
<!--  			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" onclick="onclick1()"> -->
<!--  			<label id="btntext" for="btnradio2">??????</label> --> 
          </div>
        </div>
      </div>
    </section>
    <!--  ?????? ?????? ??? -->
    <%Product_DetailPageInfoVO pageInfo = (Product_DetailPageInfoVO)request.getAttribute("pageInfo"); %>
    
    <section class="pt-0" style="width: 1350px; padding: 100px 100px 100px 100px;">
      <div class="container">
        <div class="row masonry gutter-3" id="reviewchange">
          <c:forEach var="review" items="${reviewList }">
          <!-- ajax ????????? ?????? ?????? -->
	          <div class="col-md-6 col-lg-4">
	            <article class="card card-post">
	              <figure class="equal equal-50">
	                <a class="image image-fade" href="review_detail?review_idx=${review.review_idx }"><img src="resources/img/review/${review.review_image1 }"></a>
	              </figure>
	              <div class="card-body">
	              	<a class="profile" href="review_mystyle?member_idx=${review.member_idx }&review_idx=${review.review_idx }"><img src="resources/img/member/${review.member_image }"><span class="eyebrow text-muted">${review.member_nickname }</span></a>
	                <h3 class="card-content">${review.review_content }</h3>
	                <div class="like" id="change${review_idx }"><a href="javascript:onclick2('${review.review_idx },${review.heartImg },${review.style_like_count },${pageInfo.pageNum2 }')"><img src="resources/img/review/${review.heartImg }">${review.style_like_count }&nbsp;&nbsp;</a><img src="resources/img/review/reply.jpg">${review.review_reply_count }</div>
	                <h4 class="card-title"><a href="product_detail?product_idx=${product.product_idx }"><img src="resources/img/product/${review.product_image }"><div class="subject">${review.product_name }<br><fmt:formatNumber value="${review.product_buy_price}" pattern="#,###"/>&nbsp;???</div></a></h4>
	              </div>
	            </article>
	          </div>
          <!-- ??? -->
        </c:forEach>
          
        </div>
        
        
        <!-- ????????? -->
        
		<div class="row">
              	
          <div class="col" id="pageChange" style="text-align: center;">
            <nav class="d-inline-block">
              <ul class="pagination">
              	<li class="page-item active"><input class="page-link" type="button" value="??????" <%if(pageInfo.getPageNum2() > pageInfo.getStartPage()) {%>onclick="onclick1(${pageInfo.pageNum2 - 1})"<%} %>></li>
				<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${i eq pageInfo.pageNum2 }"><li class="page-item"><a class="page-link">${i }</a></li></c:when>
						<c:otherwise><li class="page-item active"><a class="page-link" href="javascript:onclick1(${i })">${i }<span class="sr-only">(current)</span></a></li></c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item active"><input class="page-link" type="button" value="??????" <%if(pageInfo.getPageNum2() < pageInfo.getMaxPage()) {%>onclick="onclick1(${pageInfo.pageNum2 + 1})"<%} %>></li>
              </ul>
            </nav>
          </div>
        </div>
 
      </div>
      
    </section>
	</c:if>

   <jsp:include page="../inc/footer.jsp"></jsp:include>





    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
  </body>
</html>