<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>제품 삭제</title>
	</head>
	<body>
		<%
			String prodId = request.getParameter("prodId");
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				sql = "DELETE FROM product WHERE prodId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, prodId);
				pstmt.executeUpdate();
			} else {
				out.println("일치하는 제품이 없습니다.");
			}
			
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			
			response.sendRedirect("editProduct.jsp?edit=delete");
		%>
	</body>
</html>