<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CGV - 마이페이지</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/leftMenu.css">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: 'Noto Sans KR', sans-serif;
    }

    .page-wrapper {
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    .page-layout {
      display: flex;
      flex: 1;
      min-height: calc(100vh - 160px); /* 헤더 + 푸터 고려 */
    }

    #main_nav {
      width: 240px;
      background-color: #f8f8f8;
      border-right: 1px solid #ccc;
      padding: 20px;
      box-sizing: border-box;
    }

    .mypage-container-wrapper {
      flex: 1;
      padding: 40px;
      box-sizing: border-box;
    }

    .mypage-container {
      max-width: 800px;
      margin: 0 auto;
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

    .button-group {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
      margin-top: 20px;
    }

    .confirm-button, .btn {
      background: #666;
      color: white;
      border: none;
      padding: 8px 16px;
      border-radius: 4px;
      font-size: 14px;
      cursor: pointer;
    }

    .btn-danger {
      background-color: #e50914;
    }

    .btn-secondary {
      background-color: #999;
    }

    .footer {
      background: #1c1c1c;
      color: #fff;
      text-align: center;
      padding: 40px 0;
    }
  </style>
</head>
<body>

  <div class="page-wrapper">
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="page-layout">
      <jsp:include page="/WEB-INF/views/common/leftMenu.jsp" />

      <div class="mypage-container-wrapper">
        <div class="mypage-container">
          <div class="mypage-header">
            <h2>${member.name}님 <span class="vip-tag">${member.grade} 등급</span></h2>
            <button type="button" class="confirm-button" onclick="location.href='${pageContext.request.contextPath}/member/modifyForm.do'">회원정보수정</button>
          </div>

          <!-- 예매 내역 -->
          <div class="mypage-section">
            <div class="mypage-item">
              <div class="mypage-label">
                <a href="${pageContext.request.contextPath}/reservation/reservationList.do" style="text-decoration: none; color: inherit;">> 나의 예매내역</a>
              </div>
              <div class="mypage-content">
                <c:forEach var="reservation" items="${reservationList}">
                  <h3>${reservation.mvTitle}</h3>
                  <div class="mypage-date">${reservation.screeningDate} | ${reservation.name} | ${reservation.viewers}명 | ${reservation.pMovie}원</div>
                </c:forEach>
              </div>
            </div>
          </div>

          <!-- 쿠폰 목록 -->
          <div class="mypage-item">
            <a href="${pageContext.request.contextPath}/member/mypageCoupon.do" style="text-decoration: none; color: inherit;">
              <div class="mypage-label">> 할인쿠폰 관리</div>
            </a>
            <div class="mypage-content">
              <c:forEach var="coupon" items="${couponList}">
                <div>
                  <strong>${coupon.couponName}</strong><br>
                  할인 금액: ${coupon.discountAmount}원 | 유효기간: ${coupon.expired_date}
                </div>
              </c:forEach>
            </div>
          </div>

          <!-- 문의 내역 -->
          <div class="mypage-item">
            <a href="${pageContext.request.contextPath}/notice/ask.do" style="text-decoration: none; color: inherit;">
              <div class="mypage-label">> 문의내역</div>
            </a>
            <div class="mypage-content">블랙팬서입니다</div>
            <div class="mypage-date">2023.04.16 (화) | 10:30 | 등록완료</div>
            <div class="mypage-content">집가고싶다</div>
            <div class="mypage-date">2023.04.16 (화) | 10:30 | 등록완료</div>
          </div>

          <div class="button-group">
            <button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/member/deleteForm.do'">회원탈퇴</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">홈으로</button>
          </div>

        </div>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </div>

</body>
</html>
