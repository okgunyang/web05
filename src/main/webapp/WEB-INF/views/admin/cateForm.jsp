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
<title>카테고리 등록</title>
<%@ include file="../inc/head.jsp" %>
</head>
<body>
<%@ include file="admin_header.jsp" %>
<div id="contents" class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>
			<hr>
			<div style="color:red; font-size:24px; font-weight:bold;">※ 해당 카테고리 클릭시 카테고리에서 자동으로 삭제되어 메뉴에 나타나지 않으니 유의하시기 바랍니다.</div>
			<button type="button" id="menu_btn">카테고리 보이기</button>
			<script>
			$(document).ready(function(){
				$("#category").css("display","none");
				var sw = true;
				$("#menu_btn").click(function(){
					if(sw){
						$("#category").slideDown();
						$(this).text("카테고리 숨기기");
					} else {
						$("#category").slideUp();
						$(this).text("카테고리 보이기");
					}
					sw = !sw;
				});
			});
			</script> 
			<br><br><br>
			<ul class="lst" id="category">
				<c:forEach items="${navbarList}" var="nav" varStatus="status">
				<c:if test="${nav.dept==0 }">
				<br><hr style="clear:both"><br>
				<li class="lst-item" style="min-width:150px; clear:both; ">
					<p>깊이 : ${nav.dept}</p>
					<p>메뉴명 : ${nav.navname}</p>
					<p>분류코드 : ${nav.navparam}</p>					
				</li>
				</c:if>
				<c:if test="${nav.dept!=0 }">
				<li class="lst-item" style="min-width:200px; float:left;">
					<button type="button" class="del_click" onclick="delCate(${nav.idx})" style="cursor:pointer; color:deepskyblue; font-weight:bold;">
						<p>깊이 : ${nav.dept}</p>
						<p>메뉴명 : ${nav.navname}</p>
						<p>분류코드 : ${nav.navparam}</p>
					</button>
				</li>
				</c:if>
				</c:forEach>
	        </ul>
			
			<br><br><hr><br><br>		
			<h2 class="tit">카테고리 등록</h2>
			<form action="addCate.do" method="post" onsubmit="return navCommit(this)">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="navparam">분류 단계</label></th>
							<td>
								<select name="dept" id="dept" required>
										<option value="0">대분류</option>
										<option value="1">중분류</option>
										<!-- <option value="2">소분류</option> -->
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="navparam">분류코드</label></th>
							<td>
								<input type="text" name="navparam" id="navparam" required>
								<button type="button" class="btn btn-primary" onclick="navCk()">중복 확인</button>
								<input type="hidden" name="nav_ck" id="nav_ck">
							</td>
						</tr>
						<tr>
							<th><label for="navname">메뉴명</label></th>
							<td><input type="text" name="navname" id="navname" size="40" class="single40" required></td>
						</tr>
						<tr>
							<th><label for="navurl">메뉴 주소</label></th>
							<td><input type="text" name="navurl" id="navurl" required></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" class="btn btn-primary" value="카테고리 등록">
								<input type="reset" class="btn btn-primary" value="취소">
							</td>
						</tr>	
					</tbody>
				</table>
			</form>
			<script>
				function navCommit(f){
					if(f.nav_ck.value!="ok"){
						alert("상품 분류 코드의 중복 확인을 하지 않으셨습니다.");
						return false;
					}
				}
				
				function navCk(){
					var navParam = $("#navparam").val();
					if(navParam==""){
						alert("상품 분류 코드를 입력하지 않으셨습니다.");
						return false;
					}
					$.ajax({
						type:"get",
						url:"checkNav.do?navparam="+navParam,
						//dataType:'json',
						success:function(data){
							if(data=='ok'){
								$("#nav_ck").val("ok");
								alert("사용이 가능한 분류코드입니다.");
							} else {
								alert("사용이 불가능한 분류코드입니다.");
							}
						},
						error:function(data, status, err){
							alert("분류코드 조회 오류입니다.");
						}
					});
				}
				
				function delCate(idx){
					location.href = "delCate.do?idx="+idx;
				}
			</script>
		</div>
	</div>		
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>