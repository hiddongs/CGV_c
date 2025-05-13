<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>영화 예매 대문 페이지</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

  <style>
  
    /* iframe을 감싸는 컨테이너 */
    .iframe-container {
      position: relative;
      z-index: 10;
      width: 70%;
      height: 800px;
      padding: 30px;
      box-sizing: border-box;
      
       background-color: white; /* iframe 배경 흰색 */
       margin: 0 auto;
    }

    .iframe-container iframe {
      width: 100%;
      height: 100%;
      border-radius: 12px;
      
     
      border: none;
    }
     body {
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans KR', sans-serif;
  }
  </style>
</head>

<body>
 

  <!-- 🖼️ iframe 컨텐츠 -->
  <div class="iframe-container">
    <iframe src="reservationMV.do" frameborder="0"></iframe>
  </div>
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
