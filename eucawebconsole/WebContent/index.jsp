<%
	session.setAttribute("message", "");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<title></title>
<!-- 
		<link rel="stylesheet" href="themes/A.min.css" />
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0-rc.1/jquery.mobile.structure-1.3.0-rc.1.min.css" />
		<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.3.0-rc.1/jquery.mobile-1.3.0-rc.1.min.js"></script>
       
<link rel="stylesheet"
	href="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
	
</script>
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.js">
	
</script>
        
         -->

<link rel="stylesheet"
	href="jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.css" />

<script
	src="jquery.mobile-1.3.0/jquery.min.js">
	
</script>
<script
	src="jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.js">
	
</script>

</head>
<body>
	<!-- Home -->
	<div data-role="page" id="page1"  data-theme="b">
		<div data-theme="b" data-role="header">
			<h1>EUCA ADMIN</h1>
		</div>
		<div data-role="content">
			<form action="dashboard/index.jsp">
				<div data-role="fieldcontain">
					<fieldset data-role="controlgroup" data-mini="true">
						<label for="userId"> User ID </label> <input name="userId"
							id="userId" placeholder="Enter User Name" value="" type="text" />
					</fieldset>
				</div>
				<div data-role="fieldcontain">
					<fieldset data-role="controlgroup" data-mini="true">
						<label for="password"> Password </label> <input name="password"
							id="password" placeholder="Enter Password" value=""
							type="password" />
					</fieldset>
				</div>
				<input id="login" type="submit" data-theme="b" data-icon="home"
					data-iconpos="right" value="Login" />
			</form>
		</div>
	</div>
</body>
</html>
