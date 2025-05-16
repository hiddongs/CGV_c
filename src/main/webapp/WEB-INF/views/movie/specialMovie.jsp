<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>특별관 소개 페이지</title>
   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>/* 전체 컨테이너 */
.special-container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 40px 20px;
    text-align: center;
}

/* 제목 및 설명 */
.special-title {
    font-size: 36px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #111;
}

.special-desc {
    color: #666;
    margin-bottom: 30px;
    font-size: 16px;
}

/* 카드 레이아웃 */
.special-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}

/* 카드 공통 스타일 */
.special-card {
    display: flex;
    flex-direction: column;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
    height: 280px;
}

.special-card:hover {
    transform: translateY(-6px);
}

/* 이미지 크기 고정 */
.card-wide img,
.card-narrow img {
    height: 180px;
    width: 100%;
    object-fit: cover;
}

/* 텍스트 영역 */
.special-text {
    padding: 15px;
    text-align: left;
}

.special-text h3 {
    font-size: 20px;
    margin: 0 0 5px;
    color: #000;
}

.special-text p {
    font-size: 14px;
    color: #555;
}
    </style>
</head>
<body>
<div class="special-container">
    <h2 class="special-title">CGV만의 특별함이 있는 영화관을 소개합니다.</h2>
    <p class="special-desc">진화된 3S(Screen, Sound, Seat) 기술로 몰입도를 극대화한 환경을 제공합니다.</p>

    <div class="special-grid">
        <div class="special-card card-wide">
            <img src="${pageContext.request.contextPath}/resources/images/imax.jpg" alt="IMAX">
            <div class="special-text">
                <h3>IMAX</h3>
                <p>궁극의 몰입감</p>
            </div>
        </div>
        <div class="special-card card-narrow">
            <img src="${pageContext.request.contextPath}/resources/images/4dx.jpg" alt="4DX">
            <div class="special-text">
                <h3>4DX</h3>
                <p>특별한 오감체험</p>
            </div>
        </div>
        <div class="special-card card-narrow">
            <img src="${pageContext.request.contextPath}/resources/images/3d.jpg" alt="3D">
            <div class="special-text">
                <h3>3D</h3>
                <p>생생한 몰입</p>
            </div>
        </div>
        <div class="special-card card-wide">
            <img src="${pageContext.request.contextPath}/resources/images/screenx.jpg" alt="SCREENX">
            <div class="special-text">
                <h3>SCREENX</h3>
                <p>세계 최초 다면 상영관</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
