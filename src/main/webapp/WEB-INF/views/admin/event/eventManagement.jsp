<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 이벤트 관리 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	var eventList = []
	var today = new Date().toISOString().split('T')[0]

	$(function(){
		$.ajax({
			type:'POST',
			url:'eventList.do',
			dataType:'JSON',
			success:function(response){
				eventList = response
				renderList('all')
			},
			error:function(){
				alert('에러가 발생했습니다')
			}
		})
	})
	

	function renderList(order){
		const container = document.querySelector('#event-grid')
		container.innerHTML = ''

		let filtered = []
		
		if(order === 'all'){
			filtered = [...eventList]
		}else if(order === 'showing'){
			filtered = eventList.filter(e => e.start_date <= today && e.end_date >= today)
		}else if(order === 'release'){
			filtered = eventList.filter(e => e.start_date > today)
		}

		if(filtered.length == 0){
			container.innerHTML = '<h3>표시할 이벤트가 없습니다</h3>'
		}else{
			filtered.forEach( event => {
					const cell = createCell(event)
					container.appendChild(cell)
					})
			}
	}
	
	const createCell = (value) => {

		console.log("value.event_id :" + value.event_id)
		console.log("value.start_date :" + value.start_date)
		console.log("value.end_date :" + value.end_date)
		console.log("value.poster_url :" +value.poster_url)

		

		const row = document.createElement('div');
		row.className = 'admin-event-item';

		const a = document.createElement('a');
		a.href = 'eventDetail.do?event_id=' + value.event_id;

		const div1 = document.createElement('div');
		div1.className = 'event-image-container';

		const img = document.createElement('img');
		img.className = 'event-image';
		img.alt = '이벤트 사진';
		console.log('url:', value.poster_url); 
		img.src = `${pageContext.request.contextPath}/upload/${"${value.poster_url}"}`;

		div1.appendChild(img);

		const div2 = document.createElement('div');
		div2.className = 'event-info';

		const event_title = document.createElement('h3');
		event_title.className = 'event-title';
		event_title.innerText = value.title;

		const event_period = document.createElement('p');
		event_period.className = 'event-period';

		const icon = document.createElement('i');
		icon.className = 'fas fa-calendar-day';

		event_period.appendChild(icon);
		event_period.insertAdjacentText('beforeend', ` ${"${value.start_date}"} ~ ${"${value.end_date}"}`);

		div2.appendChild(event_title);
		div2.appendChild(event_period);

		a.appendChild(div1);
		a.appendChild(div2);
		row.appendChild(a);

		return row;
	}
</script>
</head>
<body>
 <%@ include file="../../common/adminHeader.jsp" %>
<div class="admin-container">
	<h1 class="admin-title"><i class="fas fa-calendar-alt"></i> 이벤트 관리</h1>
	<div class="admin-button-group">
            <button class="btn btn-primary" onclick="renderList('showing')"><i class="fas fa-play-circle"></i> 진행중인 이벤트</button>
            <button class="btn btn-secondary" onclick="renderList('release')"><i class="fas fa-clock"></i> 진행예정 이벤트</button>
            <button class="btn btn-primary" onclick="renderList('all')"><i class="fas fa-list"></i> 전체 이벤트</button>
    </div>
	
	<div class="admin-card">
		<div class="event-grid" id="event-grid">
		
		</div>
	</div>
	<div class="admin-button-group">
		<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/insertEventForm.do'"><i class="fas fa-plus-circle"></i> 이벤트 등록</button>
		<button class="btn btn-secondary" onclick="location.href='main.do'"><i class="fas fa-arrow-left"></i> 관리자 메인으로</button>
	</div>
</div>
</body>
</html>