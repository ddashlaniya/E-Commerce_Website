package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.fdemo;
import bean.Userbean;
import connectiondb.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RegisterServlet() {
        super();
       
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter p = response.getWriter();
	
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String pass = request.getParameter("pass");
		
		try {
			fdemo d = new fdemo(ConnectionProvider.getConnection());
		//	fdemo d = new fdemo(name ,email ,phone ,gender ,pass);
			Userbean ubean = d.registerkaro(name, email, phone, gender, pass);
	    if(ubean == null) {
	    	//p.println("You Registered");
	    	HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "You are Successfully Registered "+name);
			response.sendRedirect("register.jsp");
			System.out.println("Your data Entered");
			return;
	    }else {
	    	p.println("You Failed");
	    }
			
		}catch(Exception e) {
			e.printStackTrace(); 
		}
	}

}
