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
		<%-- <div class="inner-box">
          <h3>지역</h3>
          <div class="input-container">
            <input required="region" placeholder="극장 지역을 검색하세요" type="region">
            <button class="invite-btn" type="button">
              검색
            </button>
          </div>
          <form action="reserve.do" method="post" class="container mt-4">
            <div class="mb-3">
              <div class="inner-box">
                <ul style="list-style: none; padding-left:0;text-align: left;">
                  <c:forEach var="theater" items="${theaterList}">
                    <input type="submit" value="${theater.region}">

                  </c:forEach>
                </ul>
              </div>
            </div>
          </form>



        </div> --%>
	</div>

	<!-- 
      <div class="inner-box">
        <h3>시간</h3>
      </div>

 -->







</body>

</html>

<!-- 

<style>
    body { font-family: 'Noto Sans KR', sans-serif; padding: 20px; }
    input, select, button { margin: 10px 0; padding: 6px; }
    table, th, td { border: 1px solid #ccc; border-collapse: collapse; padding: 8px; }
  </style>
  <h1>📘 HTML 주요 태그와 속성 예제</h1>

  input 속성
  <h3>1. input (text, password, date, checkbox, radio)</h3>
  <input type="text" placeholder="이름 입력" name="username" maxlength="20">
  <br>
  <input type="password" placeholder="비밀번호" name="password">
  <br>
  <input type="date" name="birth">
  <br>
  <input type="checkbox" name="agree" checked> 약관 동의
  <br>
  <input type="radio" name="gender" value="M" checked> 남
  <input type="radio" name="gender" value="F"> 여

  select 속성
  <h3>2. select & option</h3>
  <label for="movie">영화 선택:</label>
  <select name="movie" id="movie">
    <option value="1">파과</option>
    <option value="2" selected>야당</option>
  </select>

  button 속성
  <h3>3. button</h3>
  <button type="button" onclick="alert('클릭됨!')">클릭 버튼</button>
  <button type="submit">제출 버튼</button>

  img 속성
  <h3>4. 이미지</h3>
  <img src="https://via.placeholder.com/150" alt="샘플 이미지" width="150" height="100">

  a (링크)
  <h3>5. 링크</h3>
  <a href="https://gptonline.ai/ko/" target="_blank" title="GPTOnline으로 이동">GPTOnline.ai로 가기</a>

  table 속성
  <h3>6. 표(table)</h3>
  <table>
    <thead>
      <tr>
        <th>이름</th>
        <th>영화</th>
        <th>날짜</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>홍길동</td>
        <td>야당</td>
        <td>2025-04-25</td>
      </tr>
    </tbody>
  </table>

  form 속성
  <h3>7. 폼 (form)</h3>
  <form action="/submit" method="post">
    <input type="text" name="user" placeholder="이름 입력">
    <button type="submit">전송</button>
  </form> -->