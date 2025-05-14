
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<style>
body {
  background-color: #1c1c1c;
  color: #fff;
  font-family: 'Noto Sans KR', sans-serif;
  padding: 40px;
}

.container {
  max-width: 720px;
  margin: 0 auto;
  background-color: #2e2e2e;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.5);
}

h2 {
  text-align: center;
  margin-bottom: 30px;
  color: #ffffff;
}

/* 스크린 박스 */
.screen {
  background-color: #ffffff;
  height: 40px;
  margin: 20px auto;
  width: 100%;
  transform: rotateX(-45deg);
  box-shadow: 0 4px 10px rgba(255, 255, 255, 0.5);
  border-radius: 8px;
}

/* 좌석 행 */
.row {
  display: flex;
  justify-content: center;
  margin-bottom: 10px;
}

/* 좌석 */
.seat {
  width: 32px;
  height: 32px;
  background-color: #888;
  margin: 5px;
  border-radius: 6px;
  text-align: center;
  line-height: 32px;
  font-size: 14px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.seat.selected {
  background-color: #e50914;
  color: #fff;
}

.seat.reserved {
  background-color: #444;
  color: #ccc;
  cursor: not-allowed;
  pointer-events: none;
}

/* 예약 버튼 및 기타 버튼 공통 */
button,
input[type="submit"] {
  background: linear-gradient(to right, #e50914, #a1080f);
  color: white;
  border: none;
  padding: 12px 24px;
  font-size: 16px;
  border-radius: 8px;
  cursor: pointer;
  margin-top: 20px;
  width: 100%;
  transition: background-color 0.3s ease, transform 0.3s ease;
}

button:hover,
input[type="submit"]:hover {
  background-color: #c20710;
  transform: scale(1.03);
}

button:active,
input[type="submit"]:active {
  transform: scale(0.95);
}

/* 인원 수 선택 버튼 스타일 */
.countBtn {
  margin: 3px;
  width: 40px;
  height: 40px;
  font-size: 15px;
  font-weight: bold;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 2px solid transparent;
  border-radius: 6px;
  background-color: #444;
  color: #fff;
  cursor: pointer;
  transition: all 0.25s ease-in-out;
  box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.5);
}

/* 호버 시 */
.countBtn:hover {
  background-color: #666;
  border-color: #888;
}

/* 어른 버튼 선택 시 파란 배경 + 진한 글씨 + 내부 강조 효과 */
[id^="adultBtn"].selected {
  background: linear-gradient(to bottom, #007bff, #0056b3) !important;
  color: #fff !important;
  font-weight: bold;
  box-shadow: inset 0 0 5px rgba(255, 255, 255, 0.2), 0 0 12px rgba(0, 123, 255, 0.6);
  transform: scale(1.05);
}

/* 어린이 버튼 선택 시 분홍 배경 + 진한 글씨 + 내부 강조 효과 */
[id^="childBtn"].selected {
  background: linear-gradient(to bottom, #e83e8c, #b02564) !important;
  color: #fff !important;
  font-weight: bold;
  box-shadow: inset 0 0 5px rgba(255, 255, 255, 0.2), 0 0 12px rgba(232, 62, 140, 0.6);
  transform: scale(1.05);
}


/* 버튼 정렬 */
.inline-btns {
  display: flex;
  justify-content: center;
  gap: 10px;
}


</style>
</head>
<body>
<div class="container">
  <h2 style="text-align:center;">🎟 좌석 선택</h2>
  <p>사용자 이름: ${userName}</p>
  <p>영화 제목: ${movieTitle}</p>
  <p>극장 : ${theaterName}</p>
  <p>관람 날짜 : ${screeningDate}</p>

  <!-- 인원 수 선택 영역 -->
  <div style="text-align:center; margin-bottom: 20px;">
    <h3>👨‍👩‍👧‍👦 인원 수 선택 (최대 4명)</h3>
    <div>
      <p>어른:</p>
      <div class="inline-btns">
        <c:forEach var="i" begin="0" end="4">
          <button type="button" onclick="setCount('adult', ${i})" id="adultBtn${i}" class="countBtn">${i}</button>
        </c:forEach>
      </div>
    </div>
    <div style="margin-top:10px;">
      <p>어린이:</p>
      <div class="inline-btns">
        <c:forEach var="i" begin="0" end="4">
          <button type="button" onclick="setCount('child', ${i})" id="childBtn${i}" class="countBtn">${i}</button>
        </c:forEach>
      </div>
    </div>
  </div>

  <form name="movie" action="reserve.do" method="post">
    <input type="hidden" id="adultCount" name="adultCount">
<input type="hidden" id="childCount" name="childCount">
    
    <input type="hidden" id="viewers" name="viewers" />
    <input type="hidden" id="selectedSeats" name="selectedSeats"/>
    <input type="hidden" name="memberID" value="${mem_ID}" />
    <input type="hidden" name="scheduleID" value="${scheduleID}" />

    <div class="screen"></div>

    <c:if test="${not empty seatList}">
      <c:set var="prevRow" value="" />
      <c:forEach var="seat" items="${seatList}">
        <c:if test="${seat.seatRow ne prevRow}">
          <c:if test="${not empty prevRow}"></div></c:if>
          <div class="row">
          <c:set var="prevRow" value="${seat.seatRow}" />
        </c:if>

        <c:set var="isReserved" value="false"/>
        <c:forEach var="r" items="${reservedSeatList}">
          <c:if test="${seat.seatName eq r}">
            <c:set var="isReserved" value="true"/>
          </c:if>
        </c:forEach>

        <div class="seat ${isReserved ? 'reserved' : ''}" 
             data-seat="${seat.seatName}">
          ${seat.seatName}
        </div>
      </c:forEach>
      </div>
    </c:if>

    <button type="button" onclick="reservation()">예약하기</button>
  </form>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
  let adultCount = 0;
  let childCount = 0;

  document.querySelectorAll('.seat').forEach(seat => {
    seat.addEventListener('click', () => {
      if (!seat.classList.contains('reserved')) {
        seat.classList.toggle('selected');
        updateSeats();
      }
    });
  });

  window.setCount = function(type, value) {
    const otherType = type === 'adult' ? 'child' : 'adult';
    const otherValue = parseInt(document.getElementById(otherType + 'Count').value || '0');
    if (value + otherValue > 4) {
      alert('총 인원 수는 4명을 초과할 수 없습니다.');
      return;
    }

    document.getElementById(type + 'Count').value = value;
    for (let i = 0; i <= 4; i++) {
      document.getElementById(type + 'Btn' + i).classList.remove('selected');
    }
    document.getElementById(type + 'Btn' + value).classList.add('selected');
    updateSeats();
  }

  function updateSeats() {
    const selected = document.querySelectorAll('.seat.selected');
    const seatNames = Array.from(selected).map(seat => seat.dataset.seat);
    document.getElementById('selectedSeats').value = seatNames.join(',');
    document.getElementById('viewers').value = seatNames.length;
  }

  window.reservation = function () {
    const f = document.movie;
    const selectedSeatsValue = document.getElementById('selectedSeats').value;
    const seats = selectedSeatsValue ? selectedSeatsValue.split(',') : [];
    const adultCount = parseInt(document.getElementById('adultCount').value || '0');
    const childCount = parseInt(document.getElementById('childCount').value || '0');
    const totalPeople = adultCount + childCount;

    if (totalPeople === 0) {
      alert("어른 또는 어린이를 1명 이상 선택해야 합니다.");
      return;
    }
    if (seats.length === 0) {
      alert("좌석을 1개 이상 선택해야 합니다.");
      return;
    }
    if (seats.length !== totalPeople) {
      alert(`선택한 인원 수와 좌석 수가 일치해야 합니다.`);
      return;
    }
    f.submit();
  }
});
</script>
</body>
</html>