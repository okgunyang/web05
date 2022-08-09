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
	    <div class="container px-4 px-lg-5">
	        <a class="navbar-brand" href="#!">KKT SHOP</a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	                <!-- <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li> -->
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">KKT Shop</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
	                        <li><a class="dropdown-item" href="#!">Intro</a></li>
	                        <li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/notice/list.do">Notice</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/notice/pageList.do?curPage=1">Notice2</a></li>
	                    </ul>
	                </li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown2" href="<%=path_hd %>/goods/prolist.do?navparam=A" role="button" data-bs-toggle="dropdown" aria-expanded="false">아우터</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown2">
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=A01">가디건/조끼</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=A02">야상/점퍼</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=A03">자켓/코트</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=A04">패딩</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=A05">플리스</a></li>
	                    </ul>
	                </li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown3" href="<%=path_hd %>/goods/prolist.do?navparam=B" role="button" data-bs-toggle="dropdown" aria-expanded="false">상의</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown3">
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=B01">긴팔티셔츠</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=B02">맨투맨</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=B03">후드</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=B04">반팔티셔츠</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=B05">민소매</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=B06">니트</a></li>
	                    </ul>
	                </li>    
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown4" href="<%=path_hd %>/goods/prolist.do?navparam=C" role="button" data-bs-toggle="dropdown" aria-expanded="false">셔츠/블라우스</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown4">
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=C01">여성용 블라우스</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=C02">남성용 블라우스</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=C03">여성용 Y셔츠 반팔</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=C04">여성용 Y셔츠 긴팔</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=C05">남성용 Y셔츠 반팔</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=C06">남성용 Y셔츠 긴팔</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=C07">남녀공용 Y셔츠</a></li>
	                    </ul>
	                </li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown5" href="<%=path_hd %>/goods/prolist.do?navparam=D" role="button" data-bs-toggle="dropdown" aria-expanded="false">트레이닝</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown5">
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=D01">남성용</a></li>
						</ul>
					</li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown6" href="<%=path_hd %>/goods/prolist.do?navparam=E" role="button" data-bs-toggle="dropdown" aria-expanded="false">베이직</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown6">
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=E01">남성용</a></li>
						</ul>
					</li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown7" href="<%=path_hd %>/goods/prolist.do?navparam=F" role="button" data-bs-toggle="dropdown" aria-expanded="false">원피스</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown7">
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=F01">남성용</a></li>
						</ul>
					</li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown8" href="<%=path_hd %>/goods/prolist.do?navparam=G" role="button" data-bs-toggle="dropdown" aria-expanded="false">스커트</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown8">
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=G01">남성용</a></li>
						</ul>
					</li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown9" href="<%=path_hd %>/goods/prolist.do?navparam=H" role="button" data-bs-toggle="dropdown" aria-expanded="false">팬츠</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown9">
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=H01">남성용</a></li>
						</ul>
					</li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown10" href="<%=path_hd %>/goods/list.do" role="button" data-bs-toggle="dropdown" aria-expanded="false">기타</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown10">
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/list.do">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=I">가방</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=J">신발</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=K">악세사리</a></li>
	                        <li><a class="dropdown-item" href="<%=path_hd %>/goods/prolist.do?navparam=L">기타</a></li>
						</ul>
					</li>
	            </ul>
	            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	            	<c:if test="${member == null }">
	                <li class="nav-item"><a class="nav-link" href="<%=path_hd %>/member/loginForm.do"><strong>Login</strong></a></li>
	                <li class="nav-item"><a class="nav-link" href="<%=path_hd %>/member/joinForm.do"><strong>join</strong></a></li>
	                </c:if>
	               	<c:if test="${member != null }">
					<li class="nav-item"><a class="nav-link" href="<%=path_hd %>/member/logout.do"><strong>Logout</strong></a></li>
	                <li class="nav-item"><a class="nav-link" href="<%=path_hd %>/member/mypage.do"><strong>mypage</strong></a></li>
	                <li class="nav-item"><a class="nav-link" href="<%=path_hd %>/service/sendEmail.do"><strong>Contact</strong></a></li>
	                </c:if>
	               	<c:if test="${member.id == 'admin' }">
					<li class="nav-item"><a class="nav-link" href="<%=path_hd %>/admin/admin.do"><strong>관리자 페이지로</strong></a></li>
	                </c:if>
	            </ul>
	            <c:if test="${member.id != null}">
	            <form class="d-flex">

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
	</nav>
	<div>

	</div>
</header>