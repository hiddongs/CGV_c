<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>특별관 소개 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
/* 기본 스타일 */
.special-container {
	max-width: 1000px;
	margin: 0 auto;
	padding: 40px 20px;
	text-align: center;
}
.special-title {
	font-size: 36px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #111;
}
.special-desc {
	color: #666;
	margin-bottom: 30px;
	font-size: 16px;
}
.special-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 20px;
}
.special-card {
	display: flex;
	flex-direction: column;
	background: #fff;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s;
	height: 280px;
	cursor: pointer;
}
.special-card:hover {
	transform: translateY(-6px);
}
.card-wide img, .card-narrow img {
	height: 180px;
	width: 100%;
	object-fit: cover;
}
.special-text {
	padding: 15px;
	text-align: left;
}
.special-text h3 {
	font-size: 20px;
	margin: 0 0 5px;
	color: #000;
}
.special-text p {
	font-size: 14px;
	color: #555;
}

/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 999;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	padding: 30px 10px;
	box-sizing: border-box;
}
.modal-content {
    background: #fff;
    max-width: 550px;
    width: 90%;
    padding: 30px 25px;
    border-radius: 10px;
    text-align: center;
    position: absolute; /* 변경 */
    top: 50%;            /* 중앙 위치 */
    left: 50%;
    transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
    animation: fadeInModal 0.3s ease;
}s
.modal-content h3 {
	font-size: 22px;
	margin-bottom: 15px;
}
.modal-content p {
	font-size: 15px;
	line-height: 1.6;
	color: #333;
}
.close {
	position: absolute;
	top: 10px;
	right: 15px;
	font-size: 22px;
	font-weight: bold;
	color: #999;
	cursor: pointer;
}
.close:hover {
	color: #000;
}
#modalImg {
	width: 100%;
	max-width: 400px;
	margin: 20px auto;
	border-radius: 10px;
	animation: scaleUp 6s infinite ease-in-out;
}

/* 애니메이션 */
@keyframes fadeInModal {
	from { opacity: 0; transform: translateY(-20px); }
	to { opacity: 1; transform: translateY(0); }
}
@keyframes scaleUp {
	0%, 100% { transform: scale(1); }
	50% { transform: scale(1.05); }
}
</style>
</head>
<body>

<div class="special-container">
	<h2 class="special-title">CGV만의 특별함이 있는 영화관을 소개합니다.</h2>
	<p class="special-desc">진화된 3S(Screen, Sound, Seat) 기술로 몰입도를 극대화한 환경을 제공합니다.</p>

	<div class="special-grid">
		<!-- IMAX -->
		<div class="special-card card-wide"
			data-title="IMAX"
			data-desc="IMAX는 일반 상영관 대비 26% 더 커진 화면과 디지털 리마스터링 기술로 최고의 화질과 사운드를 제공합니다."
			data-img="${pageContext.request.contextPath}/resources/images/imax.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/imax.jpg" alt="IMAX">
			<div class="special-text">
				<h3>IMAX</h3>
				<p>궁극의 몰입감</p>
			</div>
		</div>
		<!-- 4DX -->
		<div class="special-card card-narrow"
			data-title="4DX"
			data-desc="CGV만의 오감 체험 특화관. 움직이는 좌석, 바람, 물, 향기 등의 효과가 결합되어 현실감을 극대화합니다."
			data-img="${pageContext.request.contextPath}/resources/images/4dx.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/4dx.jpg" alt="4DX">
			<div class="special-text">
				<h3>4DX</h3>
				<p>특별한 오감체험</p>
			</div>
		</div>
		<!-- 3D -->
		<div class="special-card card-narrow"
			data-title="3D"
			data-desc="입체적인 영상 효과로 영화의 깊이감을 경험할 수 있는 상영관. 일반 영화와는 차원이 다른 몰입도를 제공합니다."
			data-img="${pageContext.request.contextPath}/resources/images/3d.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/3d.jpg" alt="3D">
			<div class="special-text">
				<h3>3D</h3>
				<p>생생한 몰입</p>
			</div>
		</div>
		<!-- SCREENX -->
		<div class="special-card card-wide"
			data-title="SCREENX"
			data-desc="세계 최초 다면 상영관으로, 좌우 벽면까지 확장된 파노라마 스크린을 통해 압도적인 시각 경험을 선사합니다."
			data-img="${pageContext.request.contextPath}/resources/images/screenx.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/screenx.jpg" alt="SCREENX">
			<div class="special-text">
				<h3>SCREENX</h3>
				<p>세계 최초 다면 상영관</p>
			</div>
		</div>
	</div>
</div>

<!-- 모달창 -->
<div class="modal" id="specialModal">
	<div class="modal-content">
		<span class="close">&times;</span>
		<h3 id="modalTitle">특별관 제목</h3>
		<img id="modalImg" src="" alt="특별관 이미지">
		<p id="modalDesc">특별관 설명 내용</p>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
$(document).ready(function () {
	$('.special-card').on('click', function () {
		const title = $(this).data('title');
		const desc = $(this).data('desc');
		const img = $(this).data('img');

		$('#modalTitle').text(title);
		$('#modalDesc').text(desc);
		$('#modalImg').attr('src', img);

		$('#specialModal').fadeIn();
	});

	$('.close, #specialModal').on('click', function (e) {
		if (e.target === this || $(e.target).hasClass('close')) {
			$('#specialModal').fadeOut();
		}
	});
});
</script>

</body>
</html>
