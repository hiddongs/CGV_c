<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 시간 선택</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/hiddongs.css">

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
            <input type="radio" name="scheduleID" value="${schedule.scheduleId}" id="s${schedule.scheduleId}" required />
            <label for="s${schedule.scheduleId}">
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
