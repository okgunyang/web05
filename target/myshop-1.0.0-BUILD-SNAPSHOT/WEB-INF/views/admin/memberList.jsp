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
<title>상품 목록</title>
<%@ include file="../inc/head.jsp" %>
<link rel="stylesheet" href="../inc/datatables.min.css" />
<script src="../inc/datatables.min.js"></script>
<style>
.list { list-style:none; }
.list li { float:left; width:33.33333%; height:600px; box-sizing:border-box; margin-bottom:20px; 
overflow:hidden; }
.list li a { display:block; margin:10px; color:#333; text-decoration:none; }
.cate_tit { line-height:1.6;  padding-top:1rem; text-overflow:ellipsis; white-space:nowrap; overflow:hidden;
text-align:center;  }
.cate_comment { line-height:1.6;  padding-left:1rem; text-overflow:ellipsis; white-space:nowrap; overflow:hidden;
padding-right:2rem; padding-top:1rem; }
.cate_stock { display:block; padding-left:1rem; }
.cate_img { display:block; width:auto; height:356px; margin:0 auto; }
.btn.btn-primary { display:inline-block; max-width:120px; }
.btn.important-btn { background-color:deepskyblue; color:#fff; display:inline-block; max-width:100px; }
.table { } 
</style>
</head>
<body>
<%@ include file="admin_header.jsp" %>
<div id="contents" class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>		
			<h2 class="tit">회원 목록</h2>
			<div class="btn-frame">
				<br>
				<a href="joinMemberForm.do" class="btn btn-primary" style="display:inline-block; min-width:160px;">회원 직권 등록</a>
				<br><p></p>
			</div>
			<br><hr>
			<div class="panel-body">
				<table class="table" id="myTable">
					<tbody>
					<c:choose>
						<c:when test="${cnt > 0 }">	
							<c:forEach items="${memberList}" var="member" varStatus="status">
							<tr>
								<td><p>${status.count }</p></td>
								<td><a href="getMember.do?id=${member.id}">
									<p class="cate_tit">${member.id }</p>
								</a></td>	
								<td><p class="cate_tit">${member.uname }</p></td>
								<td><p>${member.regdate }</p></td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4"><p>등록된 회원이 없습니다.</p></td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<script>
			$(function(){
				$("#myTable").DataTable();
			});
			</script>
		</div>
	</div>
	<div class="blank" style="min-height:350px"></div>		
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>