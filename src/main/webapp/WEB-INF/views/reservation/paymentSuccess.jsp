<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<style>
body {
  font-family: 'Noto Sans KR', sans-serif;
  background-color: #1c1c1c;
  padding: 40px;
  color: #eee;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #2e2e2e;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

h2 {
  color: #e50914;
  text-align: center;
  margin-bottom: 20px;
}

.summary {
  line-height: 1.8;
  font-size: 15px;
  color: #ddd;
}

.label {
  font-weight: bold;
  color: #fff;
}

hr {
  margin: 20px 0;
  border: none;
  border-top: 1px solid #444;
}

p {
  margin: 5px 0;
}
</style>
</head>
<body>
<div class="container">
  <h2>🎉 결제가 완료되었습니다!</h2>
  <p style="text-align:center;">감사합니다. 아래는 예매 및 결제 내역입니다.</p>
  <hr>

  <div class="summary">
    <p><span class="label">예매 번호:</span> ${reservation.reservationID}</p>
    <p><span class="label">회원 이름:</span> ${member.name}</p>
    <p><span class="label">영화 제목:</span> ${reservation.mvTitle}</p>
    <p><span class="label">상영관:</span> ${reservation.movieType}</p>
    <p><span class="label">극장:</span> ${reservation.name}</p>
    <p><span class="label">관람 날짜:</span> ${reservation.screeningDate}</p>
    <p><span class="label">관람 인원:</span> ${reservation.viewers}명</p>
    <p><span class="label">좌석 번호:</span> ${reservation.seatName}</p>
    <p><span class="label">정가 금액:</span> ${reservation.pMovie}원</p>
    <p><span class="label">결제일:</span> ${reservation.paymentDate}</p>
    <p><span class="label">결제 상태:</span> ${reservation.paymentStatus}</p>
    <p><span class="label">결제 금액:</span> ${reservation.totalPrice}원</p>
    <hr>
    <p><span class="label">사용한 쿠폰:</span>
      <c:choose>
        <c:when test="${usedCouponName ne null}">
          ${usedCouponName}
        </c:when>
        <c:otherwise>
          사용 안 함
        </c:otherwise>
      </c:choose>
    </p>

    <p><span class="label">사용한 포인트:</span> 
      <c:out value="${pointUsed}" default="0"/>P
    </p>
    <p><span class="label">적립된 포인트:</span> 
      <c:out value="${earnedPoint}" default="0"/>P
    </p>
  </div>

  <hr>
 
</div>
</body>
</html>
