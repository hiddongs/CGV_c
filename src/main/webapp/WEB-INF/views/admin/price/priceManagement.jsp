<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가격 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .price-form {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }
    .price-group {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 20px;
    }
    .price-item {
        flex: 1 0 30%;
        min-width: 200px;
    }
    .price-title {
        font-weight: bold;
        margin-bottom: 10px;
    }
    .price-description {
        color: #666;
        font-size: 0.9em;
        margin-bottom: 5px;
    }
</style>
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
<div class="admin-container">
    <h1 class="admin-title">가격 관리</h1>
    
    <form action="priceUpdate.do" method="post" class="price-form">
        <div class="price-group">
            <div class="price-item">
                <div class="price-title">기본 가격 (2D)</div>
                <div class="price-description">기본 영화 가격입니다.</div>
                <input type="number" name="price" value="${price.price}" class="form-control" required>
            </div>
            
            <div class="price-item">
                <div class="price-title">주말 가격 가중치</div>
                <div class="price-description">주말에 추가되는 가격입니다.</div>
                <input type="number" name="weekend" value="${price.weekend}" class="form-control" required>
            </div>
            
            <div class="price-item">
                <div class="price-title">어린이 가격 가중치</div>
                <div class="price-description">어린이 할인 가격입니다.</div>
                <input type="number" name="kids" value="${price.kids}" class="form-control" required>
            </div>
            
            <div class="price-item">
                <div class="price-title">오후 가격 가중치</div>
                <div class="price-description">오후 시간대 가격입니다.</div>
                <input type="number" name="afternoon" value="${price.afternoon}" class="form-control" required>
            </div>
            
            <div class="price-item">
                <div class="price-title">자정 가격 가중치</div>
                <div class="price-description">자정 시간대 가격입니다.</div>
                <input type="number" name="midnight" value="${price.midnight}" class="form-control" required>
            </div>
            
            <div class="price-item">
                <div class="price-title">IMAX 가격 가중치</div>
                <div class="price-description">IMAX 영화 추가 가격입니다.</div>
                <input type="number" name="imax" value="${price.imax}" class="form-control" required>
            </div>
            
            <div class="price-item">
                <div class="price-title">ScreenX 가격 가중치</div>
                <div class="price-description">ScreenX 영화 추가 가격입니다.</div>
                <input type="number" name="screenX" value="${price.screenX}" class="form-control" required>
            </div>
            
            <div class="price-item">
                <div class="price-title">4DX 가격 가중치</div>
                <div class="price-description">4DX 영화 추가 가격입니다.</div>
                <input type="number" name="p_4DX" value="${price.p_4DX}" class="form-control" required>
            </div>
            
            <div class="price-item">
                <div class="price-title">3D 가격 가중치</div>
                <div class="price-description">3D 영화 추가 가격입니다.</div>
                <input type="number" name="p_3D" value="${price.p_3D}" class="form-control" required>
            </div>
        </div>
        
        <div class="button-group">
            <button type="submit" class="btn btn-primary">가격 업데이트</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/admin/main.do'">취소</button>
        </div>
    </form>
</div>
</body>
</html>