<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#myForm').on('submit', function(e){
		let isValid = true
		$(this).find('input').each(function(){
			if($.trim($(this).val()) === ''){
				alert('모든 항목을 입력해주세요')
				$(this).focus()
				isValid = false
				e.preventDefault()
				return false
			}
			if(!isValid) return false
		})
	})
})
function previewImage(event){
		const file = event.target.files[0]
		if(file){
			if(!file.type.startsWith('image/')){
				alert('이미지 파일만 업로드 가능합니다.')
				event.target.value = ''
				return
			}
			const reader = new FileReader()
			reader.onload = function(){
				const output = document.getElementById('preview')
				output.src = reader.result
				output.style.display = 'block'
			}
			reader.readAsDataURL(file)
		}
	}
</script>
</head>
<body>
	<%@ include file="../../common/adminHeader.jsp" %>
	<div>
		<form id="myForm" name="myForm" class="form-container" action="insertEvent.do" method="post"  enctype="multipart/form-data">
			<div class="form-group">
				<label class="form-label" id="title">이벤트 제목</label>
				<input class="form-input" type="text" id="title" name="title">
			</div>
			<div class="form-group">
				<label class="form-label" id="poster_url">이벤트 사진</label>
				<input type="file" class="form-input" id="poster_url" name="poster_url" accept="image/*" onchange="previewImage(event)">
	       	 	<br>
       			<img id="preview" class="movie-poster" src="#" alt="포스터 미리보기" style="max-width: 200px; display: none; margin-top: 10px;">
   			</div>
			<div class="form-group">
				<label class="form-label" id="start_date">이벤트 시작일</label>	
				<input type="date" class="form-input" id="start_date" name="start_date">	
			</div>
			<div class="form-group">
				<label class="form-label" id="end_date">이벤트 종료일</label>	
				<input type="date" class="form-input" id="end_date" name="end_date">	
			</div>
			<div class="form-group">
				<label class="form-label" id="type">연관타입 (제휴나 영화)</label>
				<input class="form-input" type="text" id="type" name="type">
			</div>
			<div>
				<label class="form-label" id="content">이벤트 내용</label>
				<textarea rows="10" cols="70" id="content" name="content" class="form-input"></textarea>
			</div>
			<div class="button_group">
				<button type="submit" class="btn btn-primary">이벤트 등록</button>
				 <button type="button" id="backbutton" onclick="location.href='eventManagement.do'" class="btn btn-warning">이벤트관리로</button>
			</div>
		</form>
	</div>
</body>
</html>