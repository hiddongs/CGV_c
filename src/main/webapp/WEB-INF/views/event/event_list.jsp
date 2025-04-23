<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class ="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<div class = "event-contain">
		<h2>EVENT</h2>
		<div class="event-menu">
			<ul class="tab-list">
				<li class="active">SPECIAL</li>
				<li>영화/예매</li>
				<li>제휴/할인</li>
			</ul>
			<button class="btn1-red">당첨자 발표</button>
			<button class="btn2-red">종료된 이벤트</button>
		</div>
	</div>
	<hr> <!-- 아래 실선 -->
</div>
</body>
</html>