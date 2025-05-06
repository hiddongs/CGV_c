<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>잘못된 요청</title>
  <style>
    body {
      font-family: '맑은 고딕', sans-serif;
      background-color: #f8f8f8;
      padding: 50px;
      text-align: center;
    }
    .box {
      background-color: white;
      border: 1px solid #ccc;
      padding: 30px;
      display: inline-block;
      box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    }
    h2 {
      color: #e74c3c;
    }
  </style>
</head>
<body>
  <div class="box">
    <h2>⚠ 잘못된 요청입니다</h2>
    <p>필수 입력값이 누락되었거나 올바르지 않습니다.</p>
    <p>이전 페이지로 돌아가 다시 시도해주세요.</p>
    <br/>
    <a href="javascript:history.back()">← 이전 페이지</a>
  </div>
</body>
</html>
