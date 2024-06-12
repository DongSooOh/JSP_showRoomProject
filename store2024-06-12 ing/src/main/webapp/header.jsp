<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
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
    			<a class="navbar-brand" href="welcome.jsp"><img src="<%= request.getContextPath() %>/image/home.jpg" alt="집"></a>
    			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    	  			<span class="navbar-toggler-icon"></span>
    			</button>
    			<div class="collapse navbar-collapse" id="navbarNavDropdown">
      				<ul class="navbar-nav">
      					<c:choose>
      						<c:when test="${empty sessionId}">
      							<li class="nav-item"><a class="nav-link active" href="<c:url value="loginMember.jsp"/>">로그인</a></li>
      							<li class="nav-item"><a class="nav-link active" href="<c:url value="addMember.jsp"/>">회원가입</a></li>
      						</c:when>
      						<c:otherwise>
      							<li style="padding-top:7px; color:blue">[<%=sessionId%>님]</li>
      							<li class="nav-item"><a class="nav-link active" href="<c:url value="logoutMember.jsp"/>">로그아웃</a></li>
      							<li class="nav-item"><a class="nav-link active" href="<c:url value="updateMember.jsp"/>">회원수정</a></li>
      							<li class="nav-item"><a class="nav-link active" href="<c:url value="deleteMember.jsp"/>">회원탈퇴</a></li>
      						</c:otherwise>
      					</c:choose>	
            			<li class="nav-item">	
            				<a class="nav-link active" href="productList.jsp">제품 목록</a>
            			</li>
        				<li class="nav-item">
          					<a class="nav-link active" href="addProduct.jsp">제품 등록</a>
        				</li>
        				<li class="nav-item">
          					<a class="nav-link active" href="./editProduct.jsp?edit=update">제품 수정</a>
        				</li>
        				<li class="nav-item">
          					<a class="nav-link active" href="./editProduct.jsp?edit=delete">제품 삭제</a>
        				</li>
        				<li class="nav-item">
          					<a class="nav-link active" href="<c:url value='/BoardListAction.do?pageNum=1' />">게시판</a>
        				</li>
      				</ul>
    			</div>
				<nav class="navbar bg-body-tertiary">
  					<div class="container-fluid">
  						<a class="cart" href="cart.jsp"><img src="<%= request.getContextPath() %>/image/cart.jpg" alt="장바구니"></a>
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