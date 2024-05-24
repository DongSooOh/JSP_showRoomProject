<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>제품 등록</title>
	</head>
	<body>
		<div class="container py-4">
			<%@ include file="header.jsp" %>
			
			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">제품 등록</h1>
					<p class="col-md-8 fs-4">Product Addition</p>
				</div>	
			</div>
			
			<div class="row align-items-md-stretch">
				<form name="newProd" action="processAddProduct.jsp" method="post">
					<div class="mb-3 row">
						<label class="col-sm-2">제품 코드</label>
						<div class="col-sm-3">
							<input type="text" name="prodId" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">제품명</label>
						<div class="col-sm-3">
							<input type="text" name="name" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" name="price" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">설명</label>
						<div class="col-sm-3">
							<input type="text" name="description" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-3">
							<input type="text" name="instock" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="등록">
						</div> 
					</div>
				</form>
			</div>
			<jsp:include page="footer.jsp" />
		</div>
	</body>
</html>