<%@page import="com.amazonaws.services.ec2.model.CreateSnapshotResult"%>
<%@page import="com.amazonaws.services.ec2.model.CreateVolumeResult"%>
<%@page import="eucaSampleConnect.*"%>
<%@page import="com.amazonaws.services.ec2.*"%>

<%
	
	
	String volID = request.getParameter("volID");

	String insID = request.getParameter("insID");
	
	Volumes vol = new Volumes();
	
	
	
	
	try{
	
	
		vol.attachVol(volID,insID);
		session.setAttribute("message", " volume attached");		
	}
	catch(Exception ex)
	{
		session.setAttribute("message", " Error in attaching volume");
	}

	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/listvolume.jsp";
	
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
%>
