<%@ page import="bean.Userbean" %>
<%
 Userbean authenticate = (Userbean)session.getAttribute("current_user");
%>	
<section id="header">

<ul id="navbar">  
  <li><a class="active" href="index.jsp">Home</a></li>  
  <li><a class="color-red" href="cart.jsp">Cart<span class="badge badge-danger"> <%-- "${cart_Session.size()}" --%></span></a></li>  	   
 <%
 if(authenticate == null){
	 %>
	 <li><a href="login.jsp">Login</a></li>
	 <li><a href="register.jsp">Register</a></li>  
 <%
 }else{
	%>	
	<li><a href="orders.jsp">Order</a></li>
	<li><a href="#"><%=authenticate.getName()%></a></li>
     <li><a href="LogOutServ">Logout</a></li>
	
	<%
 }
 %>
  <li><a href="#">About us</a></li> 
   
</ul>  

</section>