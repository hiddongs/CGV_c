<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV 법적고지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h2>법적고지</h2>
        <div class="content-box">
            <h3>저작권 정책</h3>
            <div class="legal-section">
                <p>CGV 웹사이트에서 제공되는 모든 콘텐츠(이미지, 텍스트, 영상 등)는 
                   CGV의 소유이거나 허가를 받아 사용하는 것으로, 저작권법의 보호를 받습니다.</p>
                <ul>
                    <li>무단 복제 및 배포 금지</li>
                    <li>상업적 목적의 사용 제한</li>
                    <li>출처 표시 의무</li>
                </ul>
            </div>
            
            <h3>면책조항</h3>
            <div class="disclaimer-section">
                <h4>서비스 이용에 대한 면책</h4>
                <p>CGV는 다음과 같은 사항에 대해 책임을 지지 않습니다:</p>
                <ul>
                    <li>천재지변 등 불가항력적 사유로 인한 서비스 중단</li>
                    <li>이용자의 귀책사유로 인한 서비스 이용의 장애</li>
                    <li>제3자의 부정한 서비스 이용 행위</li>
                    <li>이용자 간의 분쟁 또는 손해</li>
                </ul>
            </div>
            
            <h3>게시물 관리정책</h3>
            <div class="post-policy-section">
                <p>CGV는 다음과 같은 게시물을 사전 통지 없이 삭제할 수 있습니다:</p>
                <ul>
                    <li>타인의 권리를 침해하는 내용</li>
                    <li>음란성 또는 청소년에게 부적합한 내용</li>
                    <li>허위사실 유포 또는 명예훼손성 내용</li>
                    <li>영리목적의 광고성 내용</li>
                    <li>기타 관련법령에 위배되는 내용</li>
                </ul>
            </div>
            
            <h3>준거법 및 관할법원</h3>
            <div class="jurisdiction-section">
                <p>본 약관과 관련된 사항에 대한 분쟁이 발생할 경우 대한민국 법을 준거법으로 하며,
                   서울중앙지방법원을 제1심 관할법원으로 합니다.</p>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 