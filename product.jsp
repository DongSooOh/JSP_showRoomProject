<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="store.Product, store.ProductRepository" %>
<jsp:useBean id="prodBean" class="store.ProductRepository" scope="session" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product</title>
		<style>
			.info-box {
				margin: 20px;
				padding: 20px;
				background-color: black;
				color: white;
			}
			.prod-box {
				margin: 20px;
				padding: 20px;
				background-color: #ccc; 
			}
			a { text-decoration: none; color: black; }
		</style>
	</head>
	<body>
		<div class="container1">
			<div class="container1-1">
				<!-- 머리글 -->
				<%@ include file="header.jsp"%>
			</div>
			<div class="info-box">
				<h1>제품 정보</h1>
				<p>ProductInfo</p>
			</div>
			<%
				String id = request.getParameter("prodId");
				ProductRepository store = ProductRepository.getInstance();
				Product prod = prodBean.getProdById(id);
			%>
			<div class="prod-box">
				<h3><b><%= prod.getName() %></b></h3>
				<p><%= prod.getDescription() %></p>
				<p><b>제품 코드: <%= prod.getProdId() %></b></p>
				<p>분류: <%= prod.getCategory() %></p>
				<p>재고 수: <%= prod.getInstock() %></p>
				<p>가격: <%= prod.getPrice() %></p>
				<p><a href="#">제품 주문</a></p>
				<a href="productList.jsp">제품 목록</a>
			</div>
			<%@ include file="footer.jsp"%>
		</div>
	</body>
</html>