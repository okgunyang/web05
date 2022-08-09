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
			<h2 class="tit">${cate_tit}</h2>
			<c:if test="${member.id == 'admin' }">
			<div class="btn-frame">
				<br>
				<a href="addGoodsForm.do" class="btn btn-primary" style="display:inline-block;">상품 등록</a>
				<br><p></p>
			</div>
			</c:if>
			<br><hr>
			<div class="panel-body">
				<ul class="list" id="myList">
					<c:choose>
						<c:when test="${cnt > 0 }">	
							<c:forEach items="${goodsList}" var="goods" varStatus="status">
							<li>
								<p style="display:none">${status.count }</p>
								<a href="getGoods.do?gnum=${goods.gnum}">
									<h3 class="cate_tit">${goods.gname }</h3>
									<img src="../upload/${goods.gimg }" alt="${goods.gname }" class="cate_img"/>
									<p class="cate_comment">상품 설명 : ${goods.gdes }</p>
									<c:if test="${goods.gstock > 0}">
									<span class="cate_stock">남은 수량 : ${goods.gstock }</span>
									</c:if>
									<c:if test="${goods.gstock <= 0}">
									<span class="cate_stock">품절</span>
									</c:if>
								</a>
								<p style="display:none">${goods.regdate }</p>
								<c:if test="${goods.gstock > 0}">
								<a href="../sales/addSalesForm.do?gno=${goods.gnum}" class="btn important-btn">구매</a>
								</c:if>
								<c:if test="${goods.gstock <= 0}">
								<a href="#" class="btn important-btn">구매 불가</a>
								</c:if>
							</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li>
								<p>등록된 제품이 없습니다.</p>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
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