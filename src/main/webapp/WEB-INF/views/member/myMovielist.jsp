<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내가 본 영화</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="header">
		<div class="header-left">
			<h3>
				내가 본 영화 <span class="gray">1건</span>
			</h3>
			<div class="dropdown">
				<select id="filter" name="filter">
					<option value="all">전체</option>
				</select>
				<button>GO</button>
			</div>
		</div>
	</div>

	<!-- 영화 정보 -->
	<div class="movie-container">
		<img class="poster"
			src="${pageContext.request.contextPath}/upload/1085bdb5.jpg"
			alt="전우치">
		<div class="info">
			<h2>
				전우치 <span style="font-size: 14px;">(Jeon Woo-chi)</span>
			</h2>
			<p>2025.03.11 (화) 19:25 ~ 21:52</p>
			<p>CGV홍대 5관 9층 (Laser) / 1명</p>
			<p class="gray">이 영화를 평가해주세요</p>
		</div>
	</div>






	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>