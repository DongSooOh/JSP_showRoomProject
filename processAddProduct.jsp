<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="store.Product, store.ProductRepository" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ProcessAddProduct</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			String prodId = request.getParameter("prodId");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String description = request.getParameter("description");
			String category = request.getParameter("category");
			String instock = request.getParameter("instock");
			
			Integer intPrice;
			
			if (price.isEmpty()) {
				intPrice = 0;
			} else {
				intPrice = Integer.valueOf(price);
			}
			
			int stock;
			
			if (instock.isEmpty()) {
				stock = 0;
			} else {
				stock = Integer.valueOf(instock);
			}
			
			ProductRepository store = ProductRepository.getInstance();
			
			Product newProd = new Product();
			newProd.setProdId(prodId);
			newProd.setName(name);
			newProd.setPrice(intPrice);
			newProd.setDescription(description);
			newProd.setCategory(category);
			newProd.setInstock(stock);
			
			store.addProduct(newProd);
			
			response.sendRedirect("productList.jsp");
			
		%>
	</body>
</html>