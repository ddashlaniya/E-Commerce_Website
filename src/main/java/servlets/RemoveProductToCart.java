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
 * Servlet implementation class RemoveProductToCart
 */
public class RemoveProductToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveProductToCart() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			int removingId = Integer.parseInt(request.getParameter("id"));
			ArrayList<CartBean> productRe = (ArrayList<CartBean>)request.getSession().getAttribute("cart-list");
			
			if(removingId>=1) {
				if(productRe !=null) {
				     for(CartBean cartproduct : productRe) {
				    	 if(cartproduct.getProductId() == removingId) {
				    		 productRe.remove(productRe.indexOf(cartproduct));
				    						    		 break;
				    	 }
				     }
				     response.sendRedirect("cart.jsp");
					}
			}
			else {
				response.sendRedirect("cart.jsp");
			}
		}catch(Exception e) {
		e.printStackTrace();
			
		}
	}

}
