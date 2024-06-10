<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>        
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 로그인 처리</title>
	</head>
	<body>
		<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/jspdb"
			driver="com.mysql.jdbc.Driver" user="root" password="1234" />
			
		<%
			request.setCharacterEncoding("utf-8");
						
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			String error = request.getParameter("error");
			if (error != null) {
				out.println("<div class='alert alert-danger'>");
				out.println("아이디와 비밀번호를 확인해주세요.");
				out.println("</div>");
			}
		%>
		<sql:query var="resultSet" dataSource="${dataSource}">
			SELECT * FROM member WHERE id=? AND password=?
			<sql:param value="${id}" />
			<sql:param value="${passwd}" />
		</sql:query>
		<c:import var="url" url="welcome.jsp" />
	</body>
</html>