<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <title>Euca Admin
        </title>
        
        <!-- 
        <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
        <link rel="stylesheet" href="my.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
        </script>
        <script src="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.js">
        </script>

       -->

<link rel="stylesheet"
	href="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
	
</script>
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.mobile/1.2.0/jquery.mobile-1.2.0.min.js">
	
</script>
<style type="text/css">
#report{
white-space: wrap !important; 
}
</style>

</head>
    <body  >
        <!-- Home -->
        <div data-role="page" id="page1" data-theme="a" >
		<div data-theme="b" data-role="header">
			<a href="index.jsp" data-transition="pop" data-icon="home">Home</a>
			<h3>Euca Admin</h3>
			<a href="#popupLogin" data-rel="popup" data-position-to="window"
				data-transition="pop" data-icon="bars">Alerts</a>
            </div>
            <div data-role="content">
            <div id="report">
        
        <h1>Capacity Report</h1>
<h4>Begin:Fri Jan 16 18:45:41 GMT 1970</h4>
<h4>End:Sun Mar 17 18:30:00 GMT 2013</h4>
<h3>Resource Usage Section</h3>
<table  style="white-space: nowrap">
<tbody><tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">Resource</td><td width="80" colspan="1" align="center">Available</td><td width="80" colspan="1" align="center">Total</td></tr>
<tr><td width="50" colspan="2" align="left">Cloud</td><td width="80" colspan="1" align="center">S3 Storage</td><td width="80" colspan="1" align="center">66</td><td width="80" colspan="1" align="center">67</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">Elastic IP</td><td width="80" colspan="1" align="center">15</td><td width="80" colspan="1" align="center">21</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">EBS Storage</td><td width="80" colspan="1" align="center">97</td><td width="80" colspan="1" align="center">100</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">EC2 Compute</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">2</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">EC2 Disk</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">10</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">EC2 Memory</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">512</td></tr>
<tr><td width="50">&nbsp;</td><td width="50" colspan="1" align="left">VM Types</td><td width="80" colspan="1" align="center">c1.medium</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">1</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">c1.xlarge</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">0</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">m1.large</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">0</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">m1.small</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">2</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">m1.xlarge</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">0</td></tr>
<tr><td width="50" colspan="2" align="left">Availability Zone: CLUSTER01</td><td width="80" colspan="1" align="center">EBS Storage</td><td width="80" colspan="1" align="center">97</td><td width="80" colspan="1" align="center">100</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">EC2 Compute</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">2</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">EC2 Disk</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">10</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">EC2 Memory</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">512</td></tr>
<tr><td width="50">&nbsp;</td><td width="50" colspan="1" align="left">VM Types</td><td width="80" colspan="1" align="center">c1.medium</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">1</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">c1.xlarge</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">0</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">m1.large</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">0</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">m1.small</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">2</td></tr>
<tr><td width="50">&nbsp;</td><td width="50">&nbsp;</td><td width="80" colspan="1" align="center">m1.xlarge</td><td width="80" colspan="1" align="center">0</td><td width="80" colspan="1" align="center">0</td></tr>
</tbody></table>
        
        </div>
        
        
</div>        
        </div>
    </body>
</html>
