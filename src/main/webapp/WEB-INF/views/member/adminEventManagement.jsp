<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 이벤트 관리 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript">
	function renderList(order){
		
	}
</script>
</head>
<body>
 <%@ include file="../common/adminHeader.jsp" %>
<div class="container">
	<div class="button-group">
            <button class="btn btn-primary" onclick="renderList('showing')">진행중인 이벤트 목록</button>
            <button class="btn btn-secondary" onclick="renderList('release')">진행예정 이벤트 목록</button>
            <button class="btn btn-warning" onclick="renderList('all')">전체 이벤트 목록</button>
    </div>
	
	<div class="event-grid">
		<c:choose>
			<c:when test="${empty eventList}">
				<div class="event-item">
					<div class="event-info">
						<h3 class="event-title">[ 진행 중인 이벤트가 없습니다! ]</h3>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="event" items="${eventList}">
					<div class="event-item">
						<a href="adminEventDetail.do?event_id=${event.event_id}">
						<img class="event-image" alt="이벤트 사진" src="${pageContext.request.contextPath}/upload/${event.poster_url}">
						<div class="event-info">
							<h3 class="event-title">${event.title}</h3>
							<p class="event-period">${event.start_date} ~ ${event.end_date}</p>
						</div>
						</a>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="button-group">
		<a href="${pageContext.request.contextPath}/member/insertEventForm.do">이벤트 등록</a>
	</div>
</div>
</body>
</html>