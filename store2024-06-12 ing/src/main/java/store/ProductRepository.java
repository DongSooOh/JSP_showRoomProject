package store;


import java.util.ArrayList;

public class ProductRepository {
	private ArrayList<Product> prodList = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public ProductRepository() {
		Product prod1 = new Product("PROD1111", "����1", 100000);
		prod1.setDescription("������ ���� �� ����� �޴� ����");
		prod1.setCategory("����");
		prod1.setInstock(1000);
		prod1.setFilename("backpack.jpg");
		
		Product prod2 = new Product("PROD2222", "�����1", 80000);
		prod2.setDescription("�� ���� �޷��� ���� ����� �޴�" + "<br>" + "���� ����");
		prod2.setCategory("����");
		prod2.setInstock(1500);
		prod2.setFilename("shoulderbag.jpg");
		
		Product prod3 = new Product("PROD3333", "�ڵ��1", 50000);
		prod3.setDescription("�տ� ��� �ٴϴ� ������ �������� ����");
		prod3.setCategory("����");
		prod3.setInstock(2000);
		prod3.setFilename("handbag.jpg");
		
		Product prod4 = new Product("PROD4444", "����2", 100000);
		prod4.setDescription("������ ���� �� ����� �޴� ����");
		prod4.setCategory("����");
		prod4.setInstock(1000);
		prod4.setFilename("backpack.jpg");
		
		Product prod5 = new Product("PROD5555", "�����2", 80000);
		prod5.setDescription("�� ���� �޷��� ���� ����� �޴�" + "<br>" + "���� ����");
		prod5.setCategory("����");
		prod5.setInstock(1500);
		prod5.setFilename("shoulderbag.jpg");
		
		Product prod6 = new Product("PROD6666", "�ڵ��2", 50000);
		prod6.setDescription("�տ� ��� �ٴϴ� ������ �������� ����");
		prod6.setCategory("����");
		prod6.setInstock(2000);
		prod6.setFilename("handbag.jpg");
		
		Product prod7 = new Product("PROD7777", "����3", 100000);
		prod7.setDescription("������ ���� �� ����� �޴� ����");
		prod7.setCategory("����");
		prod7.setInstock(1000);
		prod7.setFilename("backpack.jpg");
		
		Product prod8 = new Product("PROD8888", "�����3", 80000);
		prod8.setDescription("�� ���� �޷��� ���� ����� �޴�" + "<br>" + "���� ����");
		prod8.setCategory("����");
		prod8.setInstock(1500);
		prod8.setFilename("shoulderbag.jpg");
		
		Product prod9 = new Product("PROD9999", "�ڵ��3", 50000);
		prod9.setDescription("�տ� ��� �ٴϴ� ������ �������� ����");
		prod9.setCategory("����");
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