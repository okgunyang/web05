<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		$.ajax({
			type:"get",
			url:"ajax10.do?id="+id,	//get방식의 @RequestParam로 데이터를 전송하므로 url에 파라미터를 기재해야함
			contentType:"application/json; charset=utf-8", //Controller에서 @RequestParam으로 받으므로 application/json 필요  
			dataType:"text",	//Controller에서 리턴되는 데이터값 String 이므로 text 기재
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
 	<div id="res">
 	</div>
</body>
</html>