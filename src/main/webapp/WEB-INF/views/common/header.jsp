<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV</title>
    <!-- 공통 스타일시트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="cgvwrap">
        <!-- 헤더 영역 -->
        <header class="header">
            <div class="header_content">
                <div class="contents">
                    <h1>
                        <a href="${pageContext.request.contextPath}/">
                            <img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png" alt="CGV">
                        </a>
                    </h1>
                    <ul class="memberInfo_wrap">
                        <c:choose>
                            <c:when test="${empty sessionScope.member}">
                                <li><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
                                <li><a href="${pageContext.request.contextPath}/member/registerForm.do">회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
                            </c:otherwise>
                        </c:choose>
                        <li><a href="${pageContext.request.contextPath}/member/myPage.do">MY CGV</a></li>
                        <li><a href="${pageContext.request.contextPath}/support">고객센터</a></li>
                    </ul>
                </div>
            </div>
            <!-- 메인 네비게이션 -->
            <nav class="nav_menu">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/movies">영화</a></li>
                    <li><a href="${pageContext.request.contextPath}/theaters">극장</a></li>
                    <li><a href="${pageContext.request.contextPath}/ticket">예매</a></li>
                    <li><a href="${pageContext.request.contextPath}/event">이벤트</a></li>
                </ul>
            </nav>
        </header>
    </div>
</body>
</html>