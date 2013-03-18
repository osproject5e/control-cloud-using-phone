<%@page import="com.amazonaws.services.ec2.model.CreateSnapshotResult"%>
<%@page import="com.amazonaws.services.ec2.model.CreateVolumeResult"%>
<%@page import="eucaSampleConnect.*"%>
<%@page import="com.amazonaws.services.ec2.*"%>

<%
	
	
	String snapID = request.getParameter("snapID");
	
	//Volumes vol = new Volumes();
	Snapshots snap = new Snapshots();
	
	
	
	try{
		
		//CreateSnapshotResult csr = snap.createSnapshots(volId, des);
		snap.deleteSnapshots(snapID);
		session.setAttribute("message", " Snapshot Deleting");		
	}
	catch(Exception ex)
	{
		session.setAttribute("message", " Error in deleting snapshot");
	}

	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/listSnapshots.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
%>
