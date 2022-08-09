<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="path1" value="{pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<%@ include file="../inc/head.jsp" %>
</head>
<body>
	<div class="panel-body">
		<span id="lb1">결제 방식 : </span><input type="text" name="paytype" id="paytype" required><br><br>
		<span id="lb2">결제 종류 : </span> 
		<select name="payplace" id="payplace" required>
			<option>선택안함</option>
		</select><br><br>
		<input type="text" name="payno" id="payno" required><br><br>
		<button type="button" id="btn1">결제완료</button>
	</div>
	<script>
	$(document).ready(function(){
		$("#paytype").val(opener.document.getElementById("payMe").value);
		var paytype = $("#paytype").val();
		$("#payplace").find("option:gt(0)").remove();
		if(paytype=="credit"){
			$("#payplace").append("<option value='bc'>BC카드</option>");
			$("#payplace").append("<option value='hyundai'>현대카드</option>");
			$("#payplace").append("<option value='shinhan'>신한카드</option>");
			$("#payplace").append("<option value='kb'>국민카드</option>");
			$("#payplace").append("<option value='hana'>하나카드</option>");
		} else if(paytype=="check"){
			$("#payplace").append("<option value='nh'>NH카드</option>");
			$("#payplace").append("<option value='shinhan'>신한카드</option>");
			$("#payplace").append("<option value='kb'>국민카드</option>");
			$("#payplace").append("<option value='hana'>하나카드</option>");
		} else if(paytype=="transfer"){
			$("#payplace").remove();
			$("#lb2").after("<input type='hidden' name='payplace' id='payplace' value='nh'/>농협 - 예금주:김기태<br>");
			$("#payno").val("316-12-256789");
		} else {
			alert("정해진 결제 방식이 없습니다.");
		}
		$("#btn1").click(function(){
			var paytype = $("#paytype").val();
			var payplace = $("#payplace").val();
			var payno = $("#payno").val();
			if(paytype=="" || payplace=="" || payno==""){
				alert("결제에 필요한 정보가 모두 입력되지 않았습니다.");
			} else {
				//결제가 완료
				alert("결제가 완료되었습니다.");
				opener.document.getElementById("paytype").value = paytype;
				opener.document.getElementById("payplace").value = payplace;
				opener.document.getElementById("payno").value = payno;
				opener.document.getElementById("pay_ck").value = "yes";
				self.close();
			}
		});
		
	});
	</script>
</body>
</html>