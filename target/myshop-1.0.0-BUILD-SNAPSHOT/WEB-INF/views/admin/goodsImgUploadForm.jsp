<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 이미지 업로드</title>
</head>
<body>
	<div>
		<form action="goodsImgUploadPro.do" method="post" enctype="multipart/form-data">
			<label for="file">파일 업로드</label>
			<input type="file" name="myfile" id="myfile"/>
			<c:if test="${!empty filename }">
			<img src="../upload/${filename }" alt="${filename }" />
			<input type="hidden" name="filename" id="filename" value="${filename }" />
			</c:if>
			<br>
			<hr>
			<br>
			<input type="submit" name="submitBtn" value="파일 업로드">
			<button type="button" id="btn1" onclick="callParent()">해당 이미지 적용</button>	
		</form>
	</div>
	<script>
	function callParent(){
		var myFile = document.getElementById("filename").value;
		opener.document.getElementById("gimg").value = myFile;
		opener.document.getElementById("upload_ck").value = myFile;
		self.close();
	}
	</script>
</body>
</html>