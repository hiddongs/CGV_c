<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ud68cuc6d0 uc0c1uc138 uc815ubcf4</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../../common/adminHeader.jsp" %>
<div class="container">
    <h1>ud68cuc6d0 uc0c1uc138 uc815ubcf4</h1>
    
    <div class="member-info">
        <h2>uae30ubcf8 uc815ubcf4</h2>
        <table class="data-table">
            <tr>
                <th>ud68cuc6d0 ID</th>
                <td>${member.member_id}</td>
            </tr>
            <tr>
                <th>uc774ub984</th>
                <td>${member.name}</td>
            </tr>
            <tr>
                <th>uc774uba54uc77c</th>
                <td>${member.email}</td>
            </tr>
            <tr>
                <th>uc804ud654ubc88ud638</th>
                <td>${member.phone}</td>
            </tr>
            <tr>
                <th>uc0ddub144uc6d4uc77c</th>
                <td><fmt:formatDate value="${member.birth}" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr>
                <th>uc8fcuc18c</th>
                <td>${member.address}</td>
            </tr>
            <tr>
                <th>uac00uc785uc77c</th>
                <td><fmt:formatDate value="${member.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            </tr>
            <tr>
                <th>uc0c1ud0dc</th>
                <td>${member.status == 1 ? 'ud65cuc131' : 'ube44ud65cuc131'}</td>
            </tr>
        </table>
        
        <div class="action-buttons">
            <button class="btn ${member.status == 1 ? 'btn-warning' : 'btn-success'}" 
                    onclick="updateMemberStatus(${member.member_id}, ${member.status})">
                ${member.status == 1 ? 'ube44ud65cuc131ud654' : 'ud65cuc131ud654'}
            </button>
            <button class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/admin/memberManagement.do'">ubaa9ub85duc73cub85c ub3ccuc544uac00uae30</button>
        </div>
    </div>
    
    <div class="member-coupons">
        <h2>ubcf4uc720 ucfe0ud3f0</h2>
        <table class="data-table">
            <thead>
                <tr>
                    <th>ucfe0ud3f0uba85</th>
                    <th>ud560uc778uc728</th>
                    <th>ubc1cuae09uc77c</th>
                    <th>ub9ccub8ccuc77c</th>
                    <th>uc0acuc6a9uc5ecubd80</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="coupon" items="${coupons}">
                    <tr>
                        <td>${coupon.coupon_name}</td>
                        <td>${coupon.discount_rate}%</td>
                        <td><fmt:formatDate value="${coupon.issue_date}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${coupon.expiry_date}" pattern="yyyy-MM-dd" /></td>
                        <td>${coupon.used == 1 ? 'uc0acuc6a9uc644ub8cc' : 'ubbf8uc0acuc6a9'}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty coupons}">
                    <tr>
                        <td colspan="5" class="no-data">ubcf4uc720ud55c ucfe0ud3f0uc774 uc5c6uc2b5ub2c8ub2e4.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
    
    <div class="member-reservations">
        <h2>uc608ub9e4 ub0b4uc5ed</h2>
        <table class="data-table">
            <thead>
                <tr>
                    <th>uc608ub9e4 ID</th>
                    <th>uc601ud654uba85</th>
                    <th>uc0c1uc601uad00</th>
                    <th>uc0c1uc601uc77cuc2dc</th>
                    <th>uc608ub9e4uc77c</th>
                    <th>uc778uc6d0</th>
                    <th>uae08uc561</th>
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
                        <td><fmt:formatNumber value="${reservation.total_price}" pattern="#,###" />uc6d0</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty reservations}">
                    <tr>
                        <td colspan="7" class="no-data">uc608ub9e4 ub0b4uc5educ774 uc5c6uc2b5ub2c8ub2e4.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<script>
function updateMemberStatus(memberId, currentStatus) {
    var newStatus = currentStatus == 1 ? 0 : 1;
    var confirmMsg = newStatus == 1 ? 'ud68cuc6d0uc744 ud65cuc131ud654 ud558uc2dcuaca0uc2b5ub2c8uae4c?' : 'ud68cuc6d0uc744 ube44ud65cuc131ud654 ud558uc2dcuaca0uc2b5ub2c8uae4c?';
    
    if(confirm(confirmMsg)) {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/memberStatusUpdate.do",
            type: "POST",
            data: {
                member_id: memberId,
                status: newStatus
            },
            success: function(response) {
                alert("ud68cuc6d0 uc0c1ud0dcuac00 ubcc0uacbdub418uc5c8uc2b5ub2c8ub2e4.");
                location.reload();
            },
            error: function(xhr, status, error) {
                alert("uc624ub958uac00 ubc1cuc0ddud588uc2b5ub2c8ub2e4: " + error);
            }
        });
    }
}
</script>
</body>
</html>
