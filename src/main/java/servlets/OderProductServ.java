package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.ProductOrderDao;
import bean.CartBean;
import bean.OrderBean;
import bean.Userbean;
import connectiondb.ConnectionProvider;

/**
 * Servlet implementation class OderProductServ
 */
public class OderProductServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try {
		PrintWriter p = response.getWriter();
		HttpSession httpSession = request.getSession();
	    Userbean userbean = (Userbean)httpSession.getAttribute("current_user");		
		if(userbean != null) {
	    Random ran = new Random();
	    int randomNumber = ran.nextInt(100)+200;
	    int completerandom = Integer.parseInt("1064"+randomNumber);
	    String idString = request.getParameter("product-id");
	    String uname =   userbean.getName();
		String proname = userbean.getPhone();
		int quantity =Integer.parseInt(request.getParameter("Quantity"));
		
		
		OrderBean orderbean = new OrderBean();
		orderbean.setOrderId(completerandom);
		orderbean.setProductId(Integer.parseInt(idString));
		orderbean.setCartQuantity(quantity);
		orderbean.setProductName(orderbean.getProductName());
		
		try {
		ProductOrderDao orderDao = new ProductOrderDao(ConnectionProvider.getConnection());
		boolean orderMethod = orderDao.orderedStore(orderbean); 
	    if(orderMethod)
		{
	    	ArrayList<CartBean> listproduct = (ArrayList<CartBean> )request.getSession().getAttribute("cart-list");
	    	if(listproduct != null) {
	    		for(CartBean cartproduct : listproduct) {
	    			if(cartproduct.getProductId() == Integer.parseInt(idString)) {
	    				listproduct.remove(listproduct.indexOf(cartproduct));
	    				break;
	    			}
	    		}
	    	}
	    	  response.sendRedirect("orders.jsp");
		}
		else {
			response.sendRedirect("Something miss match");
		}
		}catch(Exception e) {
	
			e.printStackTrace();
		}
		    
		p.println("Get method is running on");
		
		
		}	
		else {
			response.sendRedirect("login.jsp");
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter p = response.getWriter();
		p.println("Post method is running on");
	}

}
