<!DOCTYPE html>
<%@page import="eucaSampleConnect.Instances"%>
<%@page import="com.amazonaws.services.ec2.*"%>
<%@page import="java.util.*"%>

<%@page import="com.amazonaws.services.ec2.model.*"%>
<%@ page import="eucaSampleConnect.*"%>
<%@page import="eucaSampleConnect.Keypairs"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<title></title>

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
<%
	Keypairs k=new Keypairs();

	String keyname = request.getParameter("keyname");
	
	k.DeleteKeypair(keyname);
	

	out.print(keyname+"Hello");
	response.sendRedirect("http://localhost:8080/eucawebconsole/dashboard/listKeypairs.jsp");
		
%>
</body>
</html>