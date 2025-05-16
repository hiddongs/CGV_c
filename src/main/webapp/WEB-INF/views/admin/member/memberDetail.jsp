<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../../common/adminHeader.jsp" %>
<div class="container">
    <h1>회원 상세 정보</h1>
    
    <div class="member-info">
        <h2>기본 정보</h2>
        <table class="data-table">
            <tr>
                <th>회원 ID</th>
                <td>${member.member_id}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${member.name}</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${member.email}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${member.phone}</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td><fmt:formatDate value="${member.birth}" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr>
                <th>주소</th>
                <td>${member.address}</td>
            </tr>
            <tr>
                <th>가입일</th>
                <td><fmt:formatDate value="${member.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            </tr>
            <tr>
                <th>상태</th>
                <td>${member.status == 1 ? '활성' : '비활성'}</td>
            </tr>
        </table>
        
        <div class="action-buttons">
            <button class="btn ${member.status == 1 ? 'btn-warning' : 'btn-success'}" 
                    onclick="updateMemberStatus(${member.member_id}, ${member.status})">
                ${member.status == 1 ? '비활성화' : '활성화'}
            </button>
            <button class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/admin/memberManagement.do'">목록으로 돌아가기</button>
        </div>
    </div>
    
    <div class="member-coupons">
        <h2>보유 쿠폰</h2>
        <table class="data-table">
            <thead>
                <tr>
                    <th>쿠폰명</th>
                    <th>할인율</th>
                    <th>발급일</th>
                    <th>만료일</th>
                    <th>사용여부</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="coupon" items="${coupons}">
                    <tr>
                        <td>${coupon.coupon_name}</td>
                        <td>${coupon.discount_rate}%</td>
                        <td><fmt:formatDate value="${coupon.issue_date}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${coupon.expiry_date}" pattern="yyyy-MM-dd" /></td>
                        <td>${coupon.used == 1 ? '사용완료' : '미사용'}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty coupons}">
                    <tr>
                        <td colspan="5" class="no-data">보유한 쿠폰이 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
    
    <div class="member-reservations">
        <h2>예매 내역</h2>
        <table class="data-table">
            <thead>
                <tr>
                    <th>예매 ID</th>
                    <th>영화명</th>
                    <th>상영관</th>
                    <th>상영일시</th>
                    <th>예매일</th>
                    <th>인원</th>
                    <th>금액</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="reservation" items="${reservations}">
                    <tr>
                        <td>${reservation.reservation_id}</td>
                        <td>${reservation.movie_title}</td>
                        <td>${reservation.theater_name}</td>
                        <td><fmt:formatDate value="${reservation.screening_time}" pattern="yyyy-MM-dd HH:mm" /></td>
                        <td><fmt:formatDate value="${reservation.reservation_date}" pattern="yyyy-MM-dd" /></td>
                        <td>${reservation.people_count}</td>
                        <td><fmt:formatNumber value="${reservation.total_price}" pattern="#,###" />원</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty reservations}">
                    <tr>
                        <td colspan="7" class="no-data">예매 내역이 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<script>
function updateMemberStatus(memberId, currentStatus) {
    var newStatus = currentStatus == 1 ? 0 : 1;
    var confirmMsg = newStatus == 1 ? '회원을 활성화 하시겠습니까?' : '회원을 비활성화 하시겠습니까?';
    
    if(confirm(confirmMsg)) {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/memberStatusUpdate.do",
            type: "POST",
            data: {
                member_id: memberId,
                status: newStatus
            },
            success: function(response) {
                alert("회원 상태가 변경되었습니다.");
                location.reload();
            },
            error: function(xhr, status, error) {
                alert("오류가 발생했습니다: " + error);
            }
        });
    }
}
</script>
</body>
</html>
