<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
    // 지역 목록 가져오기
    $.ajax({
        type:'POST',
        url: 'theaterGetRegionList.do',
        dataType:'JSON',
        success: function(response){
            displayRegionList(response);
        },
        error: function(xhr, status, error){
            console.error('에러 발생:', error);
            alert('지역 목록을 불러오는 중 오류가 발생했습니다.');
        }
    });
});

function displayRegionList(regionList){
    const regionSelect = document.getElementById('region');
    
    if(!regionList || regionList.length === 0){
        const option = document.createElement('option');
        option.value = '';
        option.textContent = '지역 없음';
        regionSelect.appendChild(option);
        return;
    }
    
    // 기본 옵션 추가
    const defaultOption = document.createElement('option');
    defaultOption.value = '';
    defaultOption.textContent = '지역 선택';
    regionSelect.appendChild(defaultOption);
    
    // 지역 목록 추가
    regionList.forEach(region => {
        const option = document.createElement('option');
        option.value = region.region;
        option.textContent = region.region;
        regionSelect.appendChild(option);
    });
}

function validateForm() {
    const name = document.getElementById('name').value;
    const region = document.getElementById('region').value;
    const description = document.getElementById('description').value;
    
    if(!name.trim()) {
        alert('극장 이름을 입력해주세요.');
        return false;
    }
    
    if(!region) {
        alert('지역을 선택해주세요.');
        return false;
    }
    
    return true;
}
</script>
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
    <div class="admin-container">
        <h1 class="admin-title">극장 등록</h1>
        <form action="registerTheater.do" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="name">극장 이름</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="region">지역</label>
                <select id="region" name="region" class="form-control" required>
                    <!-- 지역 목록은 JavaScript로 동적 생성 -->
                </select>
            </div>
            <div class="form-group">
                <label for="description">설명</label>
                <textarea id="description" name="description" class="form-control" rows="5"></textarea>
            </div>
            <div class="button-group">
                <button type="submit" class="btn btn-primary">등록</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='theaterManagement.do'">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
