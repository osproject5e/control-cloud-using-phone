<%@page import="com.amazonaws.services.ec2.model.DescribeImagesResult"%>
<%@page import="eucaSampleConnect.*"%>
<%@page import="java.util.*"%>
<%@page import="com.amazonaws.services.ec2.model.Image"%>

<%
	EucaImages img = new EucaImages();
	List<Image> imglist = null;
	try{
		imglist = img.getImages();	
	}
	catch(Exception ex)
	{		
		session.setAttribute("message1","Error in geting list of Available images");		
		response.sendRedirect("index.jsp");

	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />

<title>Euca Admin</title>

<link rel="stylesheet"
	href="../jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.css" />

<script
	src="../jquery.mobile-1.3.0/jquery.min.js">
	
</script>
<script
	src="../jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.js">
	
</script>


</head>
<body>

	 <div data-role="page" id="page1" data-theme="a" >
		<div data-theme="b" data-role="header">
			<a href="index.jsp" data-transition="pop" data-icon="home">Home</a>
			<h3>EMI</h3>
			</div>
            <div data-role="content">



			<%
				try {
					String msg = (String) session.getAttribute("message");
					session.setAttribute("message", "");
					if (msg.trim().length() != 0) {
			%>
			<div style="color: red" class="ui-bar ui-bar-c">
				<%
					out.print(msg);
				%>
			</div>


			<div data-role="collapsible-set">

				<%
					}		
						Iterator it = imglist.iterator();

						while (it.hasNext()) {

							Image temp = (Image) it.next();
				%>
			  <div data-role="collapsible" data-collapsed="true" data-content-theme="d"
					data-inset="false">
					<h3>
						<%
							out.print(temp.getName() + temp.getImageType());
						%>
					</h3>
					<p>

						<%
							out.print("Architecture : " + temp.getArchitecture()
											+ "<br />");
									out.print("Description : " + temp.getDescription()
											+ "<br />");
									out.print("Image : " + temp.getImageId() + "<br />");
									out.print("Image Location : " + temp.getImageLocation()
											+ "<br />");
									out.print("State : " + temp.getState() + "<br />");
									//out.print("Platform : "+temp.getPlatform()+"<br />");
									//out.print("Ramdisk Id : "+temp.getRamdiskId()+"<br />");
									//out.print("Kernel Id : "+temp.getKernelId()+"<br />");
									out.print("Owner Id : " + temp.getOwnerId() + "<br />");
									out.print("Root Device Name : " + temp.getRootDeviceName()
											+ "<br />");
									//out.print("Virtualization Type : "+temp.getVirtualizationType()+"<br />");
						%>
					
					<div data-role="controlgroup" data-type="horizontal">
						<a href="#" data-role="button" data-theme="b">more info</a>
					</div>


				</div>

				<%
					}
					
					
					} catch (Exception ex) {
					}
				%>
			</div></div>
</body>
</html>