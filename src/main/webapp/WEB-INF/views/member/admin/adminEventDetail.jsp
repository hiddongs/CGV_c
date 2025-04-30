<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드민 이벤트 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('eventUpdate').addEventListener('click', function() {
            const form = document.getElementById('eventManagement');
            form.action = 'eventUpdate.do';
            form.submit();
        });
        document.getElementById('eventDelete').addEventListener('click', function() {
            const form = document.getElementById('eventManagement');
            form.action = 'eventDelete.do';
            form.submit();
        });
        const fileInput = document.getElementById('poster_url');
        // 클릭 시 값을 초기화해서 같은 파일도 변경 감지
        fileInput.addEventListener('click', function(e) { e.target.value = ''; });
        fileInput.addEventListener('change', previewImage);

        $('#myForm').on('submit', function(event){
            let isValid = true
            
            $(this).find('input').each(function(){
                
                if($(this).attr('id') === 'poster_url') return true
                
                if($.trim($(this).val === '')){
                    alert('모든 항목을 입력해주세요')
                    $(this).focus()
                    isValid = false
                    event.preventDefault()
                    return false
                }
            })
            if(!isValid) return false
        })
    });

    function previewImage(event) {
        const file = event.target.files[0];
        if (!file) return;
        if (!file.type.startsWith('image/')) {
            alert('이미지 파일만 업로드 가능합니다.');
            return;
        }
        const reader = new FileReader();
        reader.onload = function() {
            document.getElementById('preview').src = reader.result;
        };
        reader.readAsDataURL(file);
    }
</script>
</head>
<body>
    <%@ include file="../../common/adminHeader.jsp" %>
    <form name="myForm" action="" method="post" class="form-container" id="eventManagement" enctype="multipart/form-data">
        <input type="hidden" id="event_id" name="event_id" value="${event.event_id}">
        <div class="form-group">
            <label for="title" class="form-label">제목</label>
            <input type="text" name="title" id="title" value="${event.title}" class="form-input">
        </div>
        <div class="form-group">
            <label for="content" class="form-label">내용</label>
           <textarea rows="10" cols="70" id="content" name="content" class="form-input" >${event.content}</textarea>
        </div>
        <div class="form-group">
            <label for="start_date" class="form-label">이벤트 시작일</label>
            <input type="date" name="start_date" id="start_date" value="${event.start_date}" class="form-input">
        </div>
        <div class="form-group">
            <label for="end_date" class="form-label">이벤트 종료일</label>
            <input type="date" name="end_date" id="end_date" value="${event.end_date}" class="form-input">
        </div>
        <div class="form-group">
            <label for="type" class="form-label">이벤트타입</label>
            <input type="text" name="type" id="type" value="${event.type}" class="form-input">
        </div>
        <div class="form-group">
            <label for="poster_url" class="form-label">이벤트 사진</label>
            <input type="file" class="form-input" id="poster_url" name="poster_url" accept="image/*" value="">
            <input type="hidden" name="oldPosterUrl" id="oldPosterUrl" value="${event.poster_url}"> <br>
            <img src="${pageContext.request.contextPath}/upload/${event.poster_url}?v=${event.event_id}&t=<%=System.currentTimeMillis()%>" alt="미리보기" id="preview"  class="movie-poster" 
            style="max-width: 200px; margin-top: 10px;">
        </div>
        <div class="button-group">
            <button type="button" id="eventUpdate" class="btn btn-secondary">이벤트수정</button>
            <button type="button" id="eventDelete" class="btn btn-primary"> 이벤트삭제</button>
            <button type="button" id="backbutton" onclick="location.href='adminEventManagement.do'" class="btn btn-warning">이벤트관리로</button>
        </div>
    </form>
</body>
</html>