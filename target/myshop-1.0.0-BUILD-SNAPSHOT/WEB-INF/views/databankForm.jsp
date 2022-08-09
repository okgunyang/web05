<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 등록 실습</title>
</head>
<body>
	<div>
		<h2>자료 등록 실습</h2>
		<form action="databankInsert.do" method="post" enctype="multipart/form-data">
			<label for="title">제목</label>
			<input type="text" name="title" id="title"/><br><br>
			<label for="fileurl">파일</label>
			<input type="file" name="fileurl" id="fileurl"/><br><br>
			<label for="author">작성자</label>
			<input type="text" name="author" id="author"/><br><br>
			<br>
			<hr>
			<br>
			<input type="submit" name="submitBtn" value="자료 등록">	
		</form>
	</div>
</body>
</html>