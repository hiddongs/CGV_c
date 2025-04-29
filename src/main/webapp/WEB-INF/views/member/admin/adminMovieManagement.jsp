<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 관리 게시판</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script type="text/javascript">
    function renderList(order) {
        $.ajax({
            type: 'POST',
            url: 'adminMovieList.do',
            data: { order: order },
            dataType: 'json',
            success: function(response) {
                displayMovieList(response);
            },
            error: function(xhr, status, error) {
                console.error('에러 발생:', error);
                alert('영화 목록을 불러오는데 실패했습니다.');
            }
        });
    }

    function displayMovieList(movieList) {
        const container = document.querySelector('#tableBody');
        container.innerHTML = '';
        
        console.log('Received movieList:', movieList);

        if (!movieList || movieList.length === 0) {
            container.innerHTML = '<tr><td colspan="4">영화목록이 없습니다.</td></tr>';
            return;
        }

        movieList.forEach((movie, index) => {
            console.log('Movie ' + index + ':', movie);
            const row = document.createElement('tr');

            const createCell = (value) => {
                const cell = document.createElement('td');
                cell.textContent = value || '-';
                return cell;
            };

            row.appendChild(createCell(movie.mv_title));
            row.appendChild(createCell(movie.director));
            row.appendChild(createCell(movie.genre));
			row.appendChild(createCell(movie.runtime))
			
            const actionCell = document.createElement('td');
            const updateBtn = document.createElement('button');
            updateBtn.type = 'button';
            updateBtn.className = 'btn btn-secondary';
            updateBtn.textContent = '수정';
            updateBtn.dataset.movieId = movie.movie_id;
            updateBtn.onclick = updateMovieForm;

            const deleteBtn = document.createElement('button');
            deleteBtn.type = 'button';
            deleteBtn.className = 'btn btn-primary';
            deleteBtn.textContent = '삭제';
            deleteBtn.dataset.movieId = movie.movie_id;
            deleteBtn.onclick = deleteMovieForm;
            
            const movieTypeBtn = document.createElement('button')
            movieTypeBtn.type = 'button'
            movieTypeBtn.className = 'btn btn-warning'
            movieTypeBtn.textContent = '상영타입'	
           	movieTypeBtn.dataset.movieId = movie.movie_id
           	movieTypeBtn.onclick = updateMovieTypeForm;
            
            actionCell.appendChild(updateBtn);
            actionCell.appendChild(document.createTextNode(' '));
            actionCell.appendChild(deleteBtn);
            actionCell.appendChild(document.createTextNode(' '))
			actionCell.appendChild(movieTypeBtn)
            row.appendChild(actionCell);
            container.appendChild(row);
        });
    }

    // 페이지 로드 시 전체 영화 목록 표시
    $(function() {
        renderList('all');
    });
    
    function updateMovieForm(event){
        const movieId = event.target.dataset.movieId;
        console.log('Update movie_id:', movieId); // 디버깅용
        window.location.href = 'updateMovieForm.do?movie_id=' + encodeURIComponent(movieId);
    }
    
    function deleteMovieForm(event){
        const movieId = event.target.dataset.movieId;
        console.log('Delete movie_id:', movieId); // 디버깅용
        if(confirm('정말 삭제하시겠습니까?')) {
            window.location.href = 'deleteMovieForm.do?movie_id=' + encodeURIComponent(movieId);
        }
    }
    function updateMovieTypeForm(event){
		const movieId = event.target.dataset.movieId;
		window.location.href = 'updateMovieTypeForm.do?movie_id='+ encodeURIComponent(movieId)
    }
</script>

</head>
<body>
   <%@ include file="../../common/adminHeader.jsp" %>
    <div class="container">
        <div class="button-group">
            <button class="btn btn-primary" onclick="renderList('showing')">상영중인 영화 목록</button>
            <button class="btn btn-secondary" onclick="renderList('release')">개봉예정 영화 목록</button>
            <button class="btn btn-warning" onclick="renderList('all')">전체 영화 목록</button>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>감독</th>
                    <th>장르</th>
                    <th>상영시간</th>
                    <th>행동</th>
                </tr>
            </thead>
            <tbody id="tableBody"></tbody>
        </table>
    </div>
</body>
</html>

