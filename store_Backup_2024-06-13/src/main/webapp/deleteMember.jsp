<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>    
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
	</head>
	<body>
		<%@ include file="header.jsp"%>
		<div class="container py-4">			
			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">회원탈퇴</h1>
					<p class="col-md-8 fs-4">Delete</p>
				</div>
			</div>
			
			<div class="row align-items-md-stretch text-center">
				<div class="row justify-content-center align-items-center">
					<div class="h-100 p-5 col-md-6">
						<form class="form-signin" action="deleteMember.jsp" method="post">
							<div class="form-floating mb-3 row">
								<input type="text" class="form-control" name="id" required autofocus>
								<label for="floatingInput">아이디</label>
							</div>
							<div class="form-floating mb-3 row">
								<input type="password" class="form-control" name="passwd" required>
								<label for="floatingInput">비밀번호</label>
							</div>
							<p> <input type="submit" value="탈퇴하기"></p>
						</form>
					</div>
				</div>
			</div>
		</div>		
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
			<%
				session.invalidate();
			%>
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
		<%@ include file="footer.jsp" %>
	</body>
</html>
