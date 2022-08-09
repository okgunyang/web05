<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 보기</title>
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
				<h2 class="tit">상품 상세 정보</h2>
				<div class="panel-body">
				    <div class="row">
				        <div class="col-lg-6" id="fr1">
							<form action="updateGoods.do" method="post" onsubmit="return uploadCk(this)">
								<div class="form-group">
									<label for="gnum">상품명</label>
									<div class="input-group-append">
										<input type="hidden" name="gnum" id="gnum" value="${goods.gnum }" />
										<c:if test="${sid == 'admin' }">
										<input type="text" name="gname" id="gname" class="form-control" value="${goods.gname }" />
										</c:if>
									</div>	
								</div>
								<br>
								<c:if test="${sid == 'admin' }">
								<div class="form-group">
									<label for="ccode">카테고리 코드</label>
									<input type="text" name="ccode" id="ccode" class="form-control" value="${goods.ccode }" />
								</div>
								</c:if>
								<br>
								<div class="form-group">
									<label for="gprice">가격</label>
									<c:if test="${sid == 'admin' }">
									<input type="text" name="gprice" id="gprice" class="form-control" value="${goods.gprice }"/>
									</c:if>
								</div>
								<br>
								<div class="form-group">
									<label for="gstock">수량</label>
									<div>
										<c:if test="${sid == 'admin' }">
										<input type="number" name="gstock" id="gstock" class="form-control" value="${goods.gstock }" />
										</c:if>
									</div>
								</div>
								<br>
								<div class="form-group">
									<label for="gdes">설명</label>
									<div>
									<c:if test="${sid == 'admin' }">
									<textarea name="gdes" id="gdes" rows="2" cols="80">${goods.gdes }</textarea>
									</c:if>
									</div>
								</div>
								<br>
								<div class="form-group">
									<label for="gimg">상품 이미지</label>
									<div>
										<img src="../upload/${goods.gimg }" alt="${goods.gname }"/>
									</div>
									<c:if test="${sid == 'admin' }">
										<input type="text" name="gimg" id="gimg" class="form-control" value="${goods.gimg }" />
										<button type="button" id="uploadBtn" onclick="goodsUpload()">상품 이미지 업로드</button>
										<input type="hidden" id="upload_ck" name="uplaod_ck" />
									</c:if>
								</div>
								<br>
								<div class="form-group">
									<label for="regdate">입고일</label>
									<span>${goods.regdate }</span>
								</div>
								<br>
								<div class="form-group">
									<div class="text-right">
										<c:if test="${sid == 'admin' }">
										<button type="submit" class="btn btn-primary">상품 정보변경</button>
										<a href="deleteGoods.do?gnum=${goods.gnum }" class="btn btn-primary">상품 삭제</a>
										</c:if>
										<a href="goodsList.do" class="btn btn-primary">목록</a>
										<button type="reset" class="btn btn-primary">취소</button>
									</div>
								</div>
							</form>
							<c:if test="${sid == 'admin' }">
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
							</c:if>
						</div>
					</div>
				</div>		
			</div>
			<br><br><hr><br><br>
			<div class="blank" style="min-height:350px;"></div>
		</div>	
	</div>
	<%@ include file="../inc/footer.jsp" %>

</body>
</html>