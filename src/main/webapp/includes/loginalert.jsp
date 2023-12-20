<%
//Object messageObject = session.getAttribute("message");
String message = (String)session.getAttribute("messages");
if(message != null){
	%>    
    <div class="alert alert-success" role="alert">
  <h4 class="alert-heading">Invalid User Login!</h4>
  </div>
<%
session.removeAttribute("messages");
System.out.println("session active");
}
%>
