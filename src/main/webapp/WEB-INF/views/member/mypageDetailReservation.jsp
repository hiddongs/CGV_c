<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>예약 내역</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/leftMenu.css">
  <style>
    body {
      margin: 0;
      font-family: 'Noto Sans KR', sans-serif;
    }
    .page-wrapper {
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    .page-layout {
      display: flex;
      flex: 1;
    }
    .container {
      flex: 1;
      padding: 40px;
    }
    .ticket-container {
      max-width: 800px;
      margin: 0 auto;
      background: #fff;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      display: flex;
      gap: 20px;
    }
    .movie-poster img {
      width: 180px;
      height: auto;
      border-radius: 8px;
    }
    .ticket-info {
      flex: 1;
    }
    .movie-title {
      font-size: 22px;
      font-weight: bold;
      margin-bottom: 20px;
    }
    .info-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }
    .info-item {
      background: #f9f9f9;
      border-radius: 6px;
      padding: 10px 15px;
    }
    .info-label {
      font-size: 14px;
      color: #666;
      margin-bottom: 5px;
    }
    .info-value {
      font-size: 16px;
      color: #222;
    }
    .highlight {
      color: #e50914;
      font-weight: 600;
    }
    .info-button {
      font-size: 13px;
      margin-left: 5px;
      color: #e50914;
      text-decoration: none;
    }
    .settings-button {
      font-size: 22px;
      color: #999;
      cursor: pointer;
      align-self: flex-start;
    }
  </style>
</head>
<body>
  <div class="page-wrapper">
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="page-layout">
      <jsp:include page="/WEB-INF/views/common/leftMenu.jsp" />
      <div class="container">
        <div class="ticket-container">
          <div class="movie-poster">
            <img src="${pageContext.request.contextPath}/upload/${movie.poster_url}" alt="${movie.description}">
          </div>
          <div class="ticket-info">
            <div class="movie-title">
              <span>${reservationList.title}</span>
            </div>
            <div class="info-grid">
              <div class="info-item">
                <div class="info-label">관람극장</div>
                <div class="info-value">${reservationList.name} <a href="#" class="info-button">[극장정보]</a></div>
              </div>
              <div class="info-item">
                <div class="info-label">관람인원</div>
                <div class="info-value">${reservationList.viewers}</div>
              </div>
              <div class="info-item">
                <div class="info-label">관람일시</div>
                <div class="info-value"><span class="highlight">${reservationList.screeningDate}</span></div>
              </div>
              <div class="info-item">
                <div class="info-label">관람좌석</div>
                <div class="info-value">${reservationList.seatID}</div>
              </div>
              <div class="info-item">
                <div class="info-label">상영관</div>
                <div class="info-value">${reservationList.movieType}관</div>
              </div>
              <div class="info-item">
                <div class="info-label">가격</div>
                <div class="info-value">${reservationList.pMovie}원</div>
              </div>
            </div>
          </div>
          <div class="settings-button">&#8942;</div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </div>
</body>
</html>
