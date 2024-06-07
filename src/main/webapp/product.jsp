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
		<script type="text/javascript">
			function addToCart() {
				if (confirm("제품을 장바구니에 추가하시겠습니까?")) {
					document.addForm.submit();
				} else {
					document.addForm.reset();
				}
			}
		</script>
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
		<%@ include file="dbconn.jsp" %>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="info-box container-fluid py-5">
				<h1 class="display-5 fw-bold">제품 정보</h1>
				<p class="col-md-8 fs-4">ProductInfo</p>
			</div>
			<%
				String prodId = request.getParameter("prodId");
				// ProductRepository store = ProductRepository.getInstance();
				// Product prod = store.getProdById(id);
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM product WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, prodId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
			%>
			<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("filename")%>" class="img" style="width: 70%" alt="<%=rs.getString("name")%>">
			</div>
			<div class="row align-items-md-stretch">
				<div class="prod-box col-md-12">
					<h3><b><%=rs.getString("name")%></b></h3>
					<p><%=rs.getString("description")%></p>
					<p> <b>제품 코드</b>: <span class="badge text-bg-danger"><%=rs.getString("prodId")%></span></p>
					<p> <b>분류 </b>:<%=rs.getString("category")%></p>
					<p> <b>재고 수</b>: <%=rs.getString("instock")%></p>
					<p> <b>가격</b>: <%=rs.getString("price")%> 원</p>
					<form name="addForm" action="./addCart.jsp?prodId=<%=rs.getString("prodId")%>" method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">제품 주문</a>
						<a href="./cart.jsp" class="btn btn-warning">장바구니</a>
						<a href="productList.jsp" class="btn btn-secondary">제품 목록</a>
					</form>
					<br>
					<form action="processDeleteProduct.jsp" method="post" style="display: inline;">
						<input type="hidden" name="prodId" value="<%=rs.getString("prodId")%>" />
						<input type="submit" class="btn btn-danger" value="삭제" />
					</form>
				</div>
				<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				%>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>