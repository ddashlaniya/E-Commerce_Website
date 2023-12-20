package connectiondb;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	static Connection con = null;
	public ConnectionProvider(){
		
	}
  public static Connection getConnection() {
	  try {
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","Golu@888");
	  }catch(Exception e) {
		  System.out.println("You Wrong! try again");
		  e.printStackTrace();
	  }
	  return con;  
  }
}
