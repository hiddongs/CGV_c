<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>통합 결제 페이지</title>
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/hiddongs.css">
	<style>
	<style>
body {
  background-color: #1c1c1c;
  color: #fff;
  font-family: 'Noto Sans KR', sans-serif;
  padding: 40px;
}

h2 {
  text-align: center;
  color: #fff;
  margin-bottom: 30px;
}

form {
  max-width: 600px;
  margin: 0 auto;
  background-color: #2e2e2e;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4);
}

p {
  font-size: 16px;
  margin: 10px 0;
}

label {
  display: block;
  margin-top: 20px;
  color: #ddd;
  font-weight: bold;
}

select,
input[type="number"] {
  width: 100%;
  padding: 10px 14px;
  border-radius: 8px;
  border: 1px solid #777;
  background-color: #444;
  color: #fff;
  font-size: 15px;
  margin-top: 6px;
  transition: border-color 0.3s;
}

select:focus,
input[type="number"]:focus {
  border-color: #e50914;
  outline: none;
  box-shadow: 0 0 5px rgba(229, 9, 20, 0.4);
}

input[type="submit"] {
  background: linear-gradient(to right, #e50914, #a1080f);
  color: white;
  border: none;
  padding: 14px 0;
  font-size: 16px;
  border-radius: 8px;
  cursor: pointer;
  margin-top: 30px;
  width: 100%;
  box-shadow: 0 4px 15px rgba(229, 9, 20, 0.4);
  transition: transform 0.3s, box-shadow 0.3s;
}

input[type="submit"]:hover {
  transform: scale(1.05);
  box-shadow: 0 6px 25px rgba(255, 0, 0, 0.5);
}

input[type="submit"]:active {
  transform: scale(0.95);
}

#displayFinalPrice {
  color: #ffd700;
  font-size: 18px;
  font-weight: bold;
}
</style>
	</style>
  <script>
    function updateFinalPrice() {
      const basePrice = parseInt(document.getElementById("basePrice").value);
      const couponSelect = document.getElementById("couponSelect");
      const couponDiscount = parseInt(couponSelect.options[couponSelect.selectedIndex].dataset.discount || 0);
      const pointUsed = parseInt(document.getElementById("pointUsed").value || 0);
      const pointMax = parseInt(document.getElementById("pointUsed").max);

      if (pointUsed > pointMax) {
        alert("보유 포인트를 초과할 수 없습니다.");
        document.getElementById("pointUsed").value = pointMax;
        return;
      }

      let finalPrice = basePrice - couponDiscount - pointUsed;
      if (finalPrice < 0) finalPrice = 0;

      document.getElementById("displayFinalPrice").innerText = finalPrice + "원";
      document.getElementById("finalPrice").value = finalPrice;
    }
  </script>
</head>
<body onload="updateFinalPrice()">

<h2>🎟 결제 페이지</h2>

<form action="paymentProcess.do" method="post">
  <input type="hidden" id="basePrice" value="${calculatedPrice}" name="basePrice">
  <input type="hidden" id="finalPrice" name="finalPrice" value="">

  <p>기본 금액: <strong>${calculatedPrice}원</strong></p>
  <p>관람 인원: <strong>${reservation.viewers}명</strong></p>
  <p>어른 : <strong>${reservation.adultCount}명</strong></p>
  <p>어린이 : <strong>${reservation.childCount}명</strong></p>
  <label>쿠폰 선택:
    <select id="couponSelect" name="cpPossessId" onchange="updateFinalPrice()">
      <option value="0" data-discount="0">쿠폰 사용 안 함</option>
      <c:forEach var="coupon" items="${couponList}">
        <option value="${coupon.cpPossessId}" data-discount="${coupon.discountAmount}">
          ${coupon.couponName} (-${coupon.discountAmount}원)
        </option>
      </c:forEach>
    </select>
  </label><br><br>

  <label>포인트 사용 (보유: ${member.point}):
    <input type="number" id="pointUsed" name="pointUsed" value="0" min="0" max="${member.point}" oninput="updateFinalPrice()">
  </label><br><br>

  <p>최종 결제 금액: <strong id="displayFinalPrice"></strong></p>

  <label>결제 수단:
    <select name="paymentMethod">
      <option value="card">신용카드</option>
      <option value="bank">계좌이체</option>
    </select>
  </label><br><br>

  <input type="hidden" name="reservationID" value="${reservation.reservationID}">
  <input type="submit" value="결제하기">
</form>
</body>
</html>