<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax 방식 파일 업로드</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div>
		<h2>Ajax 파일 업로드</h2>
		<input type="file" name="uploadFile" id="uploadFile" multiple/>
		<br>
		<hr>
		<br>
		<input type="button" name="uploadBtn" id="uploadBtn" value="파일 업로드">	<br><br>
		<div id="msg"></div>
	</div>
	<script>
	$(document).ready(function(){
		$("#uploadBtn").on("click", function(){
			var formData = new FormData();
			var inputFile = $("#uploadFile");
			var files = inputFile[0].files;
			//console.log(files);
			for(var i=0;i<files.length;i++){
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url:'uploadAjax.do',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				sucess : function(result) {
					$("#msg").html(result);
				}
			});
		});
	});
	</script>
</body>
</html>