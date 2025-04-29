<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function previewImage(event) {
    const file = event.target.files[0];
    if (file) {
        if (!file.type.startsWith('image/')) {
            alert('이미지 파일만 업로드 가능합니다.');
            event.target.value = '';
            return;
        }
        const reader = new FileReader();
        reader.onload = function () {
            const output = document.getElementById('preview');
            output.src = reader.result;
            output.style.display = 'block';
        };
        reader.readAsDataURL(file);
    }
}
function syncCheckbox(checkbox) {
    const hiddenInput = checkbox.parentElement.querySelector('input[type="hidden"]');
    hiddenInput.value = checkbox.checked ? 'Y' : 'N';
  }
</script>
<title>관리자 영화 등록 페이지</title>
</head>
<body>
<%@ include file="../../common/adminHeader.jsp" %>
<div class="container">
	<form class="form-container" action="${pageContext.request.contextPath}/member/movieInsert.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="form-label" id="title">영화제목</label>
			<input class="form-input" type="text" id="title" name="title">
		</div>
		<div class="form-group">
	        <label class="form-label" for="poster_url">대표포스터</label>
	        <input type="file" class="form-input" id="poster_url" name="poster_url" accept="image/*" onchange="previewImage(event)">
	        <br>
       		<img id="preview" class="movie-poster" src="#" alt="포스터 미리보기" style="max-width: 200px; display: none; margin-top: 10px;">
   		</div>
		<div class="form-group">
			<label class="form-label" id="director">감독</label>
			<input type="text" class="form-input" name="director" id="director">
		</div>
		<div class="form-group">
			<label class="form-label" id="actor">배우</label>	
			<input type="text" class="form-input" id="actor" name="actor">	
		</div>
		<div class="form-group">
			<label class="form-check-label" id="genre">장르</label>	
			<div class="form-check">
				<input type="checkbox" id="genre-action" name="genre" value="액션" class="form-check-input">
				<label for="genre-action" class="form-check-label">액션</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-crime" name="genre" value="범죄" class="form-check-input">
				<label for="genre-crime" class="form-check-label">범죄</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-SF" name="genre" value="SF" class="form-check-input">
				<label for="genre-SF" class="form-check-label">SF</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-comedy" name="genre" value="코미디" class="form-check-input">
				<label for="genre-comedy" class="form-check-label">코미디</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-romance" name="genre" value="로맨스" class="form-check-input">
				<label for="genre-romance" class="form-check-label">로맨스</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-thriller" name="genre" value="스릴러" class="form-check-input">
				<label for="genre-thriller" class="form-check-label">스릴러</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-horror" name="genre" value="공포" class="form-check-input">
				<label for="genre-horror" class="form-check-label">공포</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-war" name="genre" value="전쟁" class="form-check-input">
				<label for="genre-war" class="form-check-label">전쟁</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-sport" name="genre" value="스포츠" class="form-check-input">
				<label for="genre-sport" class="form-check-label">스포츠</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-fantasy" name="genre" value="판타지" class="form-check-input">
				<label for="genre-fantasy" class="form-check-label">판타지</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-music" name="genre" value="음악" class="form-check-input">
				<label for="genre-music" class="form-check-label">음악</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-musical" name="genre" value="뮤지컬" class="form-check-input">
				<label for="genre-musical" class="form-check-label">뮤지컬</label>
			</div>
			<div class="form-check">
				<input type="checkbox" id="genre-melo" name="genre" value="멜로" class="form-check-input">
				<label for="genre-melo" class="form-check-label">멜로</label>
			</div>
		</div>
		<!-- 
		관리텝에서 관리하는걸로
		<div class="form-group">
			<label class="form-label" id="movieType">상영가능관 타입</label>
			<div class="form-check">
				<input type="checkbox" id="2D" value="2D" name="movieType" class="form-check-input" onchange="syncCheckbox(this)">
				<label for="2D" class="form-check-label">2D</label>
				 <input type="hidden" name="movieType-2D" value="N">
			</div>
			<div class="form-check">
				<input type="checkbox" id="3D" value="3D" name="movieType" class="form-check-input" onchange="syncCheckbox(this)">
				<label for="3D" class="form-check-label">3D</label>
				 <input type="hidden" name="movieType-3D" value="N">
			</div>
			<div class="form-check">
				<input type="checkbox" id="4DX" value="4DX" name="movieType" class="form-check-input" onchange="syncCheckbox(this)">
				<label for="4DX" class="form-check-label">4DX</label>
				<input type="hidden" name="movieType-4DX" value="N">
			</div>
			<div class="form-check">
				<input type="checkbox" id="IMAX" value="IMAX" name="movieType" class="form-check-input" onchange="syncCheckbox(this)">
				<label for="IMAX" class="form-check-label">IMAX</label>
				 <input type="hidden" name="movieType-IMAX" value="N">
			</div>
			<div class="form-check">
				<input type="checkbox" id="SCREENX" value="SCREENX" name="movieType" class="form-check-input" onchange="syncCheckbox(this)">
				<label for="IMAX" class="form-check-label">SCREENX</label>
				 <input type="hidden" name="movieType-SCREENX" value="N">
			</div>
		</div>
		-->
		<div class="form-group">
			<label class="form-label" id="runtime">상영시간</label>	
			<input type="text" class="form-input" id="runtime" name="runtime">	
		</div>
		<div class="form-group">
			<label class="form-label" id="release_date">개봉일(상영시작일)</label>	
			<input type="date" class="form-input" id="release_date" name="release_date">	
		</div>
		<div>
			<label class="form-label" id="description">줄거리</label>
			<textarea rows="10" cols="70" id="description" name="description" class="form-input"></textarea>
		</div>
		<div class="button_group">
			<button type="submit" class="btn btn-primary">영화등록</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='/member/adminMain.do'">메인으로</button>
		</div>
	</form>
</div>
</body>
</html>