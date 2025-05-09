<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<title>결과</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="result-container">
        <div class="result-box">
            <h2 class="result-title">${result_title}</h2>
            <div class="result-message">
                ${result_msg}
            </div>
            <div class="result-actions">
                <button class="btn btn-primary" onclick="location.href='${result_url}'">확인</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
