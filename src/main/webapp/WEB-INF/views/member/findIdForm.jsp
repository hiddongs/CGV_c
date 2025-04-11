<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container">
    <div class="form-container">
        <h2>아이디 찾기</h2>
        <form action="findId.do" method="post">
            <div class="form-group">
                <label for="mem_name" class="form-label">이름</label>
                <input type="text" name="mem_name" id="mem_name" class="form-input" required>
            </div>
            <div class="form-group">
                <label for="mem_email" class="form-label">이메일</label>
                <input type="email" name="mem_email" id="mem_email" class="form-input" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">아이디 찾기</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/member/loginForm.do'">취소</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
