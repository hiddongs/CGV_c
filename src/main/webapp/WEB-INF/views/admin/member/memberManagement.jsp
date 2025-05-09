<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ud68cuc6d0 uad00ub9ac</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../../common/adminHeader.jsp" %>
<div class="container">
    <h1>ud68cuc6d0 uad00ub9ac</h1>
    
    <div class="search-container">
        <form action="${pageContext.request.contextPath}/admin/memberManagement.do" method="get">
            <select name="searchType">
                <option value="id" ${param.searchType == 'id' ? 'selected' : ''}>ud68cuc6d0ID</option>
                <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>uc774ub984</option>
                <option value="email" ${param.searchType == 'email' ? 'selected' : ''}>uc774uba54uc77c</option>
            </select>
            <input type="text" name="searchKeyword" placeholder="uac80uc0c9uc5b4 uc785ub825" value="${param.searchKeyword}">
            <button type="submit" class="btn btn-primary">uac80uc0c9</button>
        </form>
    </div>
    
    <table class="data-table">
        <thead>
            <tr>
                <th>ud68cuc6d0ID</th>
                <th>uc774ub984</th>
                <th>uc774uba54uc77c</th>
                <th>uc804ud654ubc88ud638</th>
                <th>uac00uc785uc77c</th>
                <th>uc0c1ud0dc</th>
                <th>uad00ub9ac</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${members}">
                <tr>
                    <td>${member.member_id}</td>
                    <td>${member.name}</td>
                    <td>${member.email}</td>
                    <td>${member.phone}</td>
                    <td><fmt:formatDate value="${member.reg_date}" pattern="yyyy-MM-dd" /></td>
                    <td>${member.status == 1 ? 'ud65cuc131' : 'ube44ud65cuc131'}</td>
                    <td>
                        <button class="btn btn-sm btn-info" onclick="location.href='${pageContext.request.contextPath}/admin/memberDetail.do?member_id=${member.member_id}'">uc0c1uc138</button>
                        <button class="btn btn-sm ${member.status == 1 ? 'btn-warning' : 'btn-success'}" 
                                onclick="updateMemberStatus(${member.member_id}, ${member.status})">
                            ${member.status == 1 ? 'ube44ud65cuc131ud654' : 'ud65cuc131ud654'}
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- ud398uc774uc9c0ub124uc774uc158 -->
    <div class="pagination">
        <c:if test="${pageVO.prev}">
            <a href="${pageContext.request.contextPath}/admin/memberManagement.do?page=${pageVO.startPage-1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">&laquo;</a>
        </c:if>
        
        <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}">
            <a href="${pageContext.request.contextPath}/admin/memberManagement.do?page=${i}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}" 
               class="${pageVO.page == i ? 'active' : ''}">${i}</a>
        </c:forEach>
        
        <c:if test="${pageVO.next}">
            <a href="${pageContext.request.contextPath}/admin/memberManagement.do?page=${pageVO.endPage+1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">&raquo;</a>
        </c:if>
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
