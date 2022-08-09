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
<title>구매 목록</title>
<%@ include file="../inc/head.jsp" %>
<style>
form:label { display:inline-block; }
</style>
<script>
$(document).ready(function(){
	$("#frm1").css("z-index","1000");
});
</script>
<style>
.tit { padding-top:1em; }
</style>
</head>
<body>

	<%@ include file="../inc/header.jsp" %>
	<div id="contents" class="contents">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row">
				<br><br>
				<h2 class="tit">주문 내역</h2>
				<div class="panel-body">
					<table class="table">
						<thead><tr><th>연번</th><th>구입제품</th><th>결제금액</th><th>구입일</th></tr></thead>
						<tbody id="orderData">
							<c:if test="${salesList == null || empty salesList}">
								<tr><td colspan="4">구매하신 제품이 없습니다.</td><tr>
							</c:if>
							<c:if test="${salesList != null || !empty salesList}">
							<c:forEach items="${salesList}" var="sales" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td><a href="getSales.do?ono=${sales.ono}">${sales.gno }</a></td>
									<td>${sales.money }</td>
									<td>${sales.sdate }</td>
								</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				
<!-- 				<script>
				$(document).ready(function(){
					function orderDataLoding() {
						$("#orderData").empty();
						$.ajax({
							type:"post",
							url:"../sales/ajaxList.do",
							dataType:"json",
							success:function(salesList){
								$.each(salesList, function(i){
									String addData = "<tr>";
									addData += "<td>"+i+"</td>";
									addData += "<td>"+this.gno+"</td>";
									addData += "<td>"+this.money+"</td>";
									addData += "<td>"+this.sdate+"</td>";
									addData += "</tr>";
									$("#orderData").append(addData);
								});
							},
							error:function(salesList, status, err){
								$("#orderData").append("<tr><td colspan='4'>구매하신 제품이 없습니다.</td><tr>");
							}
						});
					}
					orderDataLoding();
				});
				</script> -->
		</div>
	</div>		
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>