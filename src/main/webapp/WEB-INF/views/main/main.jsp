<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CGV</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
	<div id="cgvwrap">
		<!-- 헤더 영역 -->
		<%@ include file="../common/header.jsp" %>

		<!-- 메인 컨텐츠 영역 -->
		<div id="container">
			<!-- 현재 상영작 -->
			<section class="movie_current">
				<h2>현재 상영작</h2>
				<div class="movie_list">
					<!-- 영화 목록이 들어갈 자리 -->
				</div>
			</section>

			<!-- 개봉 예정작 -->
			<section class="movie_upcoming">
				<h2>개봉 예정작</h2>
				<div class="movie_list">
					<!-- 영화 목록이 들어갈 자리 -->
				</div>
			</section>

			<!-- 이벤트 섹션 -->
			<section class="event_section">
				<h2>이벤트</h2>
				<div class="event_list">
					<!-- 이벤트 목록이 들어갈 자리 -->
				</div>
			</section>
		</div>

		<!-- 푸터 영역 -->
	<%@ include file="../common/footer.jsp" %>
	</div>


		
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