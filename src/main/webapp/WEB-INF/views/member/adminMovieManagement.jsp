<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 관리 게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<style>
    .button-group {
        margin: 20px 0;
        display: flex;
        gap: 10px;
    }
    .search-container {
        margin: 20px 0;
        display: flex;
        gap: 10px;
    }
    .search-container select, .search-container input {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .movie-action-buttons {
        display: flex;
        gap: 5px;
    }
    .movie-action-buttons .btn {
        padding: 6px 12px;
        font-size: 0.8rem;
    }
</style>
</head>
<%@ include file="../common/adminHeader.jsp" %>
<body>
	<div class="container">
	    <h2 class="section_title">영화 관리</h2>
	    
	    <!-- 검색 기능 -->
	    <div class="search-container">
	        <select id="searchType">
	            <option value="title">제목</option>
	            <option value="director">감독</option>
	            <option value="genre">장르</option>
	        </select>
	        <input type="text" id="searchKeyword" placeholder="검색어 입력">
	        <button class="btn btn-primary" onclick="searchMovies()">검색</button>
	        <button class="btn btn-secondary" onclick="resetSearch()">초기화</button>
	    </div>
	    
	    <!-- 영화 목록 필터 버튼 -->
	    <div class="button-group">
	        <button class="btn btn-primary" onclick="renderList('showing')">상영중인영화목록</button>
	        <button class="btn btn-secondary" onclick="renderList('release')">개봉예정영화목록</button>
	        <button class="btn btn-warning" onclick="renderList('all')">전체영화목록</button>
	        <button class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/member/adminMovieInsert.do'">영화 등록</button>
	    </div>
	    
	    <!-- 영화 목록 테이블 -->
	    <table class="table">
	    	<thead>
	    		<tr>
	    			<th>ID</th>
	    			<th>제목</th>
	    			<th>감독</th>
	    			<th>장르</th>
	    			<th>상영시간</th>
	    			<th>관리</th>
	    		</tr>
	    	</thead>
	    	<tbody id="tableBody">
	    		<!-- 영화 목록이 여기에 동적으로 로드됩니다 -->
	    	</tbody>
	    </table>
	</div>

	<script type="text/javascript">
    // JSP로 전달된 JSON 데이터를 JavaScript로 변환 (오류 처리 추가)
    let releaseMovieList = [];
    let everyMovieList = [];
    let showingMovieList = [];
    
    try {
        // 데이터가 유효한지 확인
        const releaseData = '${releaseMovieList}';
        const everyData = '${everyMovieList}';
        const showingData = '${showingMovieList}';
        
        console.log('데이터 확인:', { releaseData, everyData, showingData });
        
        // 데이터가 유효한 경우에만 파싱
        if (releaseData && releaseData !== 'false' && releaseData !== '[]') {
            releaseMovieList = JSON.parse(releaseData);
        }
        
        if (everyData && everyData !== 'false' && everyData !== '[]') {
            everyMovieList = JSON.parse(everyData);
        }
        
        if (showingData && showingData !== 'false' && showingData !== '[]') {
            showingMovieList = JSON.parse(showingData);
        }
        
        // 데이터 구조 확인 (디버깅용)
        if (everyMovieList.length > 0) {
            console.log('영화 데이터 구조 확인:', everyMovieList[0]);
            console.log('영화 ID 필드 이름:', Object.keys(everyMovieList[0]));
        }
    } catch (error) {
        console.error('JSON 파싱 오류:', error);
        // 오류 발생 시 빈 배열로 초기화
        releaseMovieList = [];
        everyMovieList = [];
        showingMovieList = [];
    }
    
    // 현재 표시 중인 영화 목록 (검색 기능을 위해 저장)
    let currentDisplayedList = [];
    let currentListType = 'all';

    // 영화 리스트 렌더링 함수
    function renderList(type) {
        currentListType = type;
        let list;
        switch (type) {
            case 'showing':
                list = showingMovieList;
                break;
            case 'release':
                list = releaseMovieList;
                break;
            default:
                list = everyMovieList;
        }
        
        currentDisplayedList = [...list]; // 현재 표시 목록 저장
        renderMovieList(list);
    }
    
    // 영화 목록을 테이블에 표시하는 함수
    function renderMovieList(list) {
        const tableBody = document.querySelector('#tableBody');
        tableBody.innerHTML = ''; // 기존 내용 초기화

        if (!list || list.length === 0) {
            tableBody.innerHTML = '<tr><td colspan="6">표시할 영화가 없습니다.</td></tr>';
            return;
        }
        
        // 데이터 디버깅 - 첫 번째 영화 데이터 출력
        console.log('렌더링할 첫 번째 영화:', list[0]);

        list.forEach(movie => {
            // 영화 데이터 각 필드 확인 및 디버깅
            console.log('현재 처리중인 영화:', movie);
            
            // 영화 ID 필드 이름 확인 (movie_id 또는 mv_id 또는 id 등)
            const movieId = movie.movie_id;
            const movieTitle = movie.mv_title;
            const movieDirector = movie.director;
            const movieGenre = movie.genre;
            const movieRuntime = movie.runtime;
            
            console.log('표시할 데이터:', { movieId, movieTitle, movieDirector, movieGenre, movieRuntime });
            
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${movieId}</td>
                <td>${movieTitle}</td>
                <td>${movieDirector}</td>
                <td>${movieGenre}</td>
                <td>${movieRuntime}</td>
                <td class="movie-action-buttons">
                    <a href="${pageContext.request.contextPath}/member/adminMovieUpdate.do?movie_id=${movieId}" class="btn btn-secondary">수정</a>
                    <button class="btn btn-danger" onclick="deleteMovie('${movieId}', '${movieTitle}')">삭제</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
    }
    
    // 영화 삭제 함수
    function deleteMovie(movieId, movieTitle) {
        if (confirm(`'${movieTitle}' 영화를 정말 삭제하시겠습니까?`)) {
            // 서버로 삭제 요청 보내기
            location.href = `${pageContext.request.contextPath}/member/adminMovieDelete.do?mv_id=${movieId}`;
        }
    }
    
    // 영화 검색 함수
    function searchMovies() {
        const searchType = document.getElementById('searchType').value;
        const keyword = document.getElementById('searchKeyword').value.trim().toLowerCase();
        
        if (!keyword) {
            alert('검색어를 입력해주세요.');
            return;
        }
        
        // 현재 표시 중인 목록에서 검색
        const filteredList = currentDisplayedList.filter(movie => {
            let searchField = '';
            
            switch(searchType) {
                case 'title':
                    searchField = movie.mv_title;
                    break;
                case 'director':
                    searchField = movie.director;
                    break;
                case 'genre':
                    searchField = movie.genre;
                    break;
            }
            
            return searchField && searchField.toLowerCase().includes(keyword);
        });
        
        renderMovieList(filteredList);
    }
    
    // 검색 초기화 함수
    function resetSearch() {
        document.getElementById('searchKeyword').value = '';
        renderList(currentListType);
    }

    // 기본으로 전체 목록 보여주기
    window.onload = () => {
        renderList('all');
    };
</script>

    <!-- 영화 정보 모달 (필요시 사용) -->
    <div id="movieDetailModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle"></h2>
            <div id="modalContent"></div>
        </div>
    </div>

    <script>
        // 모달 관련 함수들
        function openModal(title, content) {
            document.getElementById('modalTitle').textContent = title;
            document.getElementById('modalContent').innerHTML = content;
            document.getElementById('movieDetailModal').style.display = 'block';
        }
        
        function closeModal() {
            document.getElementById('movieDetailModal').style.display = 'none';
        }
        
        // ESC 키로 모달 닫기
        window.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                closeModal();
            }
        });
    </script>
</body>
</html>
