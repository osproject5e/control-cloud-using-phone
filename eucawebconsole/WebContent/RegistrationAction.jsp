
<%@page import="db.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.*"%>




<%
System.out.println("Register clicked : ");
String username=request.getParameter("username");
String password=request.getParameter("password");
String Cpassword=request.getParameter("Cpassword");
String secretKey=request.getParameter("secretKey");
String accessKey=request.getParameter("accessKey");
String endpoint=request.getParameter("endpoint");
// DB db = new DB();

if(username.trim().equals("")||password.trim().equals("")||Cpassword.trim().equals("")||secretKey.trim().equals("")||accessKey.trim().equals("")||endpoint.trim().equals("")){
	session.setAttribute("message", " All fields are mandatory.");
	
	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/register.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
}
else if (!password.equals(Cpassword)){
	session.setAttribute("message", " Passwords do not match.");
	
	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/register.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
}
else{
 Connection con;
	ResultSet rs;
	String query;
	String name=new String();
	
	
	
	try {
		con = DB.getConnection();
		
		query="insert into login(username,password,type,secretKey,accessKey,endpoint) values('"+username+"','"+password+"','admin','"+secretKey+"','"+accessKey+"','"+endpoint+"');";
		System.out.println("query : "+query);
		DB.update(con, query);
		//System.out.println(query);
		
		con.close();
	} catch (Exception e) {
		// TODO: handle exception
	}
	

	
	System.out.println("Register clicked : "+username+password+Cpassword+secretKey+accessKey+endpoint);

	String redirectURL = request.getRequestURL().substring(0,
			request.getRequestURL().lastIndexOf("/"));
	redirectURL += "/index.jsp";
	System.out.println("request URL= " + redirectURL);
	response.sendRedirect(redirectURL);
	
}	
%>
