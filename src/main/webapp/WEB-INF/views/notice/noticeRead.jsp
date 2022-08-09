<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
<%@ include file="../inc/head.jsp" %>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<div id="contents" class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>		
			<h2 class="tit">공지사항 보기</h2>
			<form action="updateNotice.do" method="post">
			<table class="table">
				<tbody>
					<tr>
						<th><label for="title">제목</label></th>
						<td>
							<c:if test="${member.id == 'admin' }">
							<input type="hidden" name="seq" id="seq" value="${notice.seq}">
							<input type="text" name="title" id="title" size="100" class="single100" placeholder="글제목 입력" value="${notice.title}" required>
							</c:if>
							<c:if test="${member.id != 'admin' }">
							<span>${notice.title }</span>							
							</c:if>
						</td>
					</tr>
					<tr>
						<th><label for="content">내용</label></th>
						<td>
							<c:if test="${member.id == 'admin' }">
							<textarea name="content" id="content" cols="100" rows="8" class="multi100" placeholder="글 내용 입력" required>${notice.content }</textarea>
							</c:if>
							<c:if test="${member.id != 'admin' }">
							<p>${notice.content }</p>							
							</c:if>
						</td>
					</tr>
					<tr>
						<th><label for="nickname">작성자</label></th>							
						<td>
							<c:if test="${member.id == 'admin' }">
							<input type="text" name="nickname" id="nickname" size="40" class="single40" value="admin" readonly>
							</c:if>
							<c:if test="${member.id != 'admin' }">
							<p>${notice.nickname }</p>							
							</c:if>
						</td>
					</tr>
					<tr>
						<th>작성일</th>							
						<td>
							<p>${notice.regdate }</p>							
						</td>
					</tr>
					<tr>
						<th>읽은 횟수</th>							
						<td>
							<p>${notice.visited }</p>							
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<c:if test="${member.id == 'admin' }">
							<input type="submit" class="btn btn-primary" value="글 수정">
							<input type="reset" class="btn btn-primary" value="취소">
							<a href="deleteNotice.do?seq=${notice.seq}" class="btn btn-primary">글 삭제</a>
							</c:if>
							<a href="list.do?curPage=1" class="btn btn-primary">목록</a>
							<!-- <a href="pageList.do?curPage=1" class="btn btn-primary">목록</a>  -->
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