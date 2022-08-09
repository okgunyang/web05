<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax 로그인 실습</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){
	$("#confirmBtn").on("click", function(){
		var id = $("#id").val();

		if(id==""){
			alert("입력되지 않은 필드가 존재합니다.");
			return false;
		}
		
		var obj = {"id":id}
		
		$.ajax({
			url:"ajax8.do",  
			type:"POST",
			data:obj,  //Controller에서 데이터를 @RequestBody로 받지 않고, 단순한 객체 DTO로 받으므로 반드시 data는 객체타입이 되어야 함
			dataType:"text",	//Controller에서 반환되는 타입이 String이므로 text 기재
			success:function(data){
				if(data=="ok") {
					alert("사용 가능");	
				} else { 
					alert("사용 불가능");
				}
				
			},
			error:function(data, status, err){
				alert("에러 : "+err+"상태 코드 : "+status)
			}
		});
	});
});
</script>
</head>
<body>
	<h2>회원가입</h2>
 	아이디 : <input type="text" name="id" id="id" required>
 	<input type="button" id="confirmBtn" value="아이디 중복 확인"><br>
 	비밀번호 : <input type="password" name="pw" id="pw" required><br>
 	비밀번호 확인 : <input type="password" name="pw2" id="pw2" required><br>
 	이름 : <input type="text" name="name" id="name" required><br>
 	<hr>
 	<input type="button" id="confirmBtn" value="전송">
 	<br><hr><br>
 	<c:if test="${!empty msg }">
 	<div id="res">${msg }</div>
 	</c:if>
</body>
</html>