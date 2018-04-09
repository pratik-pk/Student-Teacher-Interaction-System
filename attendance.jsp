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
int i=0;
String lname;
String fname;
String user2;
String dp;
ResultSet rs,rs2;
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
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-warning">5</span>  <i class="fa fa-bell fa-2x"></i>
                    </a>
                    <!-- dropdown alerts-->
                    <ul class="dropdown-menu dropdown-alerts">
                        
                        
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
                        
                        <!-- second-level-items -->
                    
                     <li>
                        <a href="result.jsp"><i class="fa fa-flask fa-fw"></i>Results</a>
                    </li>
                   <li class="selected">
                        <a href="attendance.jsp"><i class="fa fa-table fa-fw"></i>Attendance</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i>Faculty Search<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            
                            <li>
                                <a href="faculty.jsp">Faculty</a>
                            </li>
                        </ul>
                      
                   
                </ul>
                
            </div>
          
        </nav>
   
        <div id="page-wrapper">

            <div class="row">
			<div class=col-lg-6>
			<br><br>
			<h4>Select Semester</h4>
			<select name="semester" onchange="showSubject(this.value)">
			<option value"">--choose semester--</option>
			<option value="sem1">1st Semester</option>
			<option value="sem2">2nd Semester</option>
			<option value="sem3">3rd Semester</option>
			<option value="sem4">4th Semester</option>
			<option value="sem5">5th Semester</option>
			<option value="sem6">6th Semester</option>
			<option value="sem7">7th Semester</option>
			<option value="sem8">8th Semester</option>
			</select>
			</div>
			<div class=col-lg-6>
			<br><br>
			<h4>Select Subject</h4>
			<select name="subject" onchange="showAttendance(this.value)">
<option value="">--select subject--</option>
			
<%
try{
String seme=request.getParameter("seme");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");
Statement stm2=con.createStatement();
rs2=stm2.executeQuery("select * from allsubject where semester= '"+seme+"' ");
while(rs2.next())
{
	
%>
<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
<%}%>
</select>
<%
stm2.close();
con.close();

}
catch(Exception e)
{
	e.printStackTrace();
}

%>
			
			
			</div>
            <div class="row">
                 <!--  page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Attendance</h1>
                </div>
                 <!-- end  page header -->
            </div>
            <div class="row">
                <div class="col-lg-16">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Attendance Record
                        </div>
						
                        <div class="panel-body">
                            <div class="table-responsive">
						
							<form action="attendancebackend.jsp" method="post">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>REGISTRATION NUMBER</th>
                                            <th>NAME</th>
                                            <th>Subject</th>
										    <th>Semester</th>
                                            <th>Date</th>											
										    <th>Day1</th>
											<th>Day2<th>
											<th>Day3</th>
											<th>Day4<th>
											<th>Day5</th>
											<th>Day6<th>
											<th>Day7</th>
											<th>Day8<th>
											<th>Day9</th>
											<th>Day10<th>
											
                                        </tr>
                                    </thead>
						<%

						String subj=request.getParameter("subj");
						try{

Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");
Statement stm3=con.createStatement();
ResultSet rs3=stm3.executeQuery("select * from Attendance_Record where Subject_Code= '"+subj+"' ");

while(rs3.next())
{
	i++;
%>
									
									
                                    <tbody>									
                                       <tr>
                                        <td><%=rs3.getString(1)%></td>
                                        <td><%=rs3.getString(2)%></td>
                                        <td><%=rs3.getString(4)%></td>
										<td><%=rs3.getString(5)%></td>
                                      	<td><input type="Date" name='currd"+i+"'></td>
                                        <td><input type="checkbox" name='onec"+i+"'>present</td>	
                                        <td><input type="checkbox" name='twoc"+i+"'>present</td>
                                        <td><input type="checkbox" name='threec"+i+"'>present</td>
                                        <td><input type="checkbox" name='fourc"+i+"'>present</td>
                                        <td><input type="checkbox" name='fivec"+i+"'>present</td>
                                        <td><input type="checkbox" name='sixc"+i+"'>present</td>	
                                        <td><input type="checkbox" name='sevenc"+i+"'>present</td>	
                                        <td><input type="checkbox" name='eightc"+i+"'>present</td>	
                                        <td><input type="checkbox" name='ninec"+i+"'>present</td>	
                                        <td><input type="checkbox" name='tenc"+i+"'>present</td>												
                                       </tr>    
                                    </tbody>
<%}
stm3.close();
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
						con.close();
%>
									
									
                                </table>
							
								
								<div>
								<input type="submit" class="btn btn-success" value="Update"/>
							
								</div>
								<form>
					
                            </div>
                            
							
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
           
            
            
        </div>
    </div>
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="assets/plugins/flot/jquery.flot.js"></script>
    <script src="assets/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.resize.js"></script>
    <script src="assets/plugins/flot/jquery.flot.pie.js"></script>
    <script src="assets/scripts/flot-demo.js"></script>
<script>
function showSubject(str){
	var seme = str;
    window.location.replace("attendance.jsp?seme="+seme);
}
</script>
<script>
function showAttendance(str){
	var subj = str;
    window.location.replace("attendance.jsp?subj="+subj);
}
</script>


</body>

</html>
