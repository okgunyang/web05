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
<title>회원 상세 정보</title>
<%@ include file="../inc/head.jsp" %>
<style>
form:label { display:inline-block; }
</style>
<script>
$(document).ready(function(){
	$("#frm1").css("z-index","1000");
});
</script>
<style>
.tit { padding-top:1em; }
</style>
</head>
<body>

	<%@ include file="admin_header.jsp" %>
	<div id="contents" class="contents">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row">
				<br><br>		
				<h2 class="tit">회원 정보 상세보기</h2>
				<div class="panel-body">
				    <div class="row">
				        <div class="col-lg-6" id="fr1">
							<form action="memberUpdate.do" method="post">
								<div class="form-group">
									<label for="id">아이디</label>
									<div class="input-group-append">
										<input name="id" id="id" class="form-control" value="${member.id }"/>
									</div>	
								</div>
								<br>
								<div class="form-group">
									<label for="pwd">비밀번호</label>
									<input type="password" name="pwd" id="pwd" class="form-control" value="${member.pwd }" required />
									<button type="button" class="btn btn-primary" onclick="passwordInitial()">비밀번호 초기화</button>
								</div>
								<br>
								<div class="form-group">
									<label for="uname">이름</label>
									<input type="text" name="uname" id="uname" class="form-control" value="${member.uname }" required />
								</div>
								<br>
								<div class="form-group">
									<label for="birth">생년월일</label>
									<input type="text" name="birth" id="birth" class="form-control" value="${member.birth }" required />
								</div>
								<br>
								<div class="form-group">
									<label for="phone">전화번호</label>
									<input type="tel" name="phone" id="phone" class="form-control" value="${member.phone }" required />
								</div>
								<br>
								<div class="form-group">
									<label for="email">이메일</label>
									<input type="email" name="email" id="email" class="form-control" value="${member.email }" required />
								</div>
								<div class="form-group">
									<label for="regdate">가입일</label>
									<input type="text" name="regdate" id="regdate" class="form-control" value="${member.regdate }" disabled />
								</div>
								<br>
								<div class="form-group">
									<div class="text-right">
										<button type="submit" class="btn btn-primary">정보수정</button>
										<a href="deleteMember.do?id=${member.id}" class="btn btn-primary">강제 탈퇴</a>
										<button type="reset" class="btn btn-primary">취소</button>
									</div>
								</div>
							</form>
							<script>
							function passwordInitial() {
								$("#pwd").attr("type","text");
								$("#pwd").val(prompt("변경할 비밀번호를 입력해주시기 바랍니다."));
							}
							</script>
						</div>
					</div>
				</div>		
				<hr>
			</div>
			<div class="blank" style="min-height:350px;"></div>
		</div>	
	</div>
	<%@ include file="../inc/footer.jsp" %>

</body>
</html>