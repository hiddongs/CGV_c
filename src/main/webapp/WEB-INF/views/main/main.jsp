<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>
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
            <h2 class="section_title">현재 상영작</h2>
            <div class="movie-grid">
                <div class="movie-item">
                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86815/86815_320.jpg" alt="영화 포스터" class="movie-poster">
                    <div class="movie-info">
                        <h3 class="movie-title">슈퍼 마리오 브라더스</h3>
                        <div class="movie-meta">
                            <span class="rating">예매율 32.1%</span>
                            <a href="${pageContext.request.contextPath}/booking/bookingForm.do" class="btn btn-primary btn-booking">예매</a>
                        </div>
                    </div>
                </div>
                <div class="movie-item">
                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86796/86796_320.jpg" alt="영화 포스터" class="movie-poster">
                    <div class="movie-info">
                        <h3 class="movie-title">존 윅 4</h3>
                        <div class="movie-meta">
                            <span class="rating">예매율 28.5%</span>
                            <a href="${pageContext.request.contextPath}/booking/bookingForm.do" class="btn btn-primary btn-booking">예매</a>
                        </div>
                    </div>
                </div>
                <div class="movie-item">
                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86829/86829_320.jpg" alt="영화 포스터" class="movie-poster">
                    <div class="movie-info">
                        <h3 class="movie-title">스즈메의 문단속</h3>
                        <div class="movie-meta">
                            <span class="rating">예매율 15.2%</span>
                            <a href="${pageContext.request.contextPath}/booking/bookingForm.do" class="btn btn-primary btn-booking">예매</a>
                        </div>
                    </div>
                </div>
                <div class="movie-item">
                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86828/86828_320.jpg" alt="영화 포스터" class="movie-poster">
                    <div class="movie-info">
                        <h3 class="movie-title">리바운드</h3>
                        <div class="movie-meta">
                            <span class="rating">예매율 12.8%</span>
                            <a href="${pageContext.request.contextPath}/booking/bookingForm.do" class="btn btn-primary btn-booking">예매</a>
                        </div>
                    </div>
                </div>
            </div>

            <h2 class="section_title">이벤트</h2>
            <div class="event-grid">
                <div class="event-item">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/35237/16815760867380.jpg" alt="이벤트 이미지" class="event-image">
                    <div class="event-info">
                        <h3 class="event-title">[슈퍼 마리오 브라더스] CGV 필름마크</h3>
                        <p class="event-period">2023.04.15 ~ 2023.04.30</p>
                    </div>
                </div>
                <div class="event-item">
                    <img src="https://img.cgv.co.kr/WebApp/contents/eventV4/35236/16815760494330.jpg" alt="이벤트 이미지" class="event-image">
                    <div class="event-info">
                        <h3 class="event-title">[존 윅 4] 스페셜 포스터</h3>
                        <p class="event-period">2023.04.15 ~ 2023.04.30</p>
                    </div>
                </div>
            </div>
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