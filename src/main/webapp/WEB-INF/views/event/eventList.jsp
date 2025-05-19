<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<head>
  <meta charset="UTF-8">
  <title>이벤트 목록</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>

  <style>
    /* 탭 스타일 */
    .event-container {
      margin-top: 30px;
    }

    .event-menu {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .tab-list {
      list-style: none;
      display: flex;
      padding: 0;
      margin: 0;
    }

    .tab-list li {
      margin-right: 20px;
      padding: 8px 16px;
      border-radius: 20px;
      background-color: #eee;
      font-weight: bold;
      cursor: pointer;
    }

    .tab-list li.active {
      background-color: #e50914;
      color: white;
    }

    .tab-list li a {
      text-decoration: none;
      color: inherit;
    }

    .event-buttons button {
      margin-left: 10px;
      padding: 8px 12px;
      border: none;
      border-radius: 20px;
      cursor: pointer;
      font-weight: bold;
    }

    .btn-red {
      background-color: #e50914;
      color: white;
    }

    .btn-red-one {
      background-color: #555;
      color: white;
    }

    /* 카드 */
    .event-card {
      display: inline-block;
      width: 280px;
      margin: 10px;
      border: 1px solid #ccc;
      vertical-align: top;
      background-color: #fff;
      border-radius: 6px;
      overflow: hidden;
      cursor: pointer;
    }

    .event-card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }

    .event-card-content {
      padding: 10px;
    }

    /* 모달 */
    .modal {
      display: none;
      position: fixed;
      z-index: 9999;
      left: 0;
      top: 0;
      width: 100vw;
      height: 100vh;
      background-color: rgba(0, 0, 0, 0.85);
    }

    .modal-inner {
      position: relative;
      max-width: 80%;
      max-height: 90vh;
      margin: 60px auto;
      background: none;
      overflow-y: auto;
      text-align: center;
    }

    .modal-inner img {
      width: auto;
      height: auto;
      max-width: 100%;
      max-height: unset;
    }

    .close-modal {
      position: fixed;
      top: 20px;
      right: 40px;
      font-size: 35px;
      color: white;
      cursor: pointer;
      z-index: 10000;
    }
  </style>
</head>
<body>

<div class="page-main">
  <div class="event-container">
    <h2>EVENT</h2>
    <div class="event-menu">
      <ul class="tab-list">
        <li class="${selectedType eq 'SPECIAL' ? 'active' : ''}">
          <a href="eventList.do?type=SPECIAL">SPECIAL</a>
        </li>
        <li class="${selectedType eq '영화' ? 'active' : ''}">
          <a href="eventList.do?type=영화">영화/예매</a>
        </li>
        <li class="${selectedType eq '제휴' ? 'active' : ''}">
          <a href="eventList.do?type=제휴">제휴/할인</a>
        </li>
      </ul>
      <div class="event-buttons">
        <button class="btn-red">당첨자 발표</button>
        <button class="btn-red-one">종료된 이벤트</button>
      </div>
    </div>
  </div>

  <hr>

  <!-- 이벤트 카드 목록 -->
  <div>
    <c:forEach var="event" items="${eventList}">
      <div class="event-card" onclick="showModal('${pageContext.request.contextPath}/resources/images/${event.poster_url}')">
        <img src="${pageContext.request.contextPath}/resources/images/${event.poster_url}" alt="${event.title}">
        <div class="event-card-content">
          <p><strong>${event.title}</strong></p>
          <p>
            <fmt:formatDate value="${event.start_date}" pattern="yyyy.MM.dd" /> ~
            <fmt:formatDate value="${event.end_date}" pattern="yyyy.MM.dd" />
          </p>
          <c:choose>
            <c:when test="${event.end_date.time lt now.time}">
              <p style="color:gray;">종료</p>
            </c:when>
            <c:otherwise>
              <c:set var="dDayRaw" value="${(event.end_date.time - now.time) / (1000*60*60*24)}"/>
              <c:set var="dDay" value="${fn:substringBefore(dDayRaw, '.')}"/>
              <p style="color:red;">D-${dDay}</p>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<!-- 모달 -->
<div id="imageModal" class="modal">
  <span class="close-modal" onclick="closeModal()">&times;</span>
  <div class="modal-inner">
    <img id="modalImage" src="">
  </div>
</div>

<script>
function showModal(imageSrc) {
  $('#modalImage').attr('src', imageSrc);
  $('#imageModal').fadeIn();
}
function closeModal() {
  $('#imageModal').fadeOut();
}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
