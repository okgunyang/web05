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
<title>자료 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- 메타 데이터 -->
<!-- 파비콘 -->
<!-- 오픈그래프 -->
<!-- 폰트 -->
<!-- 필수 플러그인 -->
<script src="https://code.jquery.com/jquery-latest.js" crossorigin="anonymous"></script>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./inc/styles.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- Core theme JS-->
<script src="./inc/scripts.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="./inc/header.jsp" %>
<div class="contents">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row">
			<br><br>
			<h2>자료 목록</h2>
			<br><br><hr><br><br>
			<c:if test="${sid=='admin'}">
			<a href="databankForm.do" class="btn btn-primary">자료 등록</a>
			</c:if>
			<ul class="lst">
				<c:forEach items="${databankList }" var="databank" varStatus="status">
				<li>
					<a href="">
						<h5>${status.count }</h5>
						<h3>${databank.title }</h3>
						<div><a href="./upload/${databank.fileurl }">자료 다운로드</a></div>
						<p>${databank.author }</p>
					</a>
				</li>
				</c:forEach>
			</ul>
		</div>	
	</div>
</div>
<%@ include file="./inc/footer.jsp" %>
</body>
</html>