<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<%@ include file="../inc/head.jsp" %>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>
<%@ include file="admin_header.jsp" %>
<div id="contents" class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>		
			<h2 class="tit">공지사항 등록</h2>
			<div class="example">
				<div class="mb-3" style="width:80%; margin:0 auto;">
					<form action="addSmartNotice.do" method="post">
						<table class="table">
							<tbody>
								<tr>
									<th><label for="title">제목</label></th>
									<td><input type="text" name="title" id="title" size="100" class="single100" placeholder="글제목 입력" required></td>
								</tr>
								<tr>
									<th><label for="exampleTextarea1" class="form-label">글 내용</label></th>
									<td><textarea class="form-control" name="content" id="ckeditor" rows="6"></textarea></td>
								</tr>
								<tr>
									<th><label for="nickname">작성자</label></th>
									<td><input type="text" name="nickname" id="nickname" size="40" class="single40" value="admin" readonly></td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" class="btn btn-primary" value="글 등록">
										<input type="reset" class="btn btn-primary" value="취소">
									</td>
								</tr>	
							</tbody>
						</table>
					</form>	
					<script>
					$(function(){
						CKEDITOR.replace('ckeditor', {width:"100%", height:"400px", filebrowserUploadUrl:"fileupload.do"});
					});
					</script>
				</div>
			</div>
		</div>
	</div>		
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>