<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상영 스케줄 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .form-container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    .form-input, select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }
    .form-actions {
        margin-top: 20px;
        text-align: center;
    }
    .btn {
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        margin: 0 5px;
    }
    .btn-primary {
        background-color: #007bff;
        color: white;
    }
    .btn-secondary {
        background-color: #6c757d;
        color: white;
    }
</style>
<script>
    // JSP에서 전달된 극장 ID
    var preSelectedTheaterId = "${theaterId}";

    $(function(){
        // 극장 목록 가져오기
        $.ajax({
            url: 'theaterGetList.do',
            type: 'GET',
            dataType: 'json',
            success: function(theaters) {
                const theaterSelect = $('#theaterId');
                theaterSelect.empty();
                theaterSelect.append('<option value="" selected disabled>극장을 선택해주세요</option>');

                theaters.forEach(function(theater) {
                    theaterSelect.append(
                        '<option value="' + theater.theaterId + '">' + theater.name + ' (' + theater.region + ')</option>'
                    );
                });

                if (preSelectedTheaterId && preSelectedTheaterId !== "") {
                    theaterSelect.val(preSelectedTheaterId);
                    loadAuditoriums(preSelectedTheaterId);
                }
            },
            error: function() {
                alert('극장 목록을 불러오는 중 오류가 발생했습니다.');
            }
        });
        
        // 날짜 변경시 비어있는 시간 반환
       $('#screeningDate').change(function () {
    const theaterId = $('#theaterId').val();
    const auditoriumId = $('#auditoriumId').val();
    const screeningDate = $('#screeningDate').val();

    if (theaterId && auditoriumId && screeningDate) {
        $.ajax({
            url: 'getAvailableTimezone.do',
            type: 'POST',
            data: {
                theaterId: theaterId,
                auditoriumId: auditoriumId,
                screeningDate: screeningDate
            },
            dataType: 'json',
            success: function (response) {
                const slotSelect = $('#slotId');
                slotSelect.empty();
                slotSelect.append('<option value="" selected disabled>시간대를 선택해주세요</option>');

                if (response.length === 0) {
                    slotSelect.append('<option disabled>사용 가능한 시간대가 없습니다</option>');
                    return;
                }

                response.forEach(function (slot) {
                    const optionText = slot.startTime + ' ~ ' + slot.endTime;
                    slotSelect.append('<option value="' + slot.slotId + '">' + optionText + '</option>');
                });
            },
            error: function () {
                alert('시간대 조회 중 오류가 발생했습니다.');
            }
        });
    }
});

        // 극장 변경 시 상영관 목록 가져오기
        $('#theaterId').change(function() {
            const theaterId = $(this).val();
            if (theaterId) {
                loadAuditoriums(theaterId);
            }
        });

        // 영화 목록 가져오기
        $.ajax({
            url: 'movieList.do',
            type: 'GET',
            dataType: 'json',
            success: function(movies) {
                const movieSelect = $('#movieId');
                movieSelect.empty();
                movieSelect.append('<option value="" selected disabled>영화를 선택해주세요</option>');

                movies.forEach(function(movie) {
                    movieSelect.append(
                        '<option value="' + movie.movie_id + '">' + movie.mv_title + ' (' + movie.runtime + '분)</option>'
                    );
                });
            },
            error: function() {
                alert('영화 목록을 불러오는 중 오류가 발생했습니다.');
            }
        });

        
      

        // 폼 유효성 검사
        $("#scheduleForm").submit(function(event){
            if (!$("#theaterId").val()) {
                alert("극장을 선택해주세요.");
                $("#theaterId").focus();
                event.preventDefault();
                return;
            }
            if (!$("#auditoriumId").val()) {
                alert("상영관을 선택해주세요.");
                $("#auditoriumId").focus();
                event.preventDefault();
                return;
            }
            if (!$("#movieId").val()) {
                alert("영화를 선택해주세요.");
                $("#movieId").focus();
                event.preventDefault();
                return;
            }
            if (!$("#slotId").val()) {
                alert("시간대를 선택해주세요.");
                $("#slotId").focus();
                event.preventDefault();
                return;
            }
            if (!$("#screeningDate").val()) {
                alert("상영 날짜를 입력해주세요.");
                $("#screeningDate").focus();
                event.preventDefault();
                return;
            }

            if (!confirm("새 스케줄을 등록하시겠습니까?")) {
                event.preventDefault();
            }
        });
    });

    // 상영관 목록 가져오기
    function loadAuditoriums(theaterId) {
        $.ajax({
            url: 'auditoriumList.do',
            type: 'GET',
            data: { theaterId: theaterId },
            dataType: 'json',
            success: function(auditoriums) {
                const auditoriumSelect = $('#auditoriumId');
                auditoriumSelect.empty();
                auditoriumSelect.append('<option value="" selected disabled>상영관을 선택해주세요</option>');

                auditoriums.forEach(function(auditorium) {
                    auditoriumSelect.append(
                        '<option value="' + auditorium.auditoriumId + '">' + auditorium.name + ' (' + auditorium.type + ')</option>'
                    );
                });
            },
            error: function() {
                alert('상영관 목록을 불러오는 중 오류가 발생했습니다.');
            }
        });
    }
</script>
</head>
<body>
    <%@ include file="../../common/adminHeader.jsp" %>
    <div class="container">
        <h2>상영 스케줄 등록</h2>
        <p>새로운 상영 스케줄을 등록해주세요.</p>
        
        <form id="scheduleForm" action="registerSchedule.do" method="post" class="form-container">
            <div class="form-group">
                <label for="theaterId" class="form-label">극장</label>
                <select id="theaterId" name="theaterId" class="form-input" required></select>
            </div>
            
            <div class="form-group">
                <label for="auditoriumId" class="form-label">상영관</label>
                <select id="auditoriumId" name="auditoriumId" class="form-input" required>
                    <option value="" selected disabled>극장을 먼저 선택해주세요</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="movieId" class="form-label">영화</label>
                <select id="movieId" name="movieId" class="form-input" required></select>
            </div>

            <div class="form-group">
                <label for="screeningDate" class="form-label">상영 날짜</label>
                <input type="date" id="screeningDate" name="screeningDate" class="form-input" required>
            </div>
            
            <div class="form-group">
                <label for="slotId" class="form-label">상영 시간대</label>
                <select id="slotId" name="slotId" class="form-input" required></select>
            </div>
            
            
            <div class="form-group">
                <label class="form-label">상영 가능 여부</label>
                <div>
                    <label>
                        <input type="radio" name="isAvailable" value="true" checked> 예
                    </label>
                    <label style="margin-left: 20px;">
                        <input type="radio" name="isAvailable" value="false"> 아니오
                    </label>
                </div>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">등록</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='scheduleManagement.do'">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
