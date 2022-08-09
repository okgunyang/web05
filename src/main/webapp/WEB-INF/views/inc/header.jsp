<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kktshop.dto.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <c:set var="path_hd" value="{pageContext.request.contextPath }" /> --%>
<%
	String path_hd = request.getContextPath();
%>
<header id="header" class="header">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <div class="container px-4 px-lg-5" style="min-width:90%;">
	        <a class="navbar-brand" href="/myshop/">KKT SHOP</a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" id="gnb">
	                <!-- <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li> -->
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">KKT Shop</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
	                        <li><a class="dropdown-item" href="#!">Intro</a></li>
	                        <li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/newGoodsLoading.do">Popular Items</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/notice/list.do">Notice</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/notice/pageList.do?curPage=1">Notice2</a></li>
	                      	<li><a class="dropdown-item" href="<%=path_hd %>/qna/list.do">묻고 답하기</a></li>
	                      	<li><a class="dropdown-item" href="<%=path_hd %>/contact/onlineCounselForm.do">온라인 상담</a></li>
	                      	<li><a class="dropdown-item" href="<%=path_hd %>/databankList.do">자료실</a></li>
	                    </ul>
	                </li>
	         	<!-- ajax로 여기에 상품 카테고리 메뉴 추가 -->
	            </ul>
	            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	            	<c:if test="${member == null }">
	                <li class="nav-item"><a class="nav-link" href="<%=path_hd %>/member/loginForm.do"><strong>Login</strong></a></li>
	                <li class="nav-item"><a class="nav-link" href="<%=path_hd %>/member/joinForm.do"><strong>join</strong></a></li>
	                </c:if>
	               	<c:if test="${member != null }">
					<li class="nav-item"><a class="nav-link" href="<%=path_hd %>/member/logout.do"><strong>Logout</strong></a></li>
					</c:if>
					<c:if test="${member != null && member.id != 'admin'}">
	                <li class="nav-item"><a class="nav-link" href="<%=path_hd %>/member/mypage.do"><strong>mypage</strong></a></li>
	                <li class="nav-item"><a class="nav-link" href="<%=path_hd %>/sales/list.do"><strong>구입 목록</strong></a></li>
	                </c:if>
	               	<c:if test="${member.id == 'admin' }">
					<li class="nav-item" style="min-width:150px"><a class="nav-link" href="<%=path_hd %>/admin/admin.do"><strong>관리자 페이지로</strong></a></li>
	                </c:if>
	            </ul>
	            <c:if test="${member.id != null}">
	            <form class="d-flex" style="min-width:120px">
	                <a class="btn btn-outline-dark" href="/myshop/cart/list.do">
	                    <i class="bi-cart-fill me-1"></i>
	                    Cart
	                    <span class="badge bg-dark text-white ms-1 rounded-pill" id="cartCount"></span>
	                </a>
	            </form>
				</c:if>
	        </div>
	    </div>
	    <c:if test="${member.id != null}">
	    <script>
	    $(document).ready(function(){
	    	function cartCount() {
		    	$.ajax({
		    		url:"/myshop/cart/cartCount.do",
		    		type:"get",
		    		dataType:"json",
		    		success:function(data){
		    			if(data.toString()>0){
		    				$("#cartCount").html(data.toString());
		    				console.log(data.toString());
		    			} else {
		    				$("#cartCount").html(0);
		    			}
	    				console.log(data);
		    		},
		    		error:function(data, status, err){
		    			alert("데이터 로딩 실패");
		    		}
		    	});
	    	}
	    	cartCount();
	    });
	    </script>
	    </c:if>
		<script>
		$(document).ready(function(){
			function navCall() {
				var cnt = 1;
				$("#gnb").find("li.nav-item:gt(0)").remove();
				$.ajax({
					url:"/myshop/goods/navLoading.do",
					type:"post", 
					dataType:"json",  //Controller에서 return 되는 반환값이 단순한 String이 아닐 경우 반드시 지정
					success:function(navList){
						$.each(navList, function(){
							if(this.navparam.length < 2) {
								cnt++;
								$("#gnb").append("<li class='nav-item dropdown'></li>");
								$("#gnb").find("li.nav-item:last-child").append("<a class='nav-link dropdown-toggle' id='navbarDropdown"+cnt+"' href='<%=path_hd %>/goods/prolist.do?navparam="+this.navparam+"' role='button' data-bs-toggle='dropdown' aria-expanded='false'>"+this.navname+"</a>");
								$("#gnb").find("li.nav-item:last-child").append("<ul class='dropdown-menu' aria-labelledby='navbarDropdown"+cnt+"'></ul>");
								$("#gnb").find("li.nav-item:last-child ul.dropdown-menu").append("<li><a class='dropdown-item' href='<%=path_hd %>/goods/prolist.do?navparam="+this.navparam+"'>All Category</a></li>");
							} else {
								$("#gnb").find("li.nav-item:last-child ul.dropdown-menu").append("<li><a class='dropdown-item' href='<%=path_hd %>/goods/prolist.do?navparam="+this.navparam+"'>"+this.navname+"</a></li>");
							}
						});
					},
					error:function(cateList, status, err){
						alert("데이터 로딩 실패");
					}
				});
			}
			navCall();
		});
		</script>
	</nav>
	<div>

	</div>
</header>