<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <!-- 푸터 영역 -->
        <footer class="footer">
            <div class="footer_content">
                <div class="footer_info">
                    <p>&copy; CJ CGV. All Rights Reserved</p>
                    <div class="footer_links">
                        <a href="${pageContext.request.contextPath}/company">회사소개</a>
                        <a href="${pageContext.request.contextPath}/terms">이용약관</a>
                        <a href="${pageContext.request.contextPath}/privacy">개인정보처리방침</a>
                        <a href="${pageContext.request.contextPath}/support">고객센터</a>
                    </div>
                </div>
            </div>
        </footer>
        
        <!-- 상단으로 이동 버튼 -->
        <div class="btn_gotoTop">
            <a href="#" title="최상단으로 이동">↑</a>
        </div>
    </div>

    <!-- 공통 스크립트 -->
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
