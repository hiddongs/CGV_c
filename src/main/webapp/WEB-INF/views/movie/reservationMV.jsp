<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>영화 예매 대문 페이지</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/hiddongs.css">

<script>
	document.addEventListener('DOMContentLoaded', function() {
		const select = document.getElementById('movie');
		const posterImg = document.getElementById('poster');
		const descriptionText = document.getElementById('description');
		const movieInfoDiv = document.getElementById('movieInfo');

		select.addEventListener('change', function() {
			const selectedOption = select.options[select.selectedIndex];

			if (selectedOption.value !== "") {
				const posterUrl = selectedOption.getAttribute('data-poster');
				const description = selectedOption
						.getAttribute('data-description');

				posterImg.src = posterUrl;
				descriptionText.textContent = description;
				movieInfoDiv.style.display = 'block';
			} else {
				// "-- 영화를 선택하세요 --" 같은 기본 옵션 고르면 movieInfo 숨김
				movieInfoDiv.style.display = 'none';
				posterImg.src = '';
				descriptionText.textContent = '';
			}
		});
	});
</script>



</head>

<body>
	<div class="center-box">
		<div></div>
		<div class="inner-box">
			<h3>영화</h3>
			<label for="title">정렬</label> <select name="align" id="title">
				<option value="1">가나다순</option>
				<option value="2" seleceted>인기순</option>

			</select>
			<form action="movieSubmit.do" method="post"
				class="container mt-4">
				<div class="mb-3">
					<label for="movie" class="form-label">영화 선택</label> <select
						name="movieId" id="movie" class="form-select">
						<option value="">-- 영화를 선택하세요 --</option>
						<c:forEach var="movie" items="${movieList}">
							<option value="${movie.movie_id}"
								data-poster="${pageContext.request.contextPath}/upload/${movie.poster_url}"
								data-description="${movie.description}">
								${movie.mv_title}</option>
						</c:forEach>
					</select>
				</div>

				<input type="submit" value="전송">
			</form>

			<!-- 상영중인 영화 리스트 시작 -->

			<div class="movie-grid">				
				<div class="movie-item">							
					<div class="movie-info">
						<h3 class="movie-title">${movie.mv_title}</h3>
							<div class="movie-meta">
								<span class="rating">예매율 @@%</span>
							</div>
							</div>
					</div>						
			</div>
			<div id="movieInfo" style="margin-top: 20px; display: none;">
				<img id="poster" src="" alt="영화 포스터"
					style="max-width: 200px; display: block; margin: 0 auto;">
				<p id="description" style="margin-top: 10px; text-align: center;"></p>
			</div>
		</div>
	</div>
</body>
</html>
