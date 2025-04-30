<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 예매내역</title>
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

#main_nav h2 a {
	background-color: #f8f8f8;
	color: #222;
	font-size: 16px;
	padding: 12px;
	margin-bottom: 15px;
	display: block; /* <-- 추가 */
}

.menu-list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.menu-list li.section-reservation a {
	background-color: #ef4b64;
	color: #fff;
	padding: 10px;
	border-radius: 3px;
}

.menu-list li.menu-reservation {
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

/*버튼과 예매내역 위치*/
.res-container {
	width: 100%;
	background-color: #fff;
	padding: 20px;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
	color: #333;
	
}

.section {
	max-width: 800px;
	margin: 0 auto;
}

.title-wrap {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
	width: 50%;
	
}


.text-wrap {
	display: flex;
	flex-direction: column;
	/*position:absolute;*/
}

.title {
	font-weight: 700;
	font-size: 15px;
	color: #000;
}

.line {
	border: none;
	height: 1px;
	background: #ccc; /*줄 색상*/
	margin-top: 10px;
	/*margin: 10px 0;*/
	width: 500px;
}

.info {
	font-size: 13px;
	color: #333;
	line-height: 1.5;
	margin-top: 4px;
}

.movie-btn {
	background-color: #444;
	color: white;
	border: none;
	padding: 8px 12px;
	border-radius: 4px;
	font-size: 13px;
	cursor: pointer;
	white-space: nowrap;
}

.movie-btn:hover {
	background-color: #333;
}
</style>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<!-- 사이드바 부분 -->
	<nav id="main_nav">
		<div id="main_aside">
			<h2>
				<a href="${pageContext.request.contextPath}/member/myPage.do"
					style="text-decoration: none;"> My CGV HOME </a>
			</h2>
			<ul class="menu-list">
				<li class="section-reservation"><strong><a
						href="${pageContext.request.contextPath}/member/movieReservation.do">나의
							예매내역</a></strong></li>
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

	<div class="res-container">
		<div class="section">
			<div class="title-wrap">
				<div class="text-wrap">
					<div class="title">나의 예매내역</div>

					<div class="info">
						지난 <span style="color: red;">1개월</span>까지의 예매내역을 확인하실 수 있습니다.
					</div>
				</div>

				<!-- 오른쪽 버튼 -->
				<input type="button" class="movie-btn" value="내가 본 영화"
					onclick="location.href='${pageContext.request.contextPath}/member/myMovielist.do'">
			</div>
			<hr class="line">
		</div>
	</div>
	
	<table> <!-- 테이블 시작 -->
		<thead>
			<tr>
				<th>관람극장</th>
				<th>관람인원</th>
				<th>영화가격</th>
				<th>관람일시</th>
				<th>관람좌석</th>
				<th>상영관</th>
				<th>매수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "reservation" items="${reservationList}">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					
					
				</tr>
			</c:forEach>
			
		
		
		</tbody>
	</table>
	


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>