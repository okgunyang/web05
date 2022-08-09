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
	<%@ include file="../inc/header.jsp" %>
	<div id="contents" class="contents">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row">
				<br><br>		
				<h2 class="tit">상품 상세 정보</h2>
				<div class="panel-body">
				    <div class="row">
				        <div class="col-lg-6" id="fr1">
							<c:if test="${sid == 'admin' }">
							<form action="updateGoods.do" method="post" onsubmit="return uploadCk(this)">
							</c:if>
							<c:if test="${sid != 'admin' }">
							<form action="../sales/addSalesForm.do" method="post">
							</c:if>
								<div class="form-group">
									<label for="gnum">상품명</label>
									<div class="input-group-append">
										<input type="hidden" name="gnum" id="gnum" value="${goods.gnum }" />
										<c:if test="${sid == 'admin' }">
										<input type="text" name="gname" id="gname" class="form-control" value="${goods.gname }" />
										</c:if>
										<c:if test="${sid != 'admin' }">
										<input type="hidden" name="gname" id="gname" value="${goods.gname }"/>
										<span>${goods.gname }</span>
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
								<c:if test="${sid != 'admin' }">
								<input type="hidden" name="ccode" id="ccode" value="${goods.ccode }"/>
								</c:if>
								<br>
								<div class="form-group">
									<label for="gprice">가격</label>
									<c:if test="${sid == 'admin' }">
									<input type="text" name="gprice" id="gprice" class="form-control" value="${goods.gprice }"/>
									</c:if>
									<c:if test="${sid != 'admin' }">
									<span>${goods.gprice }</span>
									<input type="hidden" name="gprice" id="gprice" value="${goods.gprice }"/>
									</c:if>
								</div>
								<br>
								<div class="form-group">
									<label for="gstock">수량</label>
									<div>
										<c:if test="${sid == 'admin' }">
										<input type="number" name="gstock" id="gstock" class="form-control" value="${goods.gstock }" />
										</c:if>
										<c:if test="${sid != 'admin' && goods.gstock >= 1}">
										<input type="number" name="gstock" id="gstock" class="form-control" min="1" max="${goods.gstock }" value="1" required/>
										</c:if>
										<c:if test="${sid != 'admin' && goods.gstock < 1}">
										<span>품절</span>
										</c:if>
									</div>
								</div>
								<br>
								<div class="form-group">
									<label for="gdes">설명</label>
									<div>
									<c:if test="${sid != 'admin' }">
									<span>${goods.gdes }</span>
									</c:if>
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
										<c:if test="${sid != 'admin' && (!empty sid) && goods.gstock >= 1 && empty bno }">
										<button type="submit" class="btn btn-primary">구매</button>
										<a href="javascript:addCartPro()" class="btn btn-primary">장바구니 담기</a>
										</c:if>
										<c:if test="${sid != 'admin' && (!empty sid) && goods.gstock >= 1 && !empty bno }">
										<button type="button" onclick="salesTrans()" class="btn btn-primary">구매하기</button>
										<a href="javascript:deleteCartPro()" class="btn btn-primary">장바구니 삭제</a>
										</c:if>
										<c:if test="${sid == 'admin' }">
										<button type="submit" class="btn btn-primary">상품 정보변경</button>
										<a href="deleteGoods.do?gnum=${goods.gnum }" class="btn btn-primary">상품 삭제</a>
										</c:if>
										<a href="list.do" class="btn btn-primary">목록</a>
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
							<script>
							function salesTrans() {
								var gstock = document.getElementById("gstock").value;
								console.log(gstock);
								location.href="../sales/addSalesCartForm.do?gno="+${goods.gnum }+"&bno="+${bno}+"&gstock="+gstock;
							}
							function addCartPro(){
								var amount = parseInt(document.getElementById("gstock").value);
								var gno = document.getElementById("gnum").value;
								if(amount<1 || amount>${goods.gstock}) {
									alert("장바구니 수량이 맞지 않습니다.");
									return false;
								}
								location.href = "../cart/addCart.do?gno="+gno+"&amount="+amount;
							}
							function deleteCartPro(){
								location.href = "../cart/deleteCart.do?bno="+${bno};
							}							
							</script>
						</div>
					</div>
				</div>		
			</div>
			<br><br><hr><br><br>
			<div class="row" style="width:640px; margin:0 auto;">
				<table class="table">
					<tbody id="review_area">
						<c:forEach items="${reviewList }" var="review" varStatus="status">
						<tr>
							<td><a href="../review/getReview.do?uno=${review.uno}">${review.subject }</a></td>
							<td>${review.regdate }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${reviewCk=='yes'}">
				<button type="button" onclick="addReviewFormLoading()" class="btn btn-primary">이용후기 남기기</button>
				</c:if>
			</div>
			<script>
			function addReviewFormLoading() {
				var gnum = document.getElementById("gnum").value
				location.href = "../review/addReviewForm.do?gnum="+gnum;	
			}
			</script>
			<div class="blank" style="min-height:350px;"></div>
		</div>	
	</div>
	<%@ include file="../inc/footer.jsp" %>

</body>
</html>