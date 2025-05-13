<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나의 문의내역</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	
	 <h1>나의 문의내역</h1>
    <div class="count-info">1:1 문의</div>
    
    <div class="search-box">
        <input type="text" class="search-input" placeholder="문의조회">
        <button class="search-button">검색하기</button>
    </div>
    
    <div class="util-box">
        <div class="total-count">총 0건</div>
        <button class="view-select-button">신청상세</button>
    </div>
    
    <table>
        <thead>
            <tr>
                <th><input type="checkbox" title="선택"></th>
                <th>문의CGV</th>
                <th>유형</th>
                <th>제목</th>
                <th>등록일</th>
                <th>상태</th>
                <th>만족도</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="7" class="empty-message">고객님의 상담 내역이 존재하지 않습니다.</td>
            </tr>
        </tbody>
    </table>
    <div class="divider"></div>
	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>