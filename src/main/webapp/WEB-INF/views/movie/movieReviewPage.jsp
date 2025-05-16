	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<!DOCTYPE html>
	<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <title>${movie.mv_title} - 리뷰</title>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	    <style>
	        .movie-detail {
	            max-width: 800px;
	            margin: 40px auto 20px;
	            padding: 20px;
	            background: #f8f8f8;
	            border-radius: 10px;
	            display: flex;
	            gap: 20px;
	            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
	        }
	        .movie-detail img {
	            width: 180px;
	            border-radius: 8px;
	        }
	        .movie-info {
	            flex: 1;
	        }
	        .review-container {
	            max-width: 800px;
	            margin: 20px auto;
	            padding: 0 20px;
	        }
	        .review-item {
	            padding: 15px 0;
	            border-bottom: 1px solid #ccc;
	            position: relative;
	        }
	        .review-rating {
	            font-weight: bold;
	            color: #FF9800;
	        }
	        .review-date {
	            font-size: 12px;
	            color: #888;
	            margin-top: 5px;
	        }
	        .review-content {
	            margin-top: 8px;
	            white-space: pre-line;
	        }
	        .btn-review {
	            display: block;
	            width: fit-content;
	            margin: 30px auto 0;
	            padding: 10px 20px;
	            background: #fb4357;
	            color: white;
	            text-decoration: none;
	            border-radius: 5px;
	            font-weight: bold;
	        }
	        .btn-review:hover {
	            background: #0056b3;
	        }
	        .btn-delete {
	            position: absolute;
	            top: 15px;
	            right: 0;
	            background: none;
	            color: #d9534f;
	            border: 1px solid #d9534f;
	            border-radius: 4px;
	            padding: 3px 8px;
	            font-size: 12px;
	            cursor: pointer;
	            text-decoration: none;
	        }
	        .btn-delete:hover {
	            background-color: #d9534f;
	            color: white;
	        }
	    </style>
	</head>
	<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<!-- 영화 정보 -->
	<div class="movie-detail">
	    <img src="${pageContext.request.contextPath}/upload/${movie.poster_url}" alt="${movie.mv_title} 포스터">
	    <div class="movie-info">
	        <h2>${movie.mv_title}</h2>
	        <p><strong>감독:</strong> ${movie.director}</p>
	        <p><strong>배우:</strong> ${movie.actor}</p>
	        <p><strong>장르:</strong> ${movie.genre}</p>
	        <p><strong>상영시간:</strong> ${movie.runtime}분</p>
	        <p><strong>개봉일:</strong> <fmt:formatDate value="${movie.release_date}" pattern="yyyy-MM-dd"/></p>
	        <p><strong>연령제한:</strong> ${movie.age_limit}</p>
	    </div>
	</div>
	
	<!-- 리뷰 영역 -->
	<div class="review-container">
	    <h3>리뷰 목록</h3>
	
	    <c:if test="${empty reviewList}">
	        <p>등록된 리뷰가 없습니다.</p>
	    </c:if>
	
	    <c:forEach var="review" items="${reviewList}">
	        <div class="review-item">
	            <div class="review-rating">⭐ ${review.rating}점</div>
	            <div class="review-member"><strong>작성자 : ${review.memberName}</strong></div>
	            <div class="review-content"><c:out value="${review.content}" /></div>
	            <div class="review-date">
	                <fmt:formatDate value="${review.regDate}" pattern="yyyy-MM-dd HH:mm"/>
	            </div>
	            <c:if test="${review.memberId == member.member_id}">
	                <a href="${pageContext.request.contextPath}/movie/reviewDelete.do?review_id=${review.reviewId}&movie_id=${movie.movie_id}"
	                   class="btn-delete"
	                   onclick="return confirm('리뷰를 삭제하시겠습니까?');">삭제</a>
	            </c:if>
	        </div>
	    </c:forEach>
	
	   <a class="btn-review" href="${pageContext.request.contextPath}/movie/reviewWriteForm.do?movie_id=${movie.movie_id}">
	    리뷰 작성
	</a>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	</body>
	</html>
