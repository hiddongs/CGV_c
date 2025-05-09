<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../../common/adminHeader.jsp" %>
<div class="container">
    <h1>문의 관리</h1>
    
    <div class="search-container">
        <form action="${pageContext.request.contextPath}/admin/inquiryManagement.do" method="get">
            <select name="searchType">
                <option value="title" ${param.searchType == 'title' ? 'selected' : ''}>제목</option>
                <option value="content" ${param.searchType == 'content' ? 'selected' : ''}>내용</option>
                <option value="member" ${param.searchType == 'member' ? 'selected' : ''}>작성자</option>
            </select>
            <input type="text" name="searchKeyword" placeholder="검색어 입력" value="${param.searchKeyword}">
            <button type="submit" class="btn btn-primary">검색</button>
        </form>
    </div>
    
    <table class="data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>답변상태</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="inquiry" items="${inquiries}">
                <tr>
                    <td>${inquiry.inquiry_id}</td>
                    <td>${inquiry.title}</td>
                    <td>${inquiry.member_name}</td>
                    <td><fmt:formatDate value="${inquiry.reg_date}" pattern="yyyy-MM-dd" /></td>
                    <td>${inquiry.answer_status == 1 ? '답변완료' : '미답변'}</td>
                    <td>
                        <button class="btn btn-sm btn-info" onclick="location.href='${pageContext.request.contextPath}/admin/inquiryDetail.do?inquiry_id=${inquiry.inquiry_id}'">상세/답변</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 페이지네이션 -->
    <div class="pagination">
        <c:if test="${pageVO.prev}">
            <a href="${pageContext.request.contextPath}/admin/inquiryManagement.do?page=${pageVO.startPage-1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">&laquo;</a>
        </c:if>
        
        <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}">
            <a href="${pageContext.request.contextPath}/admin/inquiryManagement.do?page=${i}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}" 
               class="${pageVO.page == i ? 'active' : ''}">${i}</a>
        </c:forEach>
        
        <c:if test="${pageVO.next}">
            <a href="${pageContext.request.contextPath}/admin/inquiryManagement.do?page=${pageVO.endPage+1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">&raquo;</a>
        </c:if>
    </div>
</div>
</body>
</html>
