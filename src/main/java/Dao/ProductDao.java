package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.CartBean;
import bean.ProCategory;
import bean.Product;
import connectiondb.ConnectionProvider;

public class ProductDao {

	private Connection con = null;

	public ProductDao(Connection connection) {
		this.con = connection;
	}

	public Product productStore(String productName, String productModel, String productType, String productBrand,
			String productQuantity, String productPricess, String pImage1, String pImage2, String pImage3,
			String pImage4, String category,int discount, double productPrices) {
		Product pbean = new Product(productName, productModel, productType, productBrand, productQuantity,
				productPrices, pImage1, pImage2, pImage3, pImage4,discount,category);

		try {
			PreparedStatement ps = con.prepareStatement(
					"insert into eproducts(Name,Model,Type,Brand,Quantity,Discounts,Picture1,Picture2,Picture3,Picture4,Prices,product_category) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, pbean.getProductName());
			ps.setString(2, pbean.getProductModel());
			ps.setString(3, pbean.getProductType());
			ps.setString(4, pbean.getProductBrand());
			ps.setString(5, pbean.getProductQuantity());
			ps.setInt(6, pbean.getDiscount());
			ps.setString(7, pbean.getpImage1());
			ps.setString(8, pbean.getpImage2());
			ps.setString(9, pbean.getpImage3());
			ps.setString(10, pbean.getpImage4());
			ps.setDouble(11, pbean.getProductPrices());
			ps.setString(12, pbean.getProCate());
			
			int i = ps.executeUpdate();
			if (i > 0) {
				System.out.println("product Successfully added");
			} else {
				System.out.println("product are not added");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		return pbean;

	}
	
	
         //Get All Products 
	    public List<Product> getProduct() {
		List<Product> product = new ArrayList<>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from eproducts");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product item = new Product();
				item.setProductId(rs.getInt("ID"));
				item.setProductName(rs.getString("Name"));
				item.setProductModel(rs.getString("Model"));
				item.setProductType(rs.getString("Type"));
				item.setProductBrand(rs.getString("Brand"));
				item.setProductQuantity(rs.getString("Quantity"));
				item.setProductPrices(rs.getDouble("Prices"));
				item.setDiscount(rs.getInt("Discounts"));
				item.setpImage1(rs.getString("Picture1"));
				item.setpImage2(rs.getString("Picture2"));
				item.setpImage3(rs.getString("Picture3"));
				item.setpImage4(rs.getString("Picture4"));
				product.add(item);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return product;

	}
	
	public List<Product> getCategoryProduct(String categories) {
		List<Product> product = new ArrayList<>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from eproducts where product_category=?");
			ps.setString(1, categories);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product item = new Product();
				item.setProductName(rs.getString("Name"));
				item.setProductModel(rs.getString("Model"));
				item.setProductType(rs.getString("Type"));
				item.setProductBrand(rs.getString("Brand"));
				item.setProductQuantity(rs.getString("Quantity"));
				item.setProductPrices(rs.getDouble("Prices"));
				item.setDiscount(rs.getInt("Discounts"));
				item.setpImage1(rs.getString("Picture1"));
				item.setpImage2(rs.getString("Picture2"));
				item.setpImage3(rs.getString("Picture3"));
				item.setpImage4(rs.getString("Picture4"));
				product.add(item);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return product;

	}
	
	public ArrayList<CartBean> getCartProduct(ArrayList<CartBean> cartargu){
	ArrayList<CartBean> cartList = new ArrayList<>();
		try {
			
			if(cartargu.size()>0) {
				
				for(CartBean cartbean : cartargu) {
				PreparedStatement	ps = con.prepareStatement("select *from eproducts where ID=?");
			    ps.setInt(1, cartbean.getProductId());
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					CartBean cartproduct = new CartBean();
					cartproduct.setProductId(rs.getInt("ID"));
					cartproduct.setProductName(rs.getString("Name"));
					cartproduct.setProductModel(rs.getString("Model"));
					cartproduct.setProductBrand(rs.getString("Brand"));
					cartproduct.setProductType(rs.getString("Type"));
					cartproduct.setProCate(rs.getString("product_category"));
					cartproduct.setpImage1(rs.getString("Picture1"));
			
					String strPrice = rs.getString("Prices");
					double lprices = Long.parseLong(strPrice); 
					cartproduct.setProductPrices(rs.getDouble("Prices")*cartbean.getCartQuantity());
                    cartproduct.setCartQuantity(cartbean.getCartQuantity());
					cartproduct.setDiscount(rs.getInt("Discounts"));
					cartList.add(cartproduct);
					
				}
				}
			}
			
		}catch(Exception e) {
		System.out.println(e.getMessage());
		}
		return cartList;
	}
	
	public int getProductPrice(ArrayList<CartBean> productList) {
		
		int sum = 0;
		
		try {
			if(productList.size()>0) {
				for(CartBean cartbean : productList) {
				PreparedStatement	ps = con.prepareStatement("Select * from eproducts where ID=?");
				ps.setInt(1, cartbean.getProductId());
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					String price1 =rs.getString("Prices");
					int prices = Integer.parseInt(price1);
					sum = (sum + prices)*cartbean.getCartQuantity();
				}
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return sum;
	}
   public Product getOneProduct(int productId) {
	   Product one = new Product();
	   
	   try {
		   PreparedStatement ps = con.prepareStatement("select * from eproducts where ID=?");
		   ps.setInt(1, productId);
		   ResultSet rs= ps.executeQuery();
		   while(rs.next()) {
			   one.setProductName(rs.getString("Name"));
			   one.setProductModel(rs.getString("Model"));
			   one.setProductPrices(rs.getDouble("Prices"));
			   one.setProCate(rs.getString("product_category"));
			   one.setpImage1(rs.getString("Picture1"));
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return one;
   }
}
