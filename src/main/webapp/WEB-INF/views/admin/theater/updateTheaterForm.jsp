<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 극장 수정 폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function(){
        const regionOption = document.querySelector('#region')
        const regionList = JSON.parse('${regionList}')
        console.log(regionList)

        regionList.forEach(region => {
            const option = document.createElement('option')
            option.value = region.region
            option.innerText = region.region
            regionOption.appendChild(option)
        });
    })
</script>
</head>
<body>
    <form action="updateTheater.do" method="post" class="form-container">
        <input type="hidden" value="theater.theaterId">
        <div class="form-group">
            <label for="theaterName" class="form-label">극장이름</label>
            <input type="text" class="form-input" value="${theater.name}">
        </div>
        <div class="form-group">
            <label for="region" class="form-label">지역</label>
            <select name="region" id="region">

            </select>
        </div>
        <div class="form-group">
            <label for="description" class="form-label">설명</label>
            <textarea rows="10" cols="70" id="description" name="description" class="form-input">${theater.description}</textarea>
        </div>
    </form>
</body>
</html>