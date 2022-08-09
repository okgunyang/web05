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
<title>회원 가입</title>
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

	<%@ include file="../inc/header.jsp" %>
	<div id="contents" class="contents">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row">
				<br><br>		
				<h2 class="tit">마이 페이지</h2>
				<div class="panel-body">
				    <div class="row">
				        <div class="col-lg-6" id="fr1">
							<form action="updatePro.do" method="post" onsubmit="return joinConfirmMember(this)">
								<div class="form-group">
									<label for="id">아이디</label>
									<div class="input-group-append">
										<input name="id" id="id" class="form-control" value="${member.id }" readonly />
									</div>	
								</div>
								<br>
								<div class="form-group">
									<label for="pwd">비밀번호</label>
									<input type="password" name="pwd" id="pwd" class="form-control" required />
								</div>
								<br>
								<div class="form-group">
									<label for="pwd2">비밀번호 확인</label>
									<input type="password" name="pwd2" id="pwd2" class="form-control" required />
								</div>
								<br>
								<div class="form-group">
									<label for="uname">이름</label>
									<input type="text" name="uname" id="uname" class="form-control" value="${member.uname }" required />
								</div>
								<br>
								<div class="form-group">
									<label for="birth">생년월일</label>
									<span>${member.birth }</span>
									<input type="hidden" name="birth" id="birth" class="form-control" value="${member.birth }" required />
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
										<a href="deleteMember.do" class="btn btn-primary">탈퇴</a>
										<button type="reset" class="btn btn-primary">취소</button>
									</div>
								</div>
							</form>
							<script>
							function joinConfirmMember(f) {
								if(f.pwd.value!=f.pwd2.value) {
									alert("비밀번호와 비밀번호 확인이 다릅니다.");
									return false;
								}
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