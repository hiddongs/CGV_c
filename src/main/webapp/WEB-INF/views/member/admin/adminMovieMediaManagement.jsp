<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 미디어 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
    $.ajax({
        type:'POST',
        url:'adminGetMovieMedia.do',
        data:{movie_id : '${movie_id}'},
        dataType: 'JSON',
        success: function(response){
            displayMovieMedia(response)
        },
        error: function(xhr, status, error){
            console.error('예외' , error)
            alert('에러발생')
        }
    })
}


)


function displayMovieMedia(mediaList) {
    const container = document.querySelector('#event-grid');
    container.innerHTML = '';

    if (!mediaList || mediaList.length === 0) {
        container.innerHTML = '<div class="no-media">미디어 목록이 없습니다</div>';
        return;
    }

    mediaList.forEach((movieMedia, index) => {
        const row = document.createElement('div');
        row.className = 'admin-event-item';

        // 미디어 컨테이너 생성
        const mediaContainer = document.createElement('div');
        mediaContainer.className = 'event-image-container';

        let mediaElement;
        const mediaUrl = '${pageContext.request.contextPath}/upload/' + movieMedia.media_url;

        if (movieMedia.media_type === 'trailer') {
            // 비디오 요소 생성 (썸네일 대신 비디오 직접 표시)
            mediaElement = document.createElement('video');
            mediaElement.className = 'event-image';
            mediaElement.src = mediaUrl;
            mediaElement.controls = false; // 컨트롤 숨김
            mediaElement.muted = true; // 음소거
            mediaElement.preload = 'metadata'; // 메타데이터만 미리 로드
            mediaElement.poster = '${pageContext.request.contextPath}/images/video-poster.jpg'; // 기본 포스터 이미지
            
            // 마우스 오버시 재생, 마우스 아웃시 정지
            mediaContainer.addEventListener('mouseenter', function() {
                mediaElement.play().catch(e => console.error('비디오 재생 실패:', e));
            });
            mediaContainer.addEventListener('mouseleave', function() {
                mediaElement.pause();
                mediaElement.currentTime = 0;
            });
        } else {
            // 이미지 요소 생성
            mediaElement = document.createElement('img');
            mediaElement.className = 'event-image';
            mediaElement.alt = '미디어 이미지';
            mediaElement.src = mediaUrl;
        }

        mediaContainer.appendChild(mediaElement);

        // 정보 컨테이너 생성
        const infoContainer = document.createElement('div');
        infoContainer.className = 'event-info';

        // 미디어 타입 표시
        const typeElement = document.createElement('h3');
        typeElement.className = 'event-title';
        typeElement.innerText = movieMedia.media_type;
        infoContainer.appendChild(typeElement);

        // 버튼 컨테이너 생성
        const buttonContainer = document.createElement('div');
        buttonContainer.className = 'media-buttons';

        // 수정 버튼 생성
        const updateBtn = document.createElement('button');
        updateBtn.className = 'btn btn-secondary';
        updateBtn.innerHTML = '<i class="fas fa-edit"></i> 수정';
        updateBtn.dataset.mediaId = movieMedia.media_id;
        updateBtn.dataset.movieId = movieMedia.movie_id;
        updateBtn.onclick = function(e) {
            e.stopPropagation(); // 이벤트 버블링 방지
            updateMovieMediaForm(e);
        };

        // 삭제 버튼 생성
        const deleteBtn = document.createElement('button');
        deleteBtn.className = 'btn btn-danger';
        deleteBtn.innerHTML = '<i class="fas fa-trash"></i> 삭제';
        deleteBtn.dataset.mediaId = movieMedia.media_id;
        deleteBtn.onclick = function(e) {
            e.stopPropagation(); // 이벤트 버블링 방지
            deleteMovieMediaForm(e);
        };

        buttonContainer.appendChild(updateBtn);
        buttonContainer.appendChild(deleteBtn);
        infoContainer.appendChild(buttonContainer);

        // 요소들을 row에 추가
        row.appendChild(mediaContainer);
        row.appendChild(infoContainer);
        container.appendChild(row);
    });
}

function insertMedia() {
    const movieId = '${movie_id}';  
    console.log("Movie ID: " + movieId);
    
    window.location.href = 'insertMediaForm.do?movie_id=' + encodeURIComponent(movieId);
}

function updateMovieMediaForm(event){
    const mediaId = event.target.closest('button').dataset.mediaId;
    const movieId = event.target.closest('button').dataset.movieId;
    console.log('미디어 ID:', mediaId, '영화 ID:', movieId);
    
    // 수정 페이지로 이동
    window.location.href = 'updateMediaForm.do?media_id=' + encodeURIComponent(mediaId) + '&movie_id=' + encodeURIComponent(movieId);
}

function deleteMovieMediaForm(event){
    const mediaId = event.target.closest('button').dataset.mediaId;
    console.log('삭제할 미디어 ID:', mediaId);
    
    if(confirm('정말 이 미디어를 삭제하시겠습니까?')) {
        // 삭제 요청 전송
        window.location.href = 'deleteMedia.do?media_id=' + encodeURIComponent(mediaId);
    }
}

function preview(event){

}

// 이제 썸네일 생성 함수는 사용하지 않음 (비디오 요소 직접 사용)

</script>
</head>
<%@ include file="../../common/adminHeader.jsp" %>
<body>
<div class="admin-container">
    <h1 class="admin-title"><i class="fas fa-video">미디어 관리</i></h1>
    <div class="admin-button-group">

    </div>

    <div class="admin-card">
        <div class="event-grid" id="event-grid">

        </div>
    </div>

    <div class="admin-button-group">
        <button class="btn btn-primary" onclick="insertMedia()">미디어생성</button>
    </div>
</div>
</body>
</html>