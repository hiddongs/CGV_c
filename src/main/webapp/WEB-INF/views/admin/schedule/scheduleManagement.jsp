<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상영 스케쥴 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    let detailScheduleList = ${scheduleList}
    $(function(){
        displaySchedule(detailScheduleList)
    })
    
    function displaySchedule(list){
        const body = $('#tableBody')
        body.empty()

        if(!list || list.length  === 0){
            body.innerHTML = '<tr><td colspan = 7>표시할 스케쥴이 없습니다</td></tr>'
            return
        }
        
        list.forEach(schedule => {
            const row = document.createElement('tr')

            const createCell = (value) => {
                const cell = document.createElement('td')
                cell.textContent = value || '-'
                return cell
            }

            row.appendChild(createCell(schedule.theaterName))
            row.appendChild(createCell(schedule.auditoriumName))
            row.appendChild(createCell(schedule.screeningDate))
            row.appendChild(createCell(schedule.movieTitle))
            row.appendChild(createCell(schedule.startTime))
            row.appendChild(createCell(schedule.runtime))
            row.appendChild(createCell(schedule.isAvailable))

            const actionCell = document.createElement('td')
            const updateBtn = document.createElement('button')
            updateBtn.type = 'button'
            updateBtn.className = 'btn btn-secondary'
            updateBtn.textContent = '수정'
            updateBtn.dataset.scheduleId = schedule.scheduleId
            updateBtn.onclick = updateScheduleForm
            updateBtn.style.marginRight = '5px'

            const deleteBtn = document.createElement('button');
            deleteBtn.type = 'button';
            deleteBtn.className = 'btn btn-danger';
            deleteBtn.textContent = '삭제';
            deleteBtn.dataset.scheduleId = schedule.scheduleId
            deleteBtn.onclick = deleteScheduleForm;

            actionCell.appendChild(updateBtn)
            actionCell.appendChild(document.createTextNode(' '))
            actionCell.appendChild(deleteBtn)

            row.appendChild(actionCell)
            body.append(row)
        })
    }

    function updateScheduleForm(event){
        const scheduleId = event.target.dataset.scheduleId
        if(confirm('선택한 스케줄을 수정하시겠습니까?')) {
            // 수정 페이지로 이동
            window.location.href = 'updateScheduleForm.do?scheduleId=' + encodeURIComponent(scheduleId)
        }
    }

    function deleteScheduleForm(event){
        const scheduleId = event.target.dataset.scheduleId
        if(confirm('정말 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.')) {
            // 삭제 처리 후 현재 페이지 새로고침
            $.ajax({
                url: 'deleteSchedule.do',
                type: 'POST',
                data: { scheduleId: scheduleId },
                success: function(response) {
                    alert('스케줄이 성공적으로 삭제되었습니다.');
                    location.reload(); // 페이지 새로고침
                },
                error: function(xhr, status, error) {
                    alert('스케줄 삭제 중 오류가 발생했습니다: ' + error);
                }
            });
        }
    }
    
    function registerScheduleForm(event){
		window.location.href = 'registerScheduleForm.do'
    }
    </script>
</head>
<body>
    <%@ include file="../../common/adminHeader.jsp" %>
<div class="container">
    <div class="admin-controls">
        <h2>상영 스케줄 관리</h2>
        <p>극장별 상영 스케줄을 관리할 수 있습니다. 수정 및 삭제 작업은 신중하게 진행해주세요.</p>
        <button type="button" class="btn btn-primary" onclick="registerScheduleForm()">새 스케줄 등록</button>
    </div>
    <table class="table">
        <thead>
            <tr>
                <th>극장이름</th>
                <th>상영관이름</th>
                <th>상영날짜</th>
                <th>상영영화</th>
                <th>영화시작시간</th>
                <th>영화소요시간</th>
                <th>유효여부</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody id="tableBody">

        </tbody>
    </table>
</div>
</body>
</html>