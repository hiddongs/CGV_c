<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 시간 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<style>
body {
  background-color: #1c1c1c;
  color: white;
  font-family: 'Noto Sans KR', sans-serif;
  padding: 40px;
}
.container {
  max-width: 720px;
  margin: 0 auto;
  background-color: #2e2e2e;
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 6px 15px rgba(0,0,0,0.5);
}
h2 {
  text-align: center;
  margin-bottom: 30px;
  color: #fff;
}
form {
  margin-bottom: 20px;
}
label {
  color: #ccc;
}
input[type="date"] {
  padding: 10px;
  width: 100%;
  border-radius: 8px;
  border: 1px solid #666;
  background-color: #444;
  color: #fff;
  margin-top: 10px;
  margin-bottom: 20px;
}
input[type="date"]:focus {
  border-color: #e50914;
  outline: none;
}
.time-box {
  background-color: #3a3a3a;
  border-radius: 10px;
  padding: 15px;
  margin-bottom: 12px;
  transition: background 0.3s;
}
.time-box:hover {
  background-color: #505050;
}
input[type="radio"] {
  margin-right: 10px;
}
.btn {
  background-color: #e50914;
  color: white;
  border: none;
  padding: 12px 20px;
  border-radius: 6px;
  font-size: 16px;
  cursor: pointer;
  transition: background 0.3s;
}
.btn:hover {
  background-color: #c20710;
}
</style>
</head>
<body>

<div class="container">
  <h2>🎬 상영 시간 선택</h2>

  <!-- 날짜 조회용 폼 -->
  <form action="selectTime.do" method="get">
    <input type="hidden" name="movieID" value="${movieID}" />
    <input type="hidden" name="theaterID" value="${theaterID}" />
    <input type="hidden" name="auditoriumID" value="${auditoriumID}" />
    
    <label for="screenDate">상영 날짜 선택:</label>
    <input type="date" id="screenDate" name="screenDate" value="${screenDate}" required />
    <button type="submit" class="btn w-100">조회</button>
  </form>

  <!-- 상영 시간 리스트 출력 -->
  <c:choose>
    <c:when test="${not empty scheduleList}">
      <form action="selectSeat.do" method="post">
      <input type="hidden" name="memberID" value="${mem_ID}" />
        <input type="hidden" name="movieID" value="${movieID}" />
        <input type="hidden" name="theaterID" value="${theaterID}" />
        <input type="hidden" name="auditoriumID" value="${auditoriumID}" />

        <p><strong>상영 시간 선택:</strong></p>
        
        <c:forEach var="schedule" items="${scheduleList}">
          <fmt:formatDate value="${schedule.startTime}" pattern="HH:mm" var="startTime" />
          <fmt:formatDate value="${schedule.endTime}" pattern="HH:mm" var="endTime" />

          <div class="time-box">
            <input type="radio" name="scheduleID" value="${schedule.scheduleID}" id="s${schedule.scheduleID}" required />
            <label for="s${schedule.scheduleID}">
              ${startTime} ~ ${endTime} - ${schedule.auditoriumName}
              <c:if test="${not empty schedule.auditoriumType}">
                (${schedule.auditoriumType})
              </c:if>
            </label>
          </div>
        </c:forEach>

        <button type="submit" class="btn w-100">좌석 선택</button>
      </form>
    </c:when>
    <c:otherwise>
      <p style="color: #bbb;">조회된 상영 시간이 없습니다. 다른 날짜를 선택해 주세요.</p>
    </c:otherwise>
  </c:choose>
</div>

</body>
</html>
