<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="cgv_wrap">
	<%@ include file="../common/header.jsp" %>
	<div class="container">
        <div class="form-container">
            <h2>로그인</h2>
            <form action="login.do" method="post">
                <div class="form-group">
                    <label for="mem_id" class="form-label">아이디</label>
                    <input type="text" name="mem_id" id="mem_id" class="form-input" required>
                </div>
                <div class="form-group">
                    <label for="mem_pw" class="form-label">비밀번호</label>
                    <input type="password" name="mem_pw" id="mem_pw" class="form-input" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
                <div class="form-links">
                    <a href="${pageContext.request.contextPath}/member/findIdForm.do">아이디 찾기</a> |
                    <a href="${pageContext.request.contextPath}/member/findPwForm.do">비밀번호 찾기</a> |
                    <a href="${pageContext.request.contextPath}/member/registerForm.do">회원가입</a>
                </div>
            </form>
        </div>
    </div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>