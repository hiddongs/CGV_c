<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV 채용정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h2>CGV 채용정보</h2>
        <div class="content-box">
            <h3>인재상</h3>
            <div class="recruit-vision">
                <h4>CGV가 찾는 인재</h4>
                <ul>
                    <li>창의적 사고로 혁신을 추구하는 인재</li>
                    <li>고객 중심의 서비스 마인드를 가진 인재</li>
                    <li>글로벌 마인드를 갖춘 도전적인 인재</li>
                    <li>팀워크를 중시하는 협력적인 인재</li>
                </ul>
            </div>
            
            <h3>채용 프로세스</h3>
            <div class="recruit-process">
                <ol>
                    <li>서류전형</li>
                    <li>인적성검사</li>
                    <li>1차 면접(실무진)</li>
                    <li>2차 면접(임원진)</li>
                    <li>최종합격</li>
                </ol>
            </div>
            
            <h3>채용 공고</h3>
            <div class="job-list">
                <div class="job-item">
                    <h4>신입/경력 극장 운영 매니저</h4>
                    <p>접수기간: 2024.03.01 ~ 2024.03.31</p>
                    <p>자격요건: 초대졸 이상</p>
                </div>
                <div class="job-item">
                    <h4>마케팅 전략 기획자</h4>
                    <p>접수기간: 2024.03.15 ~ 2024.04.15</p>
                    <p>자격요건: 경력 3년 이상</p>
                </div>
            </div>
            
            <h3>복리후생</h3>
            <ul class="benefits">
                <li>4대보험 및 퇴직연금</li>
                <li>자기계발비 지원</li>
                <li>의료비 지원</li>
                <li>영화 관람 지원</li>
                <li>경조사 지원</li>
                <li>휴가 및 포상</li>
            </ul>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 