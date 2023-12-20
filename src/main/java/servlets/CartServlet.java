package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import bean.CartBean;
import connectiondb.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.ProductDao;



public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		int cartId = Integer.parseInt(request.getParameter("add-to-cart"));
		out.println("Cart product Id is = " + cartId);
		System.out.println("cart is is there looked here => " + cartId);

		ArrayList<CartBean> cartlist = new ArrayList<>();
		CartBean cartbean = new CartBean();

		cartbean.setProductId(cartId);
		cartbean.setCartQuantity(1);

		HttpSession session = request.getSession();
		ArrayList<CartBean> cart_session = (ArrayList<CartBean>) session.getAttribute("cart-list");

		if (cart_session == null) {
			cartlist.add(cartbean);
			session.setAttribute("cart-list", cartlist);
			out.println("session is null");
			response.sendRedirect("index.jsp");
			
		} else {
			cartlist = cart_session;
			boolean isExist = false;
		   
		    for(CartBean cartforbean :cart_session) {
	
		    	if(cartforbean.getProductId() == cartId) { 
			     isExist = true;
		    		out.println("IDs is "+cartforbean.getProductId() +" = "+cartId);	    		
		    		out.println(
						"<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>");
		    	}
		    
		    	
		    }

			if (!isExist) {
				cartlist.add(cartbean);
				response.sendRedirect("index.jsp");
			}
		}
		// with the help to print list of prpduct Id one by one 
        for(CartBean secondCart : cartlist) {
           out.println(secondCart.getProductId());        	
        }
	}

}
