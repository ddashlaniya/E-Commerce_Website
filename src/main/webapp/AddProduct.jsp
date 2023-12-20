<%@ page import="java.util.List"%>
<%@ page import="Dao.CategoryDao"%>
<%@ page import="bean.ProCategory"%>
<%@ page import="connectiondb.ConnectionProvider"%>

<%
CategoryDao categoryDao = new CategoryDao(ConnectionProvider.getConnection());
List<ProCategory> categories = categoryDao.getCategory();
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/Resister_Login.css" />
<!--  <link rel="stylesheet" href="css/AddProductCss.css" /> -->
<%-- <jsp:directive.include file="/includes/header.jsp" /> --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        referrerpolicy="no-referrer" />

<style>
<jsp:directive.include file="/css/Navbar_Styling.jsp"/>
.uploaded-file {
	color: rgb(126, 62, 126);
	margin: 10px 15px 0 40px;
}

.option-space {
	margin: 0 40px 0 50px;
}
 .form-margin{
margin: 20px 100px 10px 380px;
} 
</style>
</head>

<body>
<%-- <jsp:directive.include file="includes/NavbarScaletan.jsp" /> --%>
	<div class="form-container form-margin">

		<h1>Add Product</h1>
		<hr>
		<form method="post" action="ProductServlet2"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td><label for="name">Product Name: </label></td>
					<td><input type="text" name="pname" placeholder="e.g. Phone"
						class="form-control"></td>
				</tr>

				<tr>
					<td><label for="name">Product Model: </label></td>
					<td><input type="text" name="pmodel" placeholder="e.g. s1"
						maxlength="10" class="form-control"></td>
				</tr>

				<tr>
					<td><label for="name">Category/Type </label></td>
					<td><input type="text" name="ptype" placeholder="e.g. Phone"
						maxlength="10" class="form-control"> <!--   <type="text" name="ptype" placeholder="e.g. Phone" maxlength="10"/> -->
					</td>
				</tr>

				<tr>
					<td><label for="name">Brand: </label></td>
					<td><input type="text" name="pbrand" placeholder="e.g. realme"
						maxlength="10" class="form-control"></td>
				</tr>

				<tr>
					<td><label for="name">Quantity: </label></td>
					<td><input type="number" name="pquantity"
						placeholder="e.g. 12" maxlength="4" class="form-control">
					</td>
				</tr>
				<tr>
					<td><label for="name">Price: </label></td>
					<td><input type="number" name="price" placeholder="$499"
						maxlength="5" class="form-control"></td>
				</tr>
				<tr>
					<td><label for="name">Discount: </label></td>
					<td><input type="number" name="discount" placeholder="$499"
						maxlength="5" class="form-control"></td>
				</tr>
				<tr>
					<td><label for="name">Categories: </label></td>
					<!--  <td> <input type="text" name="category" placeholder="cate" class="form-control"></td>--->
					<td><select id="myDropdown" name="category">
							<%
							for (ProCategory category : categories) {
							%>
							<option class="form-control option-space"
								value="<%=category.getCategoryName()%>"><%=category.getCategoryName()%></option>

							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td><label for="description">Description:</label><br></td>
					<td><textarea id="description" name="description" rows="4"
							cols="50" required class="form-control"></textarea></td>
				</tr>

				<tr>
					<td><label for="file">Upload File:</label></td>

				</tr>
			</table>
			<div class="uploaded-file">
				<td><input type="file" name="pimage1" accept=".jpg, .png"></td>
				<td><input type="file" name="pimage2" accept=".jpg, .png"></td>
			</div>
			<div class="uploaded-file">
				<td><input type="file" name="pimage3" accept=".jpg, .png"></td>
				<td><input type="file" name="pimage4" accept=".jpg, .png"></td>
			</div>
			<div class="button-container button-container3">
				<div>
					<input type="submit" class="btn btn-primary" value="ADD" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>