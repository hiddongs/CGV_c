<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <title>상영 시간 선택</title>
</head>
<body>
  <form action="theaterSubmit.do" method="get">
    <input type="hidden" name="movieID" value="${movieID}" />
    <input type="hidden" name="theaterID" value="${theaterID}" />
    날짜:
    <input type="date" name="screenDate" value="${screenDate}" required />
    <input type="submit" value="조회" />
  </form>

  <c:if test="${not empty scheduleList}">
    <form action="seatSelect.do" method="post">
      <input type="hidden" name="movieID" value="${movieID}" />
      <input type="hidden" name="theaterID" value="${theaterID}" />
      
      <p><strong>상영시간 선택:</strong></p>
      <c:forEach var="schedule" items="${scheduleList}">
        <c:set var="time" value="${fn:substring(schedule.screeningTime, 11, 16)}"/>
        <input type="radio" name="scheduleID" value="${schedule.scheduleID}" id="s${schedule.scheduleID}" required />
        <label for="s${schedule.scheduleID}">
          ${time} (${schedule.auditoriumType})  <!-- ✅ 특별관 표기 -->
        </label><br/>
      </c:forEach>

      <button type="submit">좌석 선택</button>
    </form>
  </c:if>
</body>
</html>
