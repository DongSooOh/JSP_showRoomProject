<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, store.Product, store.ProductRepository" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add_Cart</title>
	</head>
	<body>
		<%
			String prodId = request.getParameter("prodId");
			if (prodId == null || prodId.trim().equals("")) {
				response.sendRedirect("productList.jsp");
				return;
			}
			
			ProductRepository store = ProductRepository.getInstance();
			
			Product prod = store.getProdById(prodId);
			if (prod == null) {
				response.sendRedirect("exceptionNoProdId.jsp");
			}
			
			ArrayList<Product> goodsList = store.getAllProducts();
			Product goods = new Product();
			for (int i = 0; i < goodsList.size(); i++) {
				goods = goodsList.get(i);
				if (goods.getProdId().equals(prodId)) {
					break;
				}
			}
			
			ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
			if (list == null) {
				list = new ArrayList<Product>();
				session.setAttribute("cartlist", list);
			}
			
			int cnt = 0;
			Product goodsQnt = new Product();
			for (int i = 0; i < list.size(); i++) {
				goodsQnt = list.get(i);
				if (goodsQnt.getProdId().equals(prodId)) {
					cnt++;
					int orderQuantity = goodsQnt.getQuantity() + 1;
					goodsQnt.setQuantity(orderQuantity);
				}
			}
			
			if (cnt == 0) {
				goods.setQuantity(1);
				list.add(goods);
			}
			
			response.sendRedirect("product.jsp?prodId=" + prodId);
		%>
	</body>
</html>