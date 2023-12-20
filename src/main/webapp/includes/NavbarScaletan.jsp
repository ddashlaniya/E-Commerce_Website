<%@ page import="bean.Userbean"%>
<%
Userbean authenticate = (Userbean) session.getAttribute("current_user");
%>
<section id="header">
	<a href="#"><img src="includes/shop-zone-2.png" alt="logo" class="logo"
		height="50px" /></a>
	<div>
		<ul id="navbar">
			<li><a class="active" href="index.jsp"><i
					class="fa-solid fa-house"></i></a></li>
			<li><a class="color-red" href="cart.jsp">Cart</a></li>
			<li><a href="#about">About as</a></li>
		<!-- 	<li><a href="FetchDataOnline">Review</a></li> -->
			<li><a href="https://www.youtube.com">Review</a></li>
			<li><a href="#contactus">Contact As</a></li>
			<li>
				<div class="search">

					<form action="#">
						<input type="text" placeholder=" Search Anything.." name="search"
							class="input-action" />
						<button>
							<i class="fas fa-search" style="font-size: 18px;"> </i>
							<!-- <i class="fas fa-search"></i> -->
						</button>
					</form>
				</div>
			</li>

			<%
			if (authenticate == null) {
			%>
			<li><a href="login.jsp">Login</a></li>
			<li><a href="register.jsp">Register</a></li>
			<%
			} else {
			%>
 
  <li class="dropdown">
                 <span><i class="fa-solid fa-bars"></i></span>
                <div class="dropdown-content">
                <div class="drop-item">
                     <p><a href="#"><%=authenticate.getName() %></a></p>
                        <p><a href="orders.jsp">Orders</a></p>
                        <p><a href="LogOutServ">LogOut</a></p>
                        <%
                        if(authenticate.getUserType().equals("Admin")){
                        %>
                        <p><a href="AdminDashboard.jsp">Dasboard</a></p>                  
                        <%} %>
                   
                </div>
                </div>
            </li>
           <li><h1 style="color: white; font-size: 14px;"></h1></li>
			<%
			}
			%>
		</ul>
	</div>

</section>
