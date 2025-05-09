<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 관련 정보 입력</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
    // 초기화 작업 가능하면 여기에
});

function onMediaTypeChange(event){
    const selectedValue = $('input[name="mediaType"]:checked').val();	
    const previewGroup = $('#previewGroup');
    const previewInput = $('#preview');

    if(selectedValue){
        previewGroup.show();
        if (selectedValue === 'trailer') {
            previewInput.attr('accept', 'video/*');
        } else if (selectedValue === 'stillcut') {
            previewInput.attr('accept', 'image/*');
        }
    }
}

function preview(event){
    const file = event.target.files[0];
    const fileType = file?.type;
    const acceptType = $('#preview').attr('accept');

    if (file && !fileType.startsWith(acceptType.split('/')[0])) {
        alert('형식에 맞는 파일을 올려주세요');
        event.target.value = '';
        return;
    }

    const reader = new FileReader();
    reader.onload = function(){
        if (fileType.startsWith('image/')) {
            $('#imgPreview').attr('src', reader.result).show();
            $('#videoPreview').hide().attr('src', '');
        } else if (fileType.startsWith('video/')) {
            $('#videoPreview').attr('src', reader.result).show();
            $('#imgPreview').hide().attr('src', '');
        }
    };
    reader.readAsDataURL(file);
}
</script>
</head>
<body>
<%@ include file="../../common/adminHeader.jsp" %>
<p>movie_id: ${movie_id}</p>
<form action="insertMedia.do" class="form-container" enctype="multipart/form-data" method="post">
	<input type="hidden" value="${movie_id}" id="movie_id" name="movie_id">
	<div class="form-group">
		<label class="form-title">종류</label>
		<div class="form-check">
			<input type="radio" name="mediaType" value="trailer" onclick="onMediaTypeChange(event)">
			<label class="form-check-label">트레일러</label>
		</div>
		<div class="form-check">
			<input type="radio" name="mediaType" value="stillcut" onclick="onMediaTypeChange(event)">
			<label class="form-check-label">스틸컷</label>
		</div>
	</div>

	<div class="form-group" id="previewGroup" style="display: none;">
		<label class="form-title">첨부파일</label>
		<input class="form-input" type="file" id="preview" name="preview" onchange="preview(event)">
		
		<!-- 미리보기 영역 -->
		<div id="previewContainer" style="margin-top: 10px;">
			<img id="imgPreview" style="max-width: 300px; display: none;" alt="이미지 미리보기">
			<video id="videoPreview" width="320" controls style="display: none;"></video>
		</div>
		
	</div>
<!--
	<div class="form-group">
		<label class="form-title">사용여부</label>
		<div class="form-check">
			<input type="radio" name="status" value="Y">
			<label class="form-check-label">사용</label>
			<input type="radio" name="status" value="N">
			<label for="form-check-label"></label>
		</div>
	</div>
-->
	<div class="btn-group">
		<button class="btn btn-primary">제출</button>
	</div>
</form>
</body>
</html>