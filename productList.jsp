<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, store.Product, store.ProductRepository" %>
<!-- <jsp:useBean id="prodBean" class="store.ProductRepository" scope="session" /> -->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>제품 목록</title>
	   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    	<title>Bootstrap Example</title>
		<style>
			.container2 {
				margin:30px;
				padding:30px 20px;
				background-color: #ccc;
			}
		</style>
	</head>
	<body>
		<div class="container1">
			<div class="container1-1">
				<!-- 머리글 -->
				<%@ include file="header.jsp"%>
			</div>
			<div class="container2">
				<h1>제품 목록</h1>
				<h5>ProductList</h5>
			</div>
			<%
				ProductRepository store = ProductRepository.getInstance();
				ArrayList<Product> prodList = store.getAllProducts();
			%>
			<div class="grid text-center">
				<%
					for (int i = 0; i < prodList.size(); i++) {
						Product prod = prodList.get(i);
				%>			
  				<div class="g-col-6 g-col-md-4">
  					<h5><b><%= prod.getName() %></b></h5>
  					<img src="<%= prod.getImageUrl() %>" alt="<%= prod.getName() %>" class="img-fluid">
  					<p><%= prod.getDescription() %></p>
  					<p><%= prod.getPrice() %> 원</p>
  					<p><a href="./product.jsp?prodId=<%=prod.getProdId() %>" class="btn btn-secondary" role="button">상세 정보</a>
  				</div>
  				<%
					}
  				%>
			</div>
			<%@ include file="footer.jsp"%>
		</div>
	</body>
</html>