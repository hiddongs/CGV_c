<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>극장 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hiddongs.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script>
document.getElementById('region').addEventListener('change', function() {
    const selectedRegion = this.value;
    if (selectedRegion) {
        // AJAX로 서버에 요청 보내기
        // 서버는 selectedRegion을 받아서 해당 지역의 극장 리스트를 반환
    }
});
</script>
</head>

<body>

    <div class="center-box">
    
        <div class="inner-box">
            <h3>극장 선택</h3>
            <form action="regionSubmit.do" method="post" class="container mt-4">
                <div class="mb-3">
                    <label for="region" class="form-label-left">지역 선택</label> 
                   <select name="region" id="region" class="form-select-left">
                    <option value="">-- 범위를 선택하세요 --</option>
                     <c:forEach var="theater" items="${regionList}">
                        <option value="${theater.region}">${theater.region}</option>
                     </c:forEach>
                   </select>
                </div>
                <input type="submit" value="전송" class="btn btn-primary">
            </form>
        </div>
    </div>
</body>

</html>