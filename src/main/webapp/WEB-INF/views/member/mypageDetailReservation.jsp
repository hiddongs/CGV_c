<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 예매내역</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layout.css">

<style>
.container {
	margin-left: 240px; /* 사이드바 너비만큼 왼쪽 여백을 줘서 콘텐츠가 오른쪽으로 이동 */
	padding: 20px;
}

.mypage-container {
	max-width: 800px;
	margin: 30px auto;
	background: #fff;
	border-radius: 8px;
	padding: 20px;
}

.mypage-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
	padding-bottom: 15px;
	border-bottom: 1px solid #eee;
}

.mypage-header h2 {
	font-size: 24px;
	color: #333;
	margin: 0;
}

.vip-tag {
	color: #fb4357;
	font-size: 14px;
}

.mypage-section {
	margin-bottom: 30px;
}

.mypage-item {
	padding: 15px 0;
	border-bottom: 1px solid #eee;
}

.mypage-item:last-child {
	border-bottom: none;
}

.mypage-label {
	color: #666;
	font-size: 14px;
	margin-bottom: 5px;
}

.mypage-content {
	color: #333;
	font-size: 16px;
}

.mypage-date {
	color: #999;
	font-size: 12px;
	margin-top: 5px;
}

.mypage-point {
	color: #fb4357;
	font-weight: bold;
}

.button-group {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
	margin-top: 20px;
}

.confirm-button {
	background: #666;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
}

</style>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<!-- 사이드바 부분 -->
	<nav id="main_nav">
		<div id="main_aside">
			<h2>
				<a href="${pageContext.request.contextPath}/member/myPage.do"
					style="text-decoration: none;"> My CGV HOME </a>
			</h2>
			<ul class="menu-list">
				<li class="section-reservation"><strong><a
						href="${pageContext.request.contextPath}/member/mypageDetailReservation.do">나의
							예매내역</a></strong></li>
				<li class="section-title"><strong><a href="#">관람권/할인쿠폰
							관리</a></strong></li>
				<li><a href="#">-CGV할인쿠폰</a></li>
				<li><a href="#">-CJ ONE 쿠폰</a></li>
				<li class="section-title"><strong><a href="#">이벤트
							참여내역</a></strong></li>
				<li class="section-title"><strong><a href="#">회원정보</a></strong></li>
				<li><a href="#">-개인정보 설정</a></li>
				<li><a href="#">-회원탈퇴</a></li>
				<li class="section-title"><strong><a href="#">나의
							문의내역</a></strong></li>
				<li><a href="#">-1:1 문의</a></li>
			</ul>
		</div>
	</nav>
<div class="res-container">
  <div class="section">
    <div class="title-wrap">
      <div class="text-wrap">
        <div class="title">나의 예매내역</div>
        <div class="info">
          지난 <span style="color: red;">1개월</span>까지의 예매내역을 확인하실 수 있습니다.
        </div>
      </div>

      <!-- 오른쪽 버튼 -->
      <input type="button" class="movie-btn" value="내가 본 영화"
             onclick="location.href='${pageContext.request.contextPath}/member/myMovielist.do'">
    </div>
    <!-- <hr class="line"> -->
    <hr size="1" noshade="noshade" width="100%">
  </div>

  <div class="page-main">
    <div class="content-main">

      <c:if test="${reservation.payment_status == '완료'}">
        <div class="item-image">
          <img src="${pageContext.request.contextPath}/upload/${movie.poster_url}" width="300" alt="영화 포스터">
        </div>

        <div class="reservation-detail">
          <form id="reservation_cart">

            <!-- 예약 정보 hidden 처리 -->
            <input type="hidden" name="reservation_num" value="${reservation.reservation_num}" id="reservation_num">
            <input type="hidden" name="reservation_mvtitle" value="${reservation.mv_title}" id="reservation_mvtitle">
            <input type="hidden" name="reservation_name" value="${reservation.name}" id="reservation_name">
            <input type="hidden" name="reservation_price" value="${reservation.price}" id="reservation_price">
            <input type="hidden" name="reservation_viewers" value="${reservation.viewers}" id="reservation_viewers">
            <input type="hidden" name="reservation_screeningTime" value="${reservation.screeningTime}" id="reservation_screeningTime">
            <input type="hidden" name="reservation_seatnum" value="${reservation.seat_num}" id="reservation_seatnum">

            <!-- 예약 정보 출력 -->
            <ul>
              <li>영화 제목: <b><span>${reservation.mv_title}</span></b></li>
              <li>관람 극장: <b><span>${reservation.name}</span></b></li>
              <li>가격: <b><fmt:formatNumber value="${reservation.price}"/>원</b></li>
              <li>관람 인원: <b><span>${reservation.viewers}</span>명</b></li>
              <li>관람 일시: <b><fmt:formatDate value="${reservation.screeningTime}" pattern="yyyy-MM-dd HH:mm" /></b></li>
              <li>관람 좌석: <b><span>${reservation.seat_num}</span></b></li>
              <li>
                상영관: <b>
                  <c:if test="${reservation.imax eq 'Y'}">IMAX </c:if>
                  <c:if test="${reservation.screenx eq 'Y'}">/ SCREENX </c:if>
                  <c:if test="${reservation.fourdx eq 'Y'}">/ 4DX </c:if>
                  <c:if test="${reservation.threed eq 'Y'}">/ 3D </c:if>
                  <c:if test="${reservation.twod eq 'Y'}">/ 2D </c:if>
                </b>
              </li>
            </ul>

          </form>
        </div>
      </c:if>

    </div>
  </div>
</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>