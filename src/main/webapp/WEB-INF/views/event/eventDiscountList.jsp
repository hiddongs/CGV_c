<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layout.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<div class="page-main">
		
			<div class="event-container">
				<!--이벤트 메인  -->
				<h2>EVENT</h2>
				<div class="event-menu">
					<ul class="tab-list">
						<li>SPECIAL</li>
						<li>영화/예매</li>
						<li class="active">>제휴/할인</li>
					</ul>
					<div class="event-buttons">
						<button class="btn-red">당첨자 발표</button>
						<button class="btn-red-one">종료된 이벤트</button>
					</div>
				</div>
			</div>
			<hr>
			</div>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>