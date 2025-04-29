<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<%@ include file="../../common/adminHeader.jsp" %>
	<div>
		<form class="form-container" action="insertEvent.do" method="post"  enctype="multipart/form-data">
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
				<button type="button" class="btn btn-secondary" onclick="location.href='/adminMain.do'">메인으로</button>
			</div>
		</form>
	</div>
</body>
</html>