<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<style>
body {
  background-color: #1c1c1c;
  color: #fff;
  font-family: 'Noto Sans KR', sans-serif;
  padding: 40px;
}
.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #2e2e2e;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
}
.hero-text {
  font-size: 24px;
  text-align: center;
  margin-bottom: 30px;
}
label {
  color: #ddd;
  margin-top: 10px;
}
select, input[type="date"] {
  width: 100%;
  padding: 10px;
  margin-top: 10px;
  border-radius: 8px;
  border: 1px solid #999;
  background-color: #444;
  color: white;
}
button {
  width: 100%;
  background-color: #e50914;
  padding: 12px;
  margin-top: 20px;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  color: white;
  cursor: pointer;
  transition: background 0.3s;
}
button:hover {
  background-color: #c20710;
}
</style>
</head>
<body>
<div class="container fade-in">
  <div class="hero-text">🎬 영화관을 선택해주세요</div>

  <form action="selectTime.do" method="post">
   <input type="hidden" name="memberID" value="${mem_ID}" />
    <input type="hidden" name="movieID" value="${movieID}" />
    <input type="hidden" name="screenDate" value="${now}" />

    <p>극장 수: <strong>${fn:length(theaterList)}</strong></p>

    <label for="theater">극장 목록</label>
    <select name="theaterID" id="theater" required>
      <option value="">-- 극장을 선택하세요 --</option>
      <c:forEach var="theater" items="${theaterList}">
        <option value="${theater.theaterId}">${theater.name}</option>
      </c:forEach>
    </select>

    <button type="submit">상영 시간 보기</button>
  </form>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script>
document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('theater')?.addEventListener('change', function() {
    console.log("선택된 극장:", this.value);
  });
});
</script>
</body>
</html>
