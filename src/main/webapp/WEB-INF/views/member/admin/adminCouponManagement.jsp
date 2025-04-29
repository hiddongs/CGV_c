<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 쿠폰 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<div class="form-container">
		<a href="${pageContext.request.contextPath}/member/adminCouponCreateForm.do"><h3>쿠폰생성</h3></a>
		<a href="${pageContext.request.contextPath}/member/adminCouponIssueForm.do"><h3>쿠폰발급</h3></a>
		<a href="${pageContext.request.contextPath}/member/adminCouponDeleteForm.do"><h3>쿠폰삭제</h3></a>
	</div>
</body>
</html>