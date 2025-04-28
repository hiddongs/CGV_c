<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<title>영화 상영관 선택</title>
</head>
<body>
	<form action="updateMovieType.do" class="form-container">
		<input type="hidden" value="${movie_id}" id="movie_id" name="movie_id">
		<h3 class="form-title">영화 타입 수정</h3>
		<div class="form-group">
			<label for="movie_type" id="movie_type" class="form-check-label">영화 타입</label>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="2d" value="2d" name="movie_type">
				<label for="2d" class="form-check-label">2d</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="3d" value="3d" name="movie_type">
				<label for="3d" class="form-check-label">3d</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="4dx" value="4dx" name="movie_type">
				<label for="4dx" class="form-check-label">4dx</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="screenx" value="screenx" name="movie_type">
				<label for="screenx" class="form-check-label">screenx</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="imax" value="imax" name="movie_type">
				<label for="imax" class="form-check-label">imax</label>
			</div>
		</div>
		<div class="button-group">
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='adminMain.do'">메인으로</button>
		</div>
	</form>
</body>
</html>