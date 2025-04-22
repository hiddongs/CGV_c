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
</script>
<title>관리자 영화 등록 페이지</title>
</head>
<body>
<%@ include file="../common/adminHeader.jsp" %>
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
			<label class="form-label" id="genre">장르</label>	
			<input type="text" class="form-input" id="genre" name="genre">	
		</div>
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
			<input type="text" class="form-input" id="description" name="description">
		</div>
		<div class="button_group">
			<button type="submit" class="btn btn-primary">영화등록</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='/member/adminMain.do'">메인으로</button>
		</div>
	</form>
</div>
</body>
</html>