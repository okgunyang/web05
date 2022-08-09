<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="path1" value="{pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<%@ include file="../inc/head.jsp" %>
<style>
.tit { text-align:center; padding-top:2rem; padding-bottom:0.8rem; }
#myTable { height:278px; }
#myTable tr { height:30px; }
#myTable td { line-height:30px; height:30px; }
#myTable td:nth-child(1) { width:10%; }
#myTable td:nth-child(2) { width:80%; }
.paging { width:500px; height:80px; margin:20px auto; }
.paging td { text-align:center; line-height:80px; }
.paging .item1, .paging .item2, .paging .item4, .paging .item5 { width:12%; }
.paging .item3 { width:50%; }
</style>
</head>
<body>
<%@ include file="admin_header.jsp" %>
<div id="contents" class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>		
			<h2 class="tit">공지사항 목록</h2>
			<c:if test="${member.id == 'admin' }">
			<div class="row">
				<a href="addSmartNoticeForm.do" class="btn btn-primary" style="display:inline-block;">글쓰기</a>
			</div>
			</c:if>
			<div class="panel-body">
				<table class="table responsive" id="myTable">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${cnt gt 0 }">	
							<c:forEach items="${noticePageList}" var="notice" varStatus="status">
							<tr>
								<td>${notice.seq }</td>
								<td><a href="noticeRead.do?seq=${notice.seq}">${notice.title }</a></td>
								<td>${notice.regdate }</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3">게시판 글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<div class="row">
				<table class="paging">
					<tbody>
					<tr>
						<td class="item1">
							<c:if test="${page.curPage > 1}">
							<a href="javascript:;" onclick="list('1')">[처음]</a>
							</c:if>
						</td>
						<td class="item2">
							<c:if test="${page.curPage > 1}">
							<a href="javascript:;" onclick="list('${page.curPage-1}')">[이전]</a>
							</c:if>
						</td>
						<td class="item3">
						<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
							<c:choose>
								<c:when test="${num == page.curPage}">
									<span style="color:red; font-weight:bold">${num }</span>
								</c:when>
								<c:otherwise>
									<a href="javascript:;" onclick="list('${num }')">${num }</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</td>
						<td class="item4">
							<c:if test="${page.curBlock < page.totBlock}">
							<a href="javascript:;" onclick="list('${page.nextPage}')">[다음]</a>
							</c:if>
						</td>
						<td class="item5">
							&nbsp;<c:if test="${page.curPage < page.totPage}">
							<a href="javascript:;" onclick="list('${page.totPage}')">[끝]</a>
							</c:if>
						</td>
					</tr>
					</tbody>
				</table>
				<script>
				function list(page){
					location.href="../notice/pageList.do?curPage="+page;
				}
				</script>
			</div>
		</div>
	</div>
</div>
<div class="blank" style="min-height:350px"></div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>