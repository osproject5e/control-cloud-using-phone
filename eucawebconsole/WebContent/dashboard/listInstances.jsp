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
	Instances ins = new Instances();
Set<Instance> instances = null;
try{
	instances = (Set<Instance>) ins.getRunningInstances();
}
catch(Exception ex){
	session.setAttribute("message", "Error in getting Instance Info");
	
}
%>



<%
	//load keypairs
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
	
//load emi


	EucaImages img = new EucaImages();
	List<Image> imglist = null;
	try{
		imglist = img.getImages();	
	}
	catch(Exception ex)
	{
		session.setAttribute("message", "Error in geting list of Available images");
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
			<h3>All Instances</h3>
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
						Iterator it = instances.iterator();
						while (it.hasNext()) {
							Instance inst = (Instance) it.next();
				%>



				<div data-role="collapsible" data-collapsed="true"
					data-content-theme="d" data-inset="false">
					<h3>
						<%
							out.println(inst.getInstanceId() + " ("
											+ inst.getPublicIpAddress() + ") ");
									if (inst.getState().getName().equalsIgnoreCase("running"))
										out.print(" (R) ");
									if (inst.getState().getName().equalsIgnoreCase("pending"))
										out.print(" (P) ");
									if (inst.getState().getName()
											.equalsIgnoreCase("terminated"))
										out.print(" (T) ");
									if (inst.getState().getName().equalsIgnoreCase("stopped"))
										out.print(" (S) ");
						%>
					</h3>
					<p>
						<%
							out.println("Instance Id : " + inst.getInstanceId()
											+ "<br />Public IP :" + inst.getPublicIpAddress()
											+ "<br />Launch Time :" + inst.getLaunchTime()
											+ "<br />Status :" + inst.getState().getName() + "");
						%>
					
					<div data-role="controlgroup" data-type="horizontal">
						<a href="#" data-role="button" data-theme="b">Start</a> <a
							href="stopInstance.jsp?instance_id=<%=inst.getInstanceId()%>"
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

				<!-- Create new instance start-->
				<!--     <a href="#popupLogin" data-rel="popup" data-position-to="window" data-role="button" data-inline="true" data-icon="check" data-theme="a" data-transition="pop">
    Create Keypair</a>
    -->
				<div data-role="popup" id="popupMenu" data-theme="a">
					<div data-role="popup" id="popupLogin" data-theme="b"
						class="ui-corner-all">
						<a href="#" data-rel="back" data-role="button" data-theme="a"
							data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
						<form action="db_create_instances.jsp" data-ajax="false">
							<div style="padding: 10px 20px;">
								<h3>Launch Instance</h3>
								 <label for="keypair" class="select">Keypair</label>
								<select name="keypair" id="keypair" data-mini="true"
									data-inline="true">

									<%
										Iterator it = keyInfo.iterator();
										while (it.hasNext()) {
											KeyPairInfo k = (KeyPairInfo) it.next();
											//out.print("<h3>" + k.getKeyName() + "</h3>");

											out.print("<option value='" + k.getKeyName() + "'>"
													+ k.getKeyName() + "</option>");

										}
									%>

								</select> 
								
								


								 <label for="keypair" class="select">EMI</label>
								<select name="emi" id="emi" data-mini="true"
									data-inline="true">

									<%
									
									Iterator<Image> itt =  imglist.iterator();
										 

									while (itt.hasNext()) {

										Image temp = (Image) itt.next();
									
												out.print("<option value='" + temp.getImageId() + "'>"
													+ temp.getImageId() + "</option>");

										}
									%>

								</select> 


								
								<button type="submit" data-theme="b" data-icon="check">Launch
								</button>
							</div>
						</form>
					</div>
				</div>
				<!-- Create new instance End -->

			</div>
</body>
</html>