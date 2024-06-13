<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.*, java.sql.*, org.apache.commons.fileupload.FileItem, 
	org.apache.commons.fileupload.disk.DiskFileItemFactory,
	 org.apache.commons.fileupload.servlet.ServletFileUpload, java.io.File"%>
<%@ include file="dbconn.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	
	// 제품 정보 및 파일 업로드를 위한 변수 선언 및 초기화
	String prodId = null;
	String name = null;
	String price = null;
	String description = null;
	String category = null;
	String instock = null;
	String filename = null;
	
	// 파일 업로드를 위한 DiskFileFactory 및 ServletFileUpload 객체 생성 및 요청에서 파싱된 데이터를 formItems 리스트에 저장
	try {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> formItems = upload.parseRequest(request);
	
		// 파일이 아닌 폼 필드인 경우 해당 필드의 이름과 값을 가져옴
		for (FileItem item : formItems) {
			if (item.isFormField()) {
				String fieldName = item.getFieldName();
				String fieldValue = item.getString("utf-8");
				// 폼 필드의 이름에 따라 적절한 변수에 값을 할당
				switch (fieldName) {
				case "prodId":
					prodId = fieldValue;
					break;
				case "name":
					name = fieldValue;
					break;
				case "price":
					price = fieldValue;
					break;
				case "description":
					description = fieldValue;
					break;
				case "category":
					category = fieldValue;
					break;
				case "instock":
					instock = fieldValue;
					break;
				}
			} else {
				// 파일인 경우 파일명 추출 후 지정된 경로에 파일 저장
				if (!item.getName().isEmpty()) {
					filename = new File(item.getName()).getName();
					String uploadPath = getServletContext().getRealPath("/") + "images";
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists()) {
					    uploadDir.mkdir();
					}
				}
			}
		}
	// 예외가 발생하면 콘솔에 에러 출력 및 클라이언트에게 예외 메시지를 보냄
	} catch (Exception ex) {
		ex.printStackTrace();
		response.getWriter().println("Exception message: " + ex.getMessage());
		return;
	}
	// 가격을 정수형으로 형변환
	int intPrice = 0;
	if (price != null && !price.isEmpty()) {
		try {
			intPrice = Integer.parseInt(price);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
	// 재고 수를 정수형으로 형변환
	int stock = 0;
	if (instock != null && !instock.isEmpty()) {
		try {
			stock = Integer.parseInt(instock);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
	
	// PreparedStatement 객체 선언
	PreparedStatement pstmt = null;
		
	try {
		// UPDATE 하는 SQL 쿼리문을 작성
		String sql = "UPDATE product SET name=?, price=?, description=?, category=?, instock=?, filename=? WHERE prodId=?";
		// PreparedStatement 사용하여 SQL 쿼리문을 실행, 제품 정보를 업데이트
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, intPrice);
		pstmt.setString(3, description);
		pstmt.setString(4, category);		
		pstmt.setInt(5, stock);
		pstmt.setString(6, filename);
		pstmt.setString(7, prodId);
		pstmt.executeUpdate();
	// SQLException이 발생할 경우 콘솔에 에러 출력 및 클라리언트에게 예외 메시지를 보냄
	} catch (SQLException e) {
		e.printStackTrace();
		response.getWriter().println("SQLException message: " + e.getMessage());
	} finally {
		// 나중에 생성한 pstmt 객체를 먼저 닫음
		if (pstmt != null)
			pstmt.close();
		// 이후 먼저 생성한 conn 객체를 닫음
		if (conn != null)
			conn.close();
	}
	// 처리 완료 후 해당된 페이지로 이동
	response.sendRedirect("editProduct.jsp?edit=update");
%>