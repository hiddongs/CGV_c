<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>극장 선택</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hiddongs.css">

</head>
<body>
    <!--  <div class="center-box">-->
        <div class="inner-box fade-in">
            <h3>극장 선택</h3>
        <form action="regionSubmit.do" method="post">
         <input type="hidden" name="memberID" value="${mem_ID}" />
  <input type="hidden" name="movieID" value="${movieID}">
  <label>지역을 선택하세요</label>
  <select name="region" required>
    <option value="">-- 선택 --</option>
    <c:forEach var="region" items="${regionList}">
      <option value="${region}">${region}</option>
    </c:forEach>
  </select>
  <button type="submit">다음</button>
</form>
        
           
        </div>
   <!--  </div> -->
</body>

</html>