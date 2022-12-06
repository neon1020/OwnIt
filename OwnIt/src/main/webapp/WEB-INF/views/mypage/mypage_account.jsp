<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/vendor.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" />
    <script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.js"></script>
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
    
    <script type="text/javascript">
    	function addCheck() {
    		if($("#account_bank").val() == '미선택') {
    			alert("은행을 선택해주세요.");
    			return false;
    		} else {
    			let isCheck = confirm("계좌를 추가하시겠습니까?");
        		return isCheck;
    		}
    	}
    </script>

    <title>Profile</title>
  </head>
  <body>

    <!-- header -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- /header -->
	
	<c:if test="${empty sessionScope.sIdx }">
		<script type="text/javascript">
			alert("잘못된 접근입니다!");
			location.href = "./";
		</script>
	</c:if>

    <!-- listing -->
    <section class="pt-5" style="margin-top: 100px;">
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
                        <h3 class="mb-0">판매 정산 계좌</h3>
                        <span class="eyebrow">${accountCount }개의 계좌가 있습니다.</span>
                      </div>
                    </div>
                    <!-- div 시작 -->
                    <div class="row gutter-2 mb-6">
                    <c:forEach var="account" items="${account }" varStatus="num">
                      <!-- 계좌 1개 정보 -->
                      <div class="col-md-6">
                        <div class="card card-data">
                          <div class="card-header card-header-options">
                            <div class="row align-items-center">
                              <div class="col">
                                <h3 class="card-title"><c:if test="${account.account_gb == '0' }"><b style="color: #FF6666;">[기본]&nbsp;&nbsp;</b></c:if>${account.account_nickname }</h3>
                              </div>
                              <div class="col text-right">
                                <div class="dropdown">
                                  <button id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button" class="btn btn-lg btn-secondary btn-ico"><i class="icon-more-vertical"></i></button>
                                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                      <c:choose>
                                        <c:when test="${account.account_gb == '1' }">
                                          <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#default_account${num.index }">기본 계좌 설정</a>
                                        </c:when>
                                      </c:choose>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#edit_account${num.index }">계좌 수정</a>
                                    </li>
                                    <li>
                                      <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#delete_account${num.index }">계좌 삭제</a>
                                    </li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card-body w-75">
                            <h5 class="eyebrow text-muted">Account</h5>
                            <p class="card-text">${account.account_bank } ${account.account_num }</p>
                            <h5 class="eyebrow text-muted">Owner</h5>
                            <p class="card-text">${account.account_owner_name }</p>
                          </div>
                        </div>
                      </div>
                      <!-- 계좌 1개 정보 -->
                      
                    <!-- modal 시작 -->
                    <!-- modal(edit_account) -->
				    <div class="modal fade" id="edit_account${num.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">계좌 수정</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">×</span>
					        </button>
					      </div>
					      <form action="editAccount" method="post" id="edit_account">
					      <input type="hidden" name="account_idx" value="${account.account_idx }">
					      <input type="hidden" name="member_idx" value="${sessionScope.sIdx }">
					      <div class="modal-body">
						      <div class="input-group">
						        <div class="input-group-append">
						          <div class="edit_account_select">
							        <select class="custom-select" id="edit_bank" name="account_bank">
					                  <option value="국민" <c:if test="${account.account_bank eq '국민'}">selected</c:if>>국민</option>
				                      <option value="기업" <c:if test="${account.account_bank eq '기업'}">selected</c:if>>기업</option>
				                      <option value="농협" <c:if test="${account.account_bank eq '농협'}">selected</c:if>>농협</option>
				                      <option value="신한" <c:if test="${account.account_bank eq '신한'}">selected</c:if>>신한</option>
				                      <option value="우리" <c:if test="${account.account_bank eq '우리'}">selected</c:if>>우리</option>
				                      <option value="하나" <c:if test="${account.account_bank eq '하나'}">selected</c:if>>하나</option>
				                      <option value="카카오뱅크" <c:if test="${account.account_bank eq '카카오뱅크'}">selected</c:if>>카카오뱅크</option>
				                      <option value="경남" <c:if test="${account.account_bank eq '경남'}">selected</c:if>>경남</option>
				                      <option value="부산" <c:if test="${account.account_bank eq '부산'}">selected</c:if>>부산</option>
					                </select>
				                  </div>
				                  <div class="edit_account_number">
						            <input type="text" id="edit_num" name="account_num" class="form-control form-control-lg" placeholder="계좌번호" aria-label="Account_Number" value="${account.account_num }">
						          </div>
						        </div>
					          </div>
						      <div class="input-account">
						        <input type="text" id="edit_name" name="account_owner_name" class="form-control form-control-lg" placeholder="예금주명" aria-label="Account_Owner" value="${account.account_owner_name }">
						      </div>
						      <div class="input-account">
						      	<input type="text" id="edit_nick" name="account_nickname" class="form-control form-control-lg" placeholder="계좌별칭" aria-label="Account_Nickname" value="${account.account_nickname }">
						      </div>
					      </div>
					      <div class="modal-footer">
					        <div class="container-fluid">
					          <div class="row gutter-0">
					            <div class="col">
					              <button type="submit" class="btn btn-block btn-dark">저장</button>
					            </div>
					            <div class="col">
					              <button type="button" class="btn btn-block btn-outline-dark" data-dismiss="modal">취소</button>
					            </div>
					          </div>
					        </div>
					      </div>
					      </form>
					    </div>
					  </div>
					</div>
					
					<!-- modal(delete_account) -->
				    <div class="modal fade" id="delete_account${num.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">계좌 삭제</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">×</span>
					        </button>
					      </div>
					      <form action="deleteAccount" method="post" id="delete_account">
					      <input type="hidden" name="account_idx" value="${account.account_idx }">
					      <input type="hidden" name="member_idx" value="${sessionScope.sIdx }">
					      <div class="modal-body">
						      <p>해당 계좌를 삭제하시겠습니까?</p>
					      </div>
					      <div class="modal-footer">
					        <div class="container-fluid">
					          <div class="row gutter-0">
					            <div class="col">
					              <button type="submit" class="btn btn-block btn-dark">Yes</button>
					            </div>
					            <div class="col">
					              <button type="button" class="btn btn-block btn-outline-dark" data-dismiss="modal">No</button>
					            </div>
					          </div>
					        </div>
					      </div>
					      </form>
					    </div>
					  </div>
					</div>
					
					<!-- modal(default_account) -->
				    <div class="modal fade" id="default_account${num.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">기본 계좌 설정</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">×</span>
					        </button>
					      </div>
					      <form action="defaultAccount" method="post" id="default_account">
					      <input type="hidden" name="account_idx" value="${account.account_idx }">
					      <input type="hidden" name="member_idx" value="${sessionScope.sIdx }">
					      <div class="modal-body">
						      <p>기본 계좌로 설정하시겠습니까?</p>
					      </div>
					      <div class="modal-footer">
					        <div class="container-fluid">
					          <div class="row gutter-0">
					            <div class="col">
					              <button type="submit" class="btn btn-block btn-dark">Yes</button>
					            </div>
					            <div class="col">
					              <button type="button" class="btn btn-block btn-outline-dark" data-dismiss="modal">No</button>
					            </div>
					          </div>
					        </div>
					      </div>
					      </form>
					    </div>
					  </div>
					</div>
					<!-- modal 끝 -->
                      </c:forEach>
                    </div>
                    <!-- div 끝 -->
                    
                    
					<!-- New Account -->
					<form action="mypage_addAccount" method="post" id="addAccount" onsubmit="return addCheck()">
					<input type="hidden" name="member_idx" value="${sessionScope.sIdx }">
                    <div class="row">
                    	<div class="col">
                    		<h3 class="mb-0">새 계좌 추가</h3>
                    	</div>
                    </div>
                    <div class="row gutter-1">
                      <div class="col-12">
                        <div class="form-group">
                          <label for="cardNumber">Account Number</label>
                          <input type="text" class="form-control" name="account_num" placeholder="계좌번호" required="required">
                        </div>
                      </div>
                      <div class="col-6 col-md-3">
                        <div class="form-group">
                          <label for="cardNumber">Bank</label>
                          <select class="custom-select" required="required" id="account_bank" name="account_bank">
                          <!-- 국민, 기업, 농협, 신한, 우리, 하나, 카카오뱅크, 경남, 부산 -->
                            <option selected value="미선택">은행 선택</option>
                            <option value="국민">국민</option>
                            <option value="기업">기업</option>
                            <option value="농협">농협</option>
                            <option value="신한">신한</option>
                            <option value="우리">우리</option>
                            <option value="하나">하나</option>
                            <option value="카카오뱅크">카카오뱅크</option>
                            <option value="경남">경남</option>
                            <option value="부산">부산</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-6 col-md-3">
                        <div class="form-group">
                          <label for="cardNumber">Owner Name</label>
                          <input type="text" class="form-control" name="account_owner_name" placeholder="예금주명" required="required">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="cardNumber">Account Nickname</label>
                          <input type="text" class="form-control" placeholder="계좌별칭" name="account_nickname" required="required">
                        </div>
                      </div>
                      <div class="col-12" style="text-align: center;">
                        <input type="submit" value="추가하기" class="btn btn-dark btn-rounded">
                      </div>
                    </div>
                    </form>
                    <!-- /New Account -->
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

	


    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

    <script src="<%=request.getContextPath() %>/resources/js/vendor.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/app.js"></script>
  </body>
</html>