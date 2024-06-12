<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.net.URLDecoder, store.Product, store.ProductRepository" %>    
<%
	request.setCharacterEncoding("utf-8");
		
	String cartId = session.getId();
			
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
			
	Cookie[] cookies = request.getCookies();
			
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId")) {
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_name")) {
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_shippingDate")) {
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_country")) {
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_zipCode")) {
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_addressName")) {
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	}
		
%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
		<meta charset="UTF-8">
		<title>주문 정보</title>
	</head>
	<body>
		<%@ include file="header.jsp" %>
		<div class="container py-4">
			
			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">주문 정보</h1>
					<p class="col-md-8 fs-4">Order Info</p>
				</div>
			</div>
			
			<div class="row align-items-md-stretch alert alert-info">
				<div class="text-center">
					<h1>영수증</h1>
				</div>
				<div class="row justify-content-between">
					<div class="col-4" align="left">
						<strong>배송 주소</strong><br>
						 성명: <%out.println(shipping_name); %><br>
						 우편번호: <%out.println(shipping_zipCode); %><br>
						 주소: <%out.println(shipping_addressName);%>(<%out.println(shipping_country);%>)<br>
					</div>
					<div class="col-4" align="right">
						<p><em>배송일: <%out.println(shipping_shippingDate); %></em>
					</div>
				</div>
				<div class="py-5">
					<table class="table table-hover">
						<tr>
							<th class="text-center">제품</th>
							<th class="text-center">#</th>
							<th class="text-center">가격</th>
							<th class="text-center">소계</th>
						</tr>
						<%
							int sum = 0;
							ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
							if (cartList == null)
								cartList = new ArrayList<Product>();
								for (int i = 0; i < cartList.size(); i++) { // 제품리스트 하나씩 출력
									Product prod = cartList.get(i);
						 			int total = prod.getPrice() * prod.getQuantity();
						 			sum = sum + total;		
						%>
						<tr>
							<td class="text-center"><em><%=prod.getName()%> </em></td>
							<td class="text-center"><%=prod.getQuantity() %></td>
							<td class="text-center"><%=prod.getPrice() %>원</td>
							<td class="text-center"><%=total %>원</td>
						</tr>
						<%
								}
						%>
						<tr>
							<td> </td>
							<td> </td>
							<td class="text-right"><strong>총액: </strong></td>
							<td class="text-center text-danger"><strong><%=sum %> </strong></td>
						</tr>	
					</table>
					<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button">이전</a>
					<a href="./thankCustomer.jsp" class="btn btn-secondary" role="button">주문 완료</a>
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>		
	</body>
</html>