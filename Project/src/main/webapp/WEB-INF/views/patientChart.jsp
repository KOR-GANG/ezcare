<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ezCare | 환자기록</title>
<link rel="stylesheet" type="text/css" href="<c:url value='./resources/css/header.css'/>">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f8f8;
}

.container {
	display: flex;
	padding: 20px;
}

.column {
	background-color: #fff;
	padding: 20px;
	margin-right: 20px;
	flex: 1;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	height: 760px;
}

.column:last-child {
	margin-right: 0;
}

.content-section {
	margin-bottom: 20px;
}

.content-section h3 {
	margin-top: 0;
	color: #555;
}

.content-section p, .content-section li {
	margin: 5px 0;
	color: #777;
}

.slide-out-panel {
	position: fixed;
	right: -350px; /* 패널이 완전히 숨겨지도록 화면 오른쪽 바깥에 위치시킴 */
	top: 0;
	height: 100%;
	width: 300px;
	background-color: #fff;
	box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
	transition: right 0.3s ease; /* 슬라이드 효과 추가 */
	z-index: 1000;
	padding: 20px;
	overflow-y: auto;
}

.slide-out-panel.open {
	right: 0; /* 패널이 나타나도록 오른쪽으로 슬라이드 */
}

.slide-out-panel .close {
	text-align: right;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="navbar">
		<div class="navbar-left">
			<img alt="EzCare Logo" src="resources/img/ezcare_logo.jpg"
				class="navbar-logo"> <a href="#">공지사항</a> <a href="#">입원환자</a>
			<a href="#">환자상태</a> <a href="#">마이페이지</a>
		</div>
		<div class="navbar-center">
			<input type="text" placeholder="환자이름 또는 환자차트번호를 입력하세요"> <img
				src="resources/img/search-icon.png" alt="Search" class="search-icon">
		</div>

		<div id="search-box"></div>

		<div class="navbar-right">
			<span class="login-name">차은우</span> <span class="login-name2">
				님 안녕하세요.</span>
			<button class="logout">로그아웃</button>
			<span class="session-timer">01:00</span> <img
				src="resources/img/alert-bell-icon.png" alt="Emergency"
				class="emergency-icon">
		</div>
	</div>

	<div class="container">
		<div class="column">
			<div class="content-section">
				<h3>내원이력</h3>
				<p>박원장</p>
				<p>2021-09-20</p>
			</div>
			<div class="content-section">
				<h3>증상</h3>
				<ul>
					<li>저녁되면 어지러움과 구토증세</li>
					<li>우울과 상실감 지속됨</li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="content-section">
				<h3>상세설명</h3>
				<ul>
					<li>우울증치료제 16년째 복용중</li>
					<li>치료방안: 졸로푸트, 팍실, 버스파, 재넥스 항우울제 처방</li>
				</ul>
			</div>
		</div>
		<div class="column">
			<div class="content-section">
				<h3>진료기록</h3>
				<p>저녁만 되면 어지러움과 구토증상.</p>
				<p>2024-07-30 11:00 박원장</p>
				<img src="resources/img/something.jpg" alt="Patient Image"
					style="width: 100%; height: auto;">
			</div>
			<div class="content-section">
				<h3>진단 및 계획</h3>
				<ul>
					<li>상세설명에 아토피 피부염</li>
					<li>치료방안: 진선제연고 0.2g</li>
				</ul>
			</div>
		</div>
		<div class="column">
			<div class="content-section">
				<h3>오더내역</h3>
				<ul>
					<li>간기능 검사</li>
					<li>혈소판감사 검사</li>
					<li>전기충격치료요법</li>
				</ul>
			</div>
			<div class="content-section">
				<h3>환자채팅</h3>
				<p>홍길동 2024-07-30</p>
				<p>내일 검진</p>
				<p>고길동 2024-07-31</p>
				<p>진선제연고</p>
			</div>
		</div>
	</div>

	<div class="slide-out-panel" id="emergencyPanel">
		<div class="close" onclick="toggleEmergencyPanel()">닫기</div>
		<h3>긴급소식</h3>
		<p>긴급 환자 정보 등이 여기에 표시됩니다.</p>
	</div>

	<script>
        //let timer = 180;
        const timerElement = document.querySelector('.session-timer');

        function updateTimer() {
            const minutes = Math.floor(timer / 60);
            const seconds = timer % 60;
            timerElement.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            if (timer > 0) {
                timer--;
            } else {
                alert('세션이 만료되었습니다. 자동 로그아웃 됩니다.');
                // 여기에 실제 로그아웃 기능을 추가하세요
            }
        }

        setInterval(updateTimer, 1000);

        function toggleEmergencyPanel() {
            const panel = document.getElementById('emergencyPanel');
            panel.classList.toggle('open');
        }

        document.querySelector('.emergency-icon').addEventListener('click', toggleEmergencyPanel);
    </script>

</body>
</html>
