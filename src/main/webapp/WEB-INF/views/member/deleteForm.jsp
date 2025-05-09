<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<div class="container">
    <div class="form-container">
        <h2>회원탈퇴</h2>
        <form action="delete.do" method="post">
            <div class="form-group">
                <label for="mem_id" class="form-label">탈퇴하는 아이디</label>
                <input type="text" id="mem_id" value="${member.user_id}" class="form-input" readonly>
            </div>
            <div class="form-group">
                <label for="mem_pw" class="form-label">비밀번호 확인</label>
                <input type="password" name="mem_pw" id="mem_pw" class="form-input" required>
            </div>
            <div class="form-group">
                <p class="warning-text">* 회원탈퇴시 모든 데이터가 삭제되며 복구할 수 없습니다.</p>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-danger" onclick="return confirm('정말 탈퇴하시겠습니까?')">탈퇴하기</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/member/myPage.do'">취소</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>