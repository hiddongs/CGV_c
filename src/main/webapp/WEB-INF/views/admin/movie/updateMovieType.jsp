<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<title>영화 상영관 선택</title>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">

	var movietype = ${movietype};
	console.log('받은 데이터 : '+movietype)

 	$(document).ready(function(){
    // movietype에 따라 체크박스 상태 설정
    checkMovietype(movietype);

    // 뒤로가기 버튼 클릭 시 동작
    $('#backButton').click(function(){
      window.history.back();
    });

    // 폼 제출 시 최소한 하나의 체크박스가 선택되었는지 확인
    $("#myForm").on("submit", function(event){
      const checkboxes = document.querySelectorAll(".form-check-input");
      const isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);

      if (!isChecked) {
        alert('최소 하나의 영화타입을 선택해주세요');
        event.preventDefault();  // 폼 제출을 막습니다.
      }
    });
  });

  // movietype 객체에 따라 체크박스 상태 설정
 function checkMovietype(movietype) {
  const checkboxes = document.querySelectorAll(".form-check-input");

  checkboxes.forEach(checkbox => {
    const type = checkbox.value;  // 체크박스의 value 값 ("2d", "3d", "4dx" 등)
    
    // 첫 글자가 숫자일 경우, 그 앞에 "_"를 붙입니다.
    const movietypeKey = /^[0-9]/.test(type) ? "_" + type : type;

    // movietype 객체에서 해당 type의 값이 "Y"이면 체크
    if (movietype[movietypeKey] === "Y") {
      checkbox.checked = true;
    }
  });
}


 </script>
</head>
<body>
	<form id="myForm" action="updateMovieType.do" class="form-container">
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
			<button type="button" id="backButton" class="btn btn-secondary">뒤로가기</button>
		</div>
	</form>
</body>
</html>