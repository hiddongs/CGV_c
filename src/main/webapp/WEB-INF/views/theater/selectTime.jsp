<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상영 시간 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hiddongs.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>

<form action="timeSubmit.do" method="post">

  <div class="center-box">
        <div class="inner-box">
       
  <div class="movie-title">
    
              <h4> 선택 영화 : ${selectedMovie.mv_title}</h4>
              <input type="hidden" name="movieID" value="${movieID}">
              <input type="hidden" name="theaterID" value="${theaterID}">
  </div>
  <div class="date-selector">
    (날짜 버튼들)
  </div>

  <div class="time-table">
    (해당 날짜에 상영하는 시간표 버튼들)
  </div>
  <div class="go-next">
    <input type="submit" value="전송" class="btn btn-primary">
  </div>
  </div>
</div>
  </form>



</body>
</html>