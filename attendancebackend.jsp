<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
SimpleDateFormat format = new SimpleDateFormat("mm-dd-yyyy");


for(int i=1;i<11;i++)
{
	Date date=format.parse(request.getParameter('currd"+i+"'));
	Date sqlDate = new Date(date.getTime());
	int onec=Integer.parseInt(request.getParameter('onec"+i+"'));
	int present=Integer.parseInt(request.getParameter('twoc"+i+"'));
	int present=Integer.parseInt(request.getParameter('threec"+i+"'));
	int present=Integer.parseInt(request.getParameter('fourc"+i+"'));
	int present=Integer.parseInt(request.getParameter('fivec"+i+"'));
	int present=Integer.parseInt(request.getParameter('sixc"+i+"'));
	int present=Integer.parseInt(request.getParameter('sevenc"+i+"'));
	int present=Integer.parseInt(request.getParameter('eightc"+i+"'));
	int present=Integer.parseInt(request.getParameter('ninec"+i+"'));
	int present=Integer.parseInt(request.getParameter('tenc"+i+"'));
}
int present=Integer.parseInt(request.getParameter("present"));
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");

PreparedStatement ps=con.prepareStatement("insert into Attendance_Record values(?,?,?,?,?,?,?,?,?,?,?)");
ps.setDate(6,sqlDate);
ps.setInt(7,present);
ps.setInt(8,present);
ps.setInt(9,present);
ps.setInt(10,present);
ps.setInt(11,present);
ps.setInt(12,present);
ps.setInt(13,present);
ps.setInt(14,present);
ps.setInt(15,present);
ps.setInt(16,present);

int i=ps.executeUpdate();
if(i!=0)
{
	String msg="Todays attendance taken successfully";
	out.println(msg);
     
    
}    
else
	out.println("attendance not inserted properly");
%> 