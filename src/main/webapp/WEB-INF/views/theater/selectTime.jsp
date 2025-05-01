<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경작 시간 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hiddongs.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script>
$(function() {
  // 날짜 선택 감지
  $("#screenDate").on("change", function() {
    const selectedDate = $(this).val();
    const movieID = $("#movieID").val();
    const theaterID = $("#theaterID").val();

    if (!selectedDate || !movieID || !theaterID) {
      alert("모든 정보가 선택되지 않았습니다.");
      return;
    }

    $.ajax({
      url: "${pageContext.request.contextPath}/movie/getScheduleByDate.do",
      type: "GET",
      dataType: "json",
      data: {
        movieID: movieID,
        theaterID: theaterID,
        
      },
      success: function(data) {
    	  $("#timeButtonList").empty();
    	  
    	  const selectedDate = $("#screenDate").val(); // yyyy-mm-dd

    	  $.each(data, function(i, schedule) {
    		  console.log("시간:", schedule.screeningTime); // 이것도 찍혀야 함
    	    const radioID = "schedule_" + schedule.scheduleID;
    	    const time = schedule.screeningTime.substring(0, 5); // "HH:mm" 형식

    	    // 예시 필터: 아침/점심/저녁 구간으로 직접 나누고 싶다면 여기에 조건 작성

    	    const buttonHtml = `
    	      <input type="radio" name="scheduleID" id="${radioID}" value="${schedule.scheduleID}" hidden required>
    	      <label for="${radioID}" class="time-btn">${time}</label>
    	    `;
    	    $("#timeButtonList").append(buttonHtml);
    	  });
    	}
,
      error: function() {
    	  console.log("Ajax 실패");
    	  console.log("상태:", status);
    	  console.log("에러:", err);
    	  console.log("응답:", xhr.responseText);  // 여기에 오류 메시지 뜸
        alert("시간 정보를 불러오는데 실패했습니다.");
      }
    });
  });
});
</script>
</head>
<body>
<form action="timeSubmit.do" method="post">
  <div class="inner-box fade-in">
    <div class="movie-title">
      <h4>선택 영화 : ${selectedMovie.mv_title}</h4>
      <input type="hidden" id="movieID" name="movieID" value="${movieID}">
      <input type="hidden" id="theaterID" name="theaterID" value="${theaterID}">
    </div>
    <div class="date-selector">
      <input type="date" id="screenDate" name="screenDate" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
    </div>
    <div id="timeButtonList">
      <!-- 날짜를 선택하면 여기에 시간 버튼(라디오)들이 생성됨 -->
    </div>
  </div>
</form>
</body>
</html>
