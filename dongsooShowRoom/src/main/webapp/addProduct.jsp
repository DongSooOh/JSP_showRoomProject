<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="./resources/js/validation.js"></script>
		<meta charset="UTF-8">
		<title>제품 등록</title>
	</head>
	<body>
		<%@ include file="header.jsp" %>
		<div class="container py-4">			
			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">제품 등록</h1>
					<p class="col-md-8 fs-4">Product Addition</p>
				</div>
				<a href="logout.jsp" class="btn btn-sm btn-success pull right">logout</a>
			</div>
			
			<div class="row align-items-md-stretch">
				<form name="newProd" action="${contextPath}/processAddProduct.do" method="post" enctype="multipart/form-data">
					<div class="mb-3 row">
						<label class="col-sm-2">제품 코드</label>
						<div class="col-sm-3">
							<input type="text" id="prodId" name="prodId" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">제품명</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="price" name="price" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">설명</label>
						<div class="col-sm-3">
							<input type="text" id="description" name="description" class="form-control">
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
							<input type="text" id="instock" name="instock" class="form-control">
						</div>
					</div>
					<div>
						<p>제품 사진 <input type="file" name="filename"></p>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProd()">
						</div> 
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</body>
</html>