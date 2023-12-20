package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.OrderBean;
import bean.Product;

public class ProductOrderDao {

	Connection conn = null;
	
	public ProductOrderDao(Connection connection) {
		this.conn = connection;
	}
	public boolean orderedStore(OrderBean orders) {
		//OrderBean orderBean = new OrderBean();
		boolean isData = false;
		try {
			PreparedStatement ps =  conn.prepareStatement("insert into orderedproduct(Order_Id,Product_Id,Product_Name,P_Quantity) values(?,?,?,?)");
            ps.setInt(1, orders.getOrderId());
			ps.setInt(2, orders.getProductId());
			ps.setString(3,orders.getProductName());
			ps.setInt(4, orders.getCartQuantity());
		    ps.executeUpdate();
            isData = true;
            if(isData) {
            	System.out.println("isData ==>> success");
            }
            else {
            	System.out.println("isData ==>> Fail");
            }
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isData;
	}
	
	public ArrayList<OrderBean> orderedProduct(int productId){
		ArrayList<OrderBean> list = new ArrayList<>();
		try {
		   PreparedStatement ps = conn.prepareStatement("select * from orderedproduct inner join eproducts\r\n"
				                   	+ "on  orderedproduct.Product_Id = eproducts.ID where ID=?");
		   ps.setInt(1, productId);
		   ResultSet rs = ps.executeQuery();
		   while(rs.next()) {
			   OrderBean orderbean = new OrderBean();
		       ProductDao productdao = new ProductDao(conn);
		       Product products =  productdao.getOneProduct(productId);
			   orderbean.setOrderId(rs.getInt("Order_Id"));
			   orderbean.setDateTime(rs.getString("Date_And_Time"));
			   orderbean.setProductName(rs.getString("Name"));
			   orderbean.setProductModel(rs.getString("Model"));
			   orderbean.setProductPrices(rs.getDouble("P_Prices"));
			   orderbean.setpImage1(rs.getString("Picture1"));
		   
		       list.add(orderbean);
		   }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
