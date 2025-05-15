<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 예매 상세페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/leftMenu.css">

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

</style>

</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- LEFT MENU -->
	<jsp:include page="/WEB-INF/views/common/leftMenu.jsp"></jsp:include>
	
	<div class="container">
        <div class="ticket-container">
            <div class="movie-poster">
            <!--  <div data-poster="${pageContext.request.contextPath}/upload/${movie.poster_url}"></div>-->
                <img src="${pageContext.request.contextPath}/upload/${movie.poster_url}" alt="${movie.description}">
            </div>
            
            
            	<!-- 
				<tr>
					<th>영화제목</th>
					<th>관람극장</th>
					<th>관람일시</th>
					<th>상영관</th>
					<th>관람인원</th>
					<th>관람좌석</th>
					<th>가격</th>
				</tr>
				 -->
            
            
            <div class="ticket-info">
                <div class="movie-title">
                    <span>${reservation.mvTitle}</span>
                </div>
                
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">관람극장</div>
                        <div class="info-value">${reservation.name} 
                        <a href="#"class="info-button">[극장정보]</a></div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">관람인원</div>
                        <div class="info-value">${reservation.viewers}</div>
                    </div>

                    <div class="info-item">
                        <div class="info-label">관람일시</div>
                        <div class="info-value"><span class="highlight">${reservation.screeningDate}</span></div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">관람좌석</div>
                        <div class="info-value">${reservation.seatName }</div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">상영관</div>
                        <div class="info-value">${reservation.movieType}관</div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">가격</div>
                        <div class="info-value">${reservation.pMovie}원</div>
                    </div>
                </div>
            </div>
            <div class="settings-button">⋮</div>
        </div>
    </div>
	

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>