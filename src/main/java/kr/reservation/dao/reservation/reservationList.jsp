<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 목록</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/leftMenu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
	});
});
</script>

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
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- LEFT MENU -->
	<jsp:include page="/WEB-INF/views/common/leftMenu.jsp"></jsp:include>
	
	
	<div class="MyList-container">
  <div class="MyList-header">
    <div class="header-title">
      <strong>My 예매내역</strong>
      <p>${member.name}님의예매내역 입니다.</p>
    </div>
    <a href="#" class="view-button">내가 본 영화</a>
  </div>
  
  <div class="search-area">
    <form action="orderList.do" method="post" id="search_form">
      <div class="search-container">
        <select name="keyfield" id="keyfield" class="search-select">
          <option value="1" <c:if test="${param.keyfield == 1}"></c:if>> 영화제목</option>
          <option value="2" <c:if test="${param.keyfield == 2}"></c:if>> 극장이름</option>
        </select>
        <input type="search" name="keyword" id="keyword" value="${param.keyword}" class="search-input">
        <input type="submit" value="찾기" class="search-button">
      </div>
    </form>
  </div>
  
  <div class="list-space align-right">
    <input type="button" value="MyPage" onclick="location.href='orderList.do'">
    <input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
  </div>
  
  <table class="reservation-table">
    <thead>
      <tr>
        <th>영화제목</th>
        <th>관람극장</th>
        <th>관람일시</th>
        <th>관람인원</th>
        <th>가격</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="reservation" items="${reservationList}">
        <tr>
          <td><a href="${pageContext.request.contextPath}/reservation/reservationDetail.do?reservationID=${reservation.reservationID}">${reservation.mvTitle}</a></td>
          <td>${reservation.name}</td>
          <td>${reservation.screeningDate}</td>
          <td>${reservation.viewers}명</td>
          <td>${reservation.pMovie}원</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</body>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</MyList-body>
</html>