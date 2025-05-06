<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 선택 후 극장 선택 폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hiddongs.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
    <!-- <div class="center-box"> -->
        <div class="inner-box fade-in">
            <div class="theater-hero">
  <div class="hero-text">영화관을 선택해주세요</div>
</div>
<form action="selectTime.do" method="post">
    <input type="hidden" name="movieID" value="${movieID}">
    <select name="theaterID">
        <c:forEach var="theater" items="${theaterList}">
            <option value="${theater.theaterId}">${theater.name}</option>
        </c:forEach>
    </select>
    <button type="submit">상영 시간 보기</button>
</form>

           
        </div>
   <!--  </div> -->
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const select = document.getElementById('theater');
    if (select) {
        select.addEventListener('change', function() {
            const selectedTheater = select.value;
            console.log('선택된 극장:', selectedTheater);
            // 여기서 추가 로직도 가능
        });
    }
  });
</script>
</html>