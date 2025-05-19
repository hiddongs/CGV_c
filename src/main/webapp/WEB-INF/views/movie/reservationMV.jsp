<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매 대문 페이지</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hiddongs.css">

<script>
document.addEventListener('DOMContentLoaded', function() {
  const select = document.getElementById('movie');
  const posterImg = document.getElementById('poster');
  const descriptionText = document.getElementById('description');
  const movieInfoDiv = document.getElementById('movieInfo');

  // 영화 선택 시 포스터 및 설명 표시
  select.addEventListener('change', function() {
    const selectedOption = select.options[select.selectedIndex];

    if (selectedOption.value !== "") {
      const posterUrl = selectedOption.getAttribute('data-poster');
      const description = selectedOption.getAttribute('data-description');

      posterImg.src = posterUrl;
      descriptionText.textContent = description;

      movieInfoDiv.classList.add('show');
      movieInfoDiv.style.display = 'block';
    } else {
      movieInfoDiv.classList.remove('show');
      movieInfoDiv.style.display = 'none';
      posterImg.src = '';
      descriptionText.textContent = '';
    }
  });

  // 영화 선택 유효성 검사
  const movieForm = document.getElementById('movieForm');
  movieForm.addEventListener('submit', function(e) {
    if (select.value === "") {
      alert("영화를 선택해 주세요.");
      e.preventDefault(); // 폼 제출 막기
    }
  });
});
</script>

</head>
<body>

<div class="inner-box fade-in">
  <h3>영화</h3>
  <input type="hidden" name="memberID" value="${mem_ID}" />

  <!-- 정렬 셀렉트 박스 form -->
  <form action="reservationMV.do" method="get" style="margin-bottom: 20px;">
    <label for="title">정렬</label>
    <select name="align" id="title" class="form-select" onchange="this.form.submit()">
      <option value="1" <c:if test="${param.align == '1'}">selected</c:if>>가나다순</option>
      <option value="2" <c:if test="${param.align == '2'}">selected</c:if>>인기순</option>
    </select>
  </form>

  <!-- 영화 선택 form -->
  <form id="movieForm" action="movieSubmit.do" method="post" class="container mt-4">
    <div class="mb-3">
      <label for="movie" class="form-label">영화 선택</label>
      <select name="movieID" id="movie" class="form-select">
        <option value="">-- 영화를 선택하세요 --</option>
        <c:forEach var="movie" items="${movieList}">
          <option value="${movie.movie_id}"
            data-poster="${pageContext.request.contextPath}/upload/${movie.poster_url}"
            data-description="${movie.description}">
            ${movie.mv_title}
          </option>
        </c:forEach>
      </select>
    </div>
    <input type="submit" value="🎟️ 전송" class="btn btn-primary">
  </form>

  <!-- 선택된 영화 정보 표시 -->
  <div id="movieInfo" style="margin-top: 20px; display: none;">
    <img id="poster" src="" alt="영화 포스터"
      style="max-width: 200px; display: block; margin: 0 auto;">
    <p id="description" style="margin-top: 10px; text-align: center;"></p>
  </div>
</div>

</body>
</html>
