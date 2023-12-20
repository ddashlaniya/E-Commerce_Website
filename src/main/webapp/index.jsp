<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="java.util.*"%>
<%@ page import="bean.Product"%>
<%@ page import="bean.ProCategory"%>
<%@ page import="Dao.ProductDao"%>
<%@ page import="Dao.CategoryDao"%>
<%@ page import="connectiondb.ConnectionProvider"%>
<%@page import="bean.CartBean"%>
<%
// fetch the link data
String linkCategory = request.getParameter("Category");
ProductDao dao = new ProductDao(ConnectionProvider.getConnection());

List<Product> product = null;
if (linkCategory == null || linkCategory.trim().equals("allproducts")) {

	product = dao.getProduct();

} else {
	product = dao.getCategoryProduct(linkCategory);
}

CategoryDao cateDao = new CategoryDao(ConnectionProvider.getConnection());
List<ProCategory> categoryList = cateDao.getCategory();

ArrayList<CartBean> cartSession = (ArrayList<CartBean>) session.getAttribute("cart-list");
if (cartSession != null) {
	request.setAttribute("cart_Session", cartSession);

}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
<jsp:directive.include file="/includes/header.jsp" />
<!-- <link rel="stylesheet" href="includes/NavDesigns.css" /> -->
<link rel="stylesheet" href="css/style.css" /> 
<link rel="stylesheet" href="css/FooterDesign.css" />
<style>
<jsp:directive.include file="/css/Navbar_Styling.jsp"/>
#top-discount {
	/* background-image: url(product-image/hero4.png); */
	
	background-image: url(https://d3nn873nee648n.cloudfront.net/1200x1800-new/20655/SM1066407.jpg);
	height: 90vh;
	width: 100%;
	background-size: cover;
	background-position: top 25% right 0%;
	padding: 0 480px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: center;
	
}
/*Banner Photo*/
.banner-container {
    background-image: url(product-image/Banner2.jpg);
  } 
  /* .pro-cart{
    margin:20px ;
  } */

  </style>
</head>
<body>
	<jsp:directive.include file="includes/NavbarScaletan.jsp" />
	
	<!-- 	<h1>Welcome on JSp page</h1> -->
	<section class="categories">
		<ul class="cate-list">
		<a href="index.jsp?Category= allproducts" class="list-group-item list-group-item-action active"
						aria-current="true"> <a>All</a></a>
	<%
	for (ProCategory loopCategory : categoryList) {
	%>
			<li><a href="index.jsp?Category=<%=loopCategory.getCategoryName()%>" class="list-group-item list-group-item-action"><%=loopCategory.getCategoryName()%></a></li>

		<%
		 }	
		%>
		</ul>
	</section>
	<div>
		<!--Top Tranding products-->
		<section id="top-discount">
			<h4>Supper Fastival Offer!</h4>
			<h2>Deal With Big Brand's</h2>
			<h1>On All Products</h1>
			<p>Save more than 75% off, for this new trends</p>
			<button>BUY NOW</button>
		</section>

	</div>
	<div><hr/>
	  <section id="allproducts" class="product-cart" id="cart-p1">
	 <div class="col-md-12"> 
                    <!-- Product cart container -->
                    <div class="product-container container-fluid row">
                    <h2>Explore Product</h2>
                    <p>Winter collection! Enjoy somethig Special</p>
                   <%
					if (product != null && !product.isEmpty()) {
					%>
					<%
					int count = 0;
					for (Product productbean : product) {
					
					%>
                        <div class="pro-cart col-md-2">
                            <img alt="product" src="product-image/<%=productbean.getpImage1()%>" height="280px" />
                            <div class="des">
                                <span><%=productbean.getProductBrand() %></span>
                                <h5>Men Printed Round Neck Cotton Blend Black T-Shirt</h5>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <h1><i class="fa-solid fa-indian-rupee-sign"></i> <%=productbean.getProductPrices() %></h1>
                                <a href="CartServlet?add-to-cart=<%= productbean.getProductId()%>"><i class="fa-solid fa-cart-plus cart-icon"></i></a>

                            </div>
                        </div>
                        	<%
                        /* 	count++;
                        	if(count>=6) break; */
					}
					%>
					<%
					} else {
					%>
					<h2 style="color:blue">No products available in this category.</h2>
					<%
					}
					%>
             </div>
           </div>
       
       </section>
       </div>
       <section class="banner-ad">
            <div class="banner-container">
            <h4>Banner-photo</h4>
            <h1>sission sell</h1>
           <p>Make sure you wrap your product elements in a container with the class </p>
           <a href="#"><button >Shop Now</button></a>
            </div>
        </section>
       <br/>
        <section class="about-section" id="about">
            <h2 ><strong class="about-heading">About Us</strong></h2>
            <div class="story-container">
                <div class="story-2">
                    <h2>Our Story</h2>
                    <p>Integer quis tortor a leo tincidunt fermentum. Suspendisse tincidunt bibendum leo, eu euismod nis
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, illum! Nostrum pariatur magnam
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        debitis numquam sed dolore quis!Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Ratione, illum! Nostrum pariatur magnam
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        debitis numquam sed dolore quis!Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Ratione, illum! Nostrum pariatur magnam
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        debitis numquam sed dolore quis!Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Ratione, illum! Nostrum pariatur magnam
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        debitis numquam sed dolore quis!Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Ratione, illum! Nostrum pariatur magnam
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        debitis numquam sed dolore quis!
                    </p>
                </div>

                <div class="mission-image">
                    <img src="https://d3nn873nee648n.cloudfront.net/900x600/100099/9-ZM1029449.jpg" alt="photo"
                        height="600px" />
                </div>
            </div>
            <div class="story-container">
                <div class="mission-image">
                    <img src="https://d3nn873nee648n.cloudfront.net/900x600/19701/15-ED955805.jpg" alt="photo"
                        height="600px" />
                </div>
                <div class="story-2">
                    <h2>Our Mission</h2>
                    <p>Integer quis tortor a leo tincidunt fermentum. Suspendisse tincidunt bibendum leo, eu euismod nis
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, illum! Nostrum pariatur magnam
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        debitis numquam sed dolore quis!Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Ratione, illum! Nostrum pariatur magnam
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        debitis numquam sed dolore quis!Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Ratione, illum! Nostrum pariatur magnam
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        debitis numquam sed dolore quis!Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Ratione, illum! Nostrum pariatur magnam
                        eveniet enim quaerat ipsum dolorum eaque, commodi minus, cumque minima praesentium tempore
                        debitis numquam sed dolore quis!
                    </p>
                </div>
            </div>
            <div class="story-container">
                <div id="about-img1">
                    <img src="https://d3nn873nee648n.cloudfront.net/900x600/16876/9-SM731236.jpg" alt="Image" height="500px" width="100%"/>
                </div>
                <div id="about-img2">
                    <img src="https://d3nn873nee648n.cloudfront.net/1200x1800-new/19255/SM910130.jpg" alt="image" height="500px" width="100%"/>
                </div>

            </div>

        </section>
     <section id="contactus">
      <jsp:directive.include file="includes/FooterSection.jsp" />
     </section>
</body>
</html>