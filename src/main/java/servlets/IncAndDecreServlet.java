package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CartBean;

/**
 * Servlet implementation class IncAndDecreServlet
 */
public class IncAndDecreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public IncAndDecreServlet() {
      
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	PrintWriter out = response.getWriter();
    	String actionOfincAnddecre = request.getParameter("action");
    	String s1 = request.getParameter("id");
    	int linkId = Integer.parseInt(s1);
    	
    	out.println("Welcome to increment or decreament servlet => "+actionOfincAnddecre+" "+linkId);
    	ArrayList<CartBean> cart_list_product = (ArrayList<CartBean>)request.getSession().getAttribute("cart-list");//cart_Session
    	if(actionOfincAnddecre != null || linkId>=1) {
    		if(actionOfincAnddecre.equals("inc")) {
    			for(CartBean cart_product : cart_list_product) {
    				if(linkId == cart_product.getProductId()) {
    					int productQuantity = cart_product.getCartQuantity();
    					productQuantity++;
    					if(productQuantity <= 10)
    					{
    					cart_product.setCartQuantity(productQuantity);
    					}
    					response.sendRedirect("cart.jsp");
    				}
    			}
    		}
    		
    		if(actionOfincAnddecre.equals("dec")) {
    			for(CartBean cart_product : cart_list_product) {
    				if(linkId == cart_product.getProductId()) {
    					int productQuantity = cart_product.getCartQuantity();
    					productQuantity--;
    				    if(productQuantity >=1)
    				    {
    					cart_product.setCartQuantity(productQuantity);
    				    }
    					response.sendRedirect("cart.jsp");
    				}
    			}
    		}
    	}
    	
    }
}
