<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
		<title>Welcome to ShowRoom</title>
		<style>
			.container1-2 {
				padding: 10px;
				margin:10px;
				text-align:center;
				background-color:#ccc;
			}
			.container1-2 h1, p {
				margin:10px;
			}
			.container2 {
				padding: 10px;
				margin: 10px;
				text-align:center;
				background-color: black;
				color:white;
			}
		</style>
	</head>
	<body>
		<div class="container1">
			<div class="container1-1">
				<!-- 머리글 -->
				<%@ include file="menu.jsp"%>
			</div>
		<%!
			String greeting = "쇼룸에 방문하신 것을 환영합니다.";
			String tagline = "Welcome to ShowRoom!";
		%>
		<!-- 본문 -->
		<div class="container1-2">
			<h1><%=greeting%></h1>
			<img src="<%= request.getContextPath() %>/images/show.jpg" alt="쇼룸">
			<p>ShowRoom</p>
		</div>
	</div>
	<div class="container2">
		<%
			Date day = new java.util.Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();

			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}
			String CT = am_pm + " " + hour + ":" + minute + ":" + second;
			out.println("현재 접속 시각: " + CT + "\n");
		%>
	<!-- 바닥글 -->
	<%@ include file="footer.jsp"%>
	</div>
</body>
</html>