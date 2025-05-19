<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV 편성기준</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h2>영화 편성기준</h2>
        <div class="content-box">
            <h3>영화 편성 원칙</h3>
            <div class="schedule-section">
                <h4>기본 원칙</h4>
                <ul>
                    <li>관객의 수요를 고려한 합리적인 상영관 배정</li>
                    <li>다양한 장르와 관람 연령대를 고려한 균형있는 편성</li>
                    <li>영화의 예상 흥행성과 작품성을 종합적으로 고려</li>
                    <li>지역별 특성과 선호도를 반영한 맞춤형 편성</li>
                </ul>
            </div>
            
            <h3>시간대별 편성 기준</h3>
            <div class="time-section">
                <h4>주중</h4>
                <ul>
                    <li>오전 (10:00~12:00): 조조 할인 영화</li>
                    <li>오후 (12:00~18:00): 다양한 장르 혼합 편성</li>
                    <li>저녁 (18:00~24:00): 신작 및 인기작 중심 편성</li>
                </ul>
                
                <h4>주말/공휴일</h4>
                <ul>
                    <li>오전 (09:00~12:00): 가족/애니메이션 영화 중심</li>
                    <li>오후 (12:00~18:00): 전연령 관람가능 영화 중심</li>
                    <li>저녁 (18:00~24:00): 청소년/성인 관객층 영화 중심</li>
                </ul>
            </div>
            
            <h3>특별관 편성 기준</h3>
            <div class="special-section">
                <h4>IMAX/4DX/SCREENX</h4>
                <p>해당 상영관 특성에 최적화된 영화를 우선 편성</p>
                <ul>
                    <li>IMAX: 대작 블록버스터 중심</li>
                    <li>4DX: 액션/어드벤처 장르 중심</li>
                    <li>SCREENX: 웅장한 스케일의 영화 중심</li>
                </ul>
            </div>
            
            <h3>기타 고려사항</h3>
            <ul class="considerations">
                <li>배급사와의 계약 조건</li>
                <li>관객 예매율 및 좌석 점유율</li>
                <li>시즌별 특성 (방학, 연휴 등)</li>
                <li>특별 이벤트 및 프로모션</li>
            </ul>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 