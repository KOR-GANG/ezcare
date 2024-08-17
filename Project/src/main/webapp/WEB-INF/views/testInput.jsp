<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/header.css">
<!-- <link href="resources/css/dicom/bootstrap.min.css" rel="stylesheet"> -->
<link href="resources/css/dicom/cornerstone.min.css" rel="stylesheet">
<style>
	.slide-out-panel {
		position: fixed !important;
		right: -350px !important; /* 패널이 완전히 숨겨지도록 화면 오른쪽 바깥에 위치시킴 */
		top: 0 !important;
		height: 100% !important;
		width: 300px !important;
		background-color: #fff !important;
		box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1) !important;
		transition: right 0.3s ease !important; /* 슬라이드 효과 추가 */
		z-index: 1000 !important;
		padding: 20px !important;
		overflow-y: auto !important;
	}

	.slide-out-panel.open {
		right: 0 !important; /* 패널이 나타나도록 오른쪽으로 슬라이드 */
	}

	.slide-out-panel .close {
		text-align: right !important;
		cursor: pointer !important;
	}
	#dName, #aName {
		display: inline-block !important;
	}
	#time, #writer {
		display: inline-block;
		margin-right: 10px;
	}
	.page-header, #selectFile, #toggleModalityLUT, #toggleVOILUT {
		display: none;
	}
</style>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/diseaseAPI.js"></script>
<script src="resources/js/ATCcodeAPI.js"></script>
<script src="resources/js/display.js"></script>
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
	<div class="slide-out-panel" id="emergencyPanel">
		<div class="close" onclick="toggleEmergencyPanel()">닫기</div>
		<h3>긴급소식</h3>
		<p>긴급 환자 정보 등이 여기에 표시됩니다.</p>
	</div>
	
	<h3>진료기록</h3>
	<p id="time"></p>
	<p id="writer"></p>
	

	<div>
		<h2>Upload Multiple Files</h2>
    	<form action="upload" method="post" enctype="multipart/form-data">
        	<input type="file" name="files" multiple>
        	<br><br>
        	<input type="submit" value="Upload">
    	</form>
	</div>
	<h3>진단</h3>
	<input id="searchD" type="text"> <p id="dName"></p>
	<div id="sDisList">
	</div>
	
	<h3>의사소견</h3>
	<textarea rows="10" cols="50"></textarea>
	
	<h3>처방약</h3>
	<input id="ATCCd" type="text"> <p id="aName"></p>
    <div id="sATCList">
    </div>
	
<!-- 	<script>
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
    </script> -->	
</body>
<script src="resources/js/dicom/cornerstone.min.js"></script>
<SCRIPT src="resources/js/dicom/cornerstoneMath.min.js"></SCRIPT>
<SCRIPT src="resources/js/dicom/cornerstoneTools.min.js"></SCRIPT>
<script src="resources/js/dicom/dicomParser.min.js"></script>
<script src="resources/js/dicom/cornerstoneWADOImageLoader.bundle.min.js"></script>
<script src="resources/js/dicom/uids.js"></script>
<script>window.cornerstoneWADOImageLoader || document.write('<script src="https://unpkg.com/cornerstone-wado-image-loader">\x3C/script>')</script>
<script src="resources/js/dicom/initializeWebWorkers.js"></script>
<script src="resources/js/dicom/dicom.js"></script>
</html>