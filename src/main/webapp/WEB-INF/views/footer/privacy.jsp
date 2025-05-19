<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV 개인정보처리방침</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h2>개인정보처리방침</h2>
        <div class="content-box privacy-content">
            <h3>1. 개인정보의 수집 및 이용 목적</h3>
            <p>회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 
               이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 
               필요한 조치를 이행할 예정입니다.</p>
            
            <h4>가. 회원가입 및 관리</h4>
            <p>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 
               서비스 부정이용 방지, 만14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인, 
               각종 고지·통지, 고충처리 목적으로 개인정보를 처리합니다.</p>
            
            <h4>나. 서비스 제공</h4>
            <p>영화 예매, 티켓 발권, 포인트 적립 및 사용, 맞춤형 서비스 제공, 
               콘텐츠 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.</p>
            
            <!-- 추가적인 개인정보처리방침 내용은 실제 CGV 방침을 참고하여 작성 -->
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 