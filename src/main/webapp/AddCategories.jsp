<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <jsp:directive.include file="/includes/header.jsp" />
    <link rel="stylesheet" href="css/Resister_Login.css" /> 
    <style>
    <jsp:directive.include file="/css/Navbar_Styling.jsp"/>
    
     /* Description Design */

        .description{
        margin: 0 60px;
        border: 2px solid darkmagenta;
        border-radius: 7px;
        height: 100px;
        font-size: 15px;
        font-weight: 600;
        }
        .button-container2{
            margin: 20px 0px 0 100px;
        }
     </style>
</head>

<body>
<jsp:directive.include file="includes/NavbarScaletan.jsp" />
   
 <div class="form-container bgphoto" id="align-d ">
            <h1>Add Category</h1>
            <hr>
            <form method="post" action="ProductCategoryServ">
            <input type="hidden" name ="categoryname" value="Categryform"/>
                <table>
                    <tr>
                        <td>Category Name</td>
                        <td><input type="text" class="form-control"  aria-describedby="emailHelp"
                                placeholder="e.g.Phone" id="category" name="category" required maxlength="15"/></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><textarea  class="description" id="description" name="description" cols="40" rows="5"></textarea>
                      </td>
                    </tr>
                    <tr>
                </table>
                <div class="button-container button-container2">
                    <div><input type="submit" class="btn btn-primary" value="ADD" /></div>
                </div>
            </form>    
        </div>  
 </body>

</html>