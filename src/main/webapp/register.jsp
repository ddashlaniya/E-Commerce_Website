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
     </style>
</head>

<body>
<jsp:directive.include file="includes/NavbarScaletan.jsp" />
    <div class="form-container" id="align-d ">
        <form method="post" action="RegisterServlet">
        <jsp:directive.include file="/includes/message.jsp" />
            <table>
                <tr>
                    <td>Enter Your name</td>
                    <td><input type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp"
                            name="name" placeholder="Enter Name" required="required" /></td>
                </tr>
                <tr>
                    <td>Enter Your Email</td>
                    <td><input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                            placeholder="Enter email" name="email" required="required" /></td>
                </tr>
                <tr>
                    <td>Enter Mobile</td>
                    <td><input type="text" name="phone" class="form-control" id="exampleImputPasswords"
                            aria-describedby="passwordHelp" placeholder="Enter Phone Number" required="required" /></td>
                </tr>
                <tr>
                    <td>Choose Gender</td>
                    <td><input class="form-check-input" type="radio" id="flexRadioDefault1" name="gender"
                            value="Male" /> Male</td>
                    <td><input class="form-check-input" type="radio" id="flexRadioDefault1" name="gender"
                            value="Female" /> Female</td>
                </tr>
                <tr>
                    <td>Create Password</td>
                    <td><input type="password" name="re-pass" class="form-control" id="exampleImputPasswords"
                            aria-describedby="passwordHelp" placeholder="Enter Passwords" required="required" /></td>
                </tr>
                <tr>
                    <td>Enter Re-Password</td>
                    <td><input type="password" name="pass" class="form-control" id="exampleImputPasswords"
                            aria-describedby="passwordHelp" placeholder="Enter Passwords" required="required" /></td>
                </tr>
                <tr>
            </table>
            <div class="button-container">
                <div><input type="submit" class="btn btn-primary" value="Register" /></div>
            </div>
        </form>
        <div class="butt-div">
            <p>If have already account <button class="btn2 btn-primary"><a
                        href="login.jsp">Login</a></button></p>
        </div>

    </div>
</body>

</html>