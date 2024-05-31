<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="store.Product, store.ProductRepository" %>
<%@ page errorPage="exceptionNoProdId.jsp" %>   
<jsp:useBean id="prodBean" class="store.ProductRepository" scope="session" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
		<title>Product</title>
		<style>
			.info-box {
				padding:10px;
				background-color: black;
				color: white;
			}
			.img {
				margin: 20px 0;
			}
			.prod-box {
				padding: 10px;
				background-color: #ccc; 
			}
			a { text-decoration: none; color: black; }
		</style>
	</head>
	<body>
		<div class="container1-1">
			<!-- 머리글 -->
			<%@ include file="header.jsp"%>
		</div>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="info-box container-fluid py-5">
				<h1 class="display-5 fw-bold">제품 정보</h1>
				<p class="col-md-8 fs-4">ProductInfo</p>
			</div>
			<%
				String id = request.getParameter("prodId");
				ProductRepository store = ProductRepository.getInstance();
				Product prod = store.getProdById(id);
			%>
			<div class="col-md-5">
				<img src="./resources/images/<%=prod.getFilename() %>" class="img" style="width: 70%">
			</div>
			<div class="row align-items-md-stretch">
				<div class="prod-box col-md-12">
					<h3><b><%= prod.getName() %></b></h3>
					<p><%= prod.getDescription() %></p>
					<p><b>제품 코드: </b><span class="badge text-bg-danger"><%= prod.getProdId() %></span></p>
					<p>분류: <%= prod.getCategory() %></p>
					<p>재고 수: <%= prod.getInstock() %></p>
					<p>가격: <%= prod.getPrice() %></p>
					<p><a href="#" class="btn btn-info">제품 주문</a></p>
					<a href="productList.jsp" class="btn btn-secondary">제품 목록</a>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>