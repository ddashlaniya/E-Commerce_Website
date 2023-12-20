package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.LoginDao;
import bean.Userbean;
import connectiondb.ConnectionProvider;

/**
 * Servlet implementation class loginServ
 */
public class loginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public loginServ() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter p = response.getWriter();
		
		String email = request.getParameter("email");
		String pass  =request.getParameter("pass");
		try {
		
			LoginDao loginD = new LoginDao(ConnectionProvider.getConnection());
			Userbean ubean = loginD.userLogin(email, pass);	
			System.out.println("UserBean => "+ubean);
			HttpSession httpSession = request.getSession();
			if(ubean != null) {    	
	    	httpSession.setAttribute("current_user", ubean);
	    	 if(ubean.getUserType().equals("Admin")) {
	    		 response.sendRedirect("AdminDashboard.jsp");
	            }
	    	else if(ubean.getUserType().equals("Client")) {
//	    		
	    		response.sendRedirect("index.jsp");
	    	}
	    	else {
	    		p.println("Not Identify Which Type of user");
	    	}
	    }else {
	           httpSession.setAttribute("messages", "Invalid User Atempt!");
	           response.sendRedirect("login.jsp");
	    }
			
		}catch(Exception e) {
			
			e.printStackTrace(); 
		}
		
	}

}
