<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head></head>
<script src="resources/js/jquery-3.6.1.js"></script>

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
	       								<a class="nav-link" name="category" id="휴대폰">- 휴대폰</a>
<!-- 	         							<a class="nav-link" href="listProductByCategory?id=스마트폰" role="category" id="phone">- 휴대폰</a> -->
	       							</li>
	       							<li class="nav-item">
	       								<a class="nav-link" name="category" id="태블릿">- 태블릿</a>
<!-- 	         							<a class="nav-link" href="listProductByCategory?id=태블릿" role="category" id="tablet">- 태블릿</a> -->
	       							</li>
	       							<li class="nav-item">
	       								<a class="nav-link" name="category" id="스마트워치">- 스마트워치</a>
<!-- 	         							<a class="nav-link" href="listProductByCategory?id=스마트워치" role="category" id="watch">- 스마트워치</a> -->
	       							</li>
	       							<li class="nav-item">
	       								<a class="nav-link" name="category" id="이어폰">- 이어폰</a>
<!-- 	         							<a class="nav-link" href="listProductByCategory?id=이어폰" role="category" id="earphone">- 이어폰</a> -->
	       							</li>
	       							<li class="nav-item">
	       								<a class="nav-link" name="category" id="헤드폰">- 헤드폰</a>
<!-- 	         							<a class="nav-link" href="listProductByCategory?id=헤드폰" role="category" id="headphone">- 헤드폰</a> -->
	       							</li>
	       							<li class="nav-item">
	       								<a class="nav-link" name="category" id="노트북">- 노트북</a>
<!-- 	         							<a class="nav-link" href="listProductByCategory?id=노트북" role="category" id="laptop">- 노트북</a> -->
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
					<input type="checkbox" class="custom-control-input" name="brand" id="APPLE"  value="Apple">
					<label class="custom-control-label" for="APPLE">Apple</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="SAMSUNG" value="Samsung">
					<label class="custom-control-label" for="SAMSUNG">Samsung</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="SONY" value="Sony">
					<label class="custom-control-label" for="SONY">Sony</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="LG" value="LG">
					<label class="custom-control-label" for="LG">LG</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="BOSE" value="Bose">
					<label class="custom-control-label" for="BOSE">BOSE</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="brand" id="ETC" value="etc">
					<label class="custom-control-label" for="ETC">ETC</label>
				</div>
			</div>		
		</div>
	</div>

	<div class="widget">
		<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-5" aria-expanded="false" aria-controls="collapse-5" role="button">
			Filter by Price
		</span>
<!-- 		<div class="d-lg-block collapse" id="collapse-5"> -->
<!-- 			<span class="widget-title">Price(ajax 처리)</span> -->
<!-- 			<div class="widget-content"> -->
<!-- 				<input type="text" class="rangeslider" name="Range Slider" value="" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
</aside>