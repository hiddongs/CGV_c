<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .form-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background: #f8f8f8;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            font-family: 'Noto Sans KR', sans-serif;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
        }

        .rating input {
            display: none;
        }

        .rating label {
            font-size: 30px;
            color: #ccc;
            cursor: pointer;
            transition: color 0.2s;
        }

        .rating input:checked ~ label,
        .rating label:hover,
        .rating label:hover ~ label {
            color: #FFD700;
        }

        .form-group textarea {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            min-height: 120px;
            resize: vertical;
        }

        .btn-submit {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<c:choose>
    <c:when test="${member.member_id != 1}">
        <jsp:include page="../common/header.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="../common/adminHeader.jsp" />
    </c:otherwise>
</c:choose>

<div class="form-container">
    <h2>리뷰 작성</h2>
    <form action="${pageContext.request.contextPath}/movie/reviewWrite.do" method="post">
        <input type="hidden" name="movie_id" value="${movie.movie_id}" />
        <input type="hidden" name="member_id" value="${member.member_id}" />

        <div class="form-group">
            <label>별점</label>
            <div class="rating">
                <input type="radio" id="star5" name="rating" value="5"><label for="star5">★</label>
                <input type="radio" id="star4" name="rating" value="4"><label for="star4">★</label>
                <input type="radio" id="star3" name="rating" value="3"><label for="star3">★</label>
                <input type="radio" id="star2" name="rating" value="2"><label for="star2">★</label>
                <input type="radio" id="star1" name="rating" value="1"><label for="star1">★</label>
            </div>
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea name="content" id="content" required></textarea>
        </div>

        <button type="submit" class="btn-submit">리뷰 등록</button>
    </form>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
