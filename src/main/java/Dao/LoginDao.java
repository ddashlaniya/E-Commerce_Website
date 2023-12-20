package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Userbean;

public class LoginDao {

	private Connection con = null;
	
	public LoginDao(Connection connection) {
		this.con = connection;
	}
	public Userbean userLogin(String email, String passwords) {
		Userbean userl = null;
		
		try {
			PreparedStatement ps = con.prepareStatement("select * from registeruser where Email=? and Passwords=?");
			ps.setString(1, email);
			ps.setString(2, passwords);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				userl = new Userbean();
				userl.setEmail(rs.getString("Email"));
				userl.setPassword(rs.getString("Passwords"));
				userl.setName(rs.getString("Name"));
				userl.setPhone(rs.getString("Mobile"));
				userl.setGender(rs.getString("Gender"));
				userl.setUserType(rs.getString("User_Type"));
				System.out.println("You Successfully Loged In");
				System.out.println("after =>"+userl);
				
			}
			else {
				System.out.println("You face Some Error During Login");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return userl;
		
	}
	
}
