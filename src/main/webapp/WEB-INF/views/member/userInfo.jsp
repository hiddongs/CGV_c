<%@page import="kr.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css">
</head>
<body>
<div class ="profile-main">
	<div class ="profile-box">
 		<div class="profile-img">
 			<img src ="${pageContext.request.contextPath}/images/face.png" width="200" height="200" class="my-photo">
 		</div>
 		<div class="profile-info">
 			<h2>${member.mem_name}님<span class = "userid" style="font-size: 14px; color: #555;">(${member.mem_id})</span></h2>
 			<p>고객님은<span class ="grade">${member.grade}</span>입니다.</p>
 		</div>
 	</div>
</div>
</body>
</html>