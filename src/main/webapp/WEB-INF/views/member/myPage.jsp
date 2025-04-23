<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV - 마이페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	
<style>
.mypage-container {
            max-width: 800px;
            margin: 30px auto;
            background: #fff;
            border-radius: 8px;
            padding: 20px;
        }
        .mypage-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        .mypage-header h2 {
            font-size: 24px;
            color: #333;
            margin: 0;
        }
        .vip-tag {
            color: #fb4357;
            font-size: 14px;
        }
        .mypage-section {
            margin-bottom: 30px;
        }
        .mypage-item {
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        .mypage-item:last-child {
            border-bottom: none;
        }
        .mypage-label {
            color: #666;
            font-size: 14px;
            margin-bottom: 5px;
        }
        .mypage-content {
            color: #333;
            font-size: 16px;
        }
        .mypage-date {
            color: #999;
            font-size: 12px;
            margin-top: 5px;
        }
        .mypage-point {
            color: #fb4357;
            font-weight: bold;
        }
        .button-group {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }
        .confirm-button {
            background: #666;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }
</style>
	
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container">
    <div class="mypage-container">
        <div class="mypage-header">
            <h2>${member.name} 님 <span class="vip-tag">${member.grade} 등급</span></h2>
            <button type="button" class="confirm-button" onclick="location.href='${pageContext.request.contextPath}/member/modifyForm.do'">회원정보수정</button>
        </div>

        <div class="mypage-section">
            <div class="mypage-item">
                <div class="mypage-label">나의 예매내역</div>
                <div class="mypage-content">예시1</div>
                <div class="mypage-date">2023.04.16 (화) | 20:30 | COD 2인 | 2만원</div>
                <div class="mypage-content">예시2</div>
                <div class="mypage-date">2023.04.16 (화) | 14:20 | 예매 12건</div>
            </div>

            <div class="mypage-item">
                <div class="mypage-label">나의 포인트</div>
                <div class="mypage-content mypage-point">${member.point} point</div>
                <div class="mypage-date">다음 적립예정 2,500P 적립예정</div>
            </div>

            <div class="mypage-item">
                <div class="mypage-label">문의내역</div>
                <div class="mypage-content">블랙팬서입니다</div>
                <div class="mypage-date">2023.04.16 (화) | 10:30 | 등록완료</div>
                <div class="mypage-content">집가고싶다</div>
                <div class="mypage-date">2023.04.16 (화) | 10:30 | 등록완료</div>
            </div>
        </div>

        <div class="button-group">
            <button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/member/deleteForm.do'">회원탈퇴</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">홈으로</button>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
