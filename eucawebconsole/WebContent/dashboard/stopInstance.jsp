<!DOCTYPE html>
<%@page import="eucaSampleConnect.Instances"%>
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
	//String Instance_id = request.getParameter("instance_id");

String Instance_id = "i-01B34335";

		

		Instances stop = new Instances();
		out.print(Instance_id);
		stop.stop_instance(Instance_id);
%>
</body>
</html>