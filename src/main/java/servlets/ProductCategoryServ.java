package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CategoryDao;
import bean.ProCategory;
import connectiondb.ConnectionProvider;

/**
 * Servlet implementation class ProductCategoryServ
 */
public class ProductCategoryServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCategoryServ() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      PrintWriter p = response.getWriter();
	      response.setContentType("text/html");
	      p.println("Successfully Connected!");
	     String categoryField = request.getParameter("categoryname");
	     if(categoryField.trim().equals("Categryform")) {
	    	 String categoryFetch = request.getParameter("category");
		      String descriptionFetch = request.getParameter("description");
		      p.println("Category is => "+categoryFetch);	  
		      p.println("Description is => "+ descriptionFetch); 
		      try {
		      CategoryDao addCategory = new CategoryDao(ConnectionProvider.getConnection());
		      ProCategory categoryBean = addCategory.productCategory(categoryFetch, descriptionFetch);
		  ;
		      if(categoryBean == null)
		    {
		    	  response.sendRedirect("AdminDashboard.jsp");
		    }
		    else {
		    	p.println("Product category Not Fetched");
		    }
		      }catch(Exception e) {
		    	  e.printStackTrace();
		      }
	     } 
	    
	}

}
