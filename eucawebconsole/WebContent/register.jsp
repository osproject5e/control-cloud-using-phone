<%
	//session.setAttribute("message", "");
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
		<%
			System.out.println(session.getAttribute("message")+"in dash1");
			String msg = (String) session.getAttribute("message");
			
				
				
				if (msg!=null && msg.trim().length() != 0) {
					session.setAttribute("message", "");
			%>
			<div style="color: red" class="ui-bar ui-bar-c">
				<%
					out.print(msg);
				System.out.println(msg);
				%>
			</div>

			<%
				}
			%>
		

		<form action="RegistrationAction.jsp">
				<div data-role="fieldcontain">
					<fieldset data-role="controlgroup" data-mini="true">
						 <input name="username"
							id="username" placeholder="Enter User Name" value=""
							type="text" />
					</fieldset>
					
					
				</div>

				<div data-role="fieldcontain">
					<fieldset data-role="controlgroup" data-mini="true">
						<input name="password"
							id="password" placeholder="Enter Password" value=""
							type="password" />
					</fieldset>
					
					
				</div>
				
				<div data-role="fieldcontain">
					<fieldset data-role="controlgroup" data-mini="true">
						<input name="Cpassword"
							id="Cpassword" placeholder="Confirm Password" value=""
							type="password" />
					</fieldset>
				</div>
				
				
				<div data-role="fieldcontain">
					<fieldset data-role="controlgroup" data-mini="true">
						<input name="accessKey"
							id="accessKey" placeholder="Enter Access Key" value="" type="text" />
					</fieldset>
				</div>


				<div data-role="fieldcontain">
					<fieldset data-role="controlgroup" data-mini="true">
						 <input name="secretKey"
							id="secretKey" placeholder="Enter Secret Key" value="" type="text" />
					</fieldset>
				</div>
				
				<div data-role="fieldcontain">
					<fieldset data-role="controlgroup" data-mini="true">
						<input name="endpoint"
							id="endpoint" placeholder="Enter Endpoint" value="" type="text" />
					</fieldset>
				</div>

		
		<input type="submit" value="Register">
		<div data-role="content">
			
			<%
				try {
					String msg1 = (String) session.getAttribute("message");
					session.setAttribute("message", "");
					if (msg1.trim().length() != 0) {
			%>
			<div style="color: red" class="ui-bar ui-bar-c">

				<%
					out.print(msg1);
					}
				%>

			</div>


			<%
				} catch (Exception ex) {
					//out.print("no err");

				}
			%>
		
		</div> 


</form>

		
			 
		</div>
	</div>
</body>
</html>
