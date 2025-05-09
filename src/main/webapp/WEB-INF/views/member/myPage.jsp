<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CGV - 마이페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<style>
.container {
	margin-left: 240px; /* 사이드바 너비만큼 왼쪽 여백을 줘서 콘텐츠가 오른쪽으로 이동 */
	padding: 20px;
}

.mypage-container {
	max-width: 800px;
	margin: 30px auto;
	background: #fff;
	border-radius: 8px;
	padding: 20px;
}

.mypage-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
	padding-bottom: 15px;
	border-bottom: 1px solid #eee;
}

.mypage-header h2 {
	font-size: 24px;
	color: #333;
	margin: 0;
}

.vip-tag {
	color: #fb4357;
	font-size: 14px;
}

.mypage-section {
	margin-bottom: 30px;
}

.mypage-item {
	padding: 15px 0;
	border-bottom: 1px solid #eee;
}

.mypage-item:last-child {
	border-bottom: none;
}

.mypage-label {
	color: #666;
	font-size: 14px;
	margin-bottom: 5px;
}

.mypage-content {
	color: #333;
	font-size: 16px;
}

.mypage-date {
	color: #999;
	font-size: 12px;
	margin-top: 5px;
}

.mypage-point {
	color: #fb4357;
	font-weight: bold;
}

.button-group {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
	margin-top: 20px;
}

.confirm-button {
	background: #666;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
}

/* 사이드바 스타일 */
#main_nav {
	width: 240px;
	background-color: #f8f8f8;
	font-family: sans-serif;
	border-right: 1px solid #ccc;
	height: 850px;
	padding: 20px;
	float: left;
}

#main_nav h2 {
	background-color: #ef4b64;
	color: white;
	font-size: 16px;
	padding: 12px;
	margin-bottom: 15px;
}

.menu-list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.menu-list li {
	margin: 6px 0;
}

.menu-list li.section-title {
	font-weight: bold;
	margin-top: 15px;
	color: #222;
}

.menu-list li a {
	color: #444;
	text-decoration: none;
	padding-left: 10px;
	display: block;
	font-size: 14px;
}

.menu-list li a:hover {
	color: #ef4b64;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<!-- 사이드바 부분 -->
	<nav id="main_nav">
		<div id="main_aside">
			<h2>My CGV HOME</h2>
			<ul class="menu-list">
				<li class="section-title"><strong><a href="${pageContext.request.contextPath}/member/movieReservation.do">
				나의 예매내역</a></strong></li>
				<li class="section-title"><strong><a href="#">관람권/할인쿠폰
							관리</a></strong></li>
				<li><a href="#">-CGV할인쿠폰</a></li>
				<li><a href="#">-CJ ONE 쿠폰</a></li>
				<li class="section-title"><strong><a href="#">이벤트
							참여내역</a></strong></li>
				<li class="section-title"><strong><a href="#">회원정보</a></strong></li>
				<li><a href="#">-개인정보 설정</a></li>
				<li><a href="#">-회원탈퇴</a></li>
				<li class="section-title"><strong><a href="#">나의
							문의내역</a></strong></li>
				<li><a href="#">-1:1 문의</a></li>
			</ul>
		</div>
	</nav>
  
	<div class="container">
		<div class="mypage-container">
			<div class="mypage-header">
				<h2>${member.name}님 <span class="vip-tag">${member.grade} 등급</span>
				</h2>
				<button type="button" class="confirm-button"
					onclick="location.href='${pageContext.request.contextPath}/member/modifyForm.do'">회원정보수정</button>
			</div>
			
			<div class="mypage-section">
				<div class="mypage-item">
					<div class="mypage-label">
					<a href ="${pageContext.request.contextPath}/member/movieReservation.do" style="text-decoration: none; color: inherit;">> 나의 예매내역</a>
					</div>
					<div class="mypage-content">예시1</div>
					<div class="mypage-date">2023.04.16 (화) | 20:30 | COD 2인 |
						2만원</div>
					<div class="mypage-content">예시2</div>
					<div class="mypage-date">2023.04.16 (화) | 14:20 | 예매 12건</div>
				</div>

				<div class="mypage-item">
					<div class="mypage-label">> 관람권/할인쿠폰 관리</div>
					<div class="mypage-content mypage-coupon">${coupon.couponid}
						쿠폰</div>
				</div>

				<div class="mypage-item">
					<div class="mypage-label">> 문의내역</div>
					<div class="mypage-content">블랙팬서입니다</div>
					<div class="mypage-date">2023.04.16 (화) | 10:30 | 등록완료</div>
					<div class="mypage-content">집가고싶다</div>
					<div class="mypage-date">2023.04.16 (화) | 10:30 | 등록완료</div>
				</div>

				<div class="mypage-item">
					<div class="mypage-label">> 나의 포인트</div>
					<div class="mypage-content mypage-point">${member.point}
						point</div>
					<div class="mypage-date">다음 적립예정 2,500P 적립예정</div>
				</div>
			</div>

			<div class="button-group">
				<button type="button" class="btn btn-danger"
					onclick="location.href='${pageContext.request.contextPath}/member/deleteForm.do'">회원탈퇴</button>
				<button type="button" class="btn btn-secondary"
					onclick="location.href='${pageContext.request.contextPath}/main/main.do'">홈으로</button>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>