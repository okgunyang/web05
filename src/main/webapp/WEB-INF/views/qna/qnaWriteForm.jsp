<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>질문하기</title>
<%@ include file="../inc/head.jsp" %>
<link rel="stylesheet" href="${path1 }/inc/reset.css">
<link rel="stylesheet" href="${path1 }/inc/common.css">
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<%@ include file="../inc/visual.jsp" %>
<article id="con" class="content">
	<h2 class="page_tit">질문하기</h2>
	<form action="${path1 }/qna/insert.do" method="post">
	<div class="table_form_wrap">
		<table class="table_form">
			<tbody>
				<tr>
					<th><label for="qtitle">제목</label></th>
					<td><input type="text" name="qtitle" id="qtitle" size="100" class="single100" placeholder="글제목 입력" required></td>
				</tr>
				<tr>
					<th><label for="qcontent">내용</label></th>
					<td><textarea name="qcontent" id="qcontent" cols="100" rows="8" class="multi100" placeholder="글 내용 입력" required></textarea></td>
				</tr>
				<tr>
					<th><label for="qwriter">작성자</label></th>
					<td><input type="text" name="qwriter" id="qwriter" size="40" class="single40" value="${sid }" readonly></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="btn btn-writer" value="질문하기">
						<input type="reset" class="btn btn-primary" value="취소">
					</td>
				</tr>	
			</tbody>
		</table>
	</div>
	</form>
</article>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>