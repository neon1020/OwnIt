<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!doctype html>
<html lang="en">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
	<link rel="stylesheet" href="resources/css/vendor.css" />
	<link rel="stylesheet" href="resources/css/style.css" />
	<title>Listing</title>
</head>
<style>
/* IE */
select::-ms-expand { 
	display: none;
}
.select {
  -o-appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  width: 120px;
  height: 35px;
  background-size: 20px;
  padding: 5px 30px 5px 10px;
  border-radius: 4px;
  outline: 0 none;
  font-size: 0.875rem;
}
.select option {
  color: black;
  padding: 3px 0;
}
.items {
	display: block;
	width: 867px;
	padding-right: 15px;
	padding-left: 5px;
	height: 60px;
}
.items > .nav-link3 {
	margin-right: 35px;
	font-size: 0.8em;
	display: inline-block;
	padding: 0;
}
.items > a#노트북 {
	margin-right: 0px;
	font-size: 0.8em;
}
.items > a > img {
	width: 60px;
	height: 60px;
}
.btn btn-outline-secondary btn-sm dropdown-toggle {
	 width: 867px;
}
.style_icon {
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	transition: all 0.2s;
	-webkit-transition-delay: 0s;
	-moz-transition-delay: 0s;
	transition-delay: 0s;
	position: absolute;
	top: 0;
	right: 0;
	display: block;
	width: 1.875rem;
	height: 1.875rem;
	text-align: right;
	color: #6c757d; }

.product-like-full {
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	transition: all 0.2s;
	-webkit-transition-delay: 0s;
	-moz-transition-delay: 0s;
	transition-delay: 0s;
	position: absolute;
	top: 0;
	right: 0;
	display: block;
	width: 1.875rem;
	height: 1.875rem;
	text-align: right;
	color: #f08080; }
.product-like-full::before {
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	transition: all 0.2s;
	-webkit-transition-delay: 0s;
	-moz-transition-delay: 0s;
	transition-delay: 0s;
	content: "\ebde";
	display: block;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	font-family: 'icomoon';
	font-size: 0.875rem;
	color: #f08080; }
.product-like:hover::before {
	content: "\ebde";
	color: #f08080; }
.product-action > a:hover {
	cursor: pointer;
}

</style>
<script src="resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">

function changeHeart(heart) {
	if(${not empty sessionScope.sId}) {
		var index = heart.id.split('_')[1];
		var full = heart.className.indexOf('full') > -1
		$.ajax({
			url:'addAndRemoveLikeList',
			type:'POST',
			data:{product_idx:index},
			success:function(result){
				if(!full) { // 빈하트 -> 채움
					var a = $('#heart_' + result);
					a.removeClass('product-like');
					a.addClass('product-like-full');
				} else if(full) { // 채워진 -> 빈하트
					var b = $('#heart_' + result);
					b.removeClass('product-like-full');
					b.addClass('product-like');
				}
			}
		});
	} else alert("로그인 후 이용가능합니다");
}

$(document).on("click", ".product-action", function() {
	if(${not empty sessionScope.sId}) {
		var index = $(this).attr('id');
		$.ajax({
			url:'addCart',
			type:'GET',
			data:{
				product_idx:index
			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(result){
				if(result == 'Added') {
					$('#'+index+' > a').html(result).css('color', 'blue');
				} else {
					$('#'+index+' > a').html(result).css('color', 'red');
				}
			checkCart();
			}
		});
	} else alert("로그인 후 이용가능합니다");
});

var str = "";
$(function() {
	$('input[type=checkbox]').click(function() {
		if($(this).is(":checked")){
			str += $(this).attr('name')+":"+$(this).attr('id')+"/";
		} else {
			var removeStr = $(this).attr('name')+":"+$(this).attr('id')+"/"
			str = str.replace(removeStr, '');
		}
		listByCategory();
	});
	
	$('.nav-link3').click(function() {
		str = str.replace('category:스마트폰/', '');
		str = str.replace('category:태블릿/', '');
		str = str.replace('category:스마트워치/', '');
		str = str.replace('category:이어폰/', '');
		str = str.replace('category:헤드폰/', '');
		str = str.replace('category:노트북/', '');
		if($(this).attr('id') != null) {
			str += "category:"+$(this).attr('id')+"/";
		}
		listByCategory();
	});
	
	$('select').change(function() {
		str = str.replace('productListing:price_high/', '');
		str = str.replace('productListing:product_popular/', '');
		str = str.replace('productListing:price_low/', '');
		str = str.replace('productListing:product_new/', '');
		var selectVal = $(this).val();
		str += "productListing:"+selectVal+"/";
		listByCategory();
	});
});

function listByCategory() {
// 	$(function() {
		$.ajax({
			url:'listProductByCategory',
			type:'POST',
			data:{
				categories:str
			},
			dataType:'json',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(prd) {
				var html = "";
				var cnt = 0;
				$.each(prd, function(index) {
					var buyPrice = numberWithCommas(prd[index].product_buy_price);
					var myWish = prd[index].my_wish;
					html += "<div class='col-6 col-md-4'>";
					html += "<div class='product'>";
					html += "<figure class='product-image'>";
					html += "<a href='product_detail?product_idx="+ prd[index].product_idx +"'>";
					html += "<img src='resources/img/product/"+ prd[index].image_real_file1+"' alt='Image' width='261.66px' height='261.66px'>";
					html += "<img src='resources/img/product/"+ prd[index].image_real_file2+"' alt='Image' width='261.66px' height='261.66px'>";
					html += "</a></figure>";
					html += "<div class='product-meta' style='width: 261.66px; height: 160.72px'>";
					html += "<h3 class='product-title'><a href='product_detail?product_idx="+ prd[index].product_idx +"'><b>"+prd[index].product_brand+"</b></a></h3>";
					html += "<h3 class='product-title' style='height: 63px'><a href='product_detail?product_idx="+ prd[index].product_idx +"'>"+prd[index].product_name+" </a></h3>";
					html += "<div class='product-price'>";
					html += "<span>"+ buyPrice+"원</span>";
					html += "<span class='product-action' id='"+ prd[index].product_idx +"'>";
					html += "<a style='color: #101010;'>장바구니에 추가</a>";
					html += "</span></div>";
					if(myWish != 0) {
						html += "<span id='heartSection1'><a class='product-like-full' id='heart_"+prd[index].product_idx+"' onclick='changeHeart(this)'></a></span>";
					} else {
						html += "<span id='heartSection2'><a class='product-like' id='heart_"+prd[index].product_idx+"' onclick='changeHeart(this)'></a></span>";
					}
					html += "<a href='product_detail?product_idx="+ prd[index].product_idx +"#review' class='style-icon' style='color: #101010; font-size: 0.85em;''><img src='resources/img/product/review_icon.png'>Review</a>";
					html += "</div></div></div>";
					cnt+=1;
				});
				$('#listHere').html(html);
				$('#productCnt').html(cnt +" products");
			}
		});
// 	});
}

</script>
  <body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 페이지 레벨 / breadcrumbs -->

    <!-- 상품 목록 위 카테고리 관련 / listing -->
    <section class="pt-6" style="margin-top: 100px;">
      <div class="container">
        <div class="row justify-content-end">
          <div class="col-lg-9">
            <div class="row gutter-2 align-items-end">
              <div class="col-md-6">
                <h1 class="mb-0"><a href="product_list" style="color: black;">Tech</a></h1>
                <span class="eyebrow" id="productCnt">${cnt } products</span>
              </div>
              <div class="items">
			   	<a class="nav-link3" id="스마트폰" >
			   		<img src="./resources/img/product/phone1.png" alt="스마트폰">스마트폰
			   	</a>
			   	<a class="nav-link3" id="태블릿">
			   		<img src="./resources/img/product/tablet1.png">태블릿
			   	</a>
			   	<a class="nav-link3" id="스마트워치">
			   		<img src="./resources/img/product/watch1.png">스마트워치
			   	</a>
		   		<a class="nav-link3" id="이어폰">
			   		<img src="./resources/img/product/earphone1.jpeg">이어폰
			   	</a>
			   	<a class="nav-link3" id="헤드폰">
			   		<img src="./resources/img/product/head1.png">헤드폰
			   	</a>
			   	<a class="nav-link3" id="노트북">
			   		<img src="./resources/img/product/mac1.png">노트북
			   	</a>
		     </div>
            </div>
          </div>
         <div class="col-md-6 text-md-right" style="margin-top: 25px">
           <select class="select"><!-- onchange="arrayByCategory(this.value)" -->
	          <option value="product_popular" id="productListing" selected="selected">인기순</option>
	          <option value="price_high" id="productListing">가격높은순</option>
	          <option value="price_low" id="productListing">가격낮은순</option>
	          <option value="product_new" id="productListing">신제품</option>
           </select>
         </div>
       </div>
        <div class="row gutter-4">
		<!-- sidebar -->
        <jsp:include page="../inc/sidebar_product.jsp"></jsp:include>
          <!-- 상품 목록 리스팅 코드 / content -->
          <div class="col-lg-9">
            <div class="row gutter-2 gutter-lg-3" id="listHere">
             <c:forEach var="product" items="${productList }" >
              <div class="col-6 col-md-4">
                <div class="product">
                  <figure class="product-image">
                    <a href="product_detail?product_idx=${product.product_idx }">
                      <img src="resources/img/product/${product.image_real_file1 }" alt="Image" width="261.66px" height="261.66px">
                      <img src="resources/img/product/${product.image_real_file2 }" alt="Image" width="261.66px" height="261.66px">
                    </a>
                  </figure>
                  <div class="product-meta" style="width: 261.66px; height: 160.72px">
                  <h3 class="product-title"><a href="product_detail?product_idx=${product.product_idx }"><b>${product.product_brand }</b></a></h3>
                    <h3 class="product-title" style="height: 63px"><a href="product_detail?product_idx=${product.product_idx }">${product.product_name } </a></h3>
                    <div class="product-price">
                      <span><fmt:formatNumber value="${product.product_buy_price }" pattern="#,###"/>원</span>
                      <span class="product-action" id="${product.product_idx }">
                        <a style="color: blue;">장바구니에 추가</a>
                      </span>
                    </div>
	                  <c:choose>
                    	<c:when test="${product.my_wish ne 0}">
                    	  <span id="heartSection1">
                   			<a class="product-like-full" id="heart_${product.product_idx }" onclick="changeHeart(this)"></a>
                   		  </span>
                   		</c:when>
                   		<c:otherwise>
                   		  <span id="heartSection2">
                   			<a class="product-like" id="heart_${product.product_idx }" onclick="changeHeart(this)"></a>
                   		  </span>
                   		</c:otherwise>
	                  </c:choose>
                    <a href="product_detail?product_idx=${product.product_idx }#review" class="style-icon" style="color: #101010; font-size: 0.85em;"><i class="bi bi-chat-left-text"></i> Review</a>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
            <div class="row">
              <div class="col">
                <nav class="d-inline-block">
<!--                   <ul class="pagination"> -->
<!--                     <li class="page-item active"><a class="page-link" href="#!">1 <span class="sr-only">(current)</span></a></li> -->
<!--                     <li class="page-item" aria-current="page"><a class="page-link" href="#!">2</a></li> -->
<!--                     <li class="page-item"><a class="page-link" href="#!">3</a></li> -->
<!--                     <li class="page-item"><a class="page-link" href="#!">4</a></li> -->
<!--                   </ul> -->
                </nav>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section>


    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
  </body>
</html>