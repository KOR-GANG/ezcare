let day = ['일', '월', '화', '수', '목', '금', '토'];

let today = new Date();

let dateFormat = today.getFullYear() + '-' + ((today.getMonth()+1) < 9 ? "0" + (today.getMonth()+1) : (today.getMonth()+1)) + '-' + (today.getDate() < 9 ? "0" + today.getDate() : today.getDate()) + " " + (today.getHours() < 9 ? "0" + today.getHours() : today.getHours()) + ":" + (today.getMinutes() < 9 ? "0" + today.getMinutes() : today.getMinutes()) + ":" + (today.getSeconds() < 9 ? "0" + today.getSeconds() : today.getSeconds());

function displayDate() {
	document.getElementById('time').innerHTML = dateFormat;
}

function displayWriter() {
	document.getElementById("writer").innerHTML = $(".login-name").text();
}

window.onload = function() {
	displayDate();
	displayWriter();
}