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
    	
    	.input-account {
    		width: 400px;
    		margin: 10px auto;
    	}
    	
    	.modal-body {
    		padding: 10px;
    		text-align: center;
    	}
    	
    	.edit_account_select > .custom-select {
    		width: 130px;
    		height: 57px;
    	}
    	
    	.edit_account_number{
    		width: 270px;
    		height: 100%;
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
                  <!-- Accounts -->
                  <div class="tab-pane fade show active" id="sidebar-1-4">
                    <div class="row">
                      <div class="col">
                        <h3 class="mb-0">Accounts</h3>
                        <span class="eyebrow">2개의 계좌가 있습니다.</span>
                      </div>
                    </div>
                    <div class="row gutter-2 mb-6">
                      <div class="col-md-6">
                        <div class="card card-data">
                          <div class="card-header card-header-options">
                            <div class="row align-items-center">
                              <div class="col">
                                <h3 class="card-title">default (기본 계좌)</h3>
                              </div>
                              <div class="col text-right">
                                <div class="dropdown">
                                  <button id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button" class="btn btn-lg btn-secondary btn-ico"><i class="icon-more-vertical"></i></button>
                                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#default_account">기본 계좌 설정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#edit_account">계좌 수정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#delete_account">계좌 삭제</a>
                                    </li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card-body w-75">
                            <h5 class="eyebrow text-muted">Account</h5>
                            <p class="card-text"><b>신한</b> 1111-2222-3333</p>
                            <h5 class="eyebrow text-muted">Owner</h5>
                            <p class="card-text"><b>김감자</b></p>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="card card-data">
                          <div class="card-header card-header-options">
                            <div class="row align-items-center">
                              <div class="col">
                                <h3 class="card-title">second</h3>
                              </div>
                              <div class="col text-right">
                                <div class="dropdown">
                                  <button id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button" class="btn btn-lg btn-secondary btn-ico"><i class="icon-more-vertical"></i></button>
                                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#default_account">기본 계좌 설정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#edit_account">계좌 수정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#delete_account">계좌 삭제</a>
                                    </li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card-body w-75">
                            <h5 class="eyebrow text-muted">Account</h5>
                            <p class="card-text"><b>국민</b> 7777-8888-9999</p>
                            <h5 class="eyebrow text-muted">Owner</h5>
                            <p class="card-text"><b>김감자</b></p>
                          </div>
                        </div>
                      </div>
                      <!-- account 내용 끝 -->
                    </div>
                    

                    <div class="row">
                    	<div class="col">
                    		<h3 class="mb-0">New Account</h3>
                    	</div>
                    </div>
                    <div class="row gutter-1">
                      <div class="col-12">
                        <div class="form-group">
                          <label for="cardNumber">Account Number</label>
                          <input type="text" class="form-control" placeholder="계좌번호">
                        </div>
                      </div>
                      <div class="col-6 col-md-3">
                        <div class="form-group">
                          <label for="cardNumber">Bank</label>
                          <select class="custom-select">
                            <option selected>은행 선택</option>
                            <option value="1">신한</option>
                            <option value="2">국민</option>
                            <option value="3">농협</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-6 col-md-3">
                        <div class="form-group">
                          <label for="cardNumber">Owner Name</label>
                          <input type="text" class="form-control" placeholder="예금주명">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="cardNumber">Account Nickname</label>
                          <input type="text" class="form-control" placeholder="계좌별칭">
                        </div>
                      </div>
                      <div class="col-12">
                        <a href="#!" class="btn btn-primary">Add</a>
                      </div>
                    </div>
                  </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          <!-- / content -->
    </section>
    <!-- listing -->

	<!-- modal(edit_account) -->
    <div class="modal fade" id="edit_account" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">계좌 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	      </div>
	      <div class="modal-body">
		      <div class="input-group">
		        <div class="input-group-append">
		          <div class="edit_account_select">
			        <select class="custom-select">
	                  <option selected>은행 선택</option>
	                  <option value="1">신한</option>
	                  <option value="2">국민</option>
	                  <option value="3">농협</option>
	                </select>
                  </div>
                  <div class="edit_account_number">
		            <input type="text" class="form-control form-control-lg" placeholder="계좌번호" aria-label="Account_Number">
		          </div>
		        </div>
	          </div>
		      <div class="input-account">
		        <input type="text" class="form-control form-control-lg" placeholder="예금주명" aria-label="Account_Owner">
		      </div>
		      <div class="input-account">
		      	<input type="text" class="form-control form-control-lg" placeholder="계좌별칭" aria-label="Account_Nickname">
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
	
	<!-- modal(delete_account) -->
    <div class="modal fade" id="delete_account" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">계좌 삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	      </div>
	      <div class="modal-body">
		      <p>해당 계좌를 삭제하시겠습니까?</p>
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
	
	<!-- modal(default_account) -->
    <div class="modal fade" id="default_account" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">기본 계좌 설정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	      </div>
	      <div class="modal-body">
		      <p>기본 계좌로 설정하시겠습니까?</p>
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