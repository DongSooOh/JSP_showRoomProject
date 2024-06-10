<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
	</head>
	<body>
		<form action="deleteMember.jsp" method="post">
			<p> 아이디: <input type="text" name="id"></p>
			<p> 비밀번호: <input type="password" name="passwd"></p>
			<p> <input type="submit" value="탈퇴하기"></p>
		</form>
		
	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		if (id != null && !id.isEmpty() && passwd != null && !passwd.isEmpty()) {
	%>
	<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/jspdb"
		driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	
	<sql:update dataSource="${dataSource}" var="resultSet">
		DELETE FROM member WHERE id=? AND password=?
		<sql:param value="<%=id%>" />
		<sql:param value="<%=passwd%>" />
	</sql:update>
	
	<c:choose>
		<c:when test="${resultSet >= 1}">
			<p> 회원탈퇴가 완료되었습니다.</p>
		</c:when>
		<c:otherwise>
			<p> 해당되는 회원정보를 찾을 수 없거나 비밀번호가 일치하지 않습니다.</p>
		</c:otherwise>
	</c:choose>
	<%
	} else {
	out.println("삭제할 아이디와 비밀번호를 입력해주세요.");
	}
	%>	
	</body>
</html>
