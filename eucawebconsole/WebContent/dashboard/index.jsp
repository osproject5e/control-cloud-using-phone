
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="refresh" content="120">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<title>Euca Admin</title>

<!-- 
        <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
        <link rel="stylesheet" href="my.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
        </script>
        <script src="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.js">
        </script>

       -->

<!-- 
<link rel="stylesheet"
	href="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
	
</script>
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.js">
	
</script>

 -->

<link rel="stylesheet"
	href="../jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.css" />

<script src="../jquery.mobile-1.3.0/jquery.min.js">
	
</script>
<script src="../jquery.mobile-1.3.0/jquery.mobile-1.3.0.min.js">
	
</script>



<script src="usableforms.js">
        </script>

</head>
<body>
	<!-- Home -->
	<div data-role="page" id="page1" data-theme="a">
		<div data-theme="b" data-role="header">
			<a href="index.jsp" data-transition="pop" data-icon="home">Home</a>
			<h3>Euca Admin</h3>
			<a href="index.jsp" data-rel="popup" data-position-to="window"
				data-transition="pop" data-icon="refresh"  data-ajax="false">Reload</a>
		</div>
		<div data-role="content">
<%
			System.out.println(session.getAttribute("message1")+"in dash1");
			String msg = (String) session.getAttribute("message1");
			
				
				
				if (msg!=null && msg.trim().length() != 0) {
					session.setAttribute("message1", "");
			%>
			<div style="color: red" class="ui-bar ui-bar-c">
				<%
					out.print(msg);
				System.out.println(msg);
				%>
			</div>

			<%
				}
			%>



			<%@ include file="cloud_status.jsp"%>




			<div data-role="collapsible-set">
				<div data-role="collapsible" data-collapsed="true"
					data-content-theme="d" data-inset="false">
					 
					<h3>Cloud Controller</h3>
					<ul data-role="listview" data-divider-theme="b" data-inset="false">
					     
						<li data-theme="c"><a href="listInstances.jsp"
							data-transition="slide" data-ajax="false"> Instances </a></li>
						<li data-theme="c"><a href="listKeypairs.jsp"
							data-transition="slide" data-ajax="false"> Keypairs 
						</a></li>
						<li data-theme="c"><a href="listImages.jsp"
							data-transition="slide" data-ajax="false"> Images </a></li>
					</ul>

				</div>
				<div data-role="collapsible" data-content-theme="d"
					data-inset="false">
					<h3>Storage Controller</h3>
					<ul data-role="listview" data-divider-theme="b" data-inset="false">
						<li data-theme="c"><a href="listvolume.jsp"
							data-transition="slide"> Volume </a></li>
						<li data-theme="c"><a href="listSnapshots.jsp"
							data-transition="slide"> Snapshots </a></li>
					</ul>
				</div>


				<div data-role="collapsible" data-content-theme="d"
					data-inset="false">
					<h3>Network Controller</h3>
					<ul data-role="listview" data-divider-theme="b" data-inset="false">
						<li data-theme="c"><a href="listAddress.jsp"
							data-transition="slide"> Elastic IP </a></li>
						<li data-theme="c"><a href="listSecurityGroups.jsp" data-transition="slide">
								Security Groups </a></li>
					</ul>
				</div>



				<div data-role="collapsible" data-content-theme="d"
					data-inset="false">
					<h3>Reports</h3>
					<ul data-role="listview" data-divider-theme="b" data-inset="false">
						<li data-theme="c"><a href="capacityReports.jsp"
							data-transition="slide"> Capacity </a></li>
						<li data-theme="c"><a href="#" data-transition="slide">
								Instances </a></li>
					</ul>
				</div>
				<div data-role="collapsible" data-content-theme="d"
					data-inset="false">
					<h3>Setting</h3>
					<ul data-role="listview" data-divider-theme="b" data-inset="false">
						<li data-theme="c"><a href="capacityReports.jsp"
							data-transition="slide"> Instance Cloud Status </a></li>
						<li data-theme="c"><a href="listquicklinks.jsp" data-transition="slide">
								Quicklinks </a></li>
					</ul>
				</div>
			</div>
			<a data-role="button" data-theme="b" href="../index.jsp"
				data-icon="home" data-iconpos="left"> LogOut </a>
		</div>
	<!-- ----------------
	
	create keypairs
	
	 -->
	 
	 
	 			<!-- Create new Keypairs start-->


			<!--      <a href="#popupLogin" data-rel="popup" data-position-to="window" data-role="button" data-inline="true" data-icon="check" data-theme="a" data-transition="pop">
    Create Keypair</a> -->

			<div data-role="popup" id="popupMenu" data-theme="a">
				<div data-role="popup" id="popupLogin" data-theme="b"
					class="ui-corner-all">
					<a href="#" data-rel="back" data-role="button" data-theme="a"
						data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					<form action="db_create_keypairs.jsp" data-ajax="false">
						<div style="padding: 10px 20px;">
							<h3>Enter Keypair Name</h3>
							<label for="un" class="ui-hidden-accessible">Key Pair
								Name:</label> <input type="text" name="keyname" id="un" value=""
								placeholder="Keypair">
							<button type="submit" data-theme="b" data-icon="check">Create
								Now</button>
						</div>
					</form>
				</div>
			</div>
			<!-- Create new Keypairs End -->
			
						<!-- Create new Keypairs start-->


			<!--      <a href="#popupLogin" data-rel="popup" data-position-to="window" data-role="button" data-inline="true" data-icon="check" data-theme="a" data-transition="pop">
    Create Keypair</a> -->

			<div data-role="popup" id="keyMenu" data-theme="a">
				<div data-role="popup" id="keyLogin" data-theme="b"
					class="ui-corner-all">
					<a href="#" data-rel="back" data-role="button" data-theme="a"
						data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					<form action="db_create_keypairs.jsp" data-ajax="false">
						<div style="padding: 10px 20px;">
							<h3>Enter Keypair Name</h3>
							<label for="un" class="ui-hidden-accessible">Key Pair
								Name:</label> <input type="text" name="keyname" id="un" value=""
								placeholder="Keypair">
							<button type="submit" data-theme="b" data-icon="check">Create
								Now</button>
						</div>
					</form>
				</div>
			</div>
			<!-- Create new Keypairs End -->
			
			
			
	 <!-- 
	 			end create keypairs
	  -->

	<!-- 
	
			Create volume
	 -->

			<div data-role="popup" id="createVolMenu" data-theme="a">
				<div data-role="popup" id="createVol" data-theme="b"
					class="ui-corner-all">
					<a href="#" data-rel="back" data-role="button" data-theme="a"
						data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					<form action="db_create_volume.jsp" data-ajax="false">
						<div style="padding: 10px 20px;">
							<h3>Enter Details</h3>

							<label for="Zone" class="select">Zone</label> <select name="Zone"
								id="Zone" data-mini="true" data-inline="true">
								<option value="CLUSTER01">CLUSTER01</option>
							</select> <label for="sizeInGB" class="select">Size</label> <select
								name="sizeInGB" id="sizeInGB" data-mini="true"
								data-inline="true">
								<option value="1">1 GB</option>
								<option value="2">2 GB</option>
								<option value="5">5 GB</option>
								<option value="10">10 GB</option>
							</select>

							<button type="submit" data-theme="b" data-icon="check">Create
								Now</button>
						</div>
					</form>
				</div>
			</div>
		


	<!-- 
			end create vol
	 -->
	
	
	<!-- 
			Attach vol
	 -->
	
	
						<!-- start Create Attach instances -->
			<div data-role="popup" id="attachVolu" data-theme="a">
				<div data-role="popup" id="attachVol" data-theme="b"
					class="ui-corner-all">
					<a href="#" data-rel="back" data-role="button" data-theme="a"
						data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					<form action="dash_db_attach_volume.jsp" data-ajax="false">
						<div style="padding: 10px 20px;">
							<h3>Attach Volume</h3>






							<label for="insID" class="select">Select Instance</label> 
							<select name="insID"	id="insID" data-mini="true" data-inline="true">
				

			<%
									
			Iterator it = instances.iterator();
			while (it.hasNext()) {
				Instance inst = (Instance) it.next();
				if (inst.getState().getName().equalsIgnoreCase("running"))
				{
					out.print("<option value='" + inst.getInstanceId() + "'>"
													+ inst.getInstanceId()+ "</option>");
				}	

										}
									%>


							</select>
							
							<hr>

							Create New Volume
							
							<label for="Zone" class="select"></label> <select name="Zone"
								id="Zone" data-mini="true" data-inline="true">
								<option value='' selected="selected">Select Zone</option>
								<option value="CLUSTER01">CLUSTER01</option>
							</select> <label for="sizeInGB" class="select"></label> <select
								name="sizeInGB" id="sizeInGB" data-mini="true"
								data-inline="true">
								<option value='' selected="selected">Select Size</option>
								<option value="1">1 GB</option>
								<option value="2">2 GB</option>
								<option value="5">5 GB</option>
								<option value="10">10 GB</option>
							</select>
							
							
							
							<hr>


							<label for="volID" class="select">OR</label> 
							<select name="volID"	id="volID" data-mini="true" data-inline="true">
<option value='' selected="selected">Select Existing Volume</option>

			<%
			Iterator<com.amazonaws.services.ec2.model.Volume> itt = volumes.iterator();									
			
			while (itt.hasNext()) {
				Volume vv = (Volume) itt.next();
					out.print("<option value='" +vv.getVolumeId()+ "'>"
													+ vv.getVolumeId()+ "</option>");
				
										}
									%>


							</select>
							
							
							
							
							
							<button type="submit" data-theme="b" data-icon="check">Attach Now		</button>
						</div>
					</form>
				</div>
			</div>			
			
			<!-- end Create Attach instances -->
	
	<!-- 
			End Attach Vol
	 -->
	
	
	<!-- 
	
			Create Vol
	 -->
	 
	 			<div data-role="popup" id="createSnapMenu" data-theme="a">
				<div data-role="popup" id="createSnap" data-theme="b"
					class="ui-corner-all">
					<a href="#" data-rel="back" data-role="button" data-theme="a"
						data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					<form action="db_create_snapshots.jsp" data-ajax="false">
						<div style="padding: 10px 20px;">
							<h3>Enter Details</h3>
							

							<label for="volumeID" class="select">Volume ID</label> 
							<select name="volumeID"	id="volumeID" data-mini="true" data-inline="true">
							
								<%
								Iterator<com.amazonaws.services.ec2.model.Volume> iit = volumes.iterator();
								while (iit.hasNext()) {
									com.amazonaws.services.ec2.model.Volume v = (com.amazonaws.services.ec2.model.Volume) iit.next();
									
									out.print("<option value='"+v.getVolumeId()+"'>"+v.getVolumeId()+"</option>");
								}
								%>
								
							</select> 
							
							<label for="description">Description:</label>
							<input type="text" name="description" id="description" value="">		
							
							<button type="submit" data-theme="b" data-icon="check">Create
								Now</button>
						</div>
					</form>
				</div>
			</div>
	 
	 <!-- 
	 		End attach vol
	  -->
	
	
	
					<!-- Create new instance start-->
				<div data-role="popup" id="popupMenu1" data-theme="a">
					<div data-role="popup" id="popupLogin1" data-theme="b"
						class="ui-corner-all">
																													
						<a href="#" data-rel="back" data-role="button" data-theme="a"
							data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
						<form action="dash_db_create_instances.jsp" data-ajax="false">
							<div style="padding: 10px 20px;">
								<h3>Launch Instance</h3>

									<input type="text" name="newkeyname" id="un" value=""
								placeholder="Enter New Keypair">
							
									<label for="keypair" class="select">OR</label>
								<select name="keypair" id="keypair" data-mini="true"
									data-inline="true">
									<option value='' selected="selected">Select Existing Keypair</option>

									<%
										Iterator itss = keyInfo.iterator();
										while (itss.hasNext()) {
											KeyPairInfo k = (KeyPairInfo) itss.next();
											//out.print("<h3>" + k.getKeyName() + "</h3>");

											out.print("<option value='" + k.getKeyName() + "'>"
													+ k.getKeyName() + "</option>");

										}
									%>
								</select>
								 								
								


								 <label for="keypair" class="select">EMI</label>
								<select name="emi" id="emi" data-mini="true"
									data-inline="true">

									<%
									
									Iterator<Image> ittss =  imglist.iterator();
										 

									while (ittss.hasNext()) {

										Image temp = (Image) ittss.next();
																			
												out.print("<option value='" + temp.getImageId() + "'>"
													+ temp.getImageId() + "</option>");

										}
									%>

								</select> 


								
								<button type="submit" data-theme="b" data-icon="check">Launch
								</button>
							</div>
						</form>
					</div>
				</div>
				<!-- Create new instance End -->

	
	
	
	</div>
	
	
	
</body>
</html>
