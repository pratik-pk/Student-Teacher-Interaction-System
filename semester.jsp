<%@ page import="java.sql.*"%>

<%
String s=request.getParameter("q");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");
PreparedStatement ps=con.prepareStatement("select subjectname from allsubject where s=(?) ");
ps.setString(3,st);
ResultSet rs=ps.executeQuery();
%>
<form action="attendance.jsp">
<%
while(rs.next()){	
%>
<input type="text" name="subject" value="rs.getString(2)">
%>
</form>


<%
out.print(rs.getString(1)+" "+rs.getString(2));

}
ps.close();
con.close();

}catch(Exception e){e.printStackTrace();}
}
%>