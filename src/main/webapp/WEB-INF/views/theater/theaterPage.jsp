<%@ page contentType="text/html; charset=UTF-8" %>
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
       <!-- 기존 코드 상단은 동일 -->


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

    #modalBackdrop {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 999;
    }

    #theaterModal {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: #fff;
        width: 90%;
        max-width: 550px;
        padding: 30px 25px;
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        z-index: 1000;
        animation: fadeInModal 0.3s ease;
    }

    @keyframes fadeInModal {
        from {
            opacity: 0;
            transform: translate(-50%, -60%);
        }
        to {
            opacity: 1;
            transform: translate(-50%, -50%);
        }
    }

    #theaterModal h3 {
        font-size: 22px;
        margin-bottom: 10px;
        color: #111;
    }

    #theaterModal p {
        font-size: 15px;
        color: #444;
        margin: 8px 0;
    }

    #modalAuditoriums {
        padding-left: 20px;
        margin: 10px 0 20px;
        text-align: left;
    }

    #modalAuditoriums li {
        font-size: 15px;
        color: #222;
        margin: 4px 0;
    }

    #modalMap {
        width: 100%;
        height: 300px;
        margin-top: 20px;
        border-radius: 8px;
        overflow: hidden;
    }

    button {
        margin-top: 20px;
        padding: 10px 20px;
        background: #333;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
    }

    button:hover {
        background: #5c3ec2;
    }

        
        /* 모달 제목 */
#modalTitle {
    font-size: 22px;
    font-weight: bold;
    color: #2c2c2c;
    text-align: center;
    margin-bottom: 12px;
}

/* 설명 */
#modalDesc {
    font-size: 15px;
    color: #555;
    text-align: center;
    margin-bottom: 10px;
    line-height: 1.5;
}

/* 주소 라벨과 값 */
#modalAddr {
    display: block;
    font-size: 14px;
    font-weight: 500;
    color: #333;
    margin-bottom: 12px;
    text-align: center;
}

/* 보유 상영관 제목 */
#theaterModal p strong {
    display: block;
    margin: 10px 0 5px;
    text-align: center;
    font-size: 15px;
    color: #444;
}

/* 상영관 리스트 */
#modalAuditoriums {
    list-style: none;
    padding: 0;
    margin: 0 auto 20px;
    max-width: 90%;
}

#modalAuditoriums li {
    background: #f8f8f8;
    margin-bottom: 8px;
    padding: 10px 14px;
    border-left: 4px solid #5c3ec2;
    border-radius: 6px;
    font-size: 14px;
    color: #333;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    transition: background-color 0.2s ease;
}

#modalAuditoriums li:hover {
    background-color: #f0f0f0;
}

/* 지도 영역 */
#modalMap {
    width: 100%;
    height: 300px;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

/* 닫기 버튼 */
#theaterModal button {
    display: block;
    margin: 20px auto 0;
    padding: 10px 22px;
    background-color: #5c3ec2;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#theaterModal button:hover {
    background-color: #462fa1;
}
        
    </style>
</head>
<body>
<div class="theater-container">
    <h2 class="theater-title">전체 극장</h2>
    <div class="theater-tab-container">
        <c:forEach var="region" items="${fn:split('서울,경기,인천,대전/충청/세종,부산/대구/경상,광주/전라,강원,제주', ',')}">
            <div class="theater-tab" id="tab-${region}" onclick="showRegion('${region}')">
                ${region}
            </div>
        </c:forEach>
    </div>
    <c:forEach var="region" items="${fn:split('서울,경기,인천,대전/충청/세종,부산/대구/경상,광주/전라,강원,제주', ',')}">
        <div class="theater-list-section" id="list-${region}">
            <div class="theater-columns">
                <c:forEach var="theater" items="${theaterList}">
                    <c:if test="${theater.region == region}">
                        <div>
                            <a href="javascript:void(0);" onclick="openTheaterModal(${theater.theaterId})">
                                ${theater.name}
                            </a>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </c:forEach>
</div>

<!-- 모달창 -->
<div id="theaterModal">
    <h3 id="modalTitle"></h3>
    <p id="modalDesc"></p>
    <p><strong>주소:</strong> <span id="modalAddr"></span></p>
    <p><strong>보유 상영관:</strong></p>
    <ul id="modalAuditoriums" style="margin-top:0;"></ul>
    <div id="modalMap"></div>
    <button onclick="closeModal()">닫기</button>
</div>
<div id="modalBackdrop" onclick="closeModal()"></div>

<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2tfw61v35v&submodules=geocoder"></script>
<script>
    function showRegion(region) {
        const tabs = document.querySelectorAll('.theater-tab');
        const lists = document.querySelectorAll('.theater-list-section');
        tabs.forEach(tab => tab.classList.remove('active'));
        lists.forEach(list => list.classList.remove('active'));
        document.getElementById('tab-' + region).classList.add('active');
        document.getElementById('list-' + region).classList.add('active');
    }

    let map, marker;
    function openTheaterModal(theaterId) {
        if (typeof naver === 'undefined' || !naver.maps || !naver.maps.Service || typeof naver.maps.Service.geocode !== 'function') {
            alert('네이버 지도 API가 아직 완전히 로드되지 않았습니다.');
            return;
        }

        Promise.all([
            fetch("${pageContext.request.contextPath}/getTheaterDetail.do?theaterId=" + theaterId).then(res => res.json()),
            fetch("${pageContext.request.contextPath}/data/theaters.json").then(res => res.json())
        ]).then(([dbData, jsonData]) => {
            const theater = dbData.theater;
            const auditoriumList = dbData.auditoriums;
            const jsonMatch = jsonData.find(t => t.THEATER_ID === theaterId);
            const address = jsonMatch ? jsonMatch.ADDRESS : "주소 정보 없음";

            document.getElementById("modalTitle").innerText = theater.name;
            document.getElementById("modalDesc").innerText = theater.description;
            document.getElementById("modalAddr").innerText = address;

            const ul = document.getElementById("modalAuditoriums");
            ul.innerHTML = "";

            if (auditoriumList && auditoriumList.length > 0) {
                auditoriumList.forEach((a) => {
                    const li = document.createElement("li");
                    li.innerText = (a.name || "이름 없음") + " (" + (a.type || "형식 없음") + ")";
                    ul.appendChild(li);
                });
            } else {
                const li = document.createElement("li");
                li.innerText = "등록된 상영관이 없습니다.";
                ul.appendChild(li);
            }


            if (address !== "주소 정보 없음") {
                naver.maps.Service.geocode({ query: address }, function (status, response) {
                    if (status !== naver.maps.Service.Status.OK) return;
                    const result = response.v2.addresses[0];
                    const latlng = new naver.maps.LatLng(result.y, result.x);

                    if (!map) {
                        map = new naver.maps.Map("modalMap", { center: latlng, zoom: 15 });
                    } else {
                        map.setCenter(latlng);
                    }

                    if (marker) marker.setMap(null);
                    marker = new naver.maps.Marker({ position: latlng, map: map, title: theater.name });
                });
            }

            document.getElementById("theaterModal").style.display = "block";
            document.getElementById("modalBackdrop").style.display = "block";
        });
    }

    function closeModal() {
        document.getElementById("theaterModal").style.display = "none";
        document.getElementById("modalBackdrop").style.display = "none";
    }

    window.onload = function () {
        showRegion('서울');
    }
</script>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
