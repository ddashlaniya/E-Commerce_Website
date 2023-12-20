package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import bean.Product;
import connectiondb.ConnectionProvider;

public class GetProductDao {

	Connection con = null;
	
	public GetProductDao(Connection con) {
		this.con = con;
	}
	
	public List<Product> getProduct(){
		List<Product> product = new ArrayList<>();
		 System.out.println("GetProductDao Class here");
		try {
		  con = ConnectionProvider.getConnection();
		  PreparedStatement ps = con.prepareStatement("select * from eproducts");
		  ResultSet rs = ps.executeQuery();
		  while(rs.next()) {
			 Product item = new Product();
			item.setProductName(rs.getString("Name"));
			item.setProductModel(rs.getString("Model"));
			item.setProductType(rs.getString("Type"));
			item.setProductBrand(rs.getString("Brand"));
			item.setProductQuantity(rs.getString("Quantity"));
			item.setpImage1(rs.getString("Picture1"));
			item.setpImage2(rs.getString("Picture2"));
			item.setpImage3(rs.getString("Picture3"));
			item.setpImage4(rs.getString("Picture4"));
			product.add(item);
		  }
		  
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return product;
	}
}
