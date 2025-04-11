<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container">
    <div class="form-container">
        <h2>마이페이지</h2>
        <div class="user-info">
            <div class="info-group">
                <label class="info-label">아이디</label>
                <span class="info-value">${member.mem_id}</span>
            </div>
            <div class="info-group">
                <label class="info-label">이름</label>
                <span class="info-value">${member.mem_name}</span>
            </div>
            <div class="info-group">
                <label class="info-label">전화번호</label>
                <span class="info-value">${member.mem_phone}</span>
            </div>
            <div class="info-group">
                <label class="info-label">이메일</label>
                <span class="info-value">${member.mem_email}</span>
            </div>
            <div class="info-group">
                <label class="info-label">가입일</label>
                <span class="info-value">${member.mem_regdate}</span>
            </div>
        </div>
        <div class="button-group">
            <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/modifyForm.do'">회원정보수정</button>
            <button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/member/deleteForm.do'">회원탈퇴</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">홈으로</button>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
