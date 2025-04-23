<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty member and member.member_id != 1}">
	<c:redirect url="${pageContext.request.contextPath}/main/main.do"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<title>관리자 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../common/adminHeader.jsp" />
	<div class="container">
		<div class="form-container">
			<a href="${pageContext.request.contextPath}/member/adminInsertMovieForm.do"><h3>영화등록</h3></a>
			<a href="${pageContext.request.contextPath}/member/adminMovieManagement.do"><h3>영화관리</h3></a>
				
		</div>
	</div>
</body>
</html>
