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
<title>온라인 상담</title>
<%@ include file="../inc/head.jsp" %>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<div class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>		
			<h2 class="tit">온라인 상담</h2>
			<br><br><hr><br><br>
			<form action="onlineCounsel.do" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="from">보내는 사람</label></th>
							<td>
								<c:if test="${empty sid }">
								<input type="email" name="from" id="from" size="100" class="single100" placeholder="보내는 사람 이메일 주소" required>
								</c:if>
								<c:if test="${!empty sid }">
								<input type="email" name="from" id="from" size="100" class="single100" placeholder="보내는 사람 이메일 주소" value="${member.email }" required>
								</c:if>
							</td>
						</tr>
						<tr>
							<th><label for="to">받는 사람</label></th>
							<td>
								<input type="email" name="to" id="to" size="100" class="single100" placeholder="받는 사람 이메일 주소" value="kkt09072@naver.com" required readonly>
							</td>
						</tr>
						<tr>
							<th><label for="title">상담 제목</label></th>
							<td>
								<input type="text" name="title" id="title" size="100" class="single100" placeholder="이메일 제목 입력" required>
							</td>
						</tr>
						<tr>
							<th><label for="content">상담 제목</label></th>
							<td>
								<textarea name="content" id="content" cols="100" rows="2"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" class="btn btn-primary" value="상담 전송" />
								<input type="reset" class="btn btn-primary" value="취소" />
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
</body>
</html>