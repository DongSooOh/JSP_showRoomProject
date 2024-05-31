<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
		<meta charset="UTF-8">
		<title>Page_Error</title>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div class="container py-4">
			<div class="jumbotron p-5 mb-4 bg-body-tertiary rounded-3">
				<div class="container">
					<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
				</div>
			</div>
			<div class="container">
				<p><%=request.getRequestURL() %></p>
				<p> <a href="productList.jsp" class="btn btn-secondary">제품 목록</a>
			</div>
		</div>
	</body>
</html>