<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>영화 정보</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <style>
.modal {
    display: none;
    position: fixed;
    z-index: 999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow-y: auto;
    background-color: rgba(0,0,0,0.6);
    padding: 30px 10px;
    box-sizing: border-box;
    font-family: 'Noto Sans KR', '맑은 고딕', sans-serif;
}

.modal-content {
    background-color: #fff;
    margin: auto;
    padding: 25px 20px;
    max-width: 480px;
    width: 100%;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    animation: fadeIn 0.3s ease;
    position: relative;
}

.close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 22px;
    font-weight: bold;
    color: #aaa;
    cursor: pointer;
}

.close:hover {
    color: #333;
}

.modal-content h2 {
    font-size: 20px;
    margin-bottom: 15px;
    text-align: center;
    color: #222;
}

.modal-content img {
    width: 100%;
    max-width: 260px;
    margin: 0 auto 15px auto;
    display: block;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.modal-content p {
    font-size: 14px;
    line-height: 1.7;
    margin: 8px 0;
    color: #444;
}

.modal-content p strong {
    display: inline-block;
    width: 80px;
    color: #666;
}

.desc-box {
    margin-top: 10px;
    border-top: 1px solid #ddd;
    padding-top: 10px;
}

#toggle-desc {
    display: inline-block;
    margin-top: 10px;
    background-color: #f5f5f5;
    color: #333;
    border: none;
    padding: 6px 12px;
    border-radius: 5px;
    font-size: 13px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

#toggle-desc:hover {
    background-color: #e0e0e0;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
   
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
            <c:choose>
                <c:when test="${empty list}">
                    <div class="movie-item">
                        <img src="${pageContext.request.contextPath}/resources/images/cgvLogo.png">
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
    <div class="movie-item"
         data-title="${fn:escapeXml(movie.mv_title)}"
         data-poster="${pageContext.request.contextPath}/upload/${fn:escapeXml(movie.poster_url)}"
         data-desc="${empty movie.description ? '줄거리 정보 없음' : fn:escapeXml(movie.description)}"
         data-director="${empty movie.director ? '정보 없음' : fn:escapeXml(movie.director)}"
         data-actor="${empty movie.actor ? '정보 없음' : fn:escapeXml(movie.actor)}"
         data-genre="${empty movie.genre ? '정보 없음' : fn:escapeXml(movie.genre)}"
         data-runtime="${empty movie.runtime ? '정보 없음' : movie.runtime}"
         data-release="<fmt:formatDate value='${movie.release_date}' pattern='yyyy-MM-dd'/>"
         data-age="${empty movie.age_limit ? '정보 없음' : fn:escapeXml(movie.age_limit)}">
        <img src="${pageContext.request.contextPath}/upload/${movie.poster_url}" alt="영화 포스터" class="movie-poster">
        <div class="movie-info">
            <h3 class="movie-title">${movie.mv_title}</h3>
            <div class="movie-meta">
                
               <a href="${pageContext.request.contextPath}/movie/movieReviewPage.do?movie_id=${movie.movie_id}"
   class="btn btn-primary btn-booking">리뷰 보기</a>
            </div>
        </div>
    </div>
</c:forEach>
                    
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>

<div id="movieModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div id="modal-body"></div>
        <h2 id="modal-title"></h2>
    <img id="modal-poster" src="" alt="영화 이미지">
    <p><strong>감독:</strong> <span id="modal-director"></span></p>
    <p><strong>배우:</strong> <span id="modal-actor"></span></p>
    <p><strong>장르:</strong> <span id="modal-genre"></span></p>
    <p><strong>상영시간:</strong> <span id="modal-runtime"></span>분</p>
    <p><strong>개봉일:</strong> <span id="modal-release"></span></p>
    <p><strong>연령제한:</strong> <span id="modal-age"></span></p>
    
    <div class="desc-box">
        <p id="modal-desc-short" style="display: block;"></p>
        <p id="modal-desc-full" style="display: none;"></p>
        <button id="toggle-desc">더보기</button>
    </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>
<a href="#" class="btn_gotoTop show">↑</a>

<script>
$(document).ready(function () {
    $(document).on('click', '.movie-item', function () {
        const title = $(this).data('title');
        const poster = $(this).data('poster');
        const desc = $(this).data('desc') || '줄거리 정보가 없습니다.';
        const director = $(this).data('director') || '정보 없음';
        const actor = $(this).data('actor') || '정보 없음';
        const genre = $(this).data('genre') || '정보 없음';
        const runtime = $(this).data('runtime') || '정보 없음';
        const release = $(this).data('release') || '정보 없음';
        const age = $(this).data('age') || '정보 없음';

        $('#modal-title').text(title);
        $('#modal-poster').attr('src', poster);
        $('#modal-director').text(director);
        $('#modal-actor').text(actor);
        $('#modal-genre').text(genre);
        $('#modal-runtime').text(runtime);
        $('#modal-release').text(release);
        $('#modal-age').text(age);

        if (desc.length > 100) {
            $('#modal-desc-short').text(desc.substring(0, 100) + '...');
            $('#modal-desc-full').text(desc).hide();
            $('#toggle-desc').show().text('더보기');
        } else {
            $('#modal-desc-short').hide();
            $('#modal-desc-full').text(desc).show();
            $('#toggle-desc').hide();
        }

        $('#movieModal').fadeIn();
    });

    $('#toggle-desc').on('click', function () {
        const full = $('#modal-desc-full');
        const short = $('#modal-desc-short');
        if (full.is(':visible')) {
            full.hide();
            short.show();
            $(this).text('더보기');
        } else {
            short.hide();
            full.show();
            $(this).text('접기');
        }
    });

    $('.close, #movieModal').on('click', function (e) {
        if (e.target === this) $('#movieModal').fadeOut();
    });
});

</script>

</body>
</html>
