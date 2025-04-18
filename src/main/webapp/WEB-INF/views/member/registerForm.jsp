<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV - 회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <main>
        <div class="container">
            <div class="form-container">
                <h2 class="section_title">회원가입</h2>
        <form action="register.do" method="post" id="register_form">
            <div class="form-group">
                <label for="mem_id" class="form-label">아이디</label>
                <input type="text" name="mem_id" id="mem_id" class="form-input" required>
                <span id="id_message"></span>
            </div>
            <div class="form-group">
                <label for="mem_pw" class="form-label">비밀번호</label>
                <input type="password" name="mem_pw" id="mem_pw" class="form-input" required>
            </div>
            <div class="form-group">
                <label for="mem_pw_confirm" class="form-label">비밀번호 확인</label>
                <input type="password" name="mem_pw_confirm" id="mem_pw_confirm" class="form-input" required>
                <span id="pw_message"></span>
            </div>
            <div class="form-group">
                <label for="mem_name" class="form-label">이름</label>
                <input type="text" name="mem_name" id="mem_name" class="form-input" required>
            </div>
            <div class="form-group">
                <label for="mem_phone" class="form-label">전화번호</label>
                <input type="tel" name="mem_phone" id="mem_phone" class="form-input" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000" required>
            </div>
            <div class="form-group">
                <label for="mem_email" class="form-label">이메일</label>
                <input type="email" name="mem_email" id="mem_email" class="form-input" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">가입하기</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">취소</button>
            </div>
        </form>
                </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script>
$(document).ready(function(){
    let idChecked = false;
    
    // 아이디 중복 체크
    $('#mem_id').keyup(function(){
        $.ajax({
            url:'checkDuplicateId.do',
            type:'post',
            data:{mem_id:$('#mem_id').val()},
            dataType:'json',
            success:function(param){
                if(param.result == 'idNotFound'){
                    idChecked = true;
                    $('#id_message').css('color','#000').text('사용 가능한 아이디입니다.');
                }else if(param.result == 'idDuplicated'){
                    idChecked = false;
                    $('#id_message').css('color','red').text('중복된 아이디입니다.');
                }else{
                    idChecked = false;
                    $('#id_message').text('');
                }
            },
            error:function(){
                idChecked = false;
                alert('네트워크 오류 발생');
            }
        });
    });
    
    // 비밀번호 일치 여부 체크
    $('#mem_pw_confirm').keyup(function(){
        if($('#mem_pw').val() == $('#mem_pw_confirm').val()){
            $('#pw_message').css('color','#000').text('비밀번호가 일치합니다.');
        }else{
            $('#pw_message').css('color','red').text('비밀번호가 불일치합니다.');
        }
    });
    
    // 폼 전송 전 유효성 체크
    $('#register_form').submit(function(){
        if(!idChecked){
            alert('아이디 중복 체크를 해주세요');
            $('#mem_id').focus();
            return false;
        }
        if($('#mem_pw').val() != $('#mem_pw_confirm').val()){
            alert('비밀번호가 불일치합니다.');
            $('#mem_pw_confirm').focus();
            return false;
        }
    });
});
</script>
</body>
</html>
