<%@page import="com.amazonaws.services.ec2.model.CreateSnapshotResult"%>
<%@page import="com.amazonaws.services.ec2.model.CreateVolumeResult"%>
<%@page import="eucaSampleConnect.*"%>
<%@page import="com.amazonaws.services.ec2.*"%>

<%
	
	
	String volID = request.getParameter("volID");

	
	Volumes vol = new Volumes();
	
	
	
	
	try{
	
	
		vol.detachVol(volID);
		session.setAttribute("message", " volume detached");		
	}
	catch(Exception ex)
	{
		session.setAttribute("message", " Error in detaching volume");
	}

	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/listvolume.jsp";
	
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
%>
