<%@page import="com.amazonaws.services.ec2.model.*"%>
<%@page import="com.amazonaws.services.ec2.model.InstanceMonitoring"%>
<%@page import="com.amazonaws.services.ec2.model.Monitoring"%>
<%@page import="javax.management.monitor.Monitor"%>
<%@page import="java.util.*"%>


<%@page import="com.amazonaws.services.ec2.model.Instance"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="eucaSampleConnect.*"%>

<%
	ElasticIP ip =  new ElasticIP();
    List<Address> add =null;	
try{
	add = ip.listAddress();
	
}
catch(Exception ex){
	session.setAttribute("message", "Error in getting Elastic IP Info");
	
}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Euca Admin</title>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />


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


	<div data-role="page" id="page1" data-theme="a">
		<div data-theme="b" data-role="header">
			<a href="index.jsp" data-transition="pop" data-icon="home">Home</a>
			<h3>Elastic IP</h3>
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
						Iterator it = add.iterator();
						while (it.hasNext()) {
							Address ad = (Address) it.next();
				%>



				<div data-role="collapsible" data-collapsed="true"
					data-content-theme="d" data-inset="false">
					<h3>
						<%
							out.println(ad.getPublicIp() +":"+ ad.getInstanceId());
									
						%>
					</h3>
					<p>
						<%
							out.println("Allocation Id : " +ad.getAllocationId()
											+ "<br />Domain :" + ad.getDomain()
											+ "<br />Instance Id :" + ad.getInstanceId()
											+ "<br />Public IP :" + ad.getPublicIp() + "");
						%>
					
					<div data-role="controlgroup" data-type="horizontal">
						<a href="#" data-role="button" data-theme="b">Start</a> <a
							href="#stopInstance.jsp?instance_id="
							data-role="button" data-theme="b">Stop</a> <a href="#index.html"
							data-role="button" data-theme="b">Terminate</a>
					</div>
					</p>

				</div>

				<%
					}
					} catch (Exception ex) {

					}
				%>


			</div>
</body>
</html>