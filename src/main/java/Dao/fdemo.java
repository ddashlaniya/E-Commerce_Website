package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Userbean;

public class fdemo {

	private Connection con = null;
	private PreparedStatement ps;
	private ResultSet rs;
	private String query;
	
	public fdemo(Connection con) {
		this.con = con;
	}
	
	public Userbean registerkaro(String name,String email,String phone,String gender,String pass) {
		
		Userbean user = new Userbean(name,email,phone,gender,pass, 0);
		try {
			query = "insert into registeruser (Name,Email,Mobile,Gender,Passwords) values(?,?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, gender);
			ps.setString(5, pass);
			int i = ps.executeUpdate();
			if(i>0) {
				System.out.println("Data Entered Successful");
				System.out.println(user);
			}
			else {
				System.out.println("Somethig Wrong");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return null;
		
	}
	
}
