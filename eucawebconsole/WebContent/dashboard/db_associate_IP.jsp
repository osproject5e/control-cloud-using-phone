
<%@page import="eucaSampleConnect.*"%>
<%@page import="com.amazonaws.services.ec2.*"%>

<%
	String InstanceID = request.getParameter("InstanceID");
	String IP = request.getParameter("IP");
	ElasticIP eip=new ElasticIP();
	System.out.println(IP );
	System.out.println("IP : "+IP+ "----------InstanceID : "+InstanceID);
	try{
		
		eip.associateIp(InstanceID, IP);
		
		
	
	}
	catch(Exception ex)
	{
		session.setAttribute("message", " Error in Associating PublicIP");
	}

	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/listAddress.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
%>
