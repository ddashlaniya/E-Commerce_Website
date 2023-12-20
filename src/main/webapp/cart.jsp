<%
CartBean b = new CartBean();
int ab = b.getProductId();
ArrayList<CartBean> cartSession = (ArrayList<CartBean>)session.getAttribute("cart-list");

	    List<CartBean> cartProduct = null;
        int item = 0;
		if(cartSession != null){
		out.println("Session istem is => "+cartSession.size());
		ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
		cartProduct = productDao.getCartProduct(cartSession);
		item = productDao.getProductPrice(cartSession);
		System.out.println(cartSession);
		request.setAttribute("cart_Session", cartSession);
		
		
		
	}
%>
<%@page import="connectiondb.ConnectionProvider"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.Product"%>
<%@ page import="bean.CartBean"%>
<%@ page import="Dao.ProductDao"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- <!DOCTYPE html> -->
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pro-Ecommerce Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> 
    <jsp:directive.include file="includes/header.jsp"/>
<!--    <link rel="stylesheet" href="includes/NavDesigns.css"/> -->
<style>
<jsp:directive.include file="/css/Navbar_Styling.jsp"/>
</style>
</head>
<body>
<jsp:directive.include file = "includes/NavbarScaletan.jsp" />

   <div class="container my-5">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        Shopping Cart
                    </div>
                   
                  <%try{
                  if(cartSession != null){
                	  for(CartBean loopCart :cartProduct){%>
                	
                	<div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="product-image/<%=loopCart.getpImage1() %>" alt="Product Image" class="img-fluid">
                            </div>
                            <div class="col-md-9">
                                <h5 class="card-title"><%= loopCart.getProductName() %></h5>
                                <p class="card-text">Price:$<%=loopCart.getProductPrices() %></p>
                                
                              <form action="OderProductServ" method="get" class="form-inline">
                              <input type="hidden" name="product-id" value="<%=loopCart.getProductId() %>" class="form-input"/>
                               <button class="btn btn-primary increase mr-2" ><a href="IncAndDecreServlet?action=inc&id=<%=loopCart.getProductId() %>" style=" text-decoration: none; color: white">Increase</a></button>
                                <input type="text" name="Quantity" class="form-control mr-2" style="width: 40px;" value="<%=loopCart.getCartQuantity() %>" readonly="readonly"/>
                                <button class="btn btn-secondary decrease mr-5" ><a href="IncAndDecreServlet?action=dec&id=<%=loopCart.getProductId() %>" style=" text-decoration: none; color: white">Decrease</a></button>
                                <button class="row btn btn-danger remove mr-2"><a href="remove-product-to-cart?id=<%=loopCart.getProductId() %>" style=" text-decoration: none; color: white">Remove </a></button>
                               <button class="btn btn-primary buy" type="submit">BUY NOW</button>
                            </form>
                            </div>
                        </div>
                    </div>
                	
                 <%
                	  }
                  }
                  }catch(NullPointerException e){
                	  out.println("Not available any product in cart.");
                	 // e.printStackTrace();
                  }
                  
                  %>
                    
                </div>
            </div>
            <div class="col-md-4">
            <form action="OderProductServ" method="get" class="form-inline">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total Price</h5>
                        <p class="card-text">$ <%=item %></p>
                        <button class="btn btn-secondary checkout">Checkout</button>
                        <button class="btn btn-primary buy" type="submit">BUY NOW</button>
                        
                    </div>
                </div>
                  </form>
            </div>
            
        </div>
    </div>
   
</body>
</html> 


