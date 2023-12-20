<%@page import="java.util.List" %>
<%@page import="connectiondb.ConnectionProvider"%>
<%@page import="Dao.ProductDao"%>
<%@page import="bean.Userbean"%>
<%@page import= "bean.Product" %>
<%
Userbean userbean = (Userbean) session.getAttribute("current_user");
if (userbean == null) {
	session.setAttribute("message", "Attention Firstly Register..");
	response.sendRedirect("register.jsp");

} else {
	if (userbean.getUserType().equals("Client")) {
		session.setAttribute("meesage", "Your Are Not Access This Page");
		response.sendRedirect("login.jsp");
	}
}

// get product
ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
List<Product> products= productDao.getProduct();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link rel="stylesheet" href="AdminDashboard.css"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/FooterDesign.css" />
    <style>
  <jsp:directive.include file="/css/AdminCSS.jsp"/>
  <jsp:directive.include file="/css/Navbar_Styling.jsp"/>
    </style>
</head>
<body>
    <jsp:directive.include file = "includes/NavbarScaletan.jsp" />
 <section>
    <div class="container-space adminContain">
        <div class="row">
            <div class="navmanu col-md-2">
             <div class="line-between">

                   <!-- <h1>Navigation Bar</h1> -->
             <div class="sidebar row">
                <a href="index.jsp"> <i class="fa-solid fa-angles-right"></i> <span>Home</span></a>
                <a href="cart.jsp"> <i class="fa-solid fa-angles-right"></i> <span>Cart</span></a>
                <a href="orders.jsp"> <i class="fa-solid fa-angles-right"></i> <span>Order</span></a>
                <a href="register.jsp"> <i class="fa-solid fa-angles-right"></i> <span>Regigter</span></a>
                <a href="login.jsp"> <i class="fa-solid fa-angles-right"></i> <span>Login</span></a>
                <a href="AddProduct.jsp"> <i class="fa-solid fa-angles-right"></i> <span>Add Product</span></a>
                <a href="AddCategories.jsp"> <i class="fa-solid fa-angles-right"></i> <span>Add Category</span></a>
                <a href="RemoveProducts.jsp"> <i class="fa-solid fa-angles-right"></i> <span>All Products</span></a>
              
                <!-- <div class="right-border"></div>  -->
                <!-- Right Border -->
            </div>
        </div>
            </div>
            <div class="container  col-md-10">

           <div class="cont-row">
                <!-- Creating cart -->
                <div class="pro-cart">
                    <h4><i class="fa-solid fa-layer-group" style="color: #8e9095;"></i> Sales Earnings </h4>
                    <h1> 0.0%</h1>
                    <p>this is the hello word</p>
                </div>
                <div class="pro-cart">
                    <h4><i class="fa-solid fa-bag-shopping"></i>  Available Product</h4>
                    <h1><%=products.size() %></h1>
                    <p>Currently have product </p>
                </div>
                <div class="pro-cart">
                    <h4><i class="fa-solid fa-users-gear"></i> Total Users </h4>
                    <h1>20000</h1>
                    <p>These are Our total Customer</p>
                </div>
                <div class="pro-cart">
                    <h4><i class="fa-regular fa-user"></i> Active Users </h4>
                    <h1>1050</h1>
                    <p>These user are login</p>
                </div>

            </div>
                <div class="chart">
                    <h3>Analize the Sells </h3>
                    <div class="img"><img src="includes/chartImage.png" alt="chart" width="80%"></div>
                 </div>
        </div>
        </div>
        <section class="section2">
     

        </section>

    </div>
     </section>
  <!--   </div> -->
   <section id="footer col-md-12">
      <jsp:directive.include file="includes/FooterSection.jsp" />
     </section>
</body>

</html>