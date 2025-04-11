<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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