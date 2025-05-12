<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- left Menu -->
<nav id="main_nav">
		<div id="main_aside">
			<h2><a href="${pageContext.request.contextPath}/member/myPage.do">My CGV HOME</a></h2>
			<ul class="menu-list">
				<li class="section-title"><strong><a href="${pageContext.request.contextPath}/member/mypageDetailReservation.do">
				나의 예매내역</a></strong></li>
				<li class="section-title"><strong><a href="${pageContext.request.contextPath}/member/mypageCoupon.do">할인쿠폰 관리</a></strong></li>
				<li><a href="#">-CGV쿠폰</a></li>
				<li><a href="#">-CJ ONE 쿠폰</a></li>
				<li class="section-title"><strong><a href="#">이벤트
							참여내역</a></strong></li>
				<li class="section-title"><strong><a href="#">회원정보</a></strong></li>
				<li><a href="#">-개인정보 설정</a></li>
				<li><a href="#">-회원탈퇴</a></li>
				<li class="section-title"><strong><a href="${pageContext.request.contextPath}/notice/ask.do">나의
							문의내역</a></strong></li>
				<li><a href="#">-1:1 문의</a></li>
			</ul>
		</div>
	</nav>