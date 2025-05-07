<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 선택</title>

<!-- Bootstrap 및 커스텀 스타일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<style>
    body {
        background-color: #f9f9f9;
        padding: 30px;
    }

    .fade-in {
        animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .card-title {
        font-size: 1.4rem;
        font-weight: bold;
        margin-bottom: 1rem;
    }

    .hero-text {
        font-size: 1.6rem;
        font-weight: 600;
        text-align: center;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
<div class="container fade-in">
    <div class="hero-text">🎬 영화관을 선택해주세요</div>

    <div class="card shadow-sm">
        <div class="card-body">
            <h5 class="card-title">영화관 선택</h5>

            <form action="selectTheater.do" method="post">
                <input type="hidden" name="movieID" value="${movieID}">
                
                <p>극장 수: <span class="badge bg-secondary">${fn:length(theaterList)}</span></p>

                <div class="mb-3">
                    <label for="theater" class="form-label">극장 목록</label>
                    <select name="theaterID" id="theater" class="form-select" required>
                        <option value="">-- 극장을 선택하세요 --</option>
                        <c:forEach var="theater" items="${theaterList}">
                            <option value="${theater.theaterId}">${theater.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary w-100">상영 시간 보기</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const select = document.getElementById('theater');
    if (select) {
        select.addEventListener('change', function() {
            console.log('선택된 극장:', select.value);
        });
    }
});
</script>
</body>
</html>
