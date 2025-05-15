<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 완료</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/hiddongs.css">

</head>
<body>
	<div class="center-box">
		<div class="inner-box fade-in">
			<h2 class="r-title">🎉 예매가 완료되었습니다!</h2>
			<p class="r-subText">고객님의 예매 내역은 다음과 같습니다.</p>
			<hr style="margin: 20px 0; border-top: 1px solid #444;">

			<c:choose>
				<c:when test="${not empty reservation}">
					<div class="r-text" style="line-height: 2;">
						<p>
							<strong class="r-strong">🎫 예매 번호:</strong>
							${reservation.reservationID}
						</p>
						<p>
							<strong class="r-strong">👤 회원 이름:</strong>
							${reservation.mem_Name}
						</p>
						<p>
							<strong class="r-strong">🎬 영화 제목:</strong>
							${reservation.mvTitle}
						</p>
						<p>
							<strong class="r-strong">🏛 상영관:</strong>
							${reservation.auditoriumName}
						</p>
						<p>
							<strong class="r-strong">🕒 상영 일시:</strong>
							${reservation.screeningDate}
						</p>
						<p>
							<strong class="r-strong">💺 좌석 번호:</strong>
							${reservation.seatName}
						</p>
						<p>
							<strong class="r-strong">👥 관람 인원:</strong>
							${reservation.viewers}명
						</p>
					</div>

				</c:when>
				<c:otherwise>
					<p class="r-subText">⚠ 예약 정보를 불러올 수 없습니다. 다시 시도해 주세요.</p>
				</c:otherwise>
			</c:choose>

			<br>
			<form action="payment.do" method="get">
				<input type="hidden" name="reservationID"
					value="${reservation.reservationID}"> <input type="hidden"
					name="adultCount" value="${adultCount}"> <input
					type="hidden" name="childCount" value="${childCount}"> <input
					type="submit" value="결제화면으로 이동">
			</form>

		</div>
	</div>
</body>
</html>

