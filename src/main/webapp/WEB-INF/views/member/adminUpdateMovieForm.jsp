<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 영화수정 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<script type="text/javascript">
	function onchange(event){
		var fileInput = document.getElementById('poster_url')
		
		if(fileInput.files.length > 0){
			var oldPosterUrl = document.getElementById('oldPosterUrl')
			document.getElementById('delete_URL').value = oldPosterUrl;
		}
	}
</script>
</head>
<body>
<jsp:include page="../common/adminHeader.jsp" />
	<form action="updateMovie.do" class="form-container" method="post" enctype="multipart/form-data">
		<h3 class="form-title">관리자 영화수정 페이지</h3>
		<input type="hidden" id="movie_id" value="${movie.movie_id}" name="movie_id">
		<div class="form-group"></div> 
			<div class="form-group">
			<label class="form-label" id="title" for="title">영화제목</label>
			<input class="form-input" type="text" id="title" name="title" value="${movie.mv_title }">
		</div>
		<div class="form-group">
	        <label class="form-label" for="poster_url">대표포스터</label>
	        <input type="file" class="form-input" id="poster_url" name="poster_url" accept="image/*" onchange="previewImage(event)">
	        <input type="hidden" id="delete_URL" name="deletePosterUrl" value="">
        	<input type="hidden" id="oldPosterUrl" value="${movie.poster_url}" name="oldPosterUrl"> <!-- 현재 포스터 URL 저장 -->
		  <br>
       		<img id="preview" class="movie-poster" src="${pageContext.request.contextPath}/upload/${movie.poster_url}" alt="포스터 미리보기" style="max-width: 200px; margin-top: 10px;">
   		</div>
		<div class="form-group">
			<label class="form-label" id="director" for="director">감독</label>
			<input type="text" class="form-input" name="director" id="director" value="${movie.director }">
		</div>
		<div class="form-group">
			<label class="form-label" id="actor" for="actor">배우</label>	
			<input type="text" class="form-input" id="actor" name="actor" value="${movie.actor }">	
		</div>
		<div class="form-group">
			<label class="form-check-label" id="genre" for="genre">장르</label>	
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
		<div class="form-group">
			<label class="form-label" id="runtime" for="runtime">상영시간</label>	
			<input type="text" class="form-input" id="runtime" name="runtime" value="${movie.runtime }">	
		</div>
		<div class="form-group">
			<label class="form-title" id="age_limit" for="age_limit">연령제한</label>
			<div class="form-check">
				<input type="radio" class="age_limit" value="ALL" id="ALL" name="age_limit">
				<label for="ALL" class="form-check-label">전체이용가</label>
			</div>
			<div class="form-check">
				<input type="radio" class="age_limit" value="12" id="12" name="age_limit">
				<label for="12" class="form-check-label">12세 이용가</label>
			</div>
			<div class="form-check">
				<input type="radio" class="age_limit" value="15" id="15" name="age_limit">
				<label for="15" class="form-check-label">15세 이용가</label>
			</div>
			<div class="form-check">
				<input type="radio" class="age_limit" value="18" id="18" name="age_limit">
				<label for="18" class="form-check-label">18세 이용가</label>
			</div>
		</div>
		<div class="form-group">
			<label class="form-label" id="release_date" for="release_date">개봉일(상영시작일)</label>	
			<input type="date" class="form-input" id="release_date" name="release_date" value="${movie.release_date }">	
		</div>
		<div>
			<label class="form-label" id="description" for="description">줄거리</label>
			<textarea rows="10" cols="70" id="description" name="description" class="form-input" >${movie.description }</textarea>
		</div>
		</div>
		<div class="button_group">
			<button type="submit" class="btn btn-primary">영화수정</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='/member/adminMain.do'">메인으로</button>
		</div>
	</form>
</body>
</html>