<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
   
</script>
</head>
<body>
    <jsp:include page="../../common/adminHeader.jsp" />
    <form action="insertNotice.do" class="form-container" method="post">
        <h3 class="form-title">관리자 공지사항 작성 페이지</h3>
        <div class="form-group">    
            <label for="name" class="form-label">제목</label>
            <input type="text" class="form-input" id="name" name="name" >
        </div>
        <div class="form-group">
            <label for="type" class="form-label">상영관 타입</label>
            <select name="type" id="type">
                <option value="" disabled selected>상영관을 선택해주세요</option>
            </select>
        </div>
        <div class="button-group">
            <button type="submit" class="btn btn-primary">생성하기</button>
            <button type="button" id="backbutton" class="btn btn-secondary">뒤로가기</button>
        </div>
    </form>
</body>
</html>