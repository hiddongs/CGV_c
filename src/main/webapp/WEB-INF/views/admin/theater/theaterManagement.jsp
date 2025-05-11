<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
let theaterList = [];

$(function(){
    renderList()
})

function renderList(){
    $.ajax({
        type:'POST',
        url: 'theaterList.do',
        dataType:'JSON',
        success: function(response){
        	theaterList = response
            displayTheaterList(response)
        },
        error: function(xhr,status, error){
            console.error('에러 발생:', error)
            alert('극장목록을 불러오던중 오류가 발생했습니다.')
        }
    })
}

function displayTheaterList(theaterList){

	console.log(theaterList)
	
    const container = document.querySelector('#tableBody')
    container.innerHTML = ''

    if(!theaterList || theaterList.length === 0){
        container.innerHTML = '<tr><td colspan="3"> 극장 목록이 없습니다</td></tr>'
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

        actionCell.appendChild(updateBtn)
        actionCell.appendChild(document.createTextNode(' '))
        actionCell.appendChild(deleteBtn)

        row.appendChild(actionCell)
        container.appendChild(row)
    })
}

function updateTheaterForm(event){

}

</script>
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
    <div class="container">
        <div class="button-group">
            
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