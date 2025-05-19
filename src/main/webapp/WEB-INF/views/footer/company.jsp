<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV 회사소개</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h2>CGV 소개</h2>
        <div class="content-box">
            <h3>Cultureplex CGV</h3>
            <p>FILMO는 최고의 영화 상영 기술과 다양한 문화 콘텐츠를 통해 
               최적의 영화 관람 환경을 제공하는 글로벌 문화 플랫폼입니다.</p>
            
            <h3>CGV의 비전</h3>
            <p>See you at CGV<br>
               더 많은 사람들이 영화를 통해 더 행복한 삶을 누릴 수 있도록,<br>
               FILMO는 '영화 그 이상의 감동'을 선사하는 No.1 Cultureplex가 되겠습니다.</p>
            
            <h3>사업분야</h3>
            <ul>
                <li>영화관 사업</li>
                <li>특별관 운영</li>
                <li>매점 사업</li>
                <li>광고 사업</li>
            </ul>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 