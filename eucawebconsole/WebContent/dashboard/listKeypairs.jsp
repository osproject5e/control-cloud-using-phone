<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.amazonaws.services.ec2.*"%>
<%@page import="java.util.*"%>

<%@page import="com.amazonaws.services.ec2.model.*"%>
<%@ page import="eucaSampleConnect.*"%>
<%@page import="eucaSampleConnect.Keypairs"%>
<%
	Keypairs key = new Keypairs();
List<KeyPairInfo> keyInfo =null;
	try{

	keyInfo = key.listKeypair();
	session.setAttribute("message",session.getAttribute("message")+	" ");
 }
catch(Exception ex)
{
//	out.print("Err");
	session.setAttribute("message",session.getAttribute("message")+	" Error in getting information from cloud");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<title>Euca Admin</title>

<link rel="stylesheet"
	href="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
	
</script>
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.js">
	
</script>


</head>
<body>



	<!-- Home -->
	 <div data-role="page" id="page1" data-theme="a" >
		<div data-theme="b" data-role="header">
			<a href="index.jsp" data-transition="pop" data-icon="home">Home</a>
			<h3>Keypairs</h3>
			<a href="#popupLogin" data-rel="popup" data-position-to="window"
				data-transition="slidedown" data-icon="bars">New</a>
		</div>
		<div data-role="content">



			<%
				try {
					String msg = (String) session.getAttribute("message");
					session.setAttribute("message", "");
					if (msg.trim().length() != 0) {
			%>
			<div style="color: red" class="ui-bar ui-bar-c">
			
				<%
					out.print(msg);
				%>
			
			</div>

			<div data-role="collapsible-set">

				<%
					}

						Iterator it = keyInfo.iterator();
						while (it.hasNext()) {
							KeyPairInfo k = (KeyPairInfo) it.next();
				%>
			   <div data-role="collapsible" data-collapsed="true" data-content-theme="d"
					data-inset="false" >

					<%
						out.print("<h3>" + k.getKeyName() + "</h3>");
								out.print("<p style=\" white-space: normal; \">" + k.getKeyFingerprint() + "</p>");
					%>
					
					<div data-role="controlgroup" data-type="horizontal">
					<a href="deleteKeypairs.jsp?keyname=<%=k.getKeyName()%>" data-role="button" data-theme="b">Delete</a> <a
					href="deleteKeypairs.jsp?keyname=<%=k.getKeyName()%>"> </a>
			
				</div>
				</div>
				<%
					}
				%>

			</div>


			<%
				} catch (Exception ex) {
					//out.print("no err");

				}
			%>



		
		<!-- Create new Keypairs start-->
		    
		    
		<!--      <a href="#popupLogin" data-rel="popup" data-position-to="window" data-role="button" data-inline="true" data-icon="check" data-theme="a" data-transition="pop">
    Create Keypair</a> -->
   
		<div data-role="popup" id="popupMenu" data-theme="a">
			<div data-role="popup" id="popupLogin" data-theme="b"
				class="ui-corner-all">
				<a href="#" data-rel="back" data-role="button" data-theme="a"
					data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
				<form action="db_create_keypairs.jsp" data-ajax="false">
					<div style="padding: 10px 20px;">
						<h3>Enter Keypair Name</h3>
						<label for="un" class="ui-hidden-accessible">Key Pair
							Name:</label> <input type="text" name="keyname" id="un" value=""
							placeholder="Keypair">
						<button type="submit" data-theme="b" data-icon="check">Create
							Now</button>
					</div>
				</form>
			</div>
		</div>
		<!-- Create new Keypairs End -->

</div>
	</div>


</body>
</html>
