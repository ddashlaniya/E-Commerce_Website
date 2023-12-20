<%@page import="java.util.List" %>
<%@page import="connectiondb.ConnectionProvider"%>
<%@page import="Dao.ProductDao"%>
<%@page import="bean.Userbean"%>
<%@page import= "bean.Product" %>
<%
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
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            background-color: #ff3333;
            color: #fff;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
        }

        button:hover {
            background-color: #cc0000;
        }
    </style>
</head>

<body>
    <table>
        <tr>
            <th>Id</th>
            <th>Image</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Quantity</th>
            <th>Category</th>
            <th>Model</th>
            <th>Prices/Item</th>
            <th>Operation</th>
        </tr>
        <%for(Product pro : products)
        {
       %>
        <tr>
            <td><%=pro.getProductId() %></td>
            <td><img src="product-image/<%=pro.getpImage1() %>"
                    alt="Image" height="150px" width="50%"></td>
            <td><%=pro.getProductName() %></td>
            <td><%=pro.getProductBrand() %></td>
            <td><%=pro.getProductQuantity() %></td>
            <td><%=pro.getProCate() %></td>
            <td><%=pro.getProductModel() %></td>
            <td><%=pro.getProductPrices() %></td>
            <td><button>Delete</button></td>
        </tr>
       
       
       <% 	
        }
        	%>
        
       
    </table>
</body>

</html>
