<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, store.Product, store.ProductRepository" %>
<!-- <jsp:useBean id="prodBean" class="store.ProductRepository" scope="session" /> -->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>제품 목록</title>
	   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    	<link rel="stylesheet" href="./resources/css/bootstrap/min.css" />
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
			
			<%@ include file="dbconn.jsp" %>
			
			<div class="grid text-center">
				<%
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "SELECT * FROM product";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
				%>		
  				<div class="g-col-6 g-col-md-4">
  					<img src="./resources/images/<%=rs.getString("p_filename")%>" style="width:250; height: 350" />
  					<h5><b><%=rs.getString("p_name")%></b></h5>
  					<p><%=rs.getString("p_description")%></p>
  					<p><%=rs.getString("p_price")%> 원</p>
  					<p><a href="./product.jsp?prodId=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button">상세 정보</a>
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
			<%@ include file="footer.jsp"%>
		</div>
	</body>
</html>