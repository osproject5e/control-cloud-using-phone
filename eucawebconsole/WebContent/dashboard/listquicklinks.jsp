<%@page import="db.*"%>
<%@page import="java.sql.*"%>
<%		

	//String redirectURL = request.getRequestURL().substring(0,			request.getRequestURL().lastIndexOf("/"));
	//redirectURL += "/index.jsp";
	//System.out.println("request URL= " + redirectURL);
	ResultSet rs = null;
	try{
		DB_Config db = new DB_Config();
		
		Connection con = db.registerDB();
		
		String query ="select * from  quicklinks  where id=1" ;		
		Statement st = con.createStatement();
		rs = st.executeQuery(query);
		if(rs.next())
		{}
		else
			throw new Exception();			
	}
	catch(Exception ex)
	{
		
	}
	//response.sendRedirect("index.jsp");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<title>Euca Admin</title>

<!-- 
        <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
        <link rel="stylesheet" href="my.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
        </script>
        <script src="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.js">
        </script>

       -->

<!-- 
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
	href="../jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.css" />

<script src="../jquery.mobile-1.3.0/jquery.min.js">
	
</script>
<script src="../jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.js">
	
</script>

</head>
<body>
	<!-- Home -->
	<div data-role="page" id="page1" data-theme="a">
		<div data-theme="b" data-role="header">
			<a href="index.jsp" data-transition="pop" data-icon="home">Home</a>
			<h3>Quick Links</h3>
			<a href="#popupLogin" data-rel="popup" data-position-to="window"
				data-transition="pop" data-icon="bars">Alerts</a>
		</div>
		<div data-role="content">
<form action="db_quicklinks.jsp">
<table width="100%" >
<tr><td><label for="ListInstance"><b>List Instance:</b></label></td><td align="right"><select name="ListInstance" id="ListInstance" data-role="slider" style="">
    <option value="0" <% if(rs.getInt("ListInstance")==0) out.print("selected=1"); %>>Off</option>
    <option value="1" <% if(rs.getInt("ListInstance")==1) out.print("selected=1"); %>>On</option>
</select></td></tr>
<tr><td><label for="LaunchInstance"><b>Launch Instance:</b></label></td><td align="right"><select name="LaunchInstance" id="LaunchInstance" data-role="slider" style="">
    <option value="0" <% if(rs.getInt("LaunchInstance")==0) out.print("selected=1"); %>>Off</option>
    <option value="1" <% if(rs.getInt("LaunchInstance")==1) out.print("selected=1"); %>>On</option>
</select></td></tr>
<tr><td><label for="ListKeypair"><b>List Keypair:</b></label></td><td align="right"><select name="ListKeypair" id="ListKeypair" data-role="slider" style="">
    <option value="0" <% if(rs.getInt("ListKeypair")==0) out.print("selected=1"); %>>Off</option>
    <option value="1" <% if(rs.getInt("ListKeypair")==1) out.print("selected=1"); %>>On</option>
</select></td></tr>
<tr><td><label for="CreateKeypair"><b>Create Keypair:</b></label></td><td align="right"><select name="CreateKeypair" id="CreateKeypair" data-role="slider" style="">
    <option value="0" <% if(rs.getInt("CreateKeypair")==0) out.print("selected=1"); %>>Off</option>
    <option value="1" <% if(rs.getInt("CreateKeypair")==1) out.print("selected=1"); %>>On</option>
</select></td></tr>
<tr><td><label for="CreateVolume"><b>Create Volume:</b></label></td><td align="right"><select name="CreateVolume" id="CreateVolume" data-role="slider" style="">
    <option value="0" <% if(rs.getInt("CreateVolume")==0) out.print("selected=1"); %>>Off</option>
    <option value="1" <% if(rs.getInt("CreateVolume")==1) out.print("selected=1"); %>>On</option>
</select></td></tr>
<tr><td><label for="AttachVolume"><b>Attach Volume:</b></label></td><td align="right"><select name="AttachVolume" id="AttachVolume" data-role="slider" style="">
    <option value="0" <% if(rs.getInt("AttachVolume")==0) out.print("selected=1"); %>>Off</option>
    <option value="1" <% if(rs.getInt("AttachVolume")==1) out.print("selected=1"); %>>On</option>
</select></td></tr>
<tr><td><label for="CreateSnapshot"><b>Create Snapshot:</b></label></td><td align="right"><select name="CreateSnapshot" id="CreateSnapshot" data-role="slider" style="">
    <option value="0" <% if(rs.getInt("CreateSnapshot")==0) out.print("selected=1"); %>>Off</option>
    <option value="1" <% if(rs.getInt("CreateSnapshot")==1) out.print("selected=1"); %>>On</option>
</select></td></tr>
<tr><td><label for="AssociateIP"><b>Associate IP:</b></label></td><td align="right"><select name="AssociateIP" id="AssociateIP" data-role="slider" style="">
    <option value="0" <% if(rs.getInt("AssociateIP")==0) out.print("selected=1"); %>>Off</option>
    <option value="1" <% if(rs.getInt("AssociateIP")==1) out.print("selected=1"); %>>On</option>
</select></td></tr>
</table>

<input type="submit" value="Save" data-icon="check" data-theme="b">
</form>
</div>
	</div>
</body>
</html>
