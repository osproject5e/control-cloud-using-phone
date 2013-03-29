<%@page import="com.amazonaws.services.ec2.model.Snapshot"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.amazonaws.services.ec2.*"%>
<%@page import="java.util.*"%>
<%@ page import="eucaSampleConnect.*"%>

<%
	Snapshots snap =  new Snapshots();
	
	List<Snapshot> snapshots = null;
	
	try
	{
		snapshots = snap.listSnapshots();		
		session.setAttribute("message",session.getAttribute("message")+	" ");
	}
	catch(Exception ex)
	{
		session.setAttribute("message1",session.getAttribute("message")+	" Error in getting information from cloud");
		response.sendRedirect("index.jsp");
	}
	
	
	
	
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


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<title>Euca Admin</title>


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



	<!-- Home -->
	<div data-role="page" id="page1" data-theme="a">
		<div data-theme="b" data-role="header">
			<a href="index.jsp" data-transition="pop" data-icon="home">Home</a>
			<h3>Snapshots</h3>
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

						Iterator<Snapshot> it = snapshots.iterator();
						while (it.hasNext()) {
							Snapshot s = (Snapshot) it.next();
				%>
				<div data-role="collapsible" data-collapsed="true"
					data-content-theme="d" data-inset="false">

					<%
						out.print("<h3>" + s.getSnapshotId() + "</h3>");
								out.print("<br /><b>Description :</b> " + s.getDescription() + "");
								out.print("<br /><b>OwnerID : </b>" + s.getOwnerId()
										+ "");
								out.print("<br /><b>Progress :</b> "
										+ s.getProgress() + "");
								out.print("<br /><b>State : </b>" + s.getState() + "");
								out.print("<br /><b>Volume ID : </b>" + s.getVolumeId()
										+ "");
								out.print("<br /><b>Volume size :</b> " + s.getVolumeSize()
										+ "");
								out.print("<br /><b>Start Time :</b> " + s.getStartTime() + "");
					%>
					<div data-role="controlgroup" data-type="horizontal">
						<a href="create_vol_from_snapshots.jsp?volID=<%=s.getSnapshotId()%>"  data-role="button" 
						data-theme="b">Create Volume</a> 
						 <a	href="delete_snapshots.jsp?snapID=<%=s.getSnapshotId()%>" data-role="button"
							data-theme="b">Delete</a>
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
					<form action="db_create_snapshots.jsp" data-ajax="false">
						<div style="padding: 10px 20px;">
							<h3>Enter Details</h3>

							<label for="volumeID" class="select">Volume ID</label> 
							<select name="volumeID"	id="volumeID" data-mini="true" data-inline="true">
								<%
								Iterator<com.amazonaws.services.ec2.model.Volume> it = volumes.iterator();
								while (it.hasNext()) {
									com.amazonaws.services.ec2.model.Volume v = (com.amazonaws.services.ec2.model.Volume) it.next();
									
									out.print("<option value='"+v.getVolumeId()+"'>"+v.getVolumeId()+"</option>");
								}
								%>
								
							</select> 
							
							<label for="description">Description:</label>
							<input type="text" name="description" id="description" value="">		
							
							<button type="submit" data-theme="b" data-icon="check">Create
								Now</button>
						</div>
					</form>
				</div>
			</div>
			<!-- Create new Keypairs End -->

		</div>
	</div>


</body>
</html>
