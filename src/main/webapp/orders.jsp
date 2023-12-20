<%@page import="bean.Product"%>
<%@page import="bean.OrderBean" %>
<%@page import="connectiondb.ConnectionProvider"%>
<%@page import="Dao.ProductOrderDao"%>
<%@ page import="bean.CartBean"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="Dao.ProductDao" %>
<%
Userbean userbean = (Userbean) request.getSession().getAttribute("current_user");
ArrayList<CartBean> cartSession = (ArrayList<CartBean>) session.getAttribute("cart-list");
ArrayList<OrderBean> orderList = null;
if (userbean != null) {
	request.setAttribute("Current-User", userbean);
	ProductOrderDao productorder = new ProductOrderDao(ConnectionProvider.getConnection());
	orderList = productorder.orderedProduct(userbean.getUserId());

}
if (cartSession != null) {
	request.setAttribute("cartlist", cartSession);
	
}

%>


<?xml version="1.0" encoding="UTF-8" ?>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order-Page</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<jsp:directive.include file="includes/header.jsp" />
<link rel="stylesheet" href="includes/NavDesigns.css"/>
<style>
<jsp:directive.include file="/css/Navbar_Styling.jsp"/>
</style>
</head>
<body>
	<jsp:directive.include file = "includes/NavbarScaletan.jsp" />
	<div class="container-fluid">
	<div class="card-header my-3 " style="background-color: rgb(119, 119, 103); width: 100%">Your orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
                    <th scope="col">Ordered Code</th>
					<th scope="col">Product Name</th>
					<th scope="col">Quantity</th>
					<th scope="col">Model</th>
					<th scope="col">Price</th>
					<th scope="col">Cencel Order</th>
				</tr>
			</thead>
			<tbody>
				<%
				if(orderList != null){
					for(OrderBean o : orderList){%>
					
				<tr>
					<td><%=o.getDateTime() %></td>
					<td><%=o.getOrderId() %></td>
					<td><%=o.getProductName() %></td>
					<td><%=o.getCartQuantity() %></td>
					<td><%=o.getProductModel() %></td>
					<td><%=o.getProductPrices() %></td>
					<td>Cencel</td>
				</tr>
						
				<%	}
				}
				%>
					
			</tbody>
		</table>
	</div>
</body>
</html>