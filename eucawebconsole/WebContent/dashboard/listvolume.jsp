<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.amazonaws.services.ec2.*"%>

<%@page import="com.amazonaws.services.ec2.model.*"%>
<%@page import="java.util.*"%>
<%@ page import="eucaSampleConnect.*"%>

<%
	Volumes volume = new Volumes();
	List<com.amazonaws.services.ec2.model.Volume> volumes = null;
	
	try
	{
		volumes = volume.listVolumes();
		session.setAttribute("message",session.getAttribute("message")+	" ");
	}
	catch(Exception ex)
	{
		session.setAttribute("message",session.getAttribute("message")+	" Error in getting information from cloud");
	}
%>

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
	<div data-role="page" id="page1" data-theme="a">
		<div data-theme="b" data-role="header">
			<a href="index.jsp" data-transition="pop" data-icon="home">Home</a>
			<h3>Volume</h3>
					
			
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

						Iterator<com.amazonaws.services.ec2.model.Volume> it = volumes
								.iterator();
						while (it.hasNext()) {
							com.amazonaws.services.ec2.model.Volume v = (com.amazonaws.services.ec2.model.Volume) it
									.next();
				%>
				<div data-role="collapsible" data-collapsed="true"
					data-content-theme="d" data-inset="false">

					<%
						out.print("<h3>" + v.getVolumeId() + "</h3>");
								out.print("<br /><b>Size :</b> " + v.getSize() + "");
								out.print("<br /><b>SnapshotID : </b>" + v.getSnapshotId()
										+ "");
								out.print("<br /><b>AvailablityZone :</b> "
										+ v.getAvailabilityZone() + "");
								out.print("<br /><b>State : </b>" + v.getState() + "");
								out.print("<br /><b>CreateTime : </b>" + v.getCreateTime()
										+ "");
								out.print("<br /><b>Attachments :</b> "
										+ v.getAttachments().toString() + "");
								out.print("<br /><b>Tags :</b> " + v.getTags().toString()
										+ "");
					%>
					
					<div data-role="controlgroup" data-type="horizontal">
					
					
						<a href="#attachIns1"  data-rel="popup" data-position-to="window" data-transition="slidedown" data-role="button" data-theme="b">Attach</a> 
						<a href="detach_volume.jsp?volID=<%=v.getVolumeId()%>"  data-role="button" data-theme="b">Detach</a> 
						<a href="delete_volume.jsp?volID=<%=v.getVolumeId()%>" data-role="button" data-theme="b">Delete</a>
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
					<form action="db_create_volume.jsp" data-ajax="false">
						<div style="padding: 10px 20px;">
							<h3>Enter Details</h3>

							<label for="Zone" class="select">Zone</label> <select name="Zone"
								id="Zone" data-mini="true" data-inline="true">
								<option value="CLUSTER01">CLUSTER01</option>
							</select> <label for="sizeInGB" class="select">Size</label> <select
								name="sizeInGB" id="sizeInGB" data-mini="true"
								data-inline="true">
								<option value="1">1 GB</option>
								<option value="2">2 GB</option>
								<option value="5">5 GB</option>
								<option value="10">10 GB</option>
							</select>

							<button type="submit" data-theme="b" data-icon="check">Create
								Now</button>
						</div>
					</form>
				</div>
			</div>
			<!-- Create new Keypairs End -->
			
			
			<!-- start Create Attach instances -->
			<div data-role="popup" id="attachIns" data-theme="a">
				<div data-role="popup" id="attachIns1" data-theme="b"
					class="ui-corner-all">
					<a href="#" data-rel="back" data-role="button" data-theme="a"
						data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					<form action="db_attach_volume.jsp" data-ajax="false">
						<div style="padding: 10px 20px;">
							<h3>Attach Volume</h3>

							<label for="insID" class="select">Instance</label> 
							<select name="insID"	id="insID" data-mini="true" data-inline="true">


			<%
									
			Iterator it = instances.iterator();
			while (it.hasNext()) {
				Instance inst = (Instance) it.next();
				if (inst.getState().getName().equalsIgnoreCase("running"))
				{
					out.print("<option value='" + inst.getInstanceId() + "'>"
													+ inst.getInstanceId()+ "</option>");
				}	

										}
									%>


							</select>
							
							


							<label for="volID" class="select">Volume</label> 
							<select name="volID"	id="volID" data-mini="true" data-inline="true">


			<%
			Iterator<com.amazonaws.services.ec2.model.Volume> itt = volumes.iterator();									
			
			while (itt.hasNext()) {
				Volume vv = (Volume) itt.next();
					out.print("<option value='" +vv.getVolumeId()+ "'>"
													+ vv.getVolumeId()+ "</option>");
				
										}
									%>


							</select>
							
							
							
							
							
							<button type="submit" data-theme="b" data-icon="check">Attach Now		</button>
						</div>
					</form>
				</div>
			</div>			
			
			<!-- end Create Attach instances -->

		</div>
	</div>


</body>
</html>
