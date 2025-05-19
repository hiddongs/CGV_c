<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV 광고/제휴/출점문의</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h2>광고/제휴/출점문의</h2>
        <div class="content-box">
            <h3>스크린 광고</h3>
            <div class="ad-section">
                <h4>영화 상영관 광고</h4>
                <p>CGV의 스크린 광고는 영화 시작 전 상영되는 광고로, 
                   전국 CGV 영화관에서 노출되어 높은 광고 효과를 기대할 수 있습니다.</p>
                <ul>
                    <li>전국 CGV 영화관 스크린 광고</li>
                    <li>지역별 타겟팅 광고</li>
                    <li>시간대별 타겟팅 광고</li>
                </ul>
            </div>
            
            <h3>매점/로비 광고</h3>
            <div class="ad-section">
                <h4>현장 광고</h4>
                <p>매점 및 로비의 디지털 사이니지, 포스터 등을 통해 
                   효과적인 브랜드 노출이 가능합니다.</p>
                <ul>
                    <li>디지털 사이니지 광고</li>
                    <li>포스터 광고</li>
                    <li>샘플링 행사</li>
                </ul>
            </div>
            
            <h3>제휴 문의</h3>
            <div class="partnership-section">
                <h4>제휴 분야</h4>
                <ul>
                    <li>브랜드 제휴</li>
                    <li>프로모션 제휴</li>
                    <li>콘텐츠 제휴</li>
                    <li>시설 제휴</li>
                </ul>
            </div>
            
            <h3>출점 문의</h3>
            <div class="location-section">
                <h4>신규 출점 조건</h4>
                <ul>
                    <li>인구 밀집 지역</li>
                    <li>교통 접근성</li>
                    <li>상권 분석</li>
                    <li>부지 면적</li>
                </ul>
                <p>출점 문의: 02-1234-5678</p>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 