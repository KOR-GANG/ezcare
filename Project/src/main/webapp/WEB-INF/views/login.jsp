<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>ezCare | 로그인</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url('resources/img/mainImg.jpg');
             background-size: cover;
            background-position: center; 
            
        }
        .login-container {
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-container img {
            width: 150px;
            height: auto;
            margin-bottom: 20px;
        }
        .login-container input[type="text"], 
        .login-container input[type="password"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-container input[type="submit"] {
            width: 90%;
            padding: 10px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
            
            
        }
        #login_submit {
        	
        
        }
        
    </style>
</head>
<body>
    <div class="login-container">
        <img src="resources/img/ezcare_logo.jpg" alt="ezCare Logo">
        <div>
            아이디 <input type="text" id="userID"><br> 
            비밀번호 <input type="password" id="userPassword"><br>
           	<input type="button" value="로그인" onclick="location.href='myPage.do'">
           	<input type="button" value="test" onclick="location.href='test2.do'">
        </div>
    </div>
</body>
</html>
