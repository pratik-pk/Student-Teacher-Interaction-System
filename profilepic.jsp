<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<html>
<head>
<title>
</title>
</head>
<body>
<%!
String str;
Statement stm;
Connection con;
File file;
int maxSize=10000000;
int maxFactSize=10000000;
String path="C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/student_teacher_intraction/img/profile";
%>
<%
String type=request.getContentType();
out.println(type);
if(type.indexOf("multipart/form-data")>=0)
{
	out.println("its a multi part data");
	DiskFileItemFactory disfact=new DiskFileItemFactory();
	disfact.setSizeThreshold(maxFactSize);
	disfact.setRepository(new File("c://pic"));
	ServletFileUpload upload=new ServletFileUpload(disfact);
	upload.setSizeMax(maxSize);
	List lis=upload.parseRequest(request);
	Iterator itr=lis.iterator();
	while(itr.hasNext())
	{
		FileItem item=(FileItem)itr.next();
	
		if(!item.isFormField())
		{
			str=item.getName();
			out.println(str);
			file=new File(path,str);
			item.write(file);
			out.println("uploaded");
		}
	}
}
%>
<%

String us=String.valueOf(session.getAttribute("user3"));
out.print(us);
try
{
String query="insert into Profilepic values('"+str+"','"+us+"')";
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik");
stm=con.createStatement();
stm.executeUpdate(query);	
out.println("file path stored");
stm.close();

con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
response.sendRedirect("index.jsp");
%>

</body>
</html>



