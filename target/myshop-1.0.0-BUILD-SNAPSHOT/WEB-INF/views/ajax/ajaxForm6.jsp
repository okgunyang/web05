<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormData 전송 실습</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){
	$("#sendBtn").on("click", function(){
		var sno = $("#sno").val();
		var name = $("#name").val();
		var address = $("#address").val();
		if(sno=="" || name=="" || address==""){
			alert("입력되지 않은 필드가 존재합니다.");
			return false;
		}
		
		var data = {"sno":sno, "name":name, "address":address};
		
		$.ajax({
			url:"ajax6.do",
			type:"POST",
			dataType:'json', //Controller에서 @RequestBody로 데이터를 받으므로 dataType과 contentType이 json 형태이어야함
			//data:{"sno":sno, "name":name, "address":address}; - 개별로 보내기
			data:JSON.stringify(data),
			contentType:'application/json; charset=utf-8',
			mimeType:'application/json',
			success:function(data){
				//alert("번호 : "+data.sno);
				$("#res").html("<p>번호 : "+data.sno+"<br>"+"이름 : "+data.name+"<br>"+data.address+"</p>");
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
	<h2>폼 데이터 전송</h2>
 	번호 : <input type="text" name="sno" id="sno"><br>
 	이름 : <input type="text" name="name" id="name"><br>
 	주소 : <input type="text" name="address" id="address"><br><br>
 	<hr>
 	<input type="button" id="sendBtn" value="전송">
 	<br><hr><br>
 	<div id="res">
 	</div>
</body>
</html>