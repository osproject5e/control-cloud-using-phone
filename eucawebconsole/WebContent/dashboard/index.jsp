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
                <div data-role="collapsible-set">
                    <div data-role="collapsible" data-collapsed="true" data-content-theme="d"
					data-inset="false">
                        <h3>
                           Cloud Controller
                        </h3>
                        <ul data-role="listview" data-divider-theme="b" data-inset="false" >
                            <li data-theme="c">
                                <a href="listInstances.jsp" data-transition="slide"  data-ajax="false">
                                   Instances
                                </a>
                            </li>
                            <li data-theme="c">
                                <a href="listKeypairs.jsp" data-transition="slide"  data-ajax="false">
                                    Keypairs
                                    <span class="ui-li-count" >12</span>
                                </a>
                            </li>
                            <li data-theme="c">
                                <a href="listImages.jsp" data-transition="slide"  data-ajax="false">
                                    Images
                                </a>
                            </li>
                        </ul>
                        
                    </div>                   
                    <div data-role="collapsible"  data-content-theme="d"
					data-inset="false" >
                        <h3>
                            Users & Groups
                        </h3>
                        <ul data-role="listview" data-divider-theme="b" data-inset="false" >
                            <li data-theme="c">
                                <a href="#" data-transition="slide">
                                   Users
                                </a>
                            </li>
                            <li data-theme="c">
                                <a href="#" data-transition="slide">
                                   Groups
                                </a>
                            </li>
                            </ul>
                    </div>
                    <div data-role="collapsible"  data-content-theme="d"
					data-inset="false">
                        <h3>
                            History
                        </h3>
                    </div>
                    <div data-role="collapsible"  data-content-theme="d"
					data-inset="false">
                        <h3>
                            Setting
                        </h3>
                    </div>
                </div>
                <a data-role="button" data-theme="b" href="../index.jsp" data-icon="home" data-iconpos="left">
                    LogOut
                </a>
            </div>
        </div>
    </body>
</html>
