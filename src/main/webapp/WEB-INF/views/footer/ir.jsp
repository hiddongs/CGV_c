<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV IR</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h2>CGV IR 정보</h2>
        <div class="content-box">
            <h3>기업지배구조</h3>
            <p>CGV는 투명한 기업지배구조를 통해 주주가치를 제고하고 있습니다.</p>
            
            <h3>재무정보</h3>
            <div class="financial-info">
                <h4>실적 발표</h4>
                <ul>
                    <li>2023년 4분기 실적발표</li>
                    <li>2023년 3분기 실적발표</li>
                    <li>2023년 2분기 실적발표</li>
                    <li>2023년 1분기 실적발표</li>
                </ul>
                
                <h4>재무제표</h4>
                <ul>
                    <li>2023년 연간 재무제표</li>
                    <li>2022년 연간 재무제표</li>
                    <li>2021년 연간 재무제표</li>
                </ul>
            </div>
            
            <h3>주가정보</h3>
            <p>CGV의 주가 정보는 한국거래소(KRX)에서 확인하실 수 있습니다.</p>
            
            <h3>IR 자료실</h3>
            <p>CGV의 IR 관련 자료를 다운로드 받으실 수 있습니다.</p>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 