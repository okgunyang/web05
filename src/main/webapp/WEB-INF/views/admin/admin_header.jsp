<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
	                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                        <li><a class="dropdown-item" href="#!">All Products</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
	                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
	                    </ul>
	                </li>
					<c:if test="${member.id == 'admin' }">
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">상품관리</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                        <li><a class="dropdown-item" href="goodsList.do">상품목록</a></li>
	                        <li><a class="dropdown-item" href="cateForm.do">상품카테고리 관리</a></li>
	                        <li><a class="dropdown-item" href="addGoodsForm.do">상품등록</a></li>
	                    </ul>
	                </li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">고객관리</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                        <li><a class="dropdown-item" href="memberList.do">고객목록</a></li>
	                        <li><a class="dropdown-item" href="joinMemberForm.do">직권 고객 등록</a></li>
	                    </ul>
	                </li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">글 관리</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                        <li><a class="dropdown-item" href="noticeList.do">공지 사항 관리</a></li>
                   	        <li><a class="dropdown-item" href="reviewList.do">이용후기 관리</a></li>
	                        <li><a class="dropdown-item" href="qnaList.do">질문 및 답변 관리</a></li>	
	                     </ul>
	                </li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">판매 관리</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                        <li><a class="dropdown-item" href="salesList.do">판매목록</a></li>
                   	        <li><a class="dropdown-item" href="salesList.do">배송등록</a></li>
	                        <li><a class="dropdown-item" href="#!">배송업체 관리</a></li>	
	                     </ul>
	                </li>
	                </c:if>
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
					<li class="nav-item"><a class="nav-link" href="<%=path_hd %>/"><strong>일반 페이지로</strong></a></li>
	                </c:if>
	            </ul>
	            <form class="d-flex" style="min-width:120px">
	                <button class="btn btn-outline-dark" type="submit">
	                    <i class="bi-cart-fill me-1"></i>
	                    Cart
	                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
	                </button>
	            </form>
	        </div>
	    </div>
	</nav>
</header>