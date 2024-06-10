<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
		<meta charset="UTF-8">
		<title>제품 수정</title>
	</head>
	<body>
		<%@ include file="header.jsp" %>
		<div class="container py-4">
			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">제품 수정</h1>
					<p class="col-md-8 fs-4">Product Updating</p>
				</div>
			</div>
			<%@ include file="dbconn.jsp" %>
			<%
				String prodId = request.getParameter("prodId");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM product WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, prodId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
			%>
			<div class="row align-items-md-stretch">
				<div class="col-md-5">
					<img src="./resources/images/<%=rs.getString("p_filename") %>" alt="image" style="width: 100%" />
				</div>
				<div class="col-md-7">
					<form name="newProd" action="./processUpdateProduct.jsp" method="post" enctype="multipart/form-data">		
					<div class="mb-3 row">
						<label class="col-sm-3">제품코드</label>
						<div class="col-sm-5">
							<input type="text" name="prodId" id="prodId" class="form-control" value='<%=rs.getString("p_id")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-3">제품명</label>
						<div class="col-sm-5">
							<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("p_name")%>'>
						</div>
					</div>
					<div class="col-mb-3 row">
						<label class="col-sm-3">가격</label>
						<div class="col-sm-5">
							<input type="text" name="price" id="price" class="form-control" value='<%=rs.getString("p_price")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-3">상세정보</label>
						<div class="col-sm-9">
							<textarea name="description" id="description" cols="50" rows="2" class="form-control" placeholder="100자 미만으로 작성하십시오."><%=rs.getString("p_description")%></textarea>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-3">분류</label>
						<div class="col-sm-3">
							<select name="category" class="form-control">
								<option value="가방">가방</option>
								<option value="신발">신발</option>
								<option value="의류">의류</option>
							</select>	
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-3">재고 수</label>
						<div class="col-sm-5">
							<input type="text" name="instock" id="instock" class="form-control" value='<%=rs.getString("p_instock")%>'> 
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-3">이미지</label>
						<div class="col-sm-8">
							<input type="file" name="prodImage" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="수정">
						</div>
					</div>
					</form>
				</div>
				<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				%>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</body>
</html>