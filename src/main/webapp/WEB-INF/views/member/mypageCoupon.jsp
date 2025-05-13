<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할인쿠폰 내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" >
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="coupon-header">
            <h1>CGV 할인쿠폰 내역</h1>
        </div>
        
        <div class="coupon-info">
            CGV 할인쿠폰 수령(등록) 내역
        </div>
        
        <div class="tabs">
            <div class="tab active">영화 할인쿠폰</div>
            <div class="tab">CJ ONE 쿠폰</div>
        </div>
        
        <div class="search-bar">
            <select>
                <option>최근기간</option>
                <option>1개월</option>
                <option>3개월</option>
                <option>6개월</option>
            </select>
            <button>GO</button>
        </div>
        
        <table class="coupon-table">
            <thead>
                <tr>
                    <th>쿠폰정보</th>
                    <th>사용기간</th>
                    <th>사용가능경로</th>
                    <th>쿠폰정보</th>
                </tr>
            </thead>
            <tbody>
                <tr class="coupon-row">
                    <td class="coupon-name">&lt;애티튜드&gt; 실버8 5천원 관람권</td>
                    <td class="date-range">2025-05-09~2025-05-11</td>
                    
                    <td>
                    <div class="buttons">
                        <button class="red-button">홈페이지</button>
                        <button class="yellow-button">APP</button>
                     </div>
                     </td>

                    
                    <td class="detail-text">
                        폰 사이즈 사양 감안 수영 바깥...
                        <button class="detail-button">자세히</button>
                    </td>
                </tr>
                <tr class="coupon-row">
                    <td class="coupon-name">&lt;애티튜드&gt; 실버8 5천원 관람권</td>
                    <td class="date-range">2025-05-09~2025-05-11</td>
                    <td>               
                    <div class= buttons>
                        <button class="red-button">홈페이지</button>
                        <button class="yellow-button">APP</button>          
                   </div>
                  </td>
                    
                    <td class="detail-text">
                        폰 사이즈 사양 감안 수영 바깥...
                        <button class="detail-button">자세히</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>