<%
//Object messageObject = session.getAttribute("message");
String message = (String)session.getAttribute("message");
if(message != null){
	%>    
   <div class="alert alert-success" role="alert">
  <h4 class="alert-heading">You Successfully Registered! Pleace Login</h4>
  </div>
<%
session.removeAttribute("message");
}

%>
