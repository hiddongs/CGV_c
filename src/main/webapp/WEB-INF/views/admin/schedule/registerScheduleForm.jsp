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
    var theaterId = "${theaterId}";
    var auditoriumId;
    var movieId;
    var screeningDate;
    

    $(function(){
        // 상영관 목록 가져오기 1번
        console.log("시작 1번")
        loadAuditoriums(theaterId)
        
        
        // 영화 목록 가져오기 2번
        $('#auditoriumId').change(function(){  
        	console.log("시작 2번")
            auditoriumId = $('#auditoriumId').val()
            
            $.ajax({
                url: 'getAvailableTypeMovieList.do',
                data: {auditoriumId : auditoriumId},
                type: 'POST',
                dataType: 'json',
                success: function(response) {
	
                    displayMovieList(response);
                },
                error: function() {
                    alert('영화 목록을 불러오는 중 오류가 발생했습니다.');
                }
            });
        })
        
        $('#movieId').change(function() {
            console.log('영화가 변경되었습니다.');// 맞는 날짜 가져오기 3번
            getAvailableScheduleDate();
        });
        
        $('#screeningDate').change(function(){
            console.log('상영날짜가 변경되었습니다');
            screeningDate = $('#screeningDate').val();
            console.log('선택된 날짜:', screeningDate);
            getAvailableSlot();
        });
        
        function getAvailableSlot(){
            console.log('getAvailableSlot 실행됨');
            console.log('파라미터 확인:', {
                auditoriumId: auditoriumId,
                movieId: movieId,
                screeningDate: screeningDate
            });

            $.ajax({
                url: 'getAvailableSlot.do',
                data: {
                    auditoriumId: auditoriumId,
                    movieId: movieId,
                    screeningDate: screeningDate
                },
                type: 'POST',
                dataType: 'JSON',
                success: function(response) {
                    console.log('사용 가능한 시간대:', response);
                    displayAvailableSlot(response);
                },
                error: function(xhr, status, error) {
                    console.error('시간대 조회 중 오류 발생:', {
                        status: status,
                        error: error,
                        response: xhr.responseText
                    });
                    alert('상영 시간대를 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        function displayAvailableSlot(slotList) {
            const slotSelect = $('#slotId');
            slotSelect.empty();
            slotSelect.append('<option value="" selected disabled>상영 시간대를 선택해주세요</option>');

            if (slotList && slotList.length > 0) {
                slotList.forEach(function(slot) {
                    slotSelect.append(
                        '<option value="' + slot.slotId + '">' + 
                        slot.startTime + ' ~ ' + slot.endTime + 
                        '</option>'
                    );
                });
            } else {
                slotSelect.append('<option value="" disabled>사용 가능한 시간대가 없습니다</option>');
            }
        }
        
        function getAvailableScheduleDate() { 
        	console.log('getAvailableScheduleDate 실행됨'); 
            movieId = $('#movieId').val()
            console.log('선택된 상영관 ID:', auditoriumId);
            console.log('선택된 영화 ID:', movieId);
            
            $.ajax({
                url: 'getAvailableScheduleDate.do',
                data: {auditoriumId : auditoriumId , movieId : movieId},
                type: 'POST',
                dataType: 'JSON',
                success: function(response){
					console.log('서버 응답:', response);
                    displayAvailableScreeningDate(response);
                },
                error: function(xhr, status, error){
                    console.error('에러 상세 정보:', {
                        status: status,
                        error: error,
                        response: xhr.responseText
                    });
                    alert('날짜 정보를 가져오는 중 오류가 발생했습니다.');
                }
            })
        }
        
        function displayMovieList(movieList){
            const movieSelect = $('#movieId')

            movieSelect.off('change')

            movieSelect.empty()
            movieSelect.append('<option value="" selected disabled>영화를 선택해주세요</option>')
            movieList.forEach(function(movie){
                movieSelect.append(
                    '<option value="' + movie.movie_id + '">' + movie.mv_title + ' (' + movie.runtime + '분)</option>'
                )
            })

            movieSelect.on('change', getAvailableScheduleDate)
        }
    
        
        // 폼 유효성 검사
        $("#scheduleForm").submit(function(event){

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

        function displayAvailableScreeningDate(scheduleList) {
            const dateSelect = $('#screeningDate');
            dateSelect.empty();
            dateSelect.append('<option value="" selected disabled>상영 날짜를 선택해주세요</option>');

            if (scheduleList && scheduleList.length > 0) {
                scheduleList.forEach(function (element) {
                    try {
                        const date = new Date(element.screeningDate);
                        if (!isNaN(date.getTime())) {  // 유효한 날짜인지 확인
                            const formattedDate = date.toISOString().split('T')[0];
                            dateSelect.append('<option value="' + formattedDate + '">' + formattedDate + '</option>');
                        }
                    } catch (e) {
                        console.error('날짜 변환 중 오류 발생:', e, element.screeningDate);
                    }
                });
            } else {
                dateSelect.append('<option value="" disabled>사용 가능한 날짜가 없습니다</option>');
            }
        }
                
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
        
    } );// end 시작

 
</script>
</head>
<body>
    <%@ include file="../../common/adminHeader.jsp" %>
    <div class="container">
        <h2>상영 스케줄 등록</h2>
        <p>새로운 상영 스케줄을 등록해주세요.</p>
        
        <form id="scheduleForm" action="registerSchedule.do" method="post" class="form-container">
            
            <input type="hidden" value="${theaterId}" id="theaterId" name="theaterId">
            <!--
            <div class="form-group">
                <label for="theaterId" class="form-label">극장</label>
                <select id="theaterId" name="theaterId" class="form-input" required></select>
            </div>
            -->

            <div class="form-group">
                <label for="auditoriumId" class="form-label">상영관</label>
                <select id="auditoriumId" name="auditoriumId" class="form-input" required>
                </select>
            </div>
            
            <div class="form-group">
                <label for="movieId" class="form-label">영화</label>
                <select id="movieId" name="movieId" class="form-input" required></select>
            </div>

            <div class="form-group">
                <label for="screeningDate" class="form-label">상영 날짜</label>
                <select id="screeningDate" name="screeningDate" class="form-input" required></select>
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
