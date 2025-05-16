<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header">
    <div class="container header_content">
        <h1><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/cgvLogo.png" alt="CGV"></a></h1>
        <ul class="memberInfo_wrap">
            <c:choose>
                <c:when test="${empty sessionScope.member}">
                    <li><a href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a></li>
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
                <li><a href="${pageContext.request.contextPath}/movie/moviePage.do">영화</a>

                </li>
                <li><a href="${pageContext.request.contextPath}/movie/theaterPage.do">극장</a>
                    <ul>
                      <li><a href="${pageContext.request.contextPath}/movie/specialMovie.do">특별관</a>
                      
                      </li>
                    </ul>
                <li><a href="${pageContext.request.contextPath}/movie/reservationMVform.do">예매</a></li>
                <li><a href="${pageContext.request.contextPath}/event">이벤트</a>
                	<ul> <!-- ul태그 안에 li태그, li안에 하위 ul 넣기 -->
                		<li><a href="${pageContext.request.contextPath}/event/eventList.do">이벤트</a></li>
                		<li><a href="${pageContext.request.contextPath}/event/eventList.do">SPECIAL</a></li>
                		<li><a href="${pageContext.request.contextPath}/event/eventList.do">영화/예매</a></li>
                		<li><a href="${pageContext.request.contextPath}/event/eventList.do">제휴/할인</a></li>	
                		
                	</ul>
                </li>
                
            </ul>
        </div>
    </nav>
</header>