<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상영관 생성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var movieType = ${movieType}

    $(function(){
        makeOption(movieType)

        $('#backbutton').on('click', function(){
            window.history.back()
        })
    })

    function makeOption(movieType){
        
        const selectBox = $('#type')
        
        for(let key in movieType){
            if(movieType.hasOwnProperty(key) && key !== 'movieId'){
                var optionKey = key.startsWith('_') ? key.slice(1) : key;
                selectBox.append(
                    $('<option>', {
                        value: optionKey,
                        text: optionKey
                    })
                )
            }
        }
    }
</script>
</head>
<body>
    <jsp:include page="../../common/adminHeader.jsp" />
    <form action="insertAuditorium.do" class="form-container" method="post">
        <input type="hidden" id="theaterId" name="theaterId" value="${theaterId}">
        <h3 class="form-title">관리자 상영관수정 페이지</h3>
        <div class="form-group">    
            <label for="name" class="form-label">상영관 이름</label>
            <input type="text" class="form-input" id="name" name="name" >
        </div>
        <div class="form-group">
            <label for="type" class="form-label">상영관 타입</label>
            <select name="type" id="type">
                <option value="" disabled selected>상영관을 선택해주세요</option>
            </select>
        </div>
        <div class="button-group">
            <button type="submit" class="btn btn-primary">생성하기</button>
            <button type="button" id="backbutton" class="btn btn-secondary">뒤로가기</button>
        </div>
    </form>
</body>
</html>