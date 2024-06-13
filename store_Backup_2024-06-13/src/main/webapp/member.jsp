<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보</title>
	</head>
	<body>
		<h2>수정된 회원정보입니다.</h2>
		<p> 아이디: <%=request.getParameter("id")%></p>
		<p> 이름: <%=request.getParameter("name")%></p>
		<p> 성별: <%=request.getParameter("gender")%></p>
		<p> 생년월일: <%=request.getParameter("birth")%></p>
		<p> 이메일 주소: <%=request.getParameter("mail")%></p>
		<p> 휴대전화번호: <%=request.getParameter("phone")%></p>
		<p> 주소: <%=request.getParameter("address")%></p>
	</body>
</html>