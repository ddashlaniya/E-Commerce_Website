<%@page import="bean.Userbean"%>
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
%>

<?xml version="1.0" encoding="UTF-8" ?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Admin Pannel</title>
<jsp:directive.include file="/includes/header.jsp" />
<jsp:directive.include file="/includes/Jsfileboot.jsp"/>
<link rel="stylesheet" href="css/FooterDesign.css" />
<style>
<jsp:directive.include file="/css/Navbar_Styling.jsp"/>
<jsp:directive.include file="/includes/categoryform.jsp"/>
.card {
	/* width: 200px; */
	width: 25%;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin: 10px;
}

.card img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
}

.card-content {
	text-align: center;
}

.row {
	display: flex;
	flex-wrap: wrap;
}

.center {
	margin: auto;
	width: 70%;
	padding: 15px;
}

.decor {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<jsp:directive.include file="includes/NavbarScaletan.jsp" />
	<h1>ADMMIN JSP PAGE</h1>

	<div class="center container-fluid">


		<div class="row mt-3">
			<div class="card col-md-4">
				<div class="card-content">
					<a href="admin.html" class="decor"> <img
						src="product-image/learn.jpg" alt="Card Image" />
						<h2>total user</h2>
						<p>5054</p>
					</a>
				</div>
			</div>
			
			<div class="card card col-md-4">
				 <a href="AddProduct.jsp" class="decor"> -->
					<div class="card-content">
						<img src="product-image/learn.jpg" alt="Card Image" />
						<h2>Category</h2>
						<p>Some text describing the card content.</p>
					</div>
			 </a>
			</div>
			<div class="card card col-md-4">
				<a href="admin.html" class="decor">
					<div class="card-content">
						<img src="product-image/learn.jpg" alt="Card Image" />
						<h2>Product</h2>
						<p>Some text describing the card content.</p>
					</div>
				</a>
			</div>

		</div>

		<div class="row mt-2">

			<div class="card" id="clickDiv">
				<!-- <a href="admin.html" class="decor"> -->
				<div class="learn.jpg">
					<img src="product-image/learn.jpg" alt="Card Image" />
					<h2>Add Category</h2>
					<p>Some text describing the card content.</p>

					<!--<button id="myButton">Click me</button>--> 
					<div id="myPopup" class="popup">
						<div class="popup-content">
							<h1 style="color: green;">Welcome to E-Bazzar !</h1>

							<form action="ProductCategoryServ" method="post">
							<input type="hidden" name ="categoryname" value="Categryform"/>
								
								<label for="category">Category:</label>
								 <input type="text" id="category" name="category" required /><br />
								<br /> <label for="description">Description:</label><br />
								<textarea id="description" name="description" rows="4" cols="40"
									required ></textarea>
								<br /> <br /> <input type="submit" id="closePopup" value="Submit" />
							</form>
							<!--  <button id="closePopup">Submit&Close</button> -->
							<input type="hidden" name="Cencel" value="closing" id="closePops"/>
						</div>
					</div>


				</div>
				<!-- </a> -->
			</div>

			<div class="card" data-toggle="modal" data-target="#add-product-modal">
				<!-- <a href="admin.html" class="decor"> -->
					<div class="card-content">
						<img src="product-image/learn.jpg" alt="Card Image" />
						<h2>Add Product</h2>
						<p>Some text describing the card content.</p>
					</div>
				<!-- </a> -->
			</div>
			
			
			
			 <div class="pro-cart">
                    <img alt="product" src="f1.jpg" height="280px" />
                    <div class="des">
                        <span>Smartees </span>
                        <h5>Men Printed Round Neck Cotton Blend Black T-Shirt</h5>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h1>₹499</h1>
                        <a href="#"><i class="fa-solid fa-cart-plus cart-icon"></i></a>

                    </div>
                </div>
			<script>
	clickDiv.addEventListener("click", function() {
			myPopup.classList.add("show");
		});
	//closePopup.addEventListener("click", function() {
		
		closePops.addEventListener("click" , function(){
			myPopup.classList.remove("show");
		});
		window.addEventListener("click", function(event) {
			if (event.target == myPopup) {
				myPopup.classList.remove("show");
				
			}
		});
	</script>
		</div>
	</div>
	<section>
			  <jsp:directive.include file="includes/FooterSection.jsp" />
			</section>
</body>
</html>
