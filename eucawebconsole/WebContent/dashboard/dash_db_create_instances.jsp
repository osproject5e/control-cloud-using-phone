<%@page import="eucaSampleConnect.*"%>
<%

	String NewKeyName = request.getParameter("newkeyname");

	String keyname = request.getParameter("keypair");
	String emi =  request.getParameter("emi");
	
	
	if(NewKeyName.trim().length()!=0)
	{
		
		Keypairs key = new Keypairs();
		try {
			String result = key.CreateKeypair(NewKeyName);
		}
		catch(Exception ex)
		{
			
		}
		
		keyname = NewKeyName;
			
	}
	

	
	
	out.print(keyname+ " "+emi);
	
	Instances ins = new Instances();
	try{
	ins.create_instance(emi,keyname);
	}
	catch(Exception ex)
	{
		session.setAttribute("message1", "Error in Lauching Instance. Resource might not enough, with key pair : "+keyname);		
	}
	
	session.setAttribute("message1", "Instance Creation requested with key pair : "+keyname);

	response.sendRedirect("index.jsp");
%>