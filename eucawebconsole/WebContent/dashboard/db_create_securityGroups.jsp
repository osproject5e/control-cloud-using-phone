<%@page import="eucaSampleConnect.SecurityGroups"%>
<%
	String secGroupName = request.getParameter("name");
	String secGroupDesc = request.getParameter("desc");
	//out.print(keyname+"created");
	if (secGroupName.length() != 0 && secGroupDesc.length() != 0) {

		SecurityGroups sGroup = new SecurityGroups();
		try {
			String result = sGroup.CreateSecurityGroup(secGroupName, secGroupDesc);
			session.setAttribute("message", "Security Group Created");
		} catch (Exception ex) {
			session.setAttribute("message", "Error in creating Security Group");

		}

	} else {
		session.setAttribute("message", "Security Group Name or Description cannot be empty");
	}
	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/listSecurityGroups.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
%>