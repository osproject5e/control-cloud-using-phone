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


<%
	
	
	
	
	Instances instances = new Instances();
	Set<Instance> instanceList = null;
	
	try
	{
		instanceList = instances.getRunningInstances();
		session.setAttribute("message",session.getAttribute("message")+	" ");
	}
	catch(Exception ex)
	{
		session.setAttribute("message",session.getAttribute("message")+	" Error in getting information from cloud");
	}

	
	
%>


<html>
<head>
<title>Euca Admin</title>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />



<link rel="stylesheet"
	href="../jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.css" />

<script
	src="../jquery.mobile-1.3.0/jquery.min.js">
	
</script>
<script
	src="../jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.js">
	
</script>


</head>
<body>


	<div data-role="page" id="page1" data-theme="a">
		<div data-theme="b" data-role="header">
			<a href="index.jsp" data-transition="pop" data-icon="home">Home</a>
			<h3>Elastic IP</h3>
			<a href="#popupLogin" data-rel="popup" data-position-to="window"
				data-transition="slidedown" data-icon="bars">Associate IP</a>
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
						
					</div>
					</p>

				</div>

				<%
					}
					} catch (Exception ex) {

					}
				%>


			</div>
			
			
			<div data-role="popup" id="popupMenu" data-theme="a">
				<div data-role="popup" id="popupLogin" data-theme="b"
					class="ui-corner-all">
					<a href="#" data-rel="back" data-role="button" data-theme="a"
						data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					<form action="db_associate_IP.jsp" data-ajax="false">
						<div style="padding: 10px 20px;">
							<h3>Enter Details</h3>

							<label for="InstanceID" class="select">Instance ID</label> 
							<select name="InstanceID"	id="InstanceID" data-mini="true" data-inline="true">
							
								<%
								Iterator<Instance> it = instanceList.iterator();
									
								while (it.hasNext()) {
									com.amazonaws.services.ec2.model.Instance v = (com.amazonaws.services.ec2.model.Instance) it.next();
									out.print("<option value='"+v.getInstanceId()+"'>"+v.getInstanceId()+"</option>");
								}
								%>
							
							
								
							</select> 
							
							<label for="IP" class="select">IP</label> 
							<select name="IP"	id="IP" data-mini="true" data-inline="true">
								<%
								Iterator<Address> a = add.iterator();									
								while (a.hasNext()) {
									Address ad1 = (Address) a.next();
									//if(ad1.getInstanceId().toString() != "nobody"){										
									if(ad1.getInstanceId().toString().contains("available")){
								//	com.amazonaws.services.ec2.model.Instance v = (com.amazonaws.services.ec2.model.Instance) it.next();
									out.print("<option value='"+ad1.getPublicIp()+"'>"+ad1.getPublicIp()+"</option>");
									}
								}
								%>
							
							
								
							</select>
							
							
							
							<button type="submit" data-theme="b" data-icon="check">Allocate</button>
						</div>
					</form>
				</div>
			</div>
			
			
			
			
</body>
</html>