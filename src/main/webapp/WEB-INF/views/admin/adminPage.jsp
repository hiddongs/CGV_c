<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<title>관리자 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function scheduleExtension(event){
			$.ajax({
				type:'POST',
				url: '${pageContext.request.contextPath}/admin/scheduleExtension.do',
				dataType: 'JSON',
				success: function(response){
					if(response === 'failed'){
						alert('갱신할 스케쥴이 없습니다.')
					}else{
						alert('갱신이 완료되었습니다')
					}
				},
				error: function(xhr, status, error){
					console.error('에러 발생:' + error)
					alert('오류가 발생했습니다')
				}

			})
		}
	</script>
</head>
<body>
<jsp:include page="../common/adminHeader.jsp" />
	<div class="admin-container">
		<h1 class="admin-title">CGV 관리자 페이지</h1>
		<div class="admin-menu">
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/insertMovieForm.do">
					<div class="icon"><i class="fas fa-film"></i></div>
					<h3>영화등록</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/movieManagement.do">
					<div class="icon"><i class="fas fa-cogs"></i></div>
					<h3>영화관리</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/eventManagement.do">
					<div class="icon"><i class="fas fa-calendar-alt"></i></div>
					<h3>이벤트관리</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/inquiryManagement.do">
					<div class="icon"><i class="fas fa-question-circle"></i></div>
					<h3>문의관리</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/couponManagement.do">
					<div class="icon"><i class="fas fa-ticket-alt"></i></div>
					<h3>쿠폰관리</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/theaterManagement.do">
					<div class="icon"><i class="fas fa-building"></i></div>
					<h3>극장관리</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/priceManagement.do">
					<div class="icon"><i class="fas fa-dollar-sign"></i></div>
					<h3>가격관리</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="#" onclick="scheduleExtension()">
					<div class="icon"><i class="fas fa-calendar"></i></div>
					<h3>전체극장스케쥴갱신</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/noticeManagement.do">
					<div class="icon"><i class="fas fa-bell"></i></div>
					<h3>공지사항관리</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/memberManagement.do">
					<div class="icon"><i class="fas fa-user"></i></div>
					<h3>회원관리</h3>
				</a>
			</div>
		</div>
	</div>
</body>
</html>