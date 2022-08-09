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
<%@ include file="admin_header.jsp" %>
<div id="contents" class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>		
			<h2 class="tit">상품 구매하기</h2>
			<form action="addShuttle.do" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="gnum">판매코드</label></th>
							<td>
								<input type="text" name="ono" id="ono" value="${sales.ono }" readonly>
							</td>
						</tr>
						<tr>
							<th><label for="amount">수량</label></th>
							<td>
								<input type="text" name="amount" id="amount" value="${sales.amount }" readonly>
							</td>
						</tr>
						<tr>
							<th><label for="money">결제 금액</label></th>
							<td><input type="text" name="money" id="money" value="${sales.money }" readonly></td>
						</tr>
						<tr>
							<th><label for="paytype">결제 정보</label></th>
							<td>
								<input type="text" id="paytype" name="paytype" value="${sales.paytype }" readonly/>
								<input type="text" id="payplace" name="payplace" value="${sales.payplace }" readonly/>
								<input type="text" id="payno" name="payno" value="${sales.payno }" readonly/> 
							</td>
						</tr>
						<tr>
							<th><label for="rname">수신자 정보</label></th>
							<td>수신자명 : <input type="text" name="rname" id="rname" class="single100" value="${sales.rname }" readonly><br><br>
								연락처 : <input type="text" name="tel" id="tel" class="single100" value="${sales.tel }" readonly><br><br>
								기본 주소 : <input type="text" name="addr1" id="addr1" class="single100" value="${sales.addr1 }" readonly><br><br>
								상세 주소 : <input type="text" name="addr2" id="addr2" class="single100" value="${sales.addr2 }" readonly><br><br>
								우편번호 :  <input type="text" name="postcode" id="postcode" class="single100" value="${sales.postcode }" readonly>
							</td>
						</tr>
						<tr>
							<th><label for="transno">배송코드</label></th>
							<td>
								<c:if test="${empty sales.transno}">
								<input type="text" name="transno" id="transno" class="single100" required>
								</c:if>
								<c:if test="${!empty sales.transno}">
								<input type="text" name="transno" id="transno" class="single100" value="${sales.transno }" readonly>
								</c:if>
							</td>
						</tr>
						<tr>
							<th><label for="transco">배송사</label></th>
							<td>
								<c:if test="${empty sales.transco}">
								<input type="text" name="transco" id="transco" class="single100" required>
								</c:if>
								<c:if test="${!empty sales.transco}">
								<input type="text" name="transco" id="transco" class="single100" value="${sales.transco }" readonly>
								</c:if>
							</td>
						</tr>
						<tr>
							<th><label for="rstate">배송상태</label></th>
							<td>
								<select name="rstate" id="rstate">
									<option value="start">배송시작</option>
									<option value="mid">배송중</option>
									<option value="end">배송완료</option>
								</select>
								<c:if test="${!empty sales.rstate}">
								<input type="text" name="rstate1" id="rstate1" class="single100" value="${sales.rstate}" required>
								</c:if>
							</td>
						</tr>
						<tr>
							<th><label for="rdate">도착 예정일</label></th>
							<td>
								<c:if test="${empty sales.rdate}">
								<input type="date" name="rdate" id="rdate" class="single100" required>
								</c:if>
								<c:if test="${!empty sales.rdate}">
								<input type="text" name="rdate" id="rdate" class="single100" value="${sales.rdate}" required>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" class="btn btn-primary" value="배송 등록">
								<input type="reset" class="btn btn-primary" value="취소">
							</td>
						</tr>	
					</tbody>
				</table>
			</form>
		</div>
	</div>		
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>