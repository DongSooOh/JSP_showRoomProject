<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, store.Product, store.ProductRepository" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 개별 삭제</title>
	</head>
	<body>
		<%
			String prodId = request.getParameter("prodId");
			// id.trim().equals(""): id가 비어있는지 확인
			if (prodId == null || prodId.trim().equals("")) {
				response.sendRedirect("productList.jsp");
				return;
			}
			
			ProductRepository store = ProductRepository.getInstance();
			
			Product product = store.getProdById(prodId);
			if (product == null) {
				response.sendRedirect("exceptionNoProdId.jsp");
			}
			
			ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
			Product goodsQnt = new Product();
			for (int i = 0; i < cartList.size(); i++) {
				goodsQnt = cartList.get(i);
				if (goodsQnt.getProdId().equals(prodId)) {
					cartList.remove(goodsQnt);
				}
			}
			
			response.sendRedirect("cart.jsp");
		%>
	</body>
</html>