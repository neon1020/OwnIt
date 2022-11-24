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
			
				<!-- notice_authPolicy -->
				<div class="col-lg-9">
					<div class="row gutter-2 gutter-lg-3">
						<section id="component-2">
						<h3>검수 기준</h3>
						<div class="component">
							<ul class="nav nav-tabs lavalamp" id="component-2" role="tablist" style="margin-top: 30px;">
								<li class="nav-item">
									<a class="nav-link active" data-toggle="tab" href="#component-2-1" role="tab" aria-controls="component-2-1" aria-selected="true"></a>
								</li>
							</ul>
							<div class="tab-content mt-3" id="component-1-content">
								<div class="tab-pane fade show active" id="component-2-1" role="tabpanel" aria-labelledby="component-2-1">
									<div class="accordion accordion-minimal" id="accordion-2">
										<div class="card">
											<div class="card-header" id="heading-2-1">
												<h5 class="mb-0">
												<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-2-1" aria-expanded="true" aria-controls="collapse-2-1">
													<p><strong>[업데이트] 2022/06/24 금<br>
													[적용일시] 2022/07/01 금 00:00 체결 건 부터</strong></p>
												</button>
												</h5>
											</div>
											<div id="collapse-2-1" class="collapse show" aria-labelledby="heading-2-1" data-parent="#accordion-2">
												<div class="card-body">
													<p>Ownit의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해 지속적으로<br> 
													업데이트 되고 있습니다. 거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<br><br>
													회원님께서 판매 또는 구매하신 모든 상품은 Ownit의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 <br>
													확인한 후, 검수 합격 시에만 출고하고 있습니다.<br><br>
													<p style="color: red;">※ 전자기기 거래 관련 주의사항<br> 
													Ownit은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나, <br>
													통신판매 중개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.<br><br>
													제품 기능에 관한 사항이나 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.<br>
													단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)<br><br>
													실링/밀봉 패키지 개봉 시 가치가 하락할 수 있는 상품의 경우 내용물은 검수하지 않습니다.<br>
													상품 정보 확인, 박스 상태 점검 및 재포장 흔적 유무에 대한 다방면 검수가 진행됩니다.<br><br>
													미사용 상태 유지를 위해 정상작동 여부는 확인이 불가합니다.<br><br></p>
													<p>Ownit의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는 기준, <br>
													또는 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단하지 않으며,<br>
													이로 인한 구매 취소는 불가하므로 신중한 거래 부탁드립니다.<br><br>
													고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 특정 모델의 제조공정에<br>
													따른 개체차이와 관련하여서는 <strong>검수센터 책임자의 최종 판단 하에 결정하게 됩니다.</strong><br><br>
													Ownit의 검수기준에 동의하지 않으실 경우 거래가 불가하오니 거래 당사자는 거래에 앞서 <br>
													Ownit의 검수기준을 반드시 검토하시기 바랍니다.</p>
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
				<!-- notice_authPolicy -->
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