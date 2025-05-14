<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상영관 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
 var auditoriumList = ${auditoriumList}

 $(function(){
    renderList()
 })

 function renderList(){
    const container = $('#tableBody')
    container.empty()

    if(!auditoriumList || auditoriumList.length === 0){
        container.append('<tr><td colspan = 3> 상영관 목록이 없습니다 </td></tr>')
        return
    }

    auditoriumList.forEach((auditorium, index)=> {
        const row = $('<tr>')

        const createCell = (value) => {
            return $('<td>').text(value || '-')
        }

        row.append(createCell(auditorium.name))
        row.append(createCell(auditorium.type))

        const actionCell = $('<td>')
        
            const updateBtn = $('<button>',{
                type: 'button',
                class: 'btn btn-secondary',
                text: '수정',
                'data-auditorium-id' : auditorium.auditoriumId,
                click: updateAuditoriumForm
            })

            const deleteBtn = $('<button>', {
                type: 'button',
                class: 'btn btn-warning',
                text: '삭제',
                'data-auditorium-id' : auditorium.auditoriumId,
                click: deleteAuditorium
            })

            actionCell.append(updateBtn, ' ', deleteBtn)
            row.append(actionCell)
            container.append(row)
    })
 }

 function updateAuditoriumForm(event){
    const auditoriumId = event.target.dataset.auditoriumId
    window.location.href = 'updateAuditoriumForm.do?auditoriumId=' + encodeURIComponent(auditoriumId)
 }

 function deleteAuditorium(event){
     const auditoriumId = event.target.dataset.auditoriumId
    if(confirm('해당 상영관을 삭제하시겠습니까')){
        window.location.href = 'deleteAuditorium.do?auditoriumId=' + encodeURIComponent(auditoriumId)
    }
 }

 function insertAuditorium(event){
    let theaterId = ${theaterId}
    window.location.href = 'insertAuditoriumForm.do?theaterId=' + encodeURIComponent(theaterId)
 }
</script>
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
    <div class="admin-container">
        <h1 class="admin-title">상영관 관리</h1>
        <div class="button-group">
            <button type="button" class="btn btn-primary" onclick="insertAuditorium()">상영관 추가</button>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>상영관 이름</th>
                    <th>상영관 타입</th>
                    <th>행동</th>
                </tr>
            </thead>
            <tbody id="tableBody"></tbody>
        </table>

    </div>
</body>
</html>