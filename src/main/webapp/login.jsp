<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="javax.servlet.http.HttpSession" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
<jsp:directive.include file="/includes/header.jsp"/>
 <link rel="stylesheet" href="css/Resister_Login.css" /> 
<!-- <link rel="stylesheet" href="includes/NavDesigns.css"/> -->
<style>
<jsp:directive.include file="/css/Navbar_Styling.jsp"/>
</style>
</head>
<body>
<jsp:directive.include file = "includes/NavbarScaletan.jsp" />
 <div class="form-container" id="align-d ">
        <form method=post action="loginServ">
            <table>
                <tr>
                    <td>Enter Your Email</td>
                    <td><input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                            placeholder="Enter email" name="email" required="required" /></td>
                </tr>
                <tr>
                    <td>Enter Password</td>
                    <td><input type="password" name="pass" class="form-control" id="exampleImputPasswords"
                            aria-describedby="passwordHelp" placeholder="Enter Passwords" required="required" /></td>
                </tr>
            </table>
            <div class="button-container">
                <div><input type="submit" class="btn btn-primary" value="Login" /></div>
            </div>
        </form>
        <div class="butt-div">
            <p>If you don't have account <button class="btn2 btn-primary"><a
                        href="register.jsp">Register</a></button></p>
        </div>

    </div>
</body>
</html>
<%--</jsp:root> --%>