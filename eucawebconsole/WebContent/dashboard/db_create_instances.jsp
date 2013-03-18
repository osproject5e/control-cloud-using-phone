<%@page import="eucaSampleConnect.*"%>
<%
	String keyname = request.getParameter("keypair");
	String emi =  request.getParameter("emi");
	
	out.print(keyname+ " "+emi);
	
	Instances ins = new Instances();
	try{
	ins.create_instance(emi,keyname);
	}
	catch(Exception ex)
	{
		session.setAttribute("message", "Error in Lauching Instance. Resource might not enough.");		
	}
	
	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/listInstances.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
%>