package bean;
import java.util.*;

public class ProCategory {

	private String categoryName ;
	private String categoryDescription;
	private List<Product> product = new ArrayList<>();
	
	public ProCategory() {
		
	}

	public ProCategory(String categoryName, String categoryDescription) {
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
	}

	public String getCategoryName() {
		
		System.out.println("ProductCategory Bean class = "+categoryName);
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	
	@Override
	public String toString() {
		return "ProCategory [categoryName=" + categoryName + ", categoryDescription=" + categoryDescription + "]";
	}
	
	
}
