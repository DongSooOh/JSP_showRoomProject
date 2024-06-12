package store;

import java.io.Serializable;

public class Product implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String prodId;		// 제품 코드 ID
	private String name;		// 제품명
	private int price;			// 가격
	private String description;	// 상세정보
	private String category;	// 분류
	private int instock;		// 재고 수
	private String filename;	// 이미지 파일명
	private int quantity;		// 장바구니 수량
	
	public Product() {
	}
	
	public Product(String prodId, String name, int price) {
		this.prodId = prodId;
		this.name = name;
		this.price = price;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getInstock() {
		return instock;
	}

	public void setInstock(int instock) {
		this.instock = instock;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}