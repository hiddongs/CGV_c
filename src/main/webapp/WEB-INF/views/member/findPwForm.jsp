<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<div class="container">
    <div class="form-container">
        <h2>비밀번호 찾기</h2>
        <form action="findPw.do" method="post">
            <div class="form-group">
                <label for="mem_id" class="form-label">아이디</label>
                <input type="text" name="mem_id" id="mem_id" class="form-input" required>
            </div>
            <div class="form-group">
                <label for="mem_email" class="form-label">이메일</label>
                <input type="email" name="mem_email" id="mem_email" class="form-input" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/member/loginForm.do'">취소</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
