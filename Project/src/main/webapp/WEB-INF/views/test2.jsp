<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Multi File Upload</title>
</head>
<body>
    <h2>Upload Multiple Files</h2>
    	<form action="upload" method="post" enctype="multipart/form-data">
        	<input type="file" name="files" multiple>
        	<br><br>
        	<input type="submit" value="Upload">
    	</form>
</body>
</html>