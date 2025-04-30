<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 이벤트 관리 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script type="text/javascript">
	function renderList(order){
		
	}
</script>
</head>
<body>
 <%@ include file="../../common/adminHeader.jsp" %>
<div class="admin-container">
	<h1 class="admin-title"><i class="fas fa-calendar-alt"></i> 이벤트 관리</h1>
	<div class="admin-button-group">
            <button class="btn btn-primary" onclick="renderList('showing')"><i class="fas fa-play-circle"></i> 진행중인 이벤트</button>
            <button class="btn btn-secondary" onclick="renderList('release')"><i class="fas fa-clock"></i> 진행예정 이벤트</button>
            <button class="btn btn-primary" onclick="renderList('all')"><i class="fas fa-list"></i> 전체 이벤트</button>
    </div>
	
	<div class="admin-card">
		<div class="event-grid">
			<c:choose>
				<c:when test="${empty eventList}">
					<div class="empty-state">
						<div class="empty-state-icon"><i class="fas fa-calendar-times"></i></div>
						<p>등록된 이벤트가 없습니다.</p>
						<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/insertEventForm.do'"><i class="fas fa-plus-circle"></i> 이벤트 등록하기</button>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="event" items="${eventList}">
						<div class="admin-event-item">
							<a href="adminEventDetail.do?event_id=${event.event_id}">
							<div class="event-image-container">
								<img class="event-image" alt="이벤트 사진" src="${pageContext.request.contextPath}/upload/${event.poster_url}">
							</div>
							<div class="event-info">
								<h3 class="event-title">${event.title}</h3>
								<p class="event-period"><i class="fas fa-calendar-day"></i> ${event.start_date} ~ ${event.end_date}</p>
							</div>
							</a>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="admin-button-group">
		<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/insertEventForm.do'"><i class="fas fa-plus-circle"></i> 이벤트 등록</button>
		<button class="btn btn-secondary" onclick="location.href='adminMain.do'"><i class="fas fa-arrow-left"></i> 관리자 메인으로</button>
	</div>
</div>
</body>
</html>