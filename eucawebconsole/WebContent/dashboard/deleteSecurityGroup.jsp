<!DOCTYPE html>
<%@page import="eucaSampleConnect.SecurityGroups"%>
<%@page import="com.amazonaws.services.ec2.*"%>
<%@page import="java.util.*"%>

<%@page import="com.amazonaws.services.ec2.model.*"%>
<%@ page import="eucaSampleConnect.*"%>
<%@page import="eucaSampleConnect.SecurityGroups"%>
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
	SecurityGroups s = new SecurityGroups();
	String name = request.getParameter("name");
		
	s.DeleteSecurityGroup(name);	

	// out.print(keyname+"Hello");
	response.sendRedirect("http://localhost:8080/eucawebconsole/dashboard/listSecurityGroups.jsp");
		
%>
</body>
</html>