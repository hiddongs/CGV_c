<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 쿠폰 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
	<div class="admin-container">
		<h1 class="admin-title">쿠폰 관리</h1>
		<div class="admin-menu">
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/couponCreateForm.do">
					<div class="icon"><i class="fas fa-plus-circle"></i></div>
					<h3>쿠폰생성</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/couponIssueForm.do">
					<div class="icon"><i class="fas fa-share-square"></i></div>
					<h3>쿠폰발급</h3>
				</a>
			</div>
			<div class="admin-menu-item">
				<a href="${pageContext.request.contextPath}/admin/couponDeleteForm.do">
					<div class="icon"><i class="fas fa-trash-alt"></i></div>
					<h3>쿠폰삭제</h3>
				</a>
			</div>
		</div>
		<div class="admin-button-group">
			<button type="button" onclick="location.href='main.do'" class="btn btn-secondary">관리자 메인으로</button>
		</div>
	</div>
</body>
</html>