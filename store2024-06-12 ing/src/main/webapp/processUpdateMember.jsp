<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정 처리</title>
	</head>
	<body>
		<%@ include file="header.jsp"%>
		<%
			request.setCharacterEncoding("utf-8");
		
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String birth = request.getParameter("birth");
			String mail = request.getParameter("mail");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
		%>
		<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/jspdb"
			driver="com.mysql.jdbc.Driver" user="root" password="1234" />
		
		<sql:update dataSource="${dataSource}" var="resultSet">
		 	UPDATE member SET password=?, name=?, gender=?, birth=?, mail=?, phone=?, address=? WHERE id=?
		 	<sql:param value="<%=passwd%>" />
		 	<sql:param value="<%=name%>" />
		 	<sql:param value="<%=gender%>" />
		 	<sql:param value="<%=birth%>" />
		 	<sql:param value="<%=mail%>" />
		 	<sql:param value="<%=phone%>" />
		 	<sql:param value="<%=address%>" />
		 	<sql:param value="<%=id%>" />
		 </sql:update>
		 <c:import var="url" url="member.jsp" />
		 ${url}
		<%@ include file="footer.jsp" %> 	 
	</body>
</html>