<%@ page import = "java.sql.*" %>
<% Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");
String Registration_Number = request.getParameter("Registration_Number");
int day1=Integer.parseInt(request.getParameter("day1"));
int day2=Integer.parseInt(request.getParameter("day2"));
int day3=Integer.parseInt(request.getParameter("day3"));
int day4=Integer.parseInt(request.getParameter("day4"));
int day5=Integer.parseInt(request.getParameter("day5"));
int day6=Integer.parseInt(request.getParameter("day6"));
int day7=Integer.parseInt(request.getParameter("day7"));
int day8=Integer.parseInt(request.getParameter("day8"));
int day9=Integer.parseInt(request.getParameter("day9"));
int day10=Integer.parseInt(request.getParameter("day10"));



String dml_type = request.getParameter("dmlType");
String sql="";
if("Upd".equals(dml_type))
  sql = "update Attendance_Record set Day1='"+day1+"',Day2='"+day2+"',Day3='"+day3+"',Day4='"+day4+"',Day5='"+day5+"',Day6='"+day6+"',Day7='"+day7+"',Day8='"+day8+"',Day9='"+day9+"',Day10='"+day10+"' where Registration_Number = " + Registration_Number;
try
{
 Statement stmt = con.createStatement();
 stmt.executeQuery(sql);
}
catch(SQLException e)
{
 //e.printStackTrace();
   out.print("SQL Error encountered " + dml_type  + "," + e.getMessage());
}
con.close();
con=null;
%>