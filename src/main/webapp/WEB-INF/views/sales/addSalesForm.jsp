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
<title>상품 구매하기</title>
<%@ include file="../inc/head.jsp" %>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<div id="contents" class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>		
			<h2 class="tit">상품 구매하기</h2>
			<form action="/myshop/sales/addSales.do" method="post" onsubmit="return salesCk(this)">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="gnum">상품코드</label></th>
							<td>
								<c:if test="${!empty bno }">
								<input type="hidden" name="bno" id="bno" value="${bno }">
								</c:if>
								<c:if test="${empty bno }">
								<input type="hidden" name="bno" id="bno" value="0">
								</c:if>
								<input type="hidden" name="gno" id="gno" value="${goods.gnum }">
								${goods.gnum }
							</td>
						</tr>
						<tr>
							<th><label for="title">상품명</label></th>
							<td>${goods.gname }</td>
						</tr>
						<tr>
							<th><label for="gprice">가격</label></th>
							<td>${goods.gprice }</td>
						</tr>
						<tr>
							<th><label for="amount">수량</label></th>
							<td>
								<c:if test="${empty gstock}">
								<input type="number" name="amount" id="amount" min="1" max="${goods.gstock }" value="1">
								</c:if>
								<c:if test="${!empty gstock}">
								<input type="number" name="amount" id="amount" min="1" max="${goods.gstock }" value="${gstock }">
								</c:if>
							</td>
						</tr>
						<tr>
							<th><label for="gprice">결제할 금액</label></th>
							<td><input type="hidden" name="money" id="money">
							<span id="money_res">${goods.gprice }</span></td>
						</tr>
						<tr>
							<th><label for="paytype">결제 방식</label></th>
							<td>
								<select name="payMe" id="payMe">
									<option>선택안함</option>
									<option value="credit">신용카드</option>
									<option value="check">체크카드</option>
									<option value="transfer">계좌이체</option>
								</select>
								<input type="hidden" id="pay_ck" name="pay_ck" />
								<input type="hidden" id="paytype" name="paytype" />
								<input type="hidden" id="payplace" name="payplace" />
								<input type="hidden" id="payno" name="payno" />
								<input type="button" id="payBtn" value="결제" onclick="payment()" class="btn btn-primary"> 
							</td>
						</tr>
						<tr>
							<th><label for="rname">받는 사람</label></th>
							<td><input type="text" name="rname" id="rname" class="single100" required></td>
						</tr>
						<tr>
							<th><label for="tel">받는 사람 연락처</label></th>
							<td><input type="tel" name="tel" id="tel" class="single100" required></td>
						</tr>
						<tr>
							<th><label for="addr_find">주소</label></th>
							<td>기본 주소 : <input type="text" name="addr1" id="addr1" class="single100" required><br><br>
								상세 주소 : <input type="text" name="addr2" id="addr2" class="single100" required><br><br>
								우편번호 :  <input type="text" name="postcode" id="postcode" class="single100" required>
								<button type="button" onclick="findAddr()" class="button btn-primary">주소찾기</button>
							</td>
						</tr>
						<tr>
							<th><label for="memo">기타 요청 사항</label></th>
							<td><textarea name="memo" id="memo" rows="2" cols="80"></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" class="btn btn-primary" value="상품 구매">
								<input type="reset" class="btn btn-primary" value="취소">
							</td>
						</tr>	
					</tbody>
				</table>
			</form>
			<script>
			function payment() {
				var paytype = document.getElementById("payMe").value;
				payPop = window.open("paypop.do", "결제", "width=400, height=300");
				payPop.document.getElementById("paytype").value = paytype;
			}
			function salesCk(f){
				var pay_ck = f.pay_ck.value;
				if(pay_ck != "yes"){
					alert("결제가 완료되지 않았습니다.");
					return false;
				}
				f.submit();
			}
			$(document).ready(function(){
				$("#amount").on("keyup input change", function(){
					var gstock = $(this).val();
					var money = gstock*${goods.gprice};
					$("#money").val(money);
					$("#money_res").html(money);
				}).keyup();
			});
			</script>
			<script>
			function findAddr() {
				new daum.Postcode({
					oncomplete: function(data) {
						console.log(data);
						var roadAddr = data.roadAddress;
						var jibunAddr = data.jibunAddress;
						document.getElementById("postcode").value = data.zonecode;
						if(roadAddr !== '') {
							document.getElementById("addr1").value = roadAddr;				
						} else if(jibunAddr !== ''){
							document.getElementById("addr1").value = jibunAddr;
						}
					}
				}).open();
			}
			</script>
			<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		</div>
	</div>		
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>