<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 대시보드</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.dashboard-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    margin-bottom: 30px;
}

.dashboard-card {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    padding: 20px;
}

.dashboard-card h2 {
    margin-top: 0;
    border-bottom: 1px solid #eee;
    padding-bottom: 10px;
    margin-bottom: 15px;
}

.stat-number {
    font-size: 2.5rem;
    font-weight: bold;
    color: #3498db;
    margin: 10px 0;
}

.stat-label {
    color: #7f8c8d;
    font-size: 0.9rem;
}

.chart-container {
    height: 250px;
}
</style>
</head>
<body>
<%@ include file="../common/adminHeader.jsp" %>
<div class="container">
    <h1>관리자 대시보드</h1>
    
    <div class="dashboard-container">
        <div class="dashboard-card">
            <h2>회원 현황</h2>
            <div class="stat-number">${memberStats.totalCount}</div>
            <div class="stat-label">총 회원수</div>
            <div class="stat-details">
                <p>오늘 가입: ${memberStats.todayCount}명</p>
                <p>이번 주 가입: ${memberStats.weekCount}명</p>
                <p>이번 달 가입: ${memberStats.monthCount}명</p>
            </div>
        </div>
        
        <div class="dashboard-card">
            <h2>예매 현황</h2>
            <div class="stat-number">${reservationStats.totalCount}</div>
            <div class="stat-label">총 예매수</div>
            <div class="stat-details">
                <p>오늘 예매: ${reservationStats.todayCount}건</p>
                <p>이번 주 예매: ${reservationStats.weekCount}건</p>
                <p>이번 달 예매: ${reservationStats.monthCount}건</p>
            </div>
        </div>
        
        <div class="dashboard-card">
            <h2>영화별 예매 현황</h2>
            <div class="chart-container">
                <canvas id="movieChart"></canvas>
            </div>
        </div>
        
        <div class="dashboard-card">
            <h2>최근 등록된 영화</h2>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>제목</th>
                        <th>개봉일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="movie" items="${recentMovies}">
                        <tr>
                            <td>${movie.mv_title}</td>
                            <td><fmt:formatDate value="${movie.release_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="dashboard-container">
        <div class="dashboard-card">
            <h2>미답변 문의</h2>
            <div class="stat-number">${inquiryStats.unansweredCount}</div>
            <div class="stat-label">미답변 문의수</div>
            <div class="action-buttons">
                <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/inquiryManagement.do'">문의 관리로 이동</button>
            </div>
        </div>
        
        <div class="dashboard-card">
            <h2>바로가기</h2>
            <div class="quick-links">
                <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/memberManagement.do'">회원 관리</button>
                <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/movieManagement.do'">영화 관리</button>
                <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/eventManagement.do'">이벤트 관리</button>
                <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/couponManagement.do'">쿠폰 관리</button>
            </div>
        </div>
    </div>
</div>

<script>
// 영화별 예매 현황 차트
var ctx = document.getElementById('movieChart').getContext('2d');
var movieChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [
            <c:forEach var="movie" items="${movieReservationStats}" varStatus="status">
                '${movie.title}'${!status.last ? ',' : ''}
            </c:forEach>
        ],
        datasets: [{
            label: '예매수',
            data: [
                <c:forEach var="movie" items="${movieReservationStats}" varStatus="status">
                    ${movie.count}${!status.last ? ',' : ''}
                </c:forEach>
            ],
            backgroundColor: 'rgba(54, 162, 235, 0.5)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
</body>
</html>
