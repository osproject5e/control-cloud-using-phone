
<%@page import="db.*"%>
<%@page import="java.sql.*"%>

<%
		

	//String redirectURL = request.getRequestURL().substring(0,			request.getRequestURL().lastIndexOf("/"));
	//redirectURL += "/index.jsp";
	//System.out.println("request URL= " + redirectURL);
	try{
		DB_Config db = new DB_Config();
		
		Connection con = db.registerDB();
		
		String query ="update quicklinks set AssociateIP = "+request.getParameter("AssociateIP")
				+ ", CreateSnapshot= "+request.getParameter("CreateSnapshot")+", AttachVolume= "+request.getParameter("AttachVolume")+", CreateVolume= "+request.getParameter("CreateVolume")
				+ ", CreateKeypair= "+request.getParameter("CreateKeypair")+",ListKeypair= "+request.getParameter("ListKeypair")+",LaunchInstance= "+request.getParameter("LaunchInstance")+",ListInstance= "+request.getParameter("ListInstance")+" where id=1" ;
		
		Statement st = con.createStatement();
		st.executeUpdate(query);
	}
	catch(Exception ex)
	{
		
	}
	response.sendRedirect("index.jsp");
%>
