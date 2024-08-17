<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eaCare | 마이페이지</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/header.css'/>">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f8f8;
}

#logo, #sNav {
	display: flex;
	justify-content: center;
	align-items: center;
}

#logo>img {
	width: 400px;
	height: 150px;
}

#nNav>img {
	width: 30px;
	height: 30px;
	float: right;
	margin-right: 50px;
}

#sNav {
	margin-top: 30px;
}

#sNav>input {
	width: 600px;
	height: 30px;
}

#lNav {
	width: 20%;
	height: 600px;
	float: left;
}

.lNav {
	width: 200px;
	height: 250px;
	margin-top: 50px;
}

#todo {
	width: 60%;
	float: left;
	margin-top: 50px;
}

#todoNav {
	float: right;
}

#todolist {
	font-size: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 40px;
}

#todolist tr>td:first-child {
	padding-right: 40px;
}

#rNav {
	width: 20%;
	float: left;
	text-align: center;
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

.flatpickr-input {
	display: none;
}
</style>
</head>
<body>
	<div class="navbar">
		<div class="navbar-left">
			<img alt="EzCare Logo" src="resources/img/ezcare_logo.jpg"
				class="navbar-logo"> <a href="notice.do">공지사항</a> <a href="inpatient.do">입원환자</a>
			<a href="patientChart.do">환자상태</a> <a href="myPage.do">마이페이지</a>
		</div>
		<div class="navbar-center">
			<input type="text" placeholder="환자이름 또는 환자차트번호를 입력하세요"> <img
				src="resources/img/search-icon.png" alt="Search" class="search-icon">
		</div>

		<div id="search-box"></div>

		<div class="navbar-right">
			<span class="login-name">이두나</span> <span class="login-name2">
				님 안녕하세요.</span>
			<button class="logout">로그아웃</button>
			<span class="session-timer">01:00</span> <img
				src="resources/img/alert-bell-icon.png" alt="Emergency"
				class="emergency-icon">
		</div>
	</div>

	<!-- 	<div id="logo">
		<img src="resources/img/logo.jpg">
	</div>
	<div id="nNav">
		<img src="resources/img/bell.png">
	</div>
	<div id="sNav">
		<input type="text" name="search">
	</div> -->
	<div id="lNav">
		<img class="lNav" src="resources/img/DF1.webp"> 
		<input id="calendar" type="text" placeholder="Select Date">
	</div>

	<div id="todo">
		<div id="todoNav">
			<input type="button" value="추가"> <input type="button"
				value="제거">
		</div>
		<div id="todolist">
			<table>
				<tr>
					<td>08:30 ~ 09:00</td>
					<td>회의</td>
				</tr>
				<tr>
					<td>09:30 ~ 10:00</td>
					<td>고길동님 진료</td>
				</tr>
				<tr>
					<td>10:00 ~ 10:30</td>
					<td>홍길동님 진료</td>
				</tr>
				<tr>
					<td>10:30 ~ 11:00</td>
					<td>전우치님 진료</td>
				</tr>
				<tr>
					<td>11:00 ~ 11:30</td>
					<td>슈퍼맨님 진료</td>
				</tr>
				<tr>
					<td>11:30 ~ 12:00</td>
					<td>배트맨님 진료</td>
				</tr>
				<tr>
					<td>12:00 ~ 13:00</td>
					<td>점심시간</td>
				</tr>
				<tr>
					<td>13:00 ~ 13:30</td>
					<td>이순신님 진료</td>
				</tr>
				<tr>
					<td>13:30 ~ 14:00</td>
					<td>박지성님 진료</td>
				</tr>
				<tr>
					<td>14:00 ~ 15:00</td>
					<td>수술 회의</td>
				</tr>
				<tr>
					<td>15:00 ~ 19:00</td>
					<td>슬픔이님 수술</td>
				</tr>
				<tr>
					<td>19:00 ~ 20:00</td>
					<td>저녁시간</td>
				</tr>
				<tr>
					<td>20:00 ~ 21:00</td>
					<td>담당환자 회진</td>
				</tr>
				<tr>
					<td>21:00 ~ 21:00</td>
					<td>퇴근</td>
				</tr>
			</table>
		</div>
	</div>

	<div id="rNav">
		<h2>담당 환자</h2>
		<p>배트맨</p>
		<p>홍길동</p>
		<p>슈퍼맨</p>
		<p>전우치</p>
		<p>박지성</p>
		<p>호날두</p>
		<p>메시</p>
		<p>지단</p>
		<p>아이언맨</p>
	</div>


	<script>
/*         let timer = 60;
        const timerElement = document.querySelector('.session-timer');

        function updateTimer() {
            const minutes = Math.floor(timer / 60);
            const seconds = timer % 60;
            timerElement.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            if (timer > 0) {
                timer--;
            } else {
                alert('세션이 만료되었습니다. 자동 로그아웃 됩니다.');
                // 여기에 로그아웃 기능을 추가
            }
        } 

        setInterval(updateTimer, 1000); */

        function toggleEmergencyPanel() {
            const panel = document.getElementById('emergencyPanel');
            panel.classList.toggle('open');
        }

        document.querySelector('.emergency-icon').addEventListener('click', toggleEmergencyPanel);
    </script>

	<script>
        // flatpickr 초기화
        flatpickr("#calendar", {
            inline: true, // 달력을 인라인으로 표시
            defaultDate: "today", // 기본 날짜를 오늘로 설정
            onChange: function(selectedDates, dateStr, instance) {
                console.log("Selected date:", dateStr); // 선택된 날짜 출력
            }
        });
    </script>

</body>
</html>