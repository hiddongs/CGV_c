<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV - 회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
    <div class="form-container">
        <h2>회원정보수정</h2>
        <form action="modify.do" method="post" id="modify_form">
            <div class="form-group">
                <label for="mem_id" class="form-label">아이디</label>
                <input type="text" id="mem_id" value="${member.user_id}" class="form-input" readonly>
            </div>
            <div class="form-group">
                <label for="mem_name" class="form-label">이름</label>
                <input type="text" name="mem_name" id="mem_name" value="${member.name}" class="form-input" required>
            </div>
            <div class="form-group">
                <label for="mem_phone" class="form-label">전화번호</label>
                <input type="tel" name="mem_phone" id="mem_phone" value="${member.phone}" class="form-input" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000" required>
            </div>
            <div class="form-group">
                <label for="mem_email" class="form-label">이메일</label>
                <input type="email" name="mem_email" id="mem_email" value="${member.email}" class="form-input" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">수정하기</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/member/myPage.do'">취소</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
