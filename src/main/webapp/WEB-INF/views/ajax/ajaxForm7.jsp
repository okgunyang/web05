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
	$("#sendBtn").on("click", function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		if(id=="" || pw==""){
			alert("입력되지 않은 필드가 존재합니다.");
			return false;
		}
		
		var source = {"id":id, "pw":pw};
		
		$.ajax({
			url:"ajax7.do",
			type:"POST",
			dataType:'json',  //Controller에서 @RequestBody로 데이터를 받으므로 dataType과 contentType이 json 형태이어야함
			//data:{"sno":sno, "name":name, "address":address}; - 개별로 보내기
			data:JSON.stringify(source),
			contentType:'application/json; charset=utf-8',
			mimeType:'application/json',
			success:function(data){
				//alert("번호 : "+data.sno);
				$("#res").html("<p>아이디 : "+data.id+"<br>"+"비밀번호 : "+data.pw+"<br>종류 : "+data.gg+"</p>");
				alert("로그인 성공");
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
	<h2>로그인</h2>
 	아이디 : <input type="text" name="id" id="id" required><br>
 	비밀번호 : <input type="password" name="pw" id="pw" required><br>
 	<hr>
 	<input type="button" id="sendBtn" value="전송">
 	<br><hr><br>
 	<div id="res">
 	</div>
</body>
</html>