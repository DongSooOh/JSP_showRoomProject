<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
		<title>Store_Header</title>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
  			<div class="container-fluid">
    			<a class="navbar-brand" href="welcome.jsp"><img src="<%= request.getContextPath() %>/image/home.jpg" alt="집">Home</a>
    			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    	  			<span class="navbar-toggler-icon"></span>
    			</button>
    			<div class="collapse navbar-collapse" id="navbarNavDropdown">
      				<ul class="navbar-nav">
      					<li class="nav-item dropdown">
          					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            					PRODUCT
          					</a>
          					<ul class="dropdown-menu">
            					<li><a class="dropdown-item" href="productList.jsp" id="store">All items</a></li>
            					<li><a class="dropdown-item" href="#">New items</a></li>
            					<li><a class="dropdown-item" href="#">Other</a></li>
          					</ul>
        				</li>
        				<li class="nav-item">
          					<a class="nav-link active" aria-current="page" href="addProduct.jsp">ADDITION</a>
        				</li>
        				<li class="nav-item">
          					<a class="nav-link" href="#">ABOUT</a>
        				</li>
        				<li class="nav-item">
          					<a class="nav-link" href="#">STORE</a>
        				</li>
      				</ul>
    			</div>
				<nav class="navbar bg-body-tertiary">
  					<div class="container-fluid">
    					<a class="navbar-brand"></a>
    					<form class="d-flex" role="search">
      						<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      						<button class="btn btn-outline-success" type="submit">Search</button>
    					</form>
  					</div>
				</nav>
  			</div>
		</nav>
		<!-- dropdown기능 활성화를 위한 Bootstrap js 파일 추가 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>