package store;


import java.util.ArrayList;

public class ProductRepository {
	private ArrayList<Product> prodList = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public ProductRepository() {
		Product prod1 = new Product("PROD1111", "백팩1", 100000);
		prod1.setDescription("등으로 지는 양 어깨에 메는 가방");
		prod1.setCategory("가방");
		prod1.setInstock(1000);
		prod1.setFilename("backpack.jpg");
		
		Product prod2 = new Product("PROD2222", "숄더백1", 80000);
		prod2.setDescription("긴 끈이 달려서 한쪽 어깨에 메는" + "<br>" + "작은 가방");
		prod2.setCategory("가방");
		prod2.setInstock(1500);
		prod2.setFilename("shoulderbag.jpg");
		
		Product prod3 = new Product("PROD3333", "핸드백1", 50000);
		prod3.setDescription("손에 들고 다니는 정도의 사이즈의 가방");
		prod3.setCategory("가방");
		prod3.setInstock(2000);
		prod3.setFilename("handbag.jpg");
		
		Product prod4 = new Product("PROD4444", "백팩2", 100000);
		prod4.setDescription("등으로 지는 양 어깨에 메는 가방");
		prod4.setCategory("가방");
		prod4.setInstock(1000);
		prod4.setFilename("backpack.jpg");
		
		Product prod5 = new Product("PROD5555", "숄더백2", 80000);
		prod5.setDescription("긴 끈이 달려서 한쪽 어깨에 메는" + "<br>" + "작은 가방");
		prod5.setCategory("가방");
		prod5.setInstock(1500);
		prod5.setFilename("shoulderbag.jpg");
		
		Product prod6 = new Product("PROD6666", "핸드백2", 50000);
		prod6.setDescription("손에 들고 다니는 정도의 사이즈의 가방");
		prod6.setCategory("가방");
		prod6.setInstock(2000);
		prod6.setFilename("handbag.jpg");
		
		Product prod7 = new Product("PROD7777", "백팩3", 100000);
		prod7.setDescription("등으로 지는 양 어깨에 메는 가방");
		prod7.setCategory("가방");
		prod7.setInstock(1000);
		prod7.setFilename("backpack.jpg");
		
		Product prod8 = new Product("PROD8888", "숄더백3", 80000);
		prod8.setDescription("긴 끈이 달려서 한쪽 어깨에 메는" + "<br>" + "작은 가방");
		prod8.setCategory("가방");
		prod8.setInstock(1500);
		prod8.setFilename("shoulderbag.jpg");
		
		Product prod9 = new Product("PROD9999", "핸드백3", 50000);
		prod9.setDescription("손에 들고 다니는 정도의 사이즈의 가방");
		prod9.setCategory("가방");
		prod9.setInstock(2000);
		prod9.setFilename("handbag.jpg");
	
		prodList.add(prod1);
		prodList.add(prod2);
		prodList.add(prod3);
		prodList.add(prod4);
		prodList.add(prod5);
		prodList.add(prod6);
		prodList.add(prod7);
		prodList.add(prod8);
		prodList.add(prod9);
	}
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ArrayList<Product> getAllProducts() {
		return prodList;
	}
	
	public Product getProdById(String prodId) {
		Product prodById = null;
		
		for (int i = 0; i < prodList.size(); i++) {
			Product prod = prodList.get(i);
			if (prod != null && prod.getProdId() != null && prod.getProdId().equals(prodId)) {
				prodById = prod;
				break;
			}
		}		
		return prodById;					
	}
	
	public void addProduct(Product prod) {
		prodList.add(prod);
	}
}