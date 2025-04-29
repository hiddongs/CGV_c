<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰생성폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<form action="couponCreate.do" class="form-container">
		<div class="form-group">
			<label for="coupon_name" class="form-label">쿠폰이름(설명)</label>
			<input type="text" class="form-input" id="coupon_name" name="coupon_name">
		</div>
		<div class="form-group">
			<label for="discount_amount" class="form-label">할인금액</label>
			<input type="text" class="form-input" id="discount_amount" name="discount_amount">
		</div>
		<div class="form-group">
			<label for="expired_date" class="form-label">만료일</label>
			<input type="date" class="form-input" id="expired_date" name="expired_date">
		</div>
		<div class="button-group">
			<button class="btn btn-primary" type="submit">생성</button>
			<button class="button" onclick="location.href='adminMain.do'"></button>
		</div>
	</form>
</body>
</html>