<%@page import="com.amazonaws.services.ec2.model.CreateSnapshotResult"%>
<%@page import="com.amazonaws.services.ec2.model.CreateVolumeResult"%>
<%@page import="eucaSampleConnect.*"%>
<%@page import="com.amazonaws.services.ec2.*"%>

<%
	
	
	int size = Integer.parseInt(request.getParameter("sizeInGB"));
	
	String zone = request.getParameter("Zone");

	String volID = request.getParameter("volID");

	String insID = request.getParameter("insID");
	
	Volumes vol = new Volumes();
	
	
	if(zone.trim().length()!=0)
	{
		
		
		
		try{
			
			CreateVolumeResult cvres  = vol.createVolumes(size, zone);
			session.setAttribute("message1", " Volume created");
			volID = cvres.getVolume().getVolumeId();
			
		
		}
		catch(Exception ex)
		{
			session.setAttribute("message1", " Error in Creating Volume");
		}

	}
	
	
	
	
	try{
	
	
		vol.attachVol(volID,insID);
		session.setAttribute("message1", " volume attached");		
	}
	catch(Exception ex)
	{
		session.setAttribute("message1", " Error in attaching volume");
	}

	response.sendRedirect("index.jsp");
%>
