package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ProCategory;
import connectiondb.ConnectionProvider;

public class CategoryDao {
private Connection con = null;

public CategoryDao(Connection connection) {
	this.con = connection;
	}

public ProCategory productCategory(String name, String des) {
	ProCategory category = new ProCategory(name,des);
	
	try {
		con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement("insert into category(Category_Name,Category_Des) values(?,?)");
		ps.setString(1, name);
		ps.setString(2, des);
		int i = ps.executeUpdate();
		if(i>0){
			System.out.println("category added success");
			System.out.println(category);
		}else {
			System.out.println("category added Fail");
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return null;
	
}

public List<ProCategory> getCategory(){
	List<ProCategory> procategory = new ArrayList<>();
	try {
		PreparedStatement ps = con.prepareStatement("select * from category");
		ResultSet rs = ps.executeQuery();
        while(rs.next()) {
        	ProCategory category = new ProCategory();
        	category.setCategoryName(rs.getString("Category_Name"));
        	category.setCategoryDescription(rs.getString("Category_Des"));
        	procategory.add(category);
        }
	}catch(Exception e) {
		
		e.printStackTrace();
	}
	
	return procategory;
}

}