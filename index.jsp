<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Padhleyara</title>
    <!-- Core CSS - Include with every page -->
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />
    <!-- Page-Level CSS -->
    <link href="assets/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
	
	
	
	<style>
/* Popup container - can be anything you want */
.popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* The actual popup */
.popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}
</style>

   </head>
<body>
<%!
String lname;
String fname;
String user2;
String dp;
ResultSet rs;
Connection con;
Statement stm;
%>
<%user2=String.valueOf(session.getAttribute("user1"));%>

<%

try
{

String query="select picdp from Profilepic WHERE REGISTRATION_EMPID='"+user2+"'";
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");
stm=con.createStatement();
rs=stm.executeQuery(query);
while(rs.next())
{
	dp=rs.getString("picdp");
	
%>


<%	

}
stm.close();

con.close();

}

catch(Exception e)
{
e.printStackTrace();
}
%>


<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");
Statement stm1=con.createStatement();
ResultSet rs1=stm1.executeQuery("select * from Sign_up where Registration_empid= '"+user2+"' ");
while(rs1.next())
{
	fname=rs1.getString("firstname");
	lname=rs1.getString("lastname");

}
stm1.close();
con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
		
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
			
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
				
                <a class="navbar-brand" href="index.html">
                   <img src="assets/img/cvrce_logo.png" alt=""></img> 
                </a>
			
            </div>
            
            
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-warning">5</span>  <i class="fa fa-bell fa-2x"></i>
                    </a>
                    <!-- dropdown alerts-->
                    <ul class="dropdown-menu dropdown-alerts">
                             
                       <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Notices</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- end dropdown-alerts -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-2x"></i>
                    </a>
                    <!-- dropdown user-->
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="http://localhost:9090/student_teacher_intraction/"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                    <!-- end dropdown-user -->
                </li>
                <!-- end main dropdown -->
            </ul>
            <!-- end navbar-top-links -->

        </nav>
        <!-- end navbar top -->

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li>
                        <!-- user image section-->
						
                        <div class="user-section">
                            <div>
							   <img src="img/profile/<%=dp%>" width="200px" height="250px" alt="">
							
                            </div>



					    <div >
							<form action="profilepic.jsp" method="post" enctype="multipart/form-data"> 
							  <div class="popup" onclick="myFunction()">
							  <font size="3px"><strong><%out.print("\t update Pic");%></strong></font>
                                <span class="popuptext" id="myPopup"><input type="file" name="d1" class="btn-xs">
								  <%session.setAttribute("user3",user2);%>
								  
                                  <input type="submit" value="Upload" class="btn-xs">
                                </span>
                              </div>
							</form>
						</div>
							
							
							
							
                            <div class="user-info">
                                <div><strong><%=fname%> <%=lname%></strong></div>
                                <div class="user-text-online">
                                    <span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;Online
                                </div>
                            </div>
                        </div>
						
						
						     
                        <!--end user image section-->
                    </li>
                    <li class="sidebar-search">
                        <!-- search section-->
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!--end search section-->
                    </li>
					
                    <li class="selected">
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i>Timeline</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> About<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="about.jsp">About me</a>
                            </li>
                            
                        </ul>
                        <!-- second-level-items -->
                    </li>
                     <li>
                        <a href="result.jsp"><i class="fa fa-flask fa-fw"></i>Results</a>
                    </li>
                    <li>
                        <a href="attendance.jsp"><i class="fa fa-table fa-fw"></i>Attendance</a>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i>Faculty Search<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            
                            <li>
                                <a href="faculty.jsp">Faculty</a>
                            </li>
                        </ul>
                     
                    </li>
                </ul>
             
            </div>
            
        </nav>
          <!--  page-wrapper -->
        <div id="page-wrapper">
             <div class="row">
						<div class="col-lg-16">
						
						
						
						<div >
						
							<form action="coverpic.jsp" method="post" enctype="multipart/form-data"> 
							  
							  
							  <div class="popup" onclick="myFunction1()">
							  <img src="03.jpg" width="1080px" height="300px" ></img>
							  
							  <font size="3px"><strong></strong></font>
                                <span class="popuptext" id="myPopup1"><input type="file" value="cp" name="d2" class="btn-xs">
                                  <input type="submit" value="Update" class="btn-xs">
                                </span>
                              </div>
							</form>
						</div>
						
						
						</div>
						</div>
            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Timeline</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <!-- Welcome -->
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <i class="fa fa-folder-open"></i><b>&nbsp;Hello ! </b>Welcome<b> <%=fname%> <%=lname%></b>
                  <i class="fa  fa-pencil"></i><b>&nbsp;</b>
                    </div>
                </div>
                <!--end  Welcome -->
            </div>


            <div class="row">
                <!--quick info section -->
                <div class="col-lg-3">
                    <div class="alert alert-danger text-center">
                        <i class="fa fa-calendar fa-3x"></i>&nbsp;<b>20 </b>Classes Sheduled This Month

                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-success text-center">
                        <i class="fa  fa-beer fa-3x"></i>&nbsp;<b>3 </b>Labs in This Month  
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-rss fa-3x"></i>&nbsp;<b></b> conding club event comming soon...

                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-warning text-center">
                        <i class="fa  fa-pencil fa-3x"></i>&nbsp;<b></b>
                    </div>
                </div>
                <!--end quick info section -->
            </div>

            <div class="row">
                <div class="col-lg-8">



                    <!--Area chart example -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <i class="fa  fa-pencil fa-2x"></i><strong>Create Post</strong>
							 
                            
                        </div>

                        <div class="panel-body">
						   <textarea rows="4" cols="90">
                            
                           </textarea>
						   
                          <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary btn-xl ">
                                       post 
                                    </button>
                                </div>
                            </div>
							
                        </div>
                        
                    </div>
               
                </div>

				
				
				<div class="col-lg-8">
                    <!--Area chart example -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <i class="fa  fa-pencil fa-2x"></i><strong>someone posted</strong>
							 
                            
                        </div>

                        <div class="panel-body">
						   <img src="assets/img/cv.png" alt="" width="660px"></img>
						   
                          <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary btn-xl ">
                                       like 
                                    </button>
                                </div>
                            </div>
							
                        </div>
                        
                    </div>
               
                </div>
				
				
				
                <div class="col-lg-4">
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body ">
                            <i class="fa fa-bar-chart-o fa-3x"></i>
                            <h3>20,741 </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">Daily User Visits
                            </span>
                        </div>
                    </div>
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body ">
                            <i class="fa fa-pencil-square-o fa-3x"></i>
                            <h3>2,060 </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">Download your admit card
                            </span>
                        </div>
                    </div>
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body ">
                            <i class="fa fa fa-floppy-o fa-3x"></i>
                            <h3>20 GB</h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">Lecture Notes
                            </span>
                        </div>
                    </div>
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body ">
                            <i class="fa fa-thumbs-up fa-3x"></i>
                            <h3>2,700 </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">New User Registered
                            </span>
                        </div>
                    </div>
                    
					<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i>Notifications Panel
                        </div>

                        <div class="panel-body">
                            <div class="list-group">
                               
                                
                               
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i>New Task
                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                                </a>
                                
                                
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-warning fa-fw"></i>Registration started by today
                                    <span class="pull-right text-muted small"><em>10:57 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-shopping-cart fa-fw"></i><%out.print(user2);%>
                                    <span class="pull-right text-muted small"><em>9:49 AM</em>
                                    </span>
                                </a>

                            </div>
                            <!-- /.list-group -->
                            <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                        </div>

                        </div>
                        </div>
                        </div>
            </div>
        <!-- end page-wrapper -->

    </div>
    <!-- end wrapper -->
    
    <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="assets/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/plugins/morris/morris.js"></script>
    <script src="assets/scripts/dashboard-demo.js"></script>
	
	
	
	<script>
// When the user clicks on div, open the popup
function myFunction() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}
</script>
	
	
	<script>
// When the user clicks on div, open the popup
function myFunction1() {
    var popup1 = document.getElementById("myPopup1");
    popup1.classList.toggle("show");
}
</script>
	

</body>

</html>
