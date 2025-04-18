<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header">
    <div class="container header_content">
        <h1><a href="${pageContext.request.contextPath}/"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png" alt="CGV"></a></h1>
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
    <nav class="nav_menu">
        <div class="container">
            <ul>
                <li><a href="${pageContext.request.contextPath}/movies">영화</a></li>
                <li><a href="${pageContext.request.contextPath}/theaters">극장</a></li>
                <li><a href="${pageContext.request.contextPath}/ticket">예매</a></li>
                <li><a href="${pageContext.request.contextPath}/event">이벤트</a></li>
            </ul>
        </div>
    </nav>
</header>