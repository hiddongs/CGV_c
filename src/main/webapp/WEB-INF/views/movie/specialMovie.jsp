<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>특별관 소개 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hiddongs.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">


        </head>

<body>
<div class="special-container">
    <h2 class="special-title">CGV만의 특별함이 있는 영화관을 소개합니다.</h2>
    <p class="special-desc">진화된 3S(Screen, Sound, Seat) 기술로 몰입도를 극대화한 환경을 제공합니다.</p>

    <div class="special-grid">
        <!-- 1행 -->
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

        <!-- 2행 -->
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

</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
