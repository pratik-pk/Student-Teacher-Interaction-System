
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
String regemp=request.getParameter("Registration1");
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String emailid=request.getParameter("email1");
String reemailid=request.getParameter("re_email");
String ph=request.getParameter("phone");
String password=request.getParameter("Password1");
String confirmpassword=request.getParameter("Password2");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");
PreparedStatement ps=con.prepareStatement("insert into Sign_up values(?,?,?,?,?,?,?,?)");
ps.setString(1,regemp);
ps.setString(2,fname);
ps.setString(3,lname);
ps.setString(4,emailid);
ps.setString(5,reemailid);
ps.setString(6,ph);
ps.setString(7,password);
ps.setString(8,confirmpassword);
int i=ps.executeUpdate();

			ps.close();
		
			con.close();
if(i!=0)
	out.println("registered successfully");
     
else
	out.println("not registered");
%>


