<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
    <title>Product</title>
    <style type="text/css">
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
	    /* 상단 정렬 메뉴 버튼 */
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
	    #btn1{
	   		background: #F06464; 
	   		border-radius: 15px; 
	   		color: white; 
	   		width: 220px;
	    }
	    #btn2{
	    	background: #46BD7B; 
	    	border-radius: 15px; 
	    	color: white; 
	    	width: 220px;
	    }
	    #btn3{
	    	background: white; 
	    	border: 0.5px black solid;
	    	border-radius: 15px; 
	    	color: black;
	    	width: 460px;
	    	margin-top: 15px;
	    	
	    }
	    #btn3:hover{
	    	background: black;
	    	color: white;
	    }
    </style>
  </head>
  <body>

    <!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/cart_inTop.jsp"></jsp:include>

    <!-- breadcrumbs -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="row">
          <div class="col">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item">
                	<a href="./"
                		>Home
                	</a>
                </li>
                <li class="breadcrumb-item">
                	<a href="product_list">
                		Shop
                	</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                	Product
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>


   <!-- product  상품 메인이미지 -->
    <section class="hero pt-5">
      <div class="container">
        <div class="row gutter-2 gutter-md-4 justify-content-between">

          <div class="col-lg-7">
            <div class="row gutter-1 justify-content-between">
              <div class="col-lg-10 order-lg-2">
                <div class="owl-carousel gallery" data-slider-id="1" data-thumbs="true" data-nav="true">
                  <figure class="equal" style="width:100%; height: 100%">
                  <!-- 클릭시 보여지는 작은 이미지 -->
                    <a class="image" href="resources/img/product/${product.image_original_file1 }" 
                      style="background-image: url(resources/img/product/${product.image_original_file1 });">
                    </a>
                  </figure>
                  <figure class="equal" style="width:100%; height: 100%">
                    <a class="image" href="resources/img/product/${product.image_original_file2 }" 
                      style="background-image: url(resources/img/product/${product.image_original_file2 });">
                    </a>
                  </figure>
                  <figure class="equal" style="width:100%; height: 100%">
                    <a class="image" href="resources/img/product/${product.image_original_file3 }" 
                      style="background-image: url(resources/img/product/${product.image_original_file3 });">
                    </a>
                  </figure>
                </div>
              </div>
              
              <!--  상품 왼쪽 작은 이미지 3개 -->
              <div class="col-lg-2 text-center text-lg-left order-lg-1">
                <div class="owl-thumbs" data-slider-id="1">
                    <span class="owl-thumb-item"><img src="resources/img/product/${product.image_original_file1 }" alt=""></span>
                    <span class="owl-thumb-item"><img src="resources/img/product/${product.image_original_file2 }" alt=""></span>
                    <span class="owl-thumb-item"><img src="resources/img/product/${product.image_original_file3 }" alt=""></span>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-5 mb-5 mb-lg-0">
            <div class="row">
              <div class="col-12">
                <h4 class="item-title">${product.product_brand }</h4>
             					    <p>${product.product_name }</p>
                
                <!-- 구매 판매 버튼 -->
                <button id="btn1" type="button" class="btn"  onclick="location.href='order_buyAgree?product_idx=${product.product_idx}'" >
                	<p>
                		구매 | <fmt:formatNumber value="${product.product_buy_price }" pattern="#,###"/> 원
                	</p>
                </button>
				<button id="btn2" type="button" class="btn" onclick="location.href='order_sellAgree?product_idx=${product.product_idx}'" >
					<p>
						판매 | <fmt:formatNumber value="${product.product_sell_price }" pattern="#,###"/> 원
					</p>
				</button>
				<button id="btn3" type="button" class="btn" onclick="location.href=''" >
					<p>
						∑관심상품 | <fmt:formatNumber value="9641" pattern="#,###"/>
					</p>
				</button>
              </div>
            </div>
				
            <div class="row">
              <div class="col-12">
              
              <!--  모델번호 가격 -->
               <table class="table">
					<tr>
						<td>
							<span id="title1">
								모델번호
							</span><br>
							<span>
								${product.product_model_num }
							</span>
						</td>
						<td>
							<span id="title1">
								컬러<br>
							</span>
							<span>
								${product.product_color }
							</span>
						</td>
						<td>
							<span id="title1">
								발매가<br>
							</span>
							<span>
								<fmt:formatNumber value="${product.product_release_price }" pattern="#,###"/> 원
							</span>
						</td>
					</tr>
				</table>
				
				
				<!-- 오른쪽 버튼 -->
				<div>
			      <div class="container">
			        <div class="row gutter-2 gutter-md-4">
			          <div class="col-md-12 col-lg-12">
			            <div class="accordion accordion-minimal" id="accordion-2">
			              <div class="card">
			                <div class="card-header" id="heading-2-1">
			                  <h2 class="mb-0">
			                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-2-1" aria-expanded="false" aria-controls="collapse-2-1">
			                      <span id="title1">배송 기간 안내</span>
			                    </button>
			                  </h2>
			                </div>
			                <div id="collapse-2-1" class="collapse" aria-labelledby="heading-2-1" data-parent="#accordion-2">
			                  <div class="card-body"  id="title1" >
			                 	 OwnIt은 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다.
			                 	 <br>배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는 속도에 따라 차이가 있습니다.<br>
							     <br>[빠른배송 구매]
								 <br>- 판매자가 보관 신청한 상품 중 검수에 합격한 상품을 KREAM의 전용 창고에 보관합니다. 보관 상품에 한하여 바로 구매와 95점 구매가 가능합니다.
								 <br>- 오늘(오후 11:59까지) 결제하면 내일 바로 출고되어 빠른 배송이 가능합니다. (연휴 및 공휴일, 천재지변, 택배사 사유 등 예외적으로 출고일이 변경될 수 있습니다. 빠른배송 안내
			                  </div>
			                </div>
			              </div>
			              <div class="card">
			                <div class="card-header" id="heading-2-2">
			                  <h2 class="mb-0">
			                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-2" aria-expanded="true" aria-controls="collapse-2-2">
			                      <span id="title1">검수 안내</span>
			                    </button>
			                  </h2>
			                </div>
			                <div id="collapse-2-2" class="collapse show" aria-labelledby="heading-2-2" data-parent="#accordion-2">
			                  <div class="card-body" id="title1">
			                    판매자의 상품이 검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.
			                    <br>- 검수센터에서는 정가품 여부를 확인하기 위하여, 지속적으로 데이터를 쌓고 분석하여 기록하고 있습니다.
								<br>- 업계 전문가로 구성된 검수팀은 박스와 상품의 라벨에서 바느질, 접착, 소재 등 모든 것을 검수합니다.
			                  </div>
			                </div>
			              </div>
			              <div class="card">
			                <div class="card-header" id="heading-2-3">
			                  <h2 class="mb-0">
			                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-3" aria-expanded="false" aria-controls="collapse-2-3">
			                      <span id="title1">구매 환불/취소/교환 안내</span>
			                    </button>
			                  </h2>
			                </div>
			                <div id="collapse-2-3" class="collapse" aria-labelledby="heading-2-3" data-parent="#accordion-2">
			                  <div class="card-body" id="title1">
			                     OwnIt은 익명 거래를 기반으로 판매자가 판매하는 상품을 구매자가 실시간으로 구매하여 거래를 체결합니다.
								<br>- 단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 
								<br>- 상품을 원하지 않으시는 경우 언제든지 OwnIt에서 재판매를 하실 수 있습니다.
								<br>- 상품 수령 후, 이상이 있는 경우 OwnIt 고객센터로 문의해주시기 바랍니다.
			                  </div>
			                </div>
			              </div>
			            </div> 
			          </div>
			        </div>
			      </div>
			    </div>
			    <!--  오른쪽 버튼 끝 -->
    
              </div>
            </div>
            
            
            <div>
              <div class="col-lg-12">
              		<!-- 카트 버튼 보류 -->
<!--                 	<a data-toggle="modal" data-target="#cart" class="btn" style="background: black; color: white; width: 195px;"> -->
<!--                 		Add to Cart -->
<!--                 	</a> -->
                	<!-- 관심상품 버튼 11월 11일 위쪽으로 수정  -->
<!-- 				<button type="button" class="btn" onclick="location.href=''" style="background: black; color: white; width: 195px;"> -->
<!-- 					Add to wishlist -->
<!-- 				</button> -->
              </div>
              <img src="resources/img/product/productDetailNotice.png">
              <div class="col-12 mt-1">
                <ul class="nav nav-actions">
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    	<span style="color:black;">
                    		상품 공유하기
                    	</span>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a class="dropdown-item" href="#">Facebook</a>
                      </li>
                      <li>
                        <a class="dropdown-item" href="#">Twitter</a>
                      </li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            
          </div>

        </div>
      </div>
    </section>
	
	<hr>
	
	<!-- STYLE 시작 -->
	 <section class="hero hero-small">
      <div class="container">
        <div class="row">
          <div class="col text-center">
            <h3>Style <span style="font-size: 15px;">(257)</span></h3>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Style</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>
	 <!-- *************************** 상단 정렬 메뉴 *************************** -->
    <section class="hero hero-small">
      <div class="container">
        <div class="row">
          <div class="col text-center">
          	<input type="radio" class="btn-check" name="btnradio" id="btnradio1" checked>
           	<label for="btnradio1">인기</label>
           	<input type="radio" class="btn-check" name="btnradio" id="btnradio2">
 			<label for="btnradio2">최신</label>
          </div>
        </div>
      </div>
    </section>
    <!-- *************************** 상단 정렬 메뉴 *************************** -->
    
    <!-- *************************** 리뷰 목록 *************************** -->
    <section class="pt-0" style="width: 1350px; padding: 100px 100px 100px 100px;">
      <div class="container">
        <div class="row masonry gutter-3">
        <!-- *************************** 데이터 넣을 부분 *************************** -->
          <c:forEach var="review" items="${reviewList }">
          <div class="col-md-6 col-lg-4">
            <article class="card card-post">
              <figure class="equal equal-50">
                <a class="image image-fade" href="review_detail?review_idx=${review.review_idx }"><img src="resources/img/review/${review.review_image }"></a>
              </figure>
              <div class="card-body">
              	<a class="profile" href="review_mystyle"><img src="resources/img/member/${review.member_image }"><span class="eyebrow text-muted">${review.member_nickname }</span></a>
                <h3 class="card-content">${review.review_content }</h3>
                <div class="like"><img src="resources/img/review/like_none.jpg">128&nbsp;&nbsp;<img src="resources/img/review/reply.jpg">${review.review_reply_count }</div>
                <h4 class="card-title"><a href="product_detail?product_idx=${product.product_idx }"><img src="resources/img/product/${review.product_image }"><div class="subject">${review.product_name }<br><fmt:formatNumber value="${review.product_buy_price}" pattern="#,###"/>&nbsp;원</div></a></h4>
              </div>
            </article>
          </div>
        </c:forEach>
          
        </div>
        <div class="row">
          <div class="col">
            <nav class="d-inline-block">
              <ul class="pagination">
                <li class="page-item active"><a class="page-link" href="#!">1 <span class="sr-only">(current)</span></a></li>
                <li class="page-item" aria-current="page"><a class="page-link" href="#!">2</a></li>
                <li class="page-item"><a class="page-link" href="#!">3</a></li>
                <li class="page-item"><a class="page-link" href="#!">4</a></li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </section>


   <jsp:include page="../inc/footer.jsp"></jsp:include>





    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
  </body>
</html>