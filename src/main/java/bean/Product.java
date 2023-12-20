package bean;

import java.text.DecimalFormat;

public class Product extends Userbean {

	private String productName, productModel, productType, productBrand, productQuantity, productPricess,
			pImage1, pImage2, pImage3, pImage4,proCate;
    private ProCategory getObj;
	int discount,productId;
	double productPrices;

	public Product() {

	}

	public Product(String productName, String productModel, String productType, String productBrand,
			String productQuantity, double productPrices, String pImage1, String pImage2, String pImage3,
			String pImage4,int discount,String proCate) {
		this.productName = productName;
		this.productModel = productModel;
		this.productType = productType;
		this.productBrand = productBrand;
		this.productQuantity = productQuantity;
		this.productPrices = productPrices;
		this.pImage1 = pImage1;
		this.pImage2 = pImage2;
		this.pImage3 = pImage3;
		this.pImage4 = pImage4;
		this.proCate = proCate;
		this.discount= discount;

	}

	
	public int getProductId() {
		System.out.println("getProductId() =>" + productId);
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		System.out.println(productName);
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductModel() {
		System.out.println(productModel);
		return productModel;
	}

	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public String getProductQuantity() {
		// System.out.println("Quantity => "+productQuantity);
		return productQuantity;
	}

	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}	
	public double getProductPrices() {

		System.out.println("getProductPrices() =>" + productPrices);
		return productPrices;
	}

	public void setProductPrices(double productPrices) {
		this.productPrices = productPrices;
	}
	public String getpImage1() {
		return pImage1;
	}

	public void setpImage1(String pImage1) {
		this.pImage1 = pImage1;
	}

	public String getpImage2() {
		return pImage2;
	}

	public void setpImage2(String pImage2) {
		this.pImage2 = pImage2;
	}

	public String getpImage3() {
		return pImage3;
	}

	public void setpImage3(String pImage3) {
		this.pImage3 = pImage3;
	}

	public String getpImage4() {
		return pImage4;
	}

	public void setpImage4(String pImage4) {
		this.pImage4 = pImage4;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getProCate() {
		return proCate;
	}

	public void setProCate(String proCate) {
		this.proCate = proCate;
	}

	@Override     
	public String toString() {   //
		return "Product [productId= "+ productId +", productName=" + productName + ", productModel=" + productModel + ", productType=" + productType
				+ ", productBrand=" + productBrand + ", productDiscount=" + discount + ", pImage1=" + pImage1
				+ ", pImage2=" + pImage2 + ", pImage3=" + pImage3 + ", pImage4=" + pImage4 + ", productQuantity="
				+ productQuantity + " , ProductCategory = "+proCate +"]";
	}
	
	public double discountCalculation() {
		double d = ((this.productPrices * this.getDiscount())/100.0);
	    double sum = this.productPrices -d;	
		
	    // formate decimal values
	    DecimalFormat dcf = new DecimalFormat("#.00");
	    String formateDic = dcf.format(sum);
	    sum = Double.parseDouble(formateDic);
	   
	    System.out.println("Calcutation sum is-- => "+sum);
		return sum;
		

	}

}
