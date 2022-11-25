<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- sidebar -->
<aside class="col-lg-3 sidebar">
	<div class="widget">
		<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-1" aria-expanded="false" aria-controls="collapse-1" role="button">
		Filter by Category
		</span>
		<div class="d-lg-block collapse" id="collapse-1">
			<a href="mypage?member_idx=${sessionScope.sIdx }"><span class="widget-title">마이페이지</span></a>
			<div class="widget-content">
				<ul id="page-nav" class="nav flex-column nav-category">
					<li class="nav-item">
						<a class="nav-link" data-toggle="collapse" href="#menu-2" role="button" aria-expanded="false" aria-controls="menu-2">쇼핑 정보</a>
						<div class="collapse show" id="menu-2" data-parent="#page-nav">
							<div>
								<ul class="nav flex-column">
									<li class="nav-item">
										<a class="nav-link" href="mypage_order?member_idx=${sessionScope.sIdx }">구매내역</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="mypage_sell?member_idx=${sessionScope.sIdx }">판매내역</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="wishlist?member_idx=${sessionScope.sIdx }">관심상품</a>
									</li>
								</ul>
							</div>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="collapse" href="#menu-3" role="button" aria-expanded="false" aria-controls="menu-3">내 정보</a>
						<div class="collapse show" id="menu-3" data-parent="#page-nav">
							<div>
								<ul class="nav flex-column">
									<li class="nav-item">
										<a class="nav-link" href="mypage_profile?member_idx=${sessionScope.sIdx }">프로필 정보</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="mypage_revise?id=${sessionScope.sId }">비밀번호 변경</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="address?member_idx=${sessionScope.sIdx }">주소록</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="mypage_account?member_idx=${sessionScope.sIdx }">판매 정산 계좌</a>
									</li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</aside>
<!-- /sidebar -->