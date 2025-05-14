<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    let noticeList = JSON.parse("${noticeList}")

    $(function(){
        renderList(noticeList)
    })

    function renderList(list){
        const container = $('#tableBody')
        container.empty()

        if(!list || list.length === 0){
            container.append('<tr><td colspan="4">표시할 공지사항이 없습니다.</td></tr>')
            return
        }

        list.forEach(notice =>{
            const row = $('<tr>')

            const createCell = (value) =>{
                return $('<td>').text(value || '-')
            }

            row.append(createCell(notice.title))
            row.append(notice.reg_date)
            row.append(type)

            const actionCell = $('<td>')
                
            const updateBtn = $('<button>',{
                type:'button',
                class: 'btn btn-secondary',
                text: '수정',
                'data-notice-id' : notice.noticeId,
                click: updateNoticeForm
            })

            const deleteBtn = $('<button>',{
                type: 'button',
                class: 'btn btn-warning',
                text: '삭제',
                'data-notice-id' : notice.noticeId,
                click: deleteNotice
            })

            actionCell.append(updateBtn, ' ' , deleteBtn)
            row.append(actionCell)
            container.append(row)
        })
    }
    function deleteNotice(event){
         const noticeId = event.target.dataset.noticeId
         window.location.href='deleteNoticeForm.do?noticeId=' + encodeURIComponent(noticeId)
    }

    function updateNoticeForm(event){
        const noticeId = event.target.dataset.noticeId
        window.location.href = 'updateNoticeForm.do?noticeId='+ encodeURIComponent(noticeId)
    }

    function insertNotice(event){
        window.location.href = 'insertNoticeForm.do'
    }
</script>
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
    <div class="admin-container">
        <h1 class="admin-title">공지사항 관리</h1>
        <div class="button-group">
            <button type="button" class="btn btn-primary" onclick="insertNotice()">공지사항 작성</button>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>작성날짜</th>
                    <th>타입</th>
                    <th>행동</th>
                </tr>
            </thead>
            <tbody id="tableBody"></tbody>
        </table>
    </div>
</body>
</html>