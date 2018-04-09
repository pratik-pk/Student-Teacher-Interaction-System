<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>


<%
String user=request.getParameter("userid");
session.setAttribute("user1",user);
String pass=request.getParameter("password3");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");
PreparedStatement ps=con.prepareStatement("select * from Sign_up where Registration_empid=(?) and password=(?) ");
ps.setString(1,user);
ps.setString(2,pass);
ResultSet rs=ps.executeQuery();
if(!rs.next())
{
	out.println("<html><body bgcolor='cyan'><font color='red' size='5'><center><br><br><b>not</b></center></font></body></html>");
	

}
else
{

response.sendRedirect("index.jsp");
out.println("<html><body bgcolor='cyan'><font color='red' size='5'><center><br><br><b>success</b></center></font></body></html>");
}
ps.close();
con.close();
%>
