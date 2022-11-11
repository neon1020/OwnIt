<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/vendor.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />
    <style type="text/css">
    	.input-group {
    		width: 400px;
    		margin: 0 auto;
    	}
    	
    	.input-address {
    		width: 400px;
    		margin: 10px auto;
    	}
    	
    	.modal-body {
    		padding: 10px;
    		text-align: center;
    	}
    	
    	#Zipcode {
    		width: 780px;
    	}
    	
    	/* 수정 필요!! */
    	.card-body w-75 {
    		width: 450px;
    		height: 300px;
    	}
    </style>

    <title>Profile</title>
  </head>
  <body>

    <!-- header -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <jsp:include page="../inc/cart_inTop.jsp"></jsp:include>

    <!-- hero -->
    <section class="hero hero-small bg-purple text-white">
      <div class="container">
        <div class="row gutter-2 gutter-md-4 align-items-end">
          <div class="col-md-6 text-center text-md-left">
            <h1 class="mb-0">Michael Campbell</h1>
            <span class="text-muted">New York, USA</span>
          </div>
          <div class="col-md-6 text-center text-md-right">
            <a href="#!" class="btn btn-sm btn-outline-white">Sign out</a>
          </div>
        </div>
      </div>
    </section>



    <!-- listing -->
    <section class="pt-5">
      <div class="container">
        <div class="row gutter-4 justify-content-between">

          <!-- sidebar -->
          <jsp:include page="../inc/sidebar_mypage.jsp"></jsp:include>
          <!-- / sidebar -->

          <!-- content -->
          <div class="col-lg-9">
            <div class="row">
              <div class="col">
                <div class="tab-content" id="myTabContent">


                  <!-- addresses -->
                  <div class="tab-pane fade show active" id="sidebar-1-3">
                    <div class="row">
                      <div class="col">
                        <h3 class="mb-0">Addresses</h3>
                        <span class="eyebrow">2 개의 배송지가 있습니다.</span>
                      </div>
                    </div>
                    <div class="row gutter-2">
                      <div class="col-md-6">
                        <div class="card card-data">
                          <div class="card-header card-header-options">
                            <div class="row align-items-center">
                              <div class="col">
                                <h3 class="card-title">Home (기본배송지)</h3>
                              </div>
                              <div class="col text-right">
                                <div class="dropdown">
                                  <button id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button" class="btn btn-lg btn-secondary btn-ico"><i class="icon-more-vertical"></i></button>
                                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#default_address">기본 배송지 설정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#edit_address">배송지 수정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#delete_address">배송지 삭제</a>
                                    </li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card-body w-100" style="height: 240px;">
                            <h5 class="eyebrow text-muted">Address</h5>
                            <p class="card-text">
                            	51435 <br>
                            	경남 창원시 성산구 중앙대로 151 (용호동)
                            </p>
                            <h5 class="eyebrow text-muted">To</h5>
                            <p class="card-text">김감자</p>
                          </div>
                        </div>
                      </div>
                      
                      <!-- --------------------------------------------------------------------------------------------------------- -->
                      
                      <div class="col-md-6">
                        <div class="card card-data">
                          <div class="card-header card-header-options">
                            <div class="row align-items-center">
                              <div class="col">
                                <h3 class="card-title">Company</h3>
                              </div>
                              <div class="col text-right">
                                <div class="dropdown">
                                  <button id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button" class="btn btn-lg btn-secondary btn-ico"><i class="icon-more-vertical"></i></button>
                                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#default_address">기본 배송지 설정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#edit_address">배송지 수정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#delete_address">배송지 삭제</a>
                                    </li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card-body w-100" style="height: 240px;">
                            <h5 class="eyebrow text-muted">Address</h5>
                            <p class="card-text">
                            	47246 <br>
                            	부산광역시 부산진구 동천로 109 (부전동, 삼한골든게이트)<br>
                            	7층 아이티윌 부산교육센터
                            </p>
                            <h5 class="eyebrow text-muted">To</h5>
                            <p class="card-text">김감자</p>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-md-6">
                        <div class="card card-data">
                          <div class="card-header card-header-options">
                            <div class="row align-items-center">
                              <div class="col">
                                <h3 class="card-title">Company</h3>
                              </div>
                              <div class="col text-right">
                                <div class="dropdown">
                                  <button id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button" class="btn btn-lg btn-secondary btn-ico"><i class="icon-more-vertical"></i></button>
                                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#default_address">기본 배송지 설정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#edit_address">배송지 수정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#delete_address">배송지 삭제</a>
                                    </li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card-body w-100" style="height: 240px;">
                            <h5 class="eyebrow text-muted">Address</h5>
                            <p class="card-text">
                            	47246 <br>
                            	부산광역시 부산진구 동천로 109 (부전동, 삼한골든게이트)<br>
                            	7층 아이티윌 부산교육센터
                            </p>
                            <h5 class="eyebrow text-muted">To</h5>
                            <p class="card-text">김감자</p>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col">
                        <h3>New Address</h3>
                      </div>
                    </div>
                    <div class="row gutter-1">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="cardNumber">Zipcode</label>
                          <input id="cardNumber" type="text" class="form-control" placeholder="우편번호">
                        </div>
                      </div>
                      
                      <!-- 우편번호 검색 버튼 필요할 시 사용!! -->
<!--                       <div class="col-6 col-md-3"> -->
<!--                         <div class="form-group"> -->
<!--                     	  <label for="cardNumber">간격맞추기용</label> -->
<!--                           <button type="button" class="btn btn-block btn-primary">우편번호 검색</button> -->
<!--                         </div> -->
<!--                       </div> -->

                      <div class="col-6 col-md-3">
                        <div class="form-group">
                          <label for="cardNumber2">Address Nickname</label>
                          <input id="cardNumber2" type="text" class="form-control" placeholder="주소별칭">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="cardNumber">Address</label>
                          <input id="cardNumber" type="text" class="form-control" placeholder="주소">
                        </div>
                      </div>
                      <div class="col-6 col-md-3">
                        <div class="form-group">
                          <label for="cardNumber2">Detail Address</label>
                          <input id="cardNumber2" type="text" class="form-control" placeholder="상세주소">
                        </div>
                      </div>
                      <div class="col-6 col-md-3">
                        <div class="form-group">
                          <label for="cardNumber3">Name</label>
                          <input id="cardNumber3" type="text" class="form-control" placeholder="받으시는 분">
                        </div>
                      </div>
                      <div class="col-12" style="text-align: center;">
                        <input type="button" value="추가하기" class="btn btn-dark btn-rounded" onclick="#">
                      </div>
                    </div>
                  </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
    </section>
    <!-- listing -->
    
    <!-- modal(edit_address) -->
    <div class="modal fade" id="edit_address" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">주소지 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	      </div>
	      <div class="modal-body">
		      <div class="input-group">
		        <input type="text" class="form-control form-control-lg" placeholder="우편번호" aria-label="Zipcode">
		        <div class="input-group-append">
		          <button type="button" class="btn btn-lg btn-primary">우편번호 검색</button><br>
		        </div>
	          </div>
		      <div class="input-address">
		        <input type="text" class="form-control form-control-lg" placeholder="주소" aria-label="Address1">
		      </div>
		      <div class="input-address">
		      	<input type="text" class="form-control form-control-lg" placeholder="상세주소" aria-label="Address2">
		      </div>
		      <div class="input-address">
		      	<input type="text" class="form-control form-control-lg" placeholder="주소별칭" aria-label="Address_Nickname">
		      </div>
	      </div>
	      <div class="modal-footer">
	        <div class="container-fluid">
	          <div class="row gutter-0">
	            <div class="col">
	              <button type="button" class="btn btn-block btn-secondary" data-dismiss="modal">Close</button>
	            </div>
	            <div class="col">
	              <button type="button" class="btn btn-block btn-primary">Save</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- modal(delete_address) -->
    <div class="modal fade" id="delete_address" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">주소지 삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	      </div>
	      <div class="modal-body">
		      <p>해당 주소지를 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <div class="container-fluid">
	          <div class="row gutter-0">
	            <div class="col">
	              <button type="button" class="btn btn-block btn-primary">Yes</button>
	            </div>
	            <div class="col">
	              <button type="button" class="btn btn-block btn-secondary" data-dismiss="modal">No</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- modal(default_address) -->
    <div class="modal fade" id="default_address" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">기본 배송지 설정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	      </div>
	      <div class="modal-body">
		      <p>기본 배송지로 설정하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <div class="container-fluid">
	          <div class="row gutter-0">
	            <div class="col">
	              <button type="button" class="btn btn-block btn-primary">Yes</button>
	            </div>
	            <div class="col">
	              <button type="button" class="btn btn-block btn-secondary" data-dismiss="modal">No</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
  </body>
</html>