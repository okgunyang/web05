<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여러 파일 업로드 실습</title>
</head>
<body>
	<div>
		<h2>여러 파일 업로드 실습</h2>
		<form action="multiFileUplaod.do" method="post" enctype="multipart/form-data">
			<label for="file1">파일1 업로드</label>
			<input type="file" name="files" id="file1"/><br><br>
			<label for="file2">파일2 업로드</label>
			<input type="file" name="files" id="file2"/><br><br>
			<label for="file3">파일3 업로드</label>
			<input type="file" name="files" id="file3"/><br><br>
			<br>
			<hr>
			<br>
			<input type="submit" name="submitBtn" value="파일 업로드">	
		</form>
	</div>
	<!--  D:\kim3\jsp3\.metadata\.plugins\org.eclipse.wst.server.core
	\tmp0\wtpwebapps\web05\WEB-INF\views\upload\ 에 저장됨 -->
</body>
</html>