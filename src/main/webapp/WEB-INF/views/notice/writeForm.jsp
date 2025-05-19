<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성 폼</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
<div class="inquiry-form">
    <h2>1:1 문의 작성</h2>
    <form action="${pageContext.request.contextPath}/notice/write.do" method="post">
        <label for="theaterID">문의 CGV</label>
        <select id="theaterID" name="theaterID" required>
            <option value="">극장을 선택하세요</option>
            <c:forEach var="theater" items="${theaterList}">
                <option value="${theater.theaterId}">${theater.name}</option>
            </c:forEach>
        </select>
        
        <label for="category">문의 유형</label>
        <select id="category" name="category" required>
            <option value="">선택하세요</option>
            <option value="예매">예매</option>
            <option value="결제">결제</option>
            <option value="관람">관람</option>
            <option value="기타">기타</option>
        </select>

        <label for="title">제목</label>
        <input type="text" id="title" name="title" placeholder="문의 제목을 입력하세요" required>

        <label for="content">내용</label>
        <textarea id="content" name="content" placeholder="문의 내용을 작성하세요" required></textarea>

        <button type="submit">문의 등록</button>
    </form>
</div>
</body>
</html>