<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="store.Product, store.ProductRepository" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 전체 삭제</title>
	</head>
	<body>
		<%
			String prodId = request.getParameter("cartId");
			if (prodId == null || prodId.trim().equals("")) {
				response.sendRedirect("cart.jsp");
				return;
			}
			
			// invalidate(): 현재 세션에 저장된 모든 세션 속성을 제거
			session.invalidate();
			response.sendRedirect("cart.jsp");
		%>
	</body>
</html>