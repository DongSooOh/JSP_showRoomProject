<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.io.*, java.sql.*, com.oreilly.servlet.*,
    com.oreilly.servlet.multipart.*, org.apache.commons.fileupload.*, 
    org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ include file="dbconn.jsp" %>

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

	// 가격 및 재고 변수 초기화
	int intPrice = 0;
	int stock = 0;

	// 파일 업로드 설정
	File fileUploadPath = new File("C:\\web\\dongsooShowRoom\\src\\main\\webapp\\resources\\images");
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setRepository(fileUploadPath);
	factory.setSizeThreshold(1024 * 1024);

	// 파일 업로드를 위한 ServletFileUpload 및 DiskFileItemFactory 객체 생성
	ServletFileUpload upload = new ServletFileUpload(factory);
	try {
		// 요청에서 파일 및 폼 데이터를 파싱(주어진 데이터를 해석 및 이해하는 과정)하여 리스트로 저장
    	List<FileItem> items = upload.parseRequest(request);
    	Iterator<FileItem> params = items.iterator();

    	// 파싱된 요소들을 하나씩 확인하여 처리
        while (params.hasNext()) {
            FileItem fileItem = (FileItem) params.next();

            // 파일인지 폼 필드인지 확인하여 처리
            if (fileItem.isFormField()) {
                switch (fileItem.getFieldName()) {
                    case "prodId":
                    	prodId = fileItem.getString("utf-8");	// 제품 ID
                        break;
                    case "name":
                        name = fileItem.getString("utf-8");		// 이름
                        break;
                    case "price":
                        price = fileItem.getString("utf-8");	// 가격
                        break;
                    case "description":
                        description = fileItem.getString("utf-8");	// 상세설명
                        break;    
                    case "category":
                        category = fileItem.getString("utf-8");	// 분류
                        break;
                    case "instock":
                        instock = fileItem.getString("utf-8");	// 재고 수
                        break;
                }
            } else {
            	// 파일이면 파일명 추출 및 지정된 경로에 업로드
                filename = fileItem.getName();
                if (filename != null) {
                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
                    File file = new File(fileUploadPath + "/" + filename);
                    fileItem.write(file);
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
	
	// 가격과 재고 수를 정수형으로 형변환
	try {
	    if (price != null && !price.isEmpty()) {
            intPrice = Integer.parseInt(price);
	    }
	
	    if (instock != null && !instock.isEmpty()) {
            stock = Integer.parseInt(instock);
	    }
	} catch (NumberFormatException e) {
	    e.printStackTrace();
	}

    // PreparedStatement 초기화 
    PreparedStatement pstmt = null;
    
    // SQL 쿼리문 작성
    String sql = "INSERT INTO product VALUES(?,?,?,?,?,?,?)";
    
    // PreparedStatement를 사용하여 SQL 쿼리문을 실행, DB에 제품 정보를 삽입
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, prodId);
    pstmt.setString(2, name);
    pstmt.setInt(3, intPrice);
    pstmt.setString(4, description);
    pstmt.setString(5, category);
    pstmt.setInt(6, stock);
    pstmt.setString(7, filename);
	pstmt.executeUpdate();
	
	// 나중에 생성한 prsmt 객체 먼저 닫음 
	if (pstmt!=null)
		pstmt.close();
	// 이후 먼저 생성한 conn 객체 닫음
	if (conn!=null)
		conn.close();
	
	// 처리 완료 후 해당 페이지로 이동
	response.sendRedirect("productList.jsp");
%>