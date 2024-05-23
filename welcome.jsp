<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Welcome to Store</title>
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
				height: 75px;
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
				<%@ include file="header.jsp"%>
			</div>
		<%!
			String greeting = "매장에 방문하신 것을 환영합니다.";
			String tagline = "Welcome to Store!";
		%>
		<!-- 본문 -->
		<div class="container1-2">
			<h1><%=greeting%></h1>
			<img src="<%= request.getContextPath() %>/images/show.jpg" alt="매장">
			<p></p>
			<p><b>STORE</b></p>
		</div>
	</div>
	<div class="container2">
		<p></p>
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
	</div>
	<!-- 바닥글 -->
	<%@ include file="footer.jsp"%>	
</body>
</html>