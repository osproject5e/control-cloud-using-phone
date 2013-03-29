<%@page import="com.amazonaws.services.ec2.model.*"%>
<%@page import="com.amazonaws.services.ec2.model.InstanceMonitoring"%>
<%@page import="com.amazonaws.services.ec2.model.Monitoring"%>
<%@page import="javax.management.monitor.Monitor"%>
<%@page import="java.util.*"%>


<%@page import="com.amazonaws.services.ec2.model.Instance"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="eucaSampleConnect.*"%>


<%

	// load instances
	int countInst = 0, running = 0, pending = 0, terminated = 0, stopped = 0; 
    int countSnap = 0, sComplete = 0, sPending = 0;
	int countVol = 0, vAvailable = 0, vNotAvail = 0;
	int keycount=0;
	int imgcount=0;
    
	Instances ins = new Instances();
    Set<Instance> instances = null;
    
    
    Keypairs key = new Keypairs();
    List<KeyPairInfo> keyInfo =null;
    
    Snapshots snap =  new Snapshots();
    List<Snapshot> snapshots = null;
	
	Volumes volume = new Volumes();
	List<com.amazonaws.services.ec2.model.Volume> volumes = null;
	
	EucaImages img = new EucaImages();
	List<Image> imglist = null;

	
	
	try{
		//throw new Exception();
		instances = (Set<Instance>) ins.getRunningInstances();
		// instances count
		
		Iterator<Instance> it = instances.iterator();
		while (it.hasNext()) {
			Instance inst = (Instance) it.next();
			countInst = countInst + 1;
			if (inst.getState().getName().equalsIgnoreCase("running"))
				running = running + 1;
			if (inst.getState().getName().equalsIgnoreCase("pending"))
				pending = pending + 1;
			if (inst.getState().getName().equalsIgnoreCase("terminated"))
				terminated = terminated + 1;
			if (inst.getState().getName().equalsIgnoreCase("stopped"))
				stopped = stopped + 1;
			
		}
				
	
	
	// load keypairs
	
	
		keyInfo = key.listKeypair();
		session.setAttribute("message",session.getAttribute("message")+	" ");
		// Key-pairs count
		keycount=keyInfo.size();

	
	// load emi
	
	
		imglist = img.getImages();	
		// images count
		imgcount=imglist.size();
	
	// load snapshots
	
	
		snapshots = snap.listSnapshots();		
		session.setAttribute("message",session.getAttribute("message")+	" ");
		// snapshots count
		
		Iterator<Snapshot> iSnap = snapshots.iterator();
		while (iSnap.hasNext()) {
			//iSnap.next();
			Snapshot sn = (Snapshot) iSnap.next();
			countSnap = countSnap + 1;
			if(sn.getState().equalsIgnoreCase("completed"))
				sComplete = sComplete + 1;
			if(sn.getState().equalsIgnoreCase("pending"))
				sPending = sPending + 1;		
		
		}
	
	// load volumes
	
	
		volumes = volume.listVolumes();
		// volumes count

		Iterator<Volume> iVol = volumes.iterator();
		while (iVol.hasNext()) {
			Volume v = (Volume) iVol.next();
			countVol = countVol + 1;
			if(v.getState().equalsIgnoreCase("available")){
				vAvailable = vAvailable + 1;
			}
			else
			//if(v.getState().equalsIgnoreCase("pending")){
				vNotAvail = vNotAvail + 1;
			//}
		}
	}
	catch(Exception ex) {
		session.setAttribute("message",session.getAttribute("message")+	" Error in getting information from cloud");
	}

	
	
%>
	<%
			
			
			
			
			
			
			
			

	%>
<style>
            #red{color:white;font:bold; float:right;background:red;padding:3px;margin-right:5px;margin-top:-6px;}
            #green{color:white;font:bold; float:right;background:green;padding:3px;margin-right:5px;margin-top:-6px;}
            
            #mar{color:white;font:bold; float:right;background:#CC3300;padding:3px;margin-right:5px;margin-top:-6px;}
            #orange{color:white;font:bold; float:right;background:#FF9900;padding:3px;margin-right:5px;margin-top:-6px;}
            </style>                        
<!--             <table width="100%" bgcolor="#CCC">
            <thead><th colspan=2> Instant Cloud Status</th></thead>
            <tr><td><b>Instances</b></td><td ><div id="green"><b><%=running %> R</b></div><div id="orange"><b><%=pending %>P</b></div><div id="red"><b><%=stopped %> S</b></div><div id="mar"><b><%=terminated %>T</b></div></td></tr>
            <tr><td><b>Snapshots</b></td><td><div id="green"><b><%=sComplete %> C</b></div><div id="orange"><b><%=sPending %> P</b></div></td></tr>
            <tr><td><b>Volumes</b></td><td><div id="green"><b><%=vAvailable %> A</b></div><div id="orange"><b><%=vNotAvail %> N</b></div></td></tr>
            <tr><td><b>Keypairs</b></td><td><div id="green"><b><%=keycount%> A</b></div></td>
            <tr><td><b>Images</b></td><td><div id="green"><b><%=imgcount %> A</b></div></td>
            
            </table>
 -->
<ul data-role="listview" data-inset="true" data-divider-theme="d" >
    <li data-role="list-divider">Instant Cloud Status</li>        
    <li style="height:15px;"><div style="float:left;padding:0px;margin:0px;overflow:visible">Instances </div><div id="green"><b><%=running %> R</b></div><div id="orange"><b><%=pending %> P</b></div><div id="red"><b><%=stopped %> S</b></div><div id="mar"><b><%=terminated %> T</b></div></li>
    <li style="height:15px;"><div style="float:left;padding:0px;margin:0px;overflow:visible">Snapshots </div><div id="green"><b><%=sComplete %> C</b></div><div id="orange"><b><%=sPending %> P</b></div></li>
    <li style="height:15px;"><div style="float:left;padding:0px;margin:0px;overflow:visible">Volumes </div><div id="green"><b><%=vAvailable %> A</b></div><div id="orange"><b><%=vNotAvail %> N</b></div></li>
    <li style="height:15px;"><div style="float:left;padding:0px;margin:0px;overflow:visible">Keypairs </div><div id="green"><b><%=keycount%> A</b></div></li>
    <li style="height:15px;"><div style="float:left;padding:0px;margin:0px;overflow:visible">Images </div><div id="green"><b><%=imgcount %> A</b></div></li>
</ul>






<%@page import="db.*"%>
<%@page import="java.sql.*"%>
<%		

	//String redirectURL = request.getRequestURL().substring(0,			request.getRequestURL().lastIndexOf("/"));
	//redirectURL += "/index.jsp";
	//System.out.println("request URL= " + redirectURL);
	ResultSet rs = null;
	try{
		DB_Config db = new DB_Config();
		
		Connection con = db.registerDB();
		
		String query ="select * from  quicklinks  where id=1" ;		
		Statement st = con.createStatement();
		rs = st.executeQuery(query);
		if(rs.next())
		{}
		else
			throw new Exception();			
	}
	catch(Exception ex)
	{
		
	}
	
	//response.sendRedirect("index.jsp");
%>






<ul data-role="listview" data-inset="true" data-divider-theme="d" >
<li data-role="list-divider">Quick Links</li>
<%
	if(rs.getInt("AssociateIP")==1)
	{
		%>
		<li><a href="#">AssociateIP</a></li>
		<%
		
	}
%>
<%
	if(rs.getInt("ListInstance")==1)
	{
		%>
		<li><a href="listInstances.jsp">List Instance</a></li>
		<%
		
	}
%>
<%
	if(rs.getInt("ListKeypair")==1)
	{
		%>
		<li><a href="listKeypairs.jsp">List Keypair</a></li>
		<%
		
	}
%>
<%
	if(rs.getInt("LaunchInstance")==1)
	{
		%>
		<li><a href="#popupLogin1"   data-rel="popup" data-position-to="window"
				data-transition="slidedown">Launch Instance</a></li>
		<%
		
	}
%>
<%
	if(rs.getInt("CreateKeypair")==1)
	{
		%>
		<li><a href="#keyLogin"  data-rel="popup" data-position-to="window"
				data-transition="slidedown">Create Keypair</a></li>
		<%
		
	}
%>
<%
	if(rs.getInt("CreateVolume")==1)
	{
		%>
		<li><a  href="#createVol"  data-rel="popup" data-position-to="window"
				data-transition="slidedown">Create Volume</a></li>
		<%
		
	}
%>
<%
	if(rs.getInt("AttachVolume")==1)
	{
		%>
		<li><a  href="#attachVol"  data-rel="popup" data-position-to="window"
				data-transition="slidedown">Attach Volume</a></li>
		<%
		
	}
%>
<%
	if(rs.getInt("CreateSnapshot")==1)
	{
		%>
		<li><a  href="#createSnap"  data-rel="popup" data-position-to="window"
				data-transition="slidedown">Create Snapshot</a></li>
		<%
		
	}
%>
 
</ul>