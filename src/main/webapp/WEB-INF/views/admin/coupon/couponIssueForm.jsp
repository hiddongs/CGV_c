<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 쿠폰 발행 폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    /* 모달 스타일 */
    .item-list {
        list-style: none;
        padding: 0;
        margin: 15px 0;
        max-height: 300px;
        overflow-y: auto;
        border: 1px solid #eee;
        border-radius: 4px;
    }
    
    .item {
        padding: 12px 15px;
        border-bottom: 1px solid #eee;
        cursor: pointer;
        transition: background-color 0.2s;
    }
    
    .item:last-child {
        border-bottom: none;
    }
    
    .item:hover {
        background-color: #f5f5f5;
    }
    
    .search-input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
    }
    
    .search-input:focus {
        border-color: #fb4357;
        outline: none;
        box-shadow: 0 0 0 2px rgba(251, 67, 87, 0.1);
    }
    
    .page-title {
        font-size: 24px;
        font-weight: 700;
        color: #333;
        margin-bottom: 20px;
        text-align: center;
    }
    
    /* 모달 스타일 */
    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: none;
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }
    
    .modal-overlay.active {
        display: flex;
    }
    
    .modal-container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        width: 90%;
        max-width: 500px;
        max-height: 90vh;
        overflow-y: auto;
        padding: 24px;
        position: relative;
    }
    
    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 16px;
        padding-bottom: 16px;
        border-bottom: 1px solid #eee;
    }
    
    .modal-title {
        font-size: 20px;
        font-weight: 600;
        color: #222;
        margin: 0;
    }
    
    .modal-close {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 24px;
        color: #666;
        transition: color 0.3s;
    }
    
    .modal-close:hover {
        color: #fb4357;
    }
    
    .modal-body {
        margin-bottom: 24px;
    }
    
    .modal-footer {
        display: flex;
        justify-content: flex-end;
        gap: 12px;
        padding-top: 16px;
        border-top: 1px solid #eee;
    }
</style>
<script type="text/javascript">
function openModal(type) {
    document.getElementById(type + "Modal").classList.add("active");
}

function closeModal(type) {
    document.getElementById(type + "Modal").classList.remove("active");
}

function selectItem(type, id, name) {
    document.getElementById(type).value = name;
    document.getElementById(type + "Id").value = id;
    closeModal(type);
}

function filterList(type) {
    const input = document.getElementById(type + "Search").value.toLowerCase();
    const items = document.querySelectorAll("#" + type + "Modal .item");
    items.forEach(item => {
        item.style.display = item.textContent.toLowerCase().includes(input) ? "" : "none";
    });
}

$(document).ready(function(){
	$('#myForm').on('submit', function(e){
        let isValid = true
        $(this).find('input[type = "hidden"]').each(function(){
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
	<%@ include file="../../common/adminHeader.jsp" %>
	
	<div class="admin-container">
		<h1 class="admin-title"><i class="fas fa-share-square"></i> 쿠폰 발행</h1>
		
		<div class="admin-form-container">
			<form action="couponIssue.do" name="myForm" id="myForm">
				<div class="form-group">
					<label for="coupon" class="form-label"><i class="fas fa-ticket-alt"></i> 발행쿠폰</label>
					<input type="text" class="form-input" id="coupon" readonly onclick="openModal('coupon')" placeholder="클릭하여 쿠폰 선택">
					<input type="hidden" name="couponId" id="couponId">
				</div>
				<div class="form-group">
					<label for="member" class="form-label"><i class="fas fa-user"></i> 발행대상</label>
					<input type="text" class="form-input" id="member" readonly onclick="openModal('member')" placeholder="클릭하여 회원 선택">
					<input type="hidden" name="memberId" id="memberId">
				</div>
				<div class="admin-button-group">
					<button type="submit" class="btn btn-primary"><i class="fas fa-paper-plane"></i> 쿠폰 발행</button>
					<button type="button" onclick="location.href='couponManagement.do'" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> 쿠폰 관리로</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 쿠폰 선택 모달 -->
	<div id="couponModal" class="modal-overlay">
		<div class="modal-container">
			<div class="modal-header">
				<h3 class="modal-title">쿠폰 선택</h3>
				<button class="modal-close" onclick="closeModal('coupon')">&times;</button>
			</div>
			<div class="modal-body">
				<input type="text" id="couponSearch" class="search-input" onkeyup="filterList('coupon')" placeholder="쿠폰 검색...">
				<ul class="item-list">
					<c:forEach var="coupon" items="${couponList}">
						<li class="item" onclick="selectItem('coupon','${coupon.couponID}','${coupon.coupon_name}')">${coupon.coupon_name}</li>
					</c:forEach>
				</ul>
			</div>
			<div class="modal-footer">
				<button onclick="closeModal('coupon')" class="btn btn-secondary">닫기</button>
			</div>
		</div>
	</div>

	<!-- 회원 선택 모달 -->
	<div id="memberModal" class="modal-overlay">
		<div class="modal-container">
			<div class="modal-header">
				<h3 class="modal-title">회원 선택</h3>
				<button class="modal-close" onclick="closeModal('member')">&times;</button>
			</div>
			<div class="modal-body">
				<input type="text" id="memberSearch" class="search-input" onkeyup="filterList('member')" placeholder="회원 검색...">
				<ul class="item-list">
					<c:forEach var="member" items="${memberList}">
						<li class="item" onclick="selectItem('member', '${member.member_id}', '${member.name}')">
							<strong>아이디:</strong> ${member.user_id} | <strong>이름:</strong> ${member.name}
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="modal-footer">
				<button onclick="closeModal('member')" class="btn btn-secondary">닫기</button>
			</div>
		</div>
	</div>
</body>
</html>