<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠폰 관리 - 삭제</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    .coupon-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px;
        border-bottom: 1px solid #eee;
        transition: background-color 0.2s;
    }
    
    .coupon-item:hover {
        background-color: #f9f9f9;
    }
    
    .coupon-info {
        flex: 1;
    }
    
    .coupon-name {
        font-weight: 600;
        font-size: 16px;
        margin-bottom: 5px;
    }
    
    .coupon-description {
        color: #666;
        font-size: 14px;
    }
    
    .action-buttons {
        display: flex;
        gap: 10px;
    }
    
    .member-list {
        max-height: 300px;
        overflow-y: auto;
        margin-top: 15px;
    }
    
    .member-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 15px;
        border-bottom: 1px solid #eee;
    }
    
    .member-info {
        flex: 1;
    }
    
    .page-title {
        font-size: 24px;
        font-weight: 700;
        color: #333;
        margin-bottom: 20px;
        text-align: center;
    }
    
    .empty-state {
        text-align: center;
        padding: 40px 0;
        color: #666;
    }
    
    .empty-state-icon {
        font-size: 48px;
        margin-bottom: 15px;
        color: #ddd;
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
<script>
    function openModal(couponId) {
        document.getElementById('memberModal-' + couponId).classList.add('active');
    }
    
    function closeModal(couponId) {
        document.getElementById('memberModal-' + couponId).classList.remove('active');
    }
    
    function confirmDelete(couponId, couponName) {
        if (confirm('정말로 "' + couponName + '" 쿠폰을 삭제하시겠습니까?')) {
            location.href = '${pageContext.request.contextPath}/member/couponDelete.do?couponId=' + couponId;
        }
    }
    
    function confirmDeleteMember(couponId, memberId, memberName, possessId) {
        if (confirm('정말로 ' + memberName + ' 회원의 쿠폰을 삭제하시겠습니까?')) {
            location.href = '${pageContext.request.contextPath}/member/couponDeleteMember.do?possessId=' + possessId;
        }
    }
</script>
</head>
<body>
    <%@ include file="../../common/adminHeader.jsp" %>
    
    <div class="admin-container">
        <h1 class="admin-title"><i class="fas fa-ticket-alt"></i> 쿠폰 삭제</h1>
        
        <div class="admin-card">
            <c:choose>
                <c:when test="${empty couponList}">
                    <div class="empty-state">
                        <div class="empty-state-icon"><i class="fas fa-ticket-alt"></i></div>
                        <p>등록된 쿠폰이 없습니다.</p>
                        <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/adminCouponCreateForm.do'"><i class="fas fa-plus-circle"></i> 쿠폰 등록하기</button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-list">
                        <c:forEach var="coupon" items="${couponList}">
                            <li class="coupon-item">
                                <div class="coupon-info">
                                    <div class="coupon-name">${coupon.coupon_name}</div>
                                    <div class="coupon-description">할인금액: ${coupon.discount_amount}원</div>
                                </div>
                                <div class="action-buttons">
                                    <button class="btn btn-secondary" onclick="openModal('${coupon.couponID}')">상세보기</button>
                                    <button class="btn btn-primary" onclick="confirmDelete('${coupon.couponID}', '${coupon.coupon_name}')">삭제</button>
                                </div>
                            </li>
                            
                            <!-- 회원 목록 모달 -->
                            <div id="memberModal-${coupon.couponID}" class="modal-overlay">
                                <div class="modal-container">
                                    <div class="modal-header">
                                        <h3 class="modal-title">${coupon.coupon_name} 보유 회원</h3>
                                        <button class="modal-close" onclick="closeModal('${coupon.couponID}')">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <c:set var="hasMember" value="false" />
                                        <div class="member-list">
                                            <c:forEach var="possess" items="${cpPossessList}">
                                                <c:if test="${possess.coupon_id == coupon.couponID}">
                                                    <c:set var="hasMember" value="true" />
                                                    <div class="member-item">
                                                        <div class="member-info">
                                                            <strong>회원 ID:</strong> ${possess.member_id}
                                                        </div>
                                                        <button class="btn btn-secondary" onclick="confirmDeleteMember('${coupon.couponID}', '${possess.member_id}', '${possess.member_id}' ,'${possess.cp_possess_id }')">삭제</button>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            
                                            <c:if test="${!hasMember}">
                                                <div class="empty-state">
                                                    <p>이 쿠폰을 보유한 회원이 없습니다.</p>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" onclick="closeModal('${coupon.couponID}')">닫기</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="admin-button-group">
                        <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/adminCouponCreateForm.do'"><i class="fas fa-plus-circle"></i> 쿠폰 등록</button>
                        <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/adminCouponIssueForm.do'"><i class="fas fa-share-square"></i> 쿠폰 발행</button>
                        <button type="button" onclick="location.href='adminCouponManagement.do'" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> 쿠폰 관리로</button>
				   </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>