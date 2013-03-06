<%@page import="eucaSampleConnect.Keypairs"%>
<%
	String keyname = request.getParameter("keyname");
	//out.print(keyname+"created");
	if (keyname.length() != 0) {

		Keypairs key = new Keypairs();
		try {
			String result = key.CreateKeypair(keyname);
			session.setAttribute("message", "Keypair Created");
		} catch (Exception ex) {
			session.setAttribute("message", "Error in creating Keypair");

		}

	} else {
		session.setAttribute("message", "Keypair Name cannot be empty");
	}
	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/listKeypairs.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
%>