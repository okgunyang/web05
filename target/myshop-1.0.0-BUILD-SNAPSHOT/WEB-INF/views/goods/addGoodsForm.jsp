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
<title>상품 등록</title>
<%@ include file="../inc/head.jsp" %>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<div id="contents" class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>		
			<h2 class="tit">상품 등록</h2>
			<form action="addGoods.do" method="post" onsubmit="return uploadCk(this)">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="title">상품명</label></th>
							<td><input type="text" name="gname" id="gname" size="100" class="single100" placeholder="글제목 입력" required></td>
						</tr>
						<tr>
							<th><label for="navparam">대분류</label></th>
							<td>
								<select name="navparam" id="navparam">
								<c:set var="hh" value="0"/>
								<c:set var="sub" value="0"/>
								<c:forEach items="${navbarList }" var="cate">
									<c:set var="leng" value="${fn:length(cate.navparam) }"/>
									<c:if test="${leng eq 1 }">
										<option value="${cate.navparam }">${cate.navname }</option>
										<c:set var="hh" value="0" />
									</c:if>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="ccode">중분류</label></th>
							<td>
								<select name="ccode" id="ccode">
									<option value="">선택안함</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="gprice">가격</label></th>
							<td><input type="text" name="gprice" id="gprice" size="40" class="single40"></td>
						</tr>
						<tr>
							<th><label for="gstock">수량</label></th>
							<td><input type="number" name="gstock" id="gstock" min="1" max="1000"></td>
						</tr>
						<tr>
							<th><label for="uploadBtn">이미지</label></th>
							<td><input type="text" name="gimg" id="gimg" class="single100">
							<button type="button" id="uploadBtn" onclick="goodsUpload()">상품 이미지 업로드</button>
							<input type="hidden" id="upload_ck" name="uplaod_ck" />
							</td>
						</tr>
						<tr>
							<th><label for="gdes">상품 설명</label></th>
							<td><textarea name="gdes" id="gdes" rows="3" cols="80"></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" class="btn btn-primary" value="상품 등록">
								<input type="reset" class="btn btn-primary" value="취소">
							</td>
						</tr>	
					</tbody>
				</table>
			</form>
			<script>
			$(document).ready(function(){
				$("#navparam").change(function(){
					var navparam = $(this).val();
					$("#ccode").empty();
					$("#ccode").append("<option>선택안함</option>");
					$.ajax({
						url:"categoryLoading.do",
						type:"get",
						data:"navparam="+navparam, 
						dataType:"json",  //Controller에서 return 되는 반환값이 단순한 String이 아닐 경우 반드시 지정
						success:function(cateList){
							$.each(cateList, function(){
								$("#ccode").append("<option value='"+this.navparam+"'>"+this.navname+"</option>");
							});
							$("#ccode").find("option").eq(1).remove();
						},
						error:function(cateList, status, err){
							alert("데이터 로딩 실패");
						}
					});
				}).change();
			});
			</script>
			<script>
			var popwin;
			function goodsUpload(){
				popwin = window.open("goodsImgUploadForm.do", "이미지 업로드", "width=600, height=400");
			}
			
			function uploadCk(f){
				var gimg = f.gimg.value;
				var upload_ck = f.upload_ck.value;
				if(gimg=="" || upload_ck==""){
					alert("해당 데이터 업로드가 되지 않았습니다.");
					return false;
				}
			}
			</script>
		</div>
	</div>		
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>