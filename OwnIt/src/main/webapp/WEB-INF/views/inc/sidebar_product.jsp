<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head></head>
<script src="resources/js/jquery-3.6.1.js"></script>
<script>
// var chArr = [];
// $('input:checkbox[name=brand]:checked').each(function() {
// 	var ch = $(this).val();
// 	chArr.push(ch+" ");
// 	$.ajax({
// 		type:"GET",
// 		url:"arrayByBrand",
// 		data:chArr,
// 		success: function(result){
// 			console.log(result);
// 		}
// 	});
// })

// $('input:checkbox[name=brand]').each(function() {
// 	if($(this).is(":checked")){
// 		alert("체크됨");
// 	}

// }

</script>

 <!-- sidebar -->
<aside class="col-lg-3 sidebar">
	<div class="widget">
  		<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-1" aria-expanded="false" aria-controls="collapse-1" role="button">
    		Filter by Category
  		</span>
  		<div class="d-lg-block collapse" id="collapse-1">
   			<div class="widget-content">
      			<ul id="page-nav" class="nav flex-column nav-category">
       				<li class="nav-item">
   						<a class="nav-link" data-toggle="collapse" href="#menu-2" role="button" aria-expanded="false" aria-controls="menu-2"><span class="widget-title">Categories</span></a>
         				<div class="collapse" id="menu-2" data-parent="#page-nav">
           					<div>
     							<ul class="nav flex-column">
	       							<li class="nav-item">
	         							<a class="nav-link" href="listProductByCategory?id=스마트폰" id="phone">- 휴대폰</a>
	       							</li>
	       							<li class="nav-item">
	         							<a class="nav-link" href="listProductByCategory?id=태블릿" id="tablet">- 태블릿</a>
	       							</li>
	       							<li class="nav-item">
	         							<a class="nav-link" href="listProductByCategory?id=스마트워치" id="watch">- 스마트워치</a>
	       							</li>
	       							<li class="nav-item">
	         							<a class="nav-link" href="listProductByCategory?id=이어폰" id="earphone">- 이어폰</a>
	       							</li>
	       							<li class="nav-item">
	         							<a class="nav-link" href="listProductByCategory?id=헤드폰" id="headphone">- 헤드폰</a>
	       							</li>
	       							<li class="nav-item">
	         							<a class="nav-link" href="listProductByCategory?id=노트북" id="laptop">- 노트북</a>
	       							</li>
	     						</ul>
           					</div>
         				</div>
       				</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="widget">
		<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-2" aria-expanded="false" aria-controls="collapse-2" role="button">
			Filter by Brand
		</span>
		<div class="d-lg-block collapse" id="collapse-2">
			<span class="widget-title">Brands</span>
			<div class="widget-content" >
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="Apple"  value="Apple">
					<label class="custom-control-label" for="Apple">Apple</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="Samsung" value="Samsung">
					<label class="custom-control-label" for="Samsung">Samsung</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="Sony" value="Sony">
					<label class="custom-control-label" for="Sony">Sony</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="LG" value="LG">
					<label class="custom-control-label" for="LG">LG</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="Bose" value="Bose">
					<label class="custom-control-label" for="Bose">BOSE</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="etc" value="etc">
					<label class="custom-control-label" for="etc">ETC</label>
				</div>
			</div>		
		</div>
	</div>

	<div class="widget">
		<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-5" aria-expanded="false" aria-controls="collapse-5" role="button">
			Filter by Price
		</span>
		<div class="d-lg-block collapse" id="collapse-5">
			<span class="widget-title">Price(ajax 처리)</span>
			<div class="widget-content">
				<input type="text" class="rangeslider" name="Range Slider" value="" />
			</div>
		</div>
	</div>
</aside>