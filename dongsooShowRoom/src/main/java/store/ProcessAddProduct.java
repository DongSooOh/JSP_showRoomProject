package store;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/processAddProduct.do")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 15    // 15 MB
)
public class ProcessAddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "C:\\web\\dongsooShowRoom22\\src\\main\\webapp\\resources\\images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        
        Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/jspdb";
			String user = "root";
			String password = "1234";
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException ex) {
			System.out.println("JDBC 드라이버를 찾을 수 없습니다.");
			ex.printStackTrace();
		} catch (SQLException ex) {
			System.out.println("데이터베이스 연결에 실패했습니다.");
			System.out.println("SQLException: " + ex.getMessage());
		}
		
        // 폼 데이터 가져오기
        String prodId = request.getParameter("prodId");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String instock = request.getParameter("instock");

        // 문자열 입력값을 적절한 데이터 타입으로 변환
        int intPrice = (price == null || price.isEmpty()) ? 0 : Integer.parseInt(price);
        int stock = (instock == null || instock.isEmpty()) ? 0 : Integer.parseInt(instock);

        // 파일 업로드 처리
        String filename = "";
        Part filePart = request.getPart("filename");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = getFileName(filePart);
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            filename = fileName;
            File file = new File(uploadDir, filename);
            try {
                Files.copy(filePart.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 새 제품 생성 및 저장소에 추가
        Product prod = new Product();
        prod.setProdId(prodId);
        prod.setName(name);
        prod.setPrice(intPrice);
        prod.setDescription(description);
        prod.setCategory(category);
        prod.setInstock(stock);
        prod.setFilename(filename);

        ProductRepository store = ProductRepository.getInstance();
        store.addProduct(prod);

        // 제품 목록 페이지로 리디렉션
        response.sendRedirect("productList.jsp");
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
