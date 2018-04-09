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


</head>

<body>
<%!
String fname;
String lname;
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
                    <img src="assets/img/cvrce_logo.png" alt="" />
                </a>
            </div>
            
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-warning">5</span>  <i class="fa fa-bell fa-2x"></i>
                    </a>
                    <!-- dropdown alerts-->
                    <ul class="dropdown-menu dropdown-alerts">
                       
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Notice</strong>
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
                    <li class="">
                        <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i>Timeline</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>About<span class="fa arrow"></span></a>
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
                   
                    <li class="active">
                        <a href="#"><i class="fa fa-wrench fa-fw"></i>Faculty Search<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            
                            <li class="selected">
                                <a href="faculty.jsp">Faculty</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    
                   
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">

            <div class="row">
                <!--page header-->
                <div class="col-lg-12">
                    <h1 class="page-header">Faculty</h1>
                </div>
                 <!--end page header-->
            </div>
            <!-- row -->
            <div class="row">
                <div class="col-lg-16">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3>Meet Our Faculties here...</h3>
                            <p>They are having thre interest in different field on which they are currently working.</p>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
									
                                        <tr>
										
                                            <th>
											NAME
											
											</th>
											
											
                                            <th>
                                                AREA OF INTEREST
                                              
                                            </th>
											
                                            <th>
                                                PROFILE
                                            </th>
                                           
                                        </tr>
									
                                    </thead>
                                    <tbody>
                                       
                                        <tr>
                                            
                                            <td>Dr. Bibudhendu Pati  </td>
                                            <td>Wireless Sensor Networks, Cloud Computing, Virtual Networks, and Advanced Network Technologies</td>
                                            <td>view</td>
                                            
                                        </tr>
                                        <tr>
                                            
                                            <td>
                                                Mr. Sukant Kishoro Bisoy
                                            </td>
                                            <td>
                                                MANET, WSN
                                            </td>
                                            <td>
                                               view
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                           
                                             <td>
                                               Mrs. Shreela Dash
                                            </td>
                                            <td>
                                                Image processing
                                            </td>
                                            <td>
                                               view
                                            </td>
											
											
											
											
                                        </tr>
                                        <tr>
                                            
                                           
                                            <td>Mr. Mohit Ranjan Panda </td>
                                            <td>ROBOTICS, Parallel Computing</td>
                                            <td>view</td>
                                        </tr>
                                       
									    <tr>
                                            
                                           
                                            <td>Mr. Devpriya Panda  </td>
                                            <td>Soft computing, Internet and Web technology</td>
                                            <td>view</td>
                                        </tr>
										 <tr>
                                            
                                           
                                            <td>Mrs. Mamatarani Das </td>
                                            <td>VLSI Design, Image Processing,</td>
                                            <td>view</td>
                                        </tr>
										 <tr>
                                            
                                           
                                            <td>Mr. Manas Ranjan Mishra </td>
                                            <td>Computer Networking, MANET, Sensory & Robotics</td>
                                            <td>view</td>
                                        </tr>
										 <tr>
                                            
                                           
                                            <td>Mrs. Sasmita Parida  </td>
                                            <td>Cloud Computing</td>
                                            <td>view</td>
                                        </tr>
										 <tr>
                                            
                                           
                                            <td>Mr. Kartik Chandra Jena </td>
                                            <td>Image processing</td>
                                            <td>view</td>
                                        </tr>
										 <tr>
                                            
                                           
                                            <td>Mr. Suvendu Chandan Nayak </td>
                                            <td>Image Processing, Cloud Computing</td>
                                            <td>view</td>
                                        </tr>
										 <tr>
                                            
                                           
                                            <td>Ms. Soumya Sahoo</td>
                                            <td>Soft Computing, Data Mining</td>
                                            <td>view</td>
                                        </tr>
										
										 <tr>
                                            
                                           
                                            <td>Mr. Khitish Kumar Gadnayak</td>
                                            <td>Image Processing</td>
                                            <td>view</td>
                                        </tr>
										
										
										
										
										 <tr>
                                            
                                           
                                            <td>Mrs. Monalisa Mishra</td>
                                            <td>Computer Networks and Network Security</td>
                                            <td>view</td>
                                        </tr>
										
										
										
										 <tr>
                                            
                                           
                                            <td>Ms. Soumya Sahoo</td>
                                            <td>Soft Computing, Data Mining</td>
                                            <td>view</td>
                                        </tr>
										
										
										
										
										 <tr>
                                            
                                           
                                            <td>Mr. Sunil Kumar Mohapatra</td>
                                            <td>Mobile ADHOC Network,Wireless Sensor Network</td>
                                            <td>view</td>
                                        </tr>
										
										
										
										 <tr>
                                            
                                           
                                            <td>Mrs. Priyadarshini Nayak</td>
                                            <td>Adhoc-Networks</td>
                                            <td>view</td>
                                        </tr>
										
										
										
										 <tr>
                                            
                                           
                                            <td>Mr. Swagat Ranjan Sahoo</td>
                                            <td>Cloud Computing, Web Technology, DBMS, Linux and Open Source tools</td>
                                            <td>view</td>
                                        </tr>
										
										 <tr>
                                            
                                           
                                            <td>Mrs. Pragyan P. Mohapatra</td>
                                            <td>CS and Data Pocessing</td>
                                            <td>view</td>
                                        </tr>
										
										 <tr>
                                            
                                           
                                            <td>Mr. Shakti Kumar Samal </td>
                                            <td>Computer Science</td>
                                            <td>view</td>
                                        </tr>
										
										 <tr>
                                            <td>Dr. Prasant Kumar Nayak</td>
                                            <td>Bio Mathematics, Computer Virology</td>
                                            <td>view</td>
                                        </tr>
										
										
										
										<tr>
                                            <td>Mrs. Mamata Rath </td>
                                            <td>Computer Networking, Computer Architecture, Operating System</td>
                                            <td>view</td>
                                        </tr>
										
										
										<tr>
                                            <td>Mr. Sambhu Prasad Panda </td>
                                            <td>Theory of Computation and Computer Graphics</td>
                                            <td>view</td>
                                        </tr>
										
										
										
										<tr>
                                            <td>Mr. Sushruta Mishra</td>
                                            <td>Soft Computing & Machine Learning, Wireless Sensor Networks, Computer Networking, Software engineering and Database Engineering</td>
                                            <td>view</td>
                                        </tr>
										
										<tr>
                                            <td>Mrs. Banee Bandana Das  </td>
                                            <td>Wireless Sensor Networks, Theory Of Computation,Compiler Design</td>
                                            <td>view</td>
                                        </tr>
										
										<tr>
                                            <td>Mrs. Subhashree Mohapatra </td>
                                            <td>Networking</td>
                                            <td>view</td>
                                        </tr>
										
										
										<tr>
                                            <td>Dr. Soubhagya Sankar Barpanda  </td>
                                            <td>Biometrics, image processing, theoretical computer science</td>
                                            <td>view</td>
                                        </tr>
										
										
										
										<tr>
                                            <td>Mrs. Jally Sahoo    </td>
                                            <td>Data Mining, Database Engineering and Object Oriented Programming Paradigms</td>
                                            <td>view</td>
                                        </tr>
										
										
										
                                    </tbody>
                                </table>
                           
                    </div>
                </div>
            </div>
            <!-- end row -->
             
           
            

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

</body>

</html>
