<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/vendor.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>
    <!-- header -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- /header -->   
    
	<!-- listing -->
	<section class="pt-6">
		<div class="container">
			<div class="row justify-content-end">
			</div>
				<div class="row gutter-4">
				
				<!-- sidebar -->
				<jsp:include page="../inc/sidebar_notice.jsp"></jsp:include>
				<!-- /sidebar -->
				
				<!-- notice_qna -->
				<div class="col-lg-9">
					<div class="row gutter-2 gutter-lg-3">
						<section id="component-2">
							<h3>자주 묻는 질문</h3>
							<div class="component">
								<ul class="nav nav-tabs lavalamp" id="component-2" role="tablist" style="margin-top: 30px;">
								  <li class="nav-item">
								    <a class="nav-link active" data-toggle="tab" href="#component-2-1" role="tab" aria-controls="component-2-1" aria-selected="true">이용정책</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-toggle="tab" href="#component-2-2" role="tab" aria-controls="component-2-2" aria-selected="false">공통</a>
								  </li>
								 <li class="nav-item">
								    <a class="nav-link" data-toggle="tab" href="#component-2-3" role="tab" aria-controls="component-2-3" aria-selected="false">구매</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-toggle="tab" href="#component-2-4" role="tab" aria-controls="component-2-4" aria-selected="false">판매</a>
								  </li>
								</ul>
				                
				                <div class="tab-content mt-3" id="component-1-content">
				                
				                  <div class="tab-pane fade show active" id="component-2-1" role="tabpanel" aria-labelledby="component-2-1">
				                    <div class="accordion accordion-minimal" id="accordion-2">
				                      <div class="card">
				                        <div class="card-header" id="heading-2-1">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-2-1" aria-expanded="true" aria-controls="collapse-2-1">
				                              세금계산서 관련 안내
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-1" class="collapse show" aria-labelledby="heading-2-1" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>최종 수정일  2022년 3월 25일<br><br>
											<strong>Ownit은 통신판매중개자로서 통신판매의 당사자가 아닙니다. 즉 Ownit은 개인간 거래를 중개하는 플랫폼이므로 판매자로부터 상품을 매입하거나, 구매자에게 상품을 판매하지 않습니다.</strong> 
											이에 임의로 온잇 주식회사 앞으로 세금계산서를 발행할 경우 서비스 제재 대상이 될 수 있음을 안내 드립니다.<br><br>
											<strong>사업자의 서비스 이용 제한</strong><br>
											Ownit은 개인간 거래 중개 플랫폼으로서 별도로 계약을 체결한 제휴 사업자 이외의 사업자는 서비스를 이용할 수 없으며, 해당 행위 적발 시 이용약관 제 7조 (이용제한) 및 제 21조 (부적절 행위)에 
											따라 서비스 이용 제한 및 회원 자격 상실 등 제재가 발생할 수 있습니다.<br><br>
											이에 따라 사업자의 매입증빙을 위한 세금 계산서 발행 요청 시 위 약관에 의거하여 서비스 이용이 제한됨을 알려드립니다.<br><br>
											<strong>1. 판매이력 확인경로</strong><br>
											'내 쇼핑' 판매내역 중 정산완료된 거래건으로 확인 가능<br>
											<strong>2. 구매이력 확인경로</strong><br>
											신용카드매출전표, 간편결제사(예. 네이버페이)를 통한 현금영수증 발급사항 확인 가능</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-2">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-2" aria-expanded="false" aria-controls="collapse-2-2">
				                              이용 제한 정책
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-2" class="collapse" aria-labelledby="heading-2-2" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>최종 수정일  2021년 11월 8일<br><br>
											Ownit은 회원이 이용약관 또는 관련 법령을 위반하거나 서비스의 정상적인 운영을 방해한 경우, 이용약관 제 7 조 (이용제한 등)에 따라 일시 또는 영구적으로 서비스 이용을 제한할 수 있습니다.<br><br>
											<strong>가품/중고품 판매</strong><br>
											적발 횟수에 따라 가산 적용됩니다.</p>
											<table class="table">
												<tr><td style="width: 200px;">최소</td><td style="color: red; font-weight: bolder;">경고 또는 15일 정지</td></tr>
												<tr><td style="width: 200px;">최대</td><td style="color: red; font-weight: bolder;">영구 이용정지</td></tr>
											</table>
											<p><strong>부정거래</strong></p><br>
											시세 조작 행위, 자전 거래 등의 시도가 확인될 경우, 적발 횟수에 따라 가산 적용됩니다.
											<table class="table">
												<tr><td style="width: 200px;">최소</td><td style="color: red; font-weight: bolder;">경고 또는 7일 정지</td></tr>
												<tr><td style="width: 200px;">최대</td><td style="color: red; font-weight: bolder;">영구 이용정지</td></tr>
											</table>
											<p><strong>명의/결제 도용</strong><br>
											타인 명의 또는 결제 도용이 확인된 경우, 이용정지 중인 계정을 소유한 회원과 동일인임이 확인되는 활성 계정의 경우,<br> 해당 계정은 서비스 이용이 제한됩니다.</p>
											<table class="table">
												<tr><td style="width: 200px;">명의 도용</td><td style="color: red; font-weight: bolder;">영구 이용정지</td></tr>
												<tr><td style="width: 200px;">결제 도용</td><td style="color: red; font-weight: bolder;">영구 이용정지</td></tr>
											</table>
											<p>회원은 이용제한 등에 대해 1:1 문의 등을 통하여 이의신청을 할 수 있으며, 유관부서의 검토를 통해 이의가 정당하다고 인정될 경우 서비스 이용을 재개합니다.</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-3">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-3" aria-expanded="false" aria-controls="collapse-2-3">
				                              부적절 행위 금지
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-3" class="collapse" aria-labelledby="heading-2-3" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>최종 수정일  2022년 8월 29일<br><br>
											아래에 해당하는 경우, 이용약관 제 7조(이용제한 등), 21조(부적절 행위)에 따라 일시정지나 영구이용정지 조치됩니다.<br>
											허위사실 유포 관련 고의성이 확인될 시, 유관부서로 이관되어 처리될 수 있습니다.<br><br>
											-가품 거래 시도<br>
											-중고품 거래 시도<br>
											-여러 개의 계정을 생성하여 자전거래<br>
											-결제 혜택 및 포인트 획득, 시세 조작 등의 목적으로 지인과 공모한 허위 거래<br>
											-신용카드 불법 현금 유통 (소위 카드깡)<br>
											-개인 정보를 타인에게 유출하거나 결제 카드를 대여하여 거래(가족, 친지 포함)<br>
											-부당한 목적으로 협의하여 계정이나 명의를 도용하여 부정거래(온라인, 오프라인 포함)<br>
											-커뮤니티 내 허위사실 유포 등 서비스 운영을 방해하는 각종 부정행위</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-4">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-4" aria-expanded="false" aria-controls="collapse-2-4">
				                              커뮤니티 가이드라인
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-4" class="collapse" aria-labelledby="heading-2-4" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>최종 수정일  2021년 12월 3일<br><br>
											Ownit 내 STYLE 서비스는 회원들의 일상 속 스니커즈, 의류 등의 패션 스타일을 공유하여 서로 영감을 얻을 수 있는 공간입니다.<br>
											모두가 건강하고 즐겁게 사용할 수 있는 공간을 만들기 위해 함께 노력해주세요.<br><br>
											커뮤니티 가이드라인은 서비스를 안전하게 유지하고 보호하기 위해 만들어진 정책입니다. 
											Ownit을 사용하면 <br>이 가이드라인과 이용약관에 동의하게 됩니다. 이 가이드라인을 위반하는 경우 콘텐츠가 삭제되거나, <br>계정이 비활성화되는 등의 제재를 받을 수 있습니다.<br><br>
											<strong>커뮤니티 활동</strong><br>
											-커뮤니티 활동이란 회원이 KREAM의 STYLE 서비스에 사진 및 의견을 포함한 콘텐츠를 게시하는 활동입니다.<br>
											-회원의 커뮤니티 활동은 다른 서비스 이용자가 콘텐츠를 다운로드하여 열람하거나 개인의 가정에서 비영리적인 목적으로 사적 이용하는 것을 허락한 것으로 간주합니다.<br>
											-회원은 Ownit의 이용약관에 어긋나지 않는 콘텐츠만을 게시할 수 있습니다.<br>
											-회원이 서비스 내에 게시하는 게시물은 서비스 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정 또는 편집되어 게시될 수 있습니다.<br><br>
											본 커뮤니티 가이드라인과 이용약관을 참고하시어 건강한 커뮤니티를 만들어주세요. Ownit의 STYLE이 최고의 패션 커뮤니티로 성장할 수 있도록 도와주셔서 감사합니다.<br><br>
											문의 사항이 있으신 경우 고객센터 또는 1:1문의하기로 문의하시기 바랍니다.</p>
				                          </div>
				                        </div>
				                      </div>                      
				                    </div>
				                  </div>
				                  
				                  <div class="tab-pane fade" id="component-2-2" role="tabpanel" aria-labelledby="component-2-2">
				                    <div class="accordion accordion-minimal" id="accordion-2">
				                      <div class="card">
				                        <div class="card-header" id="heading-2-1">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-2-1" aria-expanded="true" aria-controls="collapse-2-1">
				                              Ownit은 어떤 서비스 인가요?
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-1" class="collapse show" aria-labelledby="heading-2-1" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>Ownit은 쉽게 구매하기 어려운 한정판 상품을 판매하고 거래할 수 있는 서비스 입니다.<br>
											모든 상품은 사용한 적이 없는 완전한 새상품이며, 전문가의 철저한 검수를 통해 안전하고 신속하게 거래할 수 있습니다.</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-2">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-2" aria-expanded="false" aria-controls="collapse-2-2">
				                              거래 진행 일정이 궁금해요.
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-2" class="collapse" aria-labelledby="heading-2-2" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>거래가 체결된 시점부터 48시간(일요일・공휴일 제외) 내에 상품을 발송해야 하며, 통상적으로 발송 후 1-2일 내에 Ownit 검수센터에 도착합니다.<br>
				                            다만 해당 배송기간은 코로나19,명절 등의 특수 기간시 택배사의 물량에 따라 변동될 수 있습니다.<br>
											검수센터에 도착한 상품은 입고 완료 후 3영업일 내에 검수를 진행합니다.<br> 검수에 합격할 경우, 판매자는 익일에 등록한 계좌로 판매 금액이 입금되며, 구매자는 당일 또는 익일에 배송이 시작됩니다.</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-3">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-3" aria-expanded="false" aria-controls="collapse-2-3">
				                              고객센터 연락처를 알려주세요.
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-3" class="collapse" aria-labelledby="heading-2-3" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>서비스를 이용하며 느끼신 불편한 점이나 바라는 점을 알려주세요. 소중한 의견으로 더욱 성장하는 Ownit이 되겠습니다.<br><br>
											<strong>고객센터 1588-7813</strong><br>
											운영시간 평일 11:00 - 18:00 (토∙일, 공휴일 휴무)<br>
											점심시간 평일 13:00 - 14:00<br>
											문의 전화가 많아 연결이 다소 지연될 수 있습니다. 1:1 문의하기는 즉시 접수 가능합니다.<br><br>
											<strong>1:1 문의하기</strong><br>
											홈 > 하단 푸터 [1:1 문의]<br>
											MY > 하단 고객센터 안내 [1:1 문의]<br>
											24시간 접수 가능하며 답변시간 이후 접수건은 운영시간 내 순차적으로 답변해드립니다.</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-4">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-4" aria-expanded="false" aria-controls="collapse-2-4">
				                              해외 배송이 가능한가요?
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-4" class="collapse" aria-labelledby="heading-2-4" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>Ownit은 현재 국내 사용자를 대상으로 운영중입니다.<br>
											해외 판매자의 발송정보 입력 및 해외 구매자를 위한 국외 배송과 조회 기능을 제공하지 않으며, <br>원활한 거래를 위한 발송/입고 마감 기한 정책으로 인하여 해외 거주자의 판매와 구매는 원칙적으로 불가합니다.</p>
				                          </div>
				                        </div>
				                      </div>                      
				                    </div>                  
				                  </div>
				                  
				                  <div class="tab-pane fade" id="component-2-3" role="tabpanel" aria-labelledby="component-2-3">
				                    <div class="accordion accordion-minimal" id="accordion-2">
				                      <div class="card">
				                        <div class="card-header" id="heading-2-1">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-2-1" aria-expanded="true" aria-controls="collapse-2-1">
				                              상품 구매는 어떻게 하나요?
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-1" class="collapse show" aria-labelledby="heading-2-1" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>서비스 가입 후 로그인 한 회원은 누구나 상품을 구매할 수 있습니다.<br>
											상품을 검색하고, 원하는 사이즈를 선택한 후 구매 버튼을 누르면 즉시 구매 혹은 구매 입찰이 가능합니다.<br>
											즉시 구매하거나 입찰 후 거래가 체결되면 판매자가 상품을 검수 센터로 전달하여 검수를 진행하게 되며, <br>
											검수를 합격한 상품은 구매자에게 안전하게 배송됩니다.</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-2">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-2" aria-expanded="false" aria-controls="collapse-2-2">
				                              구매가 취소 되었어요.
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-2" class="collapse" aria-labelledby="heading-2-2" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>판매자의 의무 불이행으로 인해 구매가 취소될 수 있으며, 사유는 다음과 같습니다.<br>
											검수 불합격 : 허위/불량 상품을 등록하여 검수센터로 발송한 경우<br>
											판매거부 : 판매 거래 체결 이후 판매 거부를 선택하는 경우<br>
											발송지연 : 거래 체결 후, 48시간(일요일・공휴일 제외) 이내에 발송 정보를 입력하지 않는 경우<br>
											미입고 : 검수센터로 발송한 상품이 5일(일요일・공휴일 제외) 이내에 도착하지 않는 경우<br>
											검수기준악용: 불합격 반송을 목적으로 불량 상품을 보낸 경우(상품 불일치, 사이즈 불일치, 기본 구성품 누락 등)</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-3">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-3" aria-expanded="false" aria-controls="collapse-2-3">
				                              배송 주소 변경은 어떻게 하나요?
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-3" class="collapse" aria-labelledby="heading-2-3" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>구매 입찰 중인 주문은 언제든지 "입찰 변경하기" 버튼을 선택하여 주소를 변경하실 수 있습니다. <br>
				                            구매 진행 중인 주문은 해당 주문의 상세화면에서 진행 상황이 대기 중 / 발송완료 / 입고완료인 경우 배송 주소에서<br> 
				                            "배송지 변경" 버튼으로 변경 가능합니다.<br>
											변경 가능 : 대기 중 / 발송완료 / 입고완료<br>
											변경 불가능 : 검수 중 / 검수 합격<br>
											* 빠른배송 구매 및 구매 후 창고 보관을 선택한 경우 배송 주소를 변경할 수 없습니다.</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-4">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-4" aria-expanded="false" aria-controls="collapse-2-4">
				                              도착한 상품이 가품 같아요.
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-4" class="collapse" aria-labelledby="heading-2-4" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>도착한 상품이 가품으로 의심될 경우, 고객센터로 즉시 연락 해 주시기 바랍니다. <br>
											가품이 입증된 경우에는 결제 취소를 포함하여 체결금액의 300%를 보상해 드립니다.<br>
											고객센터 : 1588-7813 또는 서비스 내 1:1문의로 문의주시기 바랍니다.</p>
				                          </div>
				                        </div>
				                      </div>                      
				                    </div>                  
				                  </div>
				
				                  <div class="tab-pane fade" id="component-2-4" role="tabpanel" aria-labelledby="component-2-4">
				                    <div class="accordion accordion-minimal" id="accordion-2">
				                      <div class="card">
				                        <div class="card-header" id="heading-2-1">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-2-1" aria-expanded="true" aria-controls="collapse-2-1">
				                              판매 과정을 설명해주세요.
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-1" class="collapse show" aria-labelledby="heading-2-1" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>서비스 가입 후 로그인 한 회원은 상품을 판매할 수 있습니다.<br>
											판매하실 상품을 검색하고, 사이즈를 선택한 후 판매 버튼을 누르면 즉시 판매 혹은 판매 입찰이 가능합니다.<br>
											즉시 판매하거나 입찰 후 거래가 체결되면 상품을 검수 센터로 발송하고, 검수에 합격하게 되면 판매 대금을 정산해 드립니다.</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-2">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-2" aria-expanded="false" aria-controls="collapse-2-2">
				                              판매 거래 체결 후, 진행상황을 설명해주세요.
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-2" class="collapse" aria-labelledby="heading-2-2" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>
				                            <strong>[발송요청]</strong> 체결 후 48시간(일요일・공휴일 제외)내 상품을 발송하신 후, 발송 정보를 앱에 입력해주세요.<br>
				                            발송 정보 입력 마감 기한 이내에는 앱에서 직접 발송 정보를 수정할 수 있습니다.<br><br>
											<strong>[발송완료]</strong> 입력하신 발송정보의 상품이 검수센터로 이동하고 있습니다.<br>
											24시간 이내 조회되지 않거나 오입력으로 인해 발생하는 미입고는 판매자의 책임에 포함됩니다.<br>
											상품을 보유하지 않은 상태로 거래(해외구매/발매일 당일 등)하여 5일(일요일・공휴일 제외) 내에 도착하지 않은 건은<br>
											허위입력으로 간주하여 모두 미입고 처리되며 이때 페널티가 부과됩니다.<br><br>
											<strong>[입고대기]</strong> 검수센터 도착 후, 판매자가 입력한 발송정보의 택배를 확인하였습니다.<br><br>
											<strong>[입고완료]</strong> 포장을 개봉하여 체결된 거래의 상품이 맞는지 확인합니다. 발송정보는 일치하나 상품이 일치하지 않는 경우 해당 단계에서 미입고 처리됩니다.<br><br> 
											<strong>[검수 중]</strong> 전문 검수팀에서 검수를 진행합니다. 주문내역과 다른 상품은 바로 검수 불합격 처리됩니다. 상품에 따라 검수소요시간은 상이합니다.<br>
											-검수 합격 : 검수 합격 다음 영업일에 정산 처리됩니다.<br>
											-검수 불합격 : 판매자에게 반송 처리됩니다.<br><br>
											<strong>[정산완료]</strong> 판매대금이 지급되었습니다.</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-3">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-3" aria-expanded="false" aria-controls="collapse-2-3">
				                              판매 대금은 언제 정산이 되나요?
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-3" class="collapse" aria-labelledby="heading-2-3" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>보내주신 상품이 검수에 합격한 후 다음 영업일에 정산처리가 됩니다.<br> 
				                            예를 들어, 검수 합격일이 금요일이라면 다음 영업일인 월요일에 정산처리됩니다.<br> 
				                            대금은 판매시 입력하신 계좌로 즉시 입금됩니다.</p>
				                          </div>
				                        </div>
				                      </div>
				                      <div class="card">
				                        <div class="card-header" id="heading-2-4">
				                          <h5 class="mb-0">
				                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-2-4" aria-expanded="false" aria-controls="collapse-2-4">
				                              판매자의 주소 정보는 왜 필요한가요?
				                            </button>
				                          </h5>
				                        </div>
				                        <div id="collapse-2-4" class="collapse" aria-labelledby="heading-2-4" data-parent="#accordion-2">
				                          <div class="card-body">
				                            <p>검수에 합격하지 못한 경우, 해당 상품은 판매자에게 반송하게 됩니다. 이를 위해 판매 시, 미리 주소 정보를 받고 있습니다.<br> 
				                            반송 운임 기준은 아래와 같습니다.<br><br>   
				                           <strong>1. 착불 반송</strong><br>
				                            -검수 기준상 '불합격' 에 해당하는 반송건<br> 
				                            -발송정보 입력없이 검수센터 도착<br> 
				                            -입고 마감 기한 이후 검수센터 도착<br> 
				                            -거래 체결 전 상품 발송<br><br>  
				                            <strong>2. 선불 반송</strong><br> 
				                            '구매의사 확인' 이후 발생하는 반송건</p>
				                          </div>
				                        </div>
				                      </div>                      
				                    </div>                  
				                  </div>
				                </div>
							</div>
						</section>
					</div>		
				</div>		
				<!-- /notice_qna -->
			</div>
		</div>
	</section>
	<!-- /listing -->
    <!-- footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- / footer -->

    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/app.js"></script>
</body>
</html>