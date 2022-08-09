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
<%@ include file="../inc/head.jsp" %>
<link rel="stylesheet" href="../inc/datatables.min.css" />
<script src="../inc/datatables.min.js"></script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<div id="contents" class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>		
			<h2 class="tit">구입 상품 보기</h2>
			<br><hr>
			<input type="hidden" name="ono" id="ono" value="${sales.ono }" />
			<div class="panel-body">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="ono">주문번호</label></th>
							<td>
								${sales.ono } 
							</td>
						</tr>
						<tr>
							<th><label for="paytype">결제정보</label></th>
							<td>
								<p><strong>결제 방식</strong> : ${sales.paytype }</p> 
								<p><strong>결제 기관</strong> : ${sales.payplace }</p>
								<p><strong>결제 카드(계좌) 번호</strong> : ${sales.payno }</p>
								<p><strong>구매 수량</strong> : ${sales.amount }</p>
								<p><strong>결제 금액</strong> : ${sales.money }</p>
								<p><strong>결제일</strong> : ${sales.sdate }</p>
							</td>
						</tr>
						<tr>
							<th><label for="gnum">주문 제품 정보</label></th>
							<td>
								<div>
									<input type="hidden" name="goodsinfo" id="goodsinfo" value="${sales.gno }" />
									<p id="gnum">제품 번호 : ${sales.gno }</p>
									<p id="gname">제품명 : </p>
									<p id="gprice">제품가격 : </p>
									<p>제품 사진 : <img src="" alt="" id="gimg" /></p>
								</div> 
							</td>
						</tr>
						<c:if test="${!empty sales.transno}">
						<tr>
							<th><label for="">배송정보</label></th>
							<td>
								<div>
									<p>배송코드 : ${sales.transno}</p>
									<p>배송업체 : ${sales.transco}</p>
									<p>수신상태 : ${sales.rstate}</p>
									<p>도착예정일 : ${sales.rdate}</p>
								</div>
							</td>
						</tr>
						</c:if>
						<c:if test="${empty sales.transno}">
						<tr>
							<td colspan="2">아직 배송정보가 없습니다.</td>
						</tr>
						</c:if>
						<tr>
							<td colspan="2">
								<a href="list.do" class="btn btn-primary">목록</a>
								<c:if test="${empty sales.transno }">
								<a href="deleteSales.do?ono=${sales.ono }" class="btn btn-primary">주문취소</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				<div>배송이 시작되면, 주문 취소가 불가능합니다.</div>
				<script>
				$(document).ready(function(){
					var gnum = document.getElementById("goodsinfo").value;
					function loadingGoods(){
						$.ajax({
							type:"get",
							url:"../goods/getAjaxGoods.do?gnum="+gnum,
							dataType:"json",
							success:function(goods){
								$("#gname").html("제품명 : "+goods.gname);
								$("#gprice").html("제품가격 : "+goods.gprice);
								$("#gimg").attr({"src":"../upload/"+goods.gimg,"alt":goods.gname});
							},
							error:function(goods, status, err){
								
							}
						});
					}
					loadingGoods();
				});
				</script>			
			</div>
		</div>
	</div>
	<div class="blank" style="min-height:350px"></div>		
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>

</body>
</html>