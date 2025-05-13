<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
let theaterList = [];
// regionList는 서버에서 받아옴
const regionList = ${regionList};

$(function(){
    renderList()
    
    // 이벤트 등록
    $('#searchInput').on('input', filterTheaterList)
    $('#regionSelect').on('change', filterTheaterList)
})

function renderList(){
    $.ajax({
        type: 'POST',
        url: 'theaterGetList.do',
        dataType: 'JSON',
        success: function(response){
        	theaterList = response
        	console.log(response)
            displayTheaterList(response)
            displaySearchRegionList()
        },
        error: function(xhr,status, error){
            console.error('에러 발생:', error)
            alert('극장목록을 불러오던중 오류가 발생했습니다.')
        }
    })
}

function displaySearchRegionList() {
    const regionSearchBox = $('#regionSelect');  // jQuery로 선택
    regionList.forEach(function(item) {
        // 새로운 option 요소 생성
        var newOption = $('<option>', {
            value: item.region,  // 지역명
            text: item.region    // 지역명
        });
        regionSearchBox.append(newOption);  // select에 추가
    });
}


function displayTheaterList(theaterList){
    console.log(theaterList)

    const container = document.querySelector('#tableBody')
    container.innerHTML = ''

    if(!theaterList || theaterList.length === 0){
        container.innerHTML = '<tr><td colspan="4"> 극장 목록이 없습니다</td></tr>'
        return
    }

    theaterList.forEach((theater, index) => {
        const row = document.createElement('tr')

        const createCell = (value) => {
            const cell = document.createElement('td')
            cell.textContent = value || '-'
            return cell
        }

        row.appendChild(createCell(theater.name))
        row.appendChild(createCell(theater.region))
        row.appendChild(createCell(theater.description))

        const actionCell = document.createElement('td')
        const updateBtn = document.createElement('button')
        updateBtn.type = 'button'
        updateBtn.className = 'btn btn-secondary'
        updateBtn.textContent = '수정'
        updateBtn.dataset.theaterId = theater.theaterId
        updateBtn.onclick = updateTheaterForm

        const deleteBtn = document.createElement('button')
        deleteBtn.type = 'button'
        deleteBtn.className = 'btn btn-warning'
        deleteBtn.textContent = '삭제'
        deleteBtn.dataset.theaterId = theater.theaterId
        deleteBtn.onclick = deleteTheaterForm

        const scheduleBtn = document.createElement('button')
        scheduleBtn.type = 'button'
        scheduleBtn.className = 'btn btn-warning'
        scheduleBtn.textContent = '스케쥴관리'
        scheduleBtn.dataset.theaterId = theater.theaterId
        scheduleBtn.onclick = scheduleManagement

        actionCell.appendChild(updateBtn)
        actionCell.appendChild(document.createTextNode(' '))
        actionCell.appendChild(deleteBtn)
        actionCell.appendChild(document.createTextNode(' '))
        actionCell.appendChild(scheduleBtn)

        row.appendChild(actionCell)
        container.appendChild(row)
    })
}

function updateTheaterForm(event){
    const theaterId = event.target.dataset.theaterId;
    window.location.href='updateTheaterForm.do?theaterId=' + theaterId;
}

function deleteTheaterForm(event){
    const theaterId = event.target.dataset.theaterId;
    if(confirm('정말로 이 극장을 삭제하시겠습니까?')) {
        window.location.href='deleteTheaterForm.do?theaterId=' + theaterId;
    }
}

function scheduleManagement(event){
    const theaterId = event.target.dataset.theaterId
    window.location.href = 'scheduleManagement.do?theaterId=' + theaterId;
}

function registerTheaterForm() {
    window.location.href='registerTheaterForm.do';
}

// 필터링 함수
function filterTheaterList() {
    const keyword = $('#searchInput').val().toLowerCase()
    const selectedRegion = $('#regionSelect').val()

    const filteredList = theaterList.filter(theater => {
        const matchName = theater.name.toLowerCase().includes(keyword)
        const matchRegion = selectedRegion === '' || theater.region === selectedRegion
        return matchName && matchRegion
    })

    displayTheaterList(filteredList)
}
</script>
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
    <div class="admin-container">
        <h1 class="admin-title">극장 관리</h1>

        <!-- 필터링 -->
        <div class="filter-group">
            <input type="text" id="searchInput" placeholder="극장 이름 검색..." class="form-control" />
            <select id="regionSelect" class="form-control">
                <option value="">전체 지역</option>
            </select>
        </div>

        <div class="button-group">
            <button type="button" class="btn btn-primary" onclick="registerTheaterForm()">극장 등록</button>
        </div>

        <table class="table">
            <thead>
                <tr>
                    <th>이름</th>
                    <th>지역</th>
                    <th>설명</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody id="tableBody"></tbody>
        </table>
    </div>
</body>
</html>
