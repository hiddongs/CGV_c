<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매 대문 페이지</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<iframe src="reservationMV.do"
            width="100%"
            height="3000"
            frameborder="0">

</iframe>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>