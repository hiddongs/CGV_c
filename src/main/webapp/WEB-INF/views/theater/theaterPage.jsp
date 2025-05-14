<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>전체 극장</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #fff;
            color: #222;
        }

        .theater-container {
            width: 900px;
            margin: 40px auto;
            border: 2px solid #aaa;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 20px;
        }

        .theater-tab-container {
            display: flex;
            justify-content: space-between;
            border-bottom: 2px solid #ccc;
            margin-bottom: 20px;
        }

        .theater-tab {
            flex: 1;
            text-align: center;
            padding: 14px 0;
            font-size: 16px;
            cursor: pointer;
            border-right: 1px solid #ccc;
            background-color: #f2f2f2;
        }

        .theater-tab:last-child {
            border-right: none;
        }

        .theater-tab.active {
            background-color: #333;
            color: white;
            font-weight: bold;
        }

        .theater-list-section {
            display: none;
        }

        .theater-list-section.active {
            display: block;
        }

        .theater-columns {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            gap: 20px;
            padding: 20px;
        }

        .theater-columns div {
            width: 180px;
        }

        .theater-columns a {
            display: block;
            color: #333;
            margin: 6px 0;
            text-decoration: none;
            font-size: 15px;
        }

        .theater-columns a:hover {
            color: #5c3ec2;
            text-decoration: underline;
        }

        .theater-title {
            text-align: center;
            font-size: 26px;
            margin-bottom: 30px;
        }
    </style>

    <script>
        function showRegion(region) {
            const tabs = document.querySelectorAll('.theater-tab');
            const lists = document.querySelectorAll('.theater-list-section');

            tabs.forEach(tab => tab.classList.remove('active'));
            lists.forEach(list => list.classList.remove('active'));

            document.getElementById('tab-' + region).classList.add('active');
            document.getElementById('list-' + region).classList.add('active');
        }

        window.onload = function () {
            showRegion('서울');
        }
    </script>
</head>
<body>

<div class="theater-container">
    <h2 class="theater-title">전체 극장</h2>

    <!-- 탭 영역 -->
    <div class="theater-tab-container">
        <c:forEach var="region" items="${fn:split('서울,경기,인천,대전/충청/세종,부산/대구/경상,광주/전라,강원,제주', ',')}">
            <div class="theater-tab" id="tab-${region}" onclick="showRegion('${region}')">
                ${region}
            </div>
        </c:forEach>
    </div>

    <!-- 극장 리스트 영역 -->
    <c:forEach var="region" items="${fn:split('서울,경기,인천,대전/충청/세종,부산/대구/경상,광주/전라,강원,제주', ',')}">
        <div class="theater-list-section" id="list-${region}">
            <div class="theater-columns">
                <c:forEach var="theater" items="${theaterList}">
                    <c:if test="${theater.region == region}">
                        <div>
                            <a href="theaterDetail.do?theaterId=${theater.theaterId}">
                                ${theater.name}
                            </a>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </c:forEach>
</div>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
