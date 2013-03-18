<%@page import="com.amazonaws.services.ec2.model.CreateVolumeResult"%>
<%@page import="eucaSampleConnect.*"%>
<%@page import="com.amazonaws.services.ec2.*"%>

<%
	int size = Integer.parseInt(request.getParameter("sizeInGB"));
	String zone = request.getParameter("Zone");
	
	Volumes vol = new Volumes();
	
	try{
		
		CreateVolumeResult cvres  = vol.createVolumes(size, zone);
		session.setAttribute("message", " Volume created");
		
	
	}
	catch(Exception ex)
	{
		session.setAttribute("message", " Error in Creating Volume");
	}

	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/listvolume.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
%>
