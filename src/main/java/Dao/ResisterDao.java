package Dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connectiondb.ConnectionProvider;
/**
 * Servlet implementation class ResisterDao
 */
public class ResisterDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ResisterDao(){
    
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;	
		PrintWriter p =  response.getWriter();
		response.setContentType("text/html");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String pass = request.getParameter("pass");
		
		try {
	
			con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into registeruser (Name,Email,Mobile,Gender,Passwords) values(?,?,?,?,?)");
			System.out.println(con);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, gender);
			ps.setString(5, pass);
			int i = ps.executeUpdate();
			if(i>0) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "You are Successfully Registered "+name);
				response.sendRedirect("register.jsp");
				System.out.println("Your data Entered");
				return;
			}
			else {
				System.out.println("Soething went to Wrong");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
