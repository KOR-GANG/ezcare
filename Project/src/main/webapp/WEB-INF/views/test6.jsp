<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="path/to/cornerstone.min.js"></script>
<script src="path/to/cornerstoneWADOImageLoader.bundle.min.js"></script>
</head>
<body>
    <h2>DICOM 파일 목록</h2>
    <ul>
        <c:forEach var="fileName" items="${fileNames}">
            <li><a href="#" onclick="loadDicomFile('${fileName}')">${fileName}</a></li>
        </c:forEach>
    </ul>

    <div id="dicomImage" style="width:512px;height:512px;"></div>

    <script>
        const dicomFolderPath = '<%= request.getContextPath() %>/resources/dicomFiles/';

        function loadDicomFile(fileName) {
            const imageId = `wadouri:${dicomFolderPath}${fileName}`;
            cornerstone.loadImage(imageId).then(function(image) {
                const element = document.getElementById('dicomImage');
                cornerstone.displayImage(element, image);
            }).catch(function(err) {
                console.error(err);
            });
        }

        cornerstone.enable(document.getElementById('dicomImage'));
    </script>
</body>
</html>