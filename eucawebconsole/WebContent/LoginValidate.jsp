
<%@page import="db.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>



<%


	System.out.println("Login clicked ");

	String userId = request.getParameter("userId");
	String pwd = request.getParameter("password");
	
	System.out.println(userId+ "  "+pwd );
	Connection con;
	ResultSet rs;
	String query;
	int flag=0;
	query="select * from login;";
	System.out.println("query "+query);
	try {
		con = DB.getConnection();
		 
	
		rs = DB.readFromDB(query, con);
		System.out.println("rs"+rs.toString());
		
		while (rs.next()) {
			if(rs.getString("username").equals(userId)&& rs.getString("password").equals(pwd)){
				flag= 1;
			System.out.println("Inside");
			
			}
			//=rs.getString(parameter);	
		}
		// close the connection
		con.close();
	} catch (Exception e) {
		System.out.println("in catch");
		session.setAttribute("message"," Unauthorized Access!!!");
		String redirectURL = request.getRequestURL().substring(0,
				request.getRequestURL().lastIndexOf("/"));
		redirectURL += "/index.jsp";
		System.out.println("request URL= " + redirectURL);
		response.sendRedirect(redirectURL);
		//response.sendRedirect("index.jsp");
		// TODO: handle exception
	}
if(flag==1){
	
	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/dashboard/index.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
}
else{
	session.setAttribute("message1",session.getAttribute("message")+	" Unauthorized Access!");
	response.sendRedirect("index.jsp");
}
%>
