<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <!-- 여기서 UTF-8로 인코딩 설정 -->
<title>극장 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../../common/adminHeader.jsp" %>
<div class="container">
    <h1>멤버 관리</h1>
    
    <div class="search-container">
        <form action="${pageContext.request.contextPath}/admin/memberManagement.do" method="get">
            <select name="searchType">
                <option value="id" ${param.searchType == 'id' ? 'selected' : ''}>회원ID</option>
                <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>이름</option>
                <option value="email" ${param.searchType == 'email' ? 'selected' : ''}>이메일</option>
            </select>
            <input type="text" name="searchKeyword" placeholder="검색어 입력" value="${param.searchKeyword}">
            <button type="submit" class="btn btn-primary">검색</button>
        </form>
    </div>
    
    <table class="table">
    <thead>
        <tr>
            <th>회원ID</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>가입일</th>
            <th>상태</th>
            <th>관리(등급)</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="member" items="${memberList}">
        	<c:choose>
	        	<c:when test="${member.member_id ne 1}">
	            <tr>
	                <td>${member.user_id}</td> <!-- user_id에 직접 접근 -->
	                <td>${member.name}</td>
	                <td>${member.email}</td>
	                <td>${member.phone}</td>
	                <td><fmt:formatDate value="${member.reg_date}" pattern="yyyy-MM-dd" /></td>
	                <td>${member.grade eq '정지' ? '비활성' : '활성'}</td>
	                <td>
	                    <button class="btn btn-sm btn-info" onclick="location.href='${pageContext.request.contextPath}/admin/memberDetail.do?member_id=${member.member_id}'">상세</button>
	                    <button class="btn btn-sm ${member.grade eq '정지' ? 'btn-warning' : 'btn-success'}" 
	                            onclick="updateMemberStatus(${member.member_id}, '${member.grade eq '정지' ? '비활성' : '활성'}')">
	                        ${member.grade eq '정지' ? '활성화' : '비활성화'}
	                    </button>
	                </td>
	            </tr>
	            </c:when>
            </c:choose>
        </c:forEach>
    </tbody>
</table>
    
    <!-- 페이징 -->
    <div class="pagination">
        <c:if test="${pageVO.prev}">
            <a href="${pageContext.request.contextPath}/admin/memberManagement.do?page=${pageVO.startPage-1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">&laquo;</a>
        </c:if>
        
        <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}">
            <a href="${pageContext.request.contextPath}/admin/memberManagement.do?page=${i}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}" 
               class="${pageVO.page == i ? 'active' : ''}">${i+1}</a>
        </c:forEach>
        
        <c:if test="${pageVO.next}">
            <a href="${pageContext.request.contextPath}/admin/memberManagement.do?page=${pageVO.endPage+1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">&raquo;</a>
        </c:if>
    </div>
</div>

<script>
function updateMemberStatus(memberId, currentStatus) {
    var newStatus = currentStatus === '정지' ? 0 : 1;
    var confirmMsg = newStatus == 1 ? '정말로 이 회원을 활성화 하시겠습니까?' : '정말로 이 회원을 비활성화 하시겠습니까?';
    
    if(confirm(confirmMsg)) {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/memberStatusUpdate.do",
            type: "POST",
            data: {
                memberId: memberId,
                status: newStatus
            },
            success: function(response) {
                alert("회원 상태가 업데이트 되었습니다.");
                location.reload();
            },
            error: function(xhr, status, error) {
                alert("오류가 발생하였습니다: " + error);
            }
        });
    }
}
</script>
</body>
</html>
