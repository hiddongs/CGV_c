<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상영 스케줄 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .form-container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    .form-input, select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }
    .form-actions {
        margin-top: 20px;
        text-align: center;
    }
    .btn {
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        margin: 0 5px;
    }
    .btn-primary {
        background-color: #007bff;
        color: white;
    }
    .btn-secondary {
        background-color: #6c757d;
        color: white;
    }
</style>
<script>
    $(function(){
        // 폼 제출 시 유효성 검사
        $("#scheduleForm").submit(function(event){
            // 필수 필드 검사
            if(!$("#screeningDate").val()){
                alert("상영 날짜를 입력해주세요.");
                $("#screeningDate").focus();
                event.preventDefault();
                return;
            }
            
            // 확인 대화상자
            if(!confirm("스케줄을 수정하시겠습니까?")){
                event.preventDefault();
            }
        });
    });
</script>
</head>
<body>
    <%@ include file="../../common/adminHeader.jsp" %>
    <div class="container">
        <h2>상영 스케줄 수정</h2>
        <p>아래 정보를 수정하여 스케줄을 업데이트하세요.</p>
        
        <form id="scheduleForm" action="updateSchedule.do" method="post" class="form-container">
            <input type="hidden" name="scheduleId" value="${schedule.scheduleId}">
            
            <div class="form-group">
                <label for="theaterId" class="form-label">극장</label>
                <select id="theaterId" name="theaterId" class="form-input" required>
                    <option value="${schedule.theaterId}" selected>${schedule.theaterName} (${schedule.theaterRegion})</option>
                    <!-- 필요한 경우 다른 극장 옵션들을 AJAX로 로드 -->
                </select>
            </div>
            
            <div class="form-group">
                <label for="auditoriumId" class="form-label">상영관</label>
                <select id="auditoriumId" name="auditoriumId" class="form-input" required>
                    <option value="${schedule.auditoriumId}" selected>${schedule.auditoriumName} (${schedule.auditoriumType})</option>
                    <!-- 필요한 경우 다른 상영관 옵션들을 AJAX로 로드 -->
                </select>
            </div>
            
            <div class="form-group">
                <label for="movieId" class="form-label">영화</label>
                <select id="movieId" name="movieId" class="form-input" required>
                    <option value="${schedule.movieId}" selected>${schedule.movieTitle} (${schedule.runtime}분)</option>
                    <!-- 필요한 경우 다른 영화 옵션들을 AJAX로 로드 -->
                </select>
            </div>
            
            <div class="form-group">
                <label for="slotId" class="form-label">상영 시간</label>
                <select id="slotId" name="slotId" class="form-input" required>
                    <option value="${schedule.slotId}" selected>${schedule.startTime} ~ ${schedule.endTime}</option>
                    <!-- 필요한 경우 다른 시간 슬롯 옵션들을 AJAX로 로드 -->
                </select>
            </div>
            
            <div class="form-group">
                <label for="screeningDate" class="form-label">상영 날짜</label>
                <input type="date" id="screeningDate" name="screeningDate" class="form-input" 
                       value="${schedule.screeningDate}" required>
            </div>
            
            <div class="form-group">
                <label class="form-label">상영 가능 여부</label>
                <div>
                    <label>
                        <input type="radio" name="isAvailable" value="true" ${schedule.available ? 'checked' : ''}> 예
                    </label>
                    <label style="margin-left: 20px;">
                        <input type="radio" name="isAvailable" value="false" ${!schedule.available ? 'checked' : ''}> 아니오
                    </label>
                </div>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">수정 완료</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='scheduleManagement.do?theaterId=${schedule.theaterId}'">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
