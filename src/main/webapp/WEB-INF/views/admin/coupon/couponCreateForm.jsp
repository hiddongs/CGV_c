<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰생성폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//만료일 최소날짜 지정(오늘기준)
	const today = new Date().toISOString().split('T')[0]
	$('#expired_date').attr('min',today)

	
	// Form의 모든값이 입력되었는지 검증
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
		})
		if(!isValid) return false
	})


})
</script>
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
	<div class="admin-container">
		<h1 class="admin-form-title">쿠폰 생성</h1>
		<form action="couponCreate.do" class="admin-form-container" id="myForm" name="myForm">
			<div class="form-group">
				<label for="coupon_name" class="form-label"><i class="fas fa-tag"></i> 쿠폰이름(설명)</label>
				<input type="text" class="form-input" id="coupon_name" name="coupon_name" placeholder="쿠폰 이름을 입력하세요">
			</div>
			<div class="form-group">
				<label for="discount_amount" class="form-label"><i class="fas fa-won-sign"></i> 할인금액</label>
				<input type="text" class="form-input" id="discount_amount" name="discount_amount" placeholder="할인 금액을 입력하세요">
			</div>
			<div class="form-group">
				<label for="expired_date" class="form-label"><i class="fas fa-calendar-alt"></i> 만료일</label>
				<input type="date" class="form-input" id="expired_date" name="expired_date">
			</div>
			<div class="admin-button-group">
				<button class="btn btn-primary" type="submit"><i class="fas fa-check"></i> 생성</button>
				<button type="button" onclick="location.href='couponManagement.do'" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> 쿠폰 관리로</button>
			</div>
		</form>
	</div>
</body>
</html>