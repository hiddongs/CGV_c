<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
</head>
<body>
	<c:choose>
    <c:when test="${member.member_id != 1}">
        <jsp:include page="../common/header.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="../common/adminHeader.jsp" />
    </c:otherwise>
</c:choose>

    <main>
        <div class="container">
        		 <!-- 상영중인 영화 리스트 시작 -->
            <h2 class="section_title">현재 상영작</h2>
            <div class="movie-grid">
               <c:choose>
             		<c:when test="${empty list}">
               			<div class="movie-item">
               				<img src="${pageContext.request.contextPath}/resources/images/logo.png">
               				<div class="movie-info">
               					<h3 class="movie-title">상영중인 영화가 없습니다.</h3>
               					<div class="movie-meta">
               						<span class="rating">상영중인 영화가 없습니다.</span>
               					</div>
               				</div>
               			</div>
            		</c:when>
            		<c:otherwise>
               			<c:forEach var="movie" items="${list}">
			               	<div class="movie-item">
			               		<img src="${pageContext.request.contextPath}/upload/${movie.poster_url}" alt="영화 포스터" class="movie-poster">
			               		<div class="movie-info">
			               			<h3 class="movie-title">${movie.mv_title}</h3>
			               			<div class="movie-meta">
			               				<span class="rating">예매율 ${movie.bookingRate}%</span>
			               				<a href="${pageContext.request.contextPath}/movie/reservationMVform.do" class="btn btn-primary btn-booking">예매</a>
			               			</div>
			               		</div>
			               	</div>
               			</c:forEach>
               		</c:otherwise>
             </c:choose>	
              	 <!-- 상영중인 영화 리스트 끝 -->
            </div>
              	 <!-- 개봉예정영화 시작 -->
              	 <h2 class="section_title">개봉 예정 영화</h2>
              	 <div class="movie-grid">
              	 	<c:choose>
              	 		<c:when test="${empty releaseList}">
	              	 		<div class="movie-item">
	               				<img src="${pageContext.request.contextPath}/resources/images/logo.png">
	               				<div class="movie-info">
	               					<h3 class="movie-title">개봉예정인 영화가 없습니다.</h3>
	               					<div class="movie-meta">
	               						<span class="rating">개봉예정인 영화가 없습니다.</span>
	               					</div>
	               				</div>
	               			</div>
              	 		</c:when>
              	 		<c:otherwise>
              	 			<c:forEach var="movie" items="${releaseList}">
			               	<div class="movie-item">
			               		<img src="${pageContext.request.contextPath}/upload/${movie.poster_url}" alt="영화 포스터" class="movie-poster">
			               		<div class="movie-info">
			               			<h3 class="movie-title">${movie.mv_title}</h3>
			               			<div class="movie-meta">
			               				<span class="rating">개봉예정</span>
			               				<a href="${pageContext.request.contextPath}/movie/reservationMVform.do" class="btn btn-primary btn-booking">예매</a>
			               			</div>
			               		</div>
			               	</div>
               			</c:forEach>
              	 		</c:otherwise>
              	 	</c:choose>
              	 </div>
              	 <!-- 개봉예정영화 끝 -->
                <!-- 영화 리스트 끝 -->
			<!-- 이벤트 리스트 시작 -->
			
			<h2 class="section_title">진행중인 이벤트</h2>
			<div class="event-grid">
				<c:choose>
					<c:when test="${empty ongoingEventList}">
						<div class="event-item">
							<img src="${pageContext.request.contextPath}/resources/images/logo.png">
	               			<div class="event-info">
	               				<h3 class="event-title"> 진행중인 이벤트가 없습니다.</h3>
	               			</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="event" items="${ongoingEventList}">
							<div class=	"event-item">
								<img src="${pageContext.request.contextPath}/upload/${event.poster_url}" alt="이벤트 이미지" class="event-image">
				        		<div class="event-info">
				        			<h3 class="event-title">${event.title}</h3>
				        			<p class="event-period">${event.start_date}~${event.end_date}</p>
				        		</div>       	
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
           <!-- 이벤트 리스트 끝  -->
        </div>
    </main>

    <%@ include file="../common/footer.jsp" %>
    <a href="#" class="btn_gotoTop show">↑</a>

    <script>
        $(document).ready(function() {
            // 스크롤 이벤트 처리
            $(window).scroll(function() {
                var headerOffsetT = $('.header').offset().top;
                var headerOuterH = $('.header').outerHeight(true);
                var fixedHeaderPosY = headerOffsetT + headerOuterH;
                var scrollT = $(this).scrollTop();
                var scrollL = $(this).scrollLeft();

                // 헤더 고정
                if (scrollT >= fixedHeaderPosY) {
                    $('.nav_menu').addClass('fixed');
                    $('.btn_gotoTop').addClass('show');
                } else {
                    $('.nav_menu').removeClass('fixed');
                    $('.btn_gotoTop').removeClass('show');
                }

                // 좌우 스크롤 처리
                if ($('.nav_menu').hasClass('fixed')) {
                    $('.nav_menu').css({ 'left': -1 * scrollL });
                } else {
                    $('.nav_menu').css({ 'left': 0 });
                }
            });

            // 상단으로 이동 버튼
            $('.btn_gotoTop').on('click', function(e) {
                e.preventDefault();
                $('html, body').stop().animate({
                    scrollTop: '0'
                }, 400);
            });
        });
    </script>
</body>
</html>