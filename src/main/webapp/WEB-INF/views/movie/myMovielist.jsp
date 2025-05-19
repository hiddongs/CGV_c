<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내가 본 영화</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function(){
		// 예약 삭제 버튼 클릭 이벤트
		$('.close-btn').click(function (){
			const $btn = $(this);
			const resvID = $btn.data('resv-id'); // 예약 ID 추출
			
			// 삭제 확인 팝업
			if (!confirm("이 영화를 리스트에서 삭제하시겠습니까?")) return;
			
			// AJAX 요청으로 삭제 처리
			$.ajax({
				url: '${pageContext.request.contextPath}/deleteReservation.do', // 컨트롤러 매핑 주소
				type: 'POST',
				data: {reservationID: resvID}, // 예약 ID를 서버로 전송
				success: function(response){
					console.log("🔵 서버 응답:", response);
					if(response.trim() === 'success'){
						// 성공 시, 해당 영화 카드 삭제
						$btn.closest('.movie-card').remove();
					}else{
						alert("삭제 실패:" + response);
					}
				},
				error: function(){
					alert("서버 오류로 삭제하지 못했습니다.");
				}
			});
		});

		// 프로필 사진 수정 관련
		$('#photo_btn').click(function(){
			$('#photo_choice').show();
			$(this).hide(); // 수정 버튼 감추기
		});

		// 이미지 미리보기
		let photo_path = $('.my-photo').attr('src'); // 현재 이미지 경로
		$('#photo').change(function(){
			let my_photo = this.files[0];
			if (!my_photo){
				// 선택 취소 시 원래 이미지로 복구
				$('.my-photo').attr('src', photo_path);
				return;
			}

			if (my_photo.size > 1024 * 1024) {
				alert(Math.round(my_photo.size / 1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
				$('.my-photo').attr('src', photo_path); // 이미지 원상복구
				$(this).val(''); // 파일 선택 초기화
				return;
			}

			// 화면에서 이미지 미리보기
			const reader = new FileReader();
			reader.readAsDataURL(my_photo);

			reader.onload = function() {
				$('.my-photo').attr('src', reader.result);
			};
		});

		// 이미지 전송
		$('#photo_submit').click(function(){
			if($('#photo').val() == ''){
				alert('파일을 선택하세요!');
				$('#photo').focus();
				return;
			}

			// 파일 전송
			const form_data = new FormData();
			form_data.append('photo', $('#photo')[0].files[0]);

			$.ajax({
				url: 'updateMyPhoto.do', // 서버에 파일 전송 URL
				type: 'POST',
				data: form_data,
				dataType: 'json',
				contentType: false, // 데이터 객체를 문자열로 바꿀지에 대한 값
				processData: false, // 해당 타입을 true로 하면 일반 text로 구분
				success: function(param) {
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요!');
					} else if(param.result == 'success') {
						alert('프로필 사진이 수정되었습니다.');
						// 수정된 이미지 정보 저장
						photo_path = $('.my-photo').attr('src');
						$('#photo').val('');
						$('#photo_choice').hide();
						$('#photo_btn').show(); // 수정 버튼 표시
					} else {
						alert('파일 전송 오류 발생');
					}
				},
				error: function() {
					alert('네트워크 오류 발생');
				}
			});
		});

		// 이미지 수정 취소
		$('#photo_reset').click(function() {
			$('.my-photo').attr('src', photo_path); // 원래 이미지로 복구
			$('#photo_choice').hide();
			$('#photo_btn').show(); // 수정 버튼 다시 보이기
		});
	});
</script>
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="Mylist-wrapper">
  <div class="Mylist-container">
    <!-- Sidebar -->
    <div class="Mylist-sidebar">
      <div class="Mylist-profile">
        <div class="Mylist-avatar"></div>
        <div class="Mylist-username">
          ${reservation.name}님 <span class="edit-icon">✏️</span>
        </div>
      </div>
      <a href="${pageContext.request.contextPath}/member/myPage.do">
    <button class="my-movies-btn">MyPage</button>
		</a>
    </div>

    <!-- Main Content -->
    <div class="Mylist-main">
      <h2>내가 본 영화</h2>

      <c:forEach var="reservation" items="${movieList}">
        <div class="movie-card">
          <img src="${pageContext.request.contextPath}/upload/${reservation.poster_url}"
               alt="${reservation.mvTitle}"
               style="width:150px;height:auto;border-radius:10px; margin-top:10px;">
          <div class="movie-info">
            <h3>${reservation.mvTitle}</h3>
            <p>
              ${reservation.screeningDate} 
              ${reservation.startTime} ~ ${reservation.endTime}
            </p>
            <p>${reservation.theaterName} / ${reservation.viewers}명</p>
          </div>
          <button class="close-btn" data-resv-id="${reservation.reservationID}">✕</button>
        </div>
        <hr/>
      </c:forEach>

    </div> <!-- Mylist-main -->
  </div>   <!-- Mylist-container -->
</div>     <!-- Mylist-wrapper -->

<!-- 프로필 사진 수정 -->
<div class="mypage-div">
  <h3>프로필 사진</h3>
  <ul>
    <li>
      <c:if test="${empty member.photo}">
        <img src="${pageContext.request.contextPath}/images/face.png" width="200" height="200" class="my-photo">
      </c:if>
      <c:if test="${!empty member.photo}">
        <img src="${pageContext.request.contextPath}/upload/${member.photo}" width="200" height="200" class="my-photo">
      </c:if>
    </li>
    <li>
      <div class="align-center">
        <input type="button" value="수정" id="photo_btn">
      </div>
      <div id="photo_choice" style="display:none;">
        <input type="file" id="photo" accept="image/gif,image/png,image/jpeg"><br>
        <input type="button" value="전송" id="photo_submit">
        <input type="button" value="취소" id="photo_reset">    
      </div>
    </li>
  </ul>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
