  <%@ page import = "java.sql.*" %> 
  <%   
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","pratik"); 
    String sql="select * from Attendance_Record";

    try
     {
      Statement stmt = conn.createStatement();       
      ResultSet rs = stmt.executeQuery(sql);
	  
       /* ResultSetMetaData object is used to retrieve column name and table name and number of 
           columns from parse recordset object using getMetaData function. Since we are attempting to 
           make table columns dynamic and not be hard coded that's why we are using metadata. */

        ResultSetMetaData rsMetaData = rs.getMetaData();

        int numberOfColumns = rsMetaData.getColumnCount();
        
		/* JSON data starts here */
        
		out.print("[");
        
		rs.next();
        /* Outer loop for each row. */
        while(true)
        {               
        	/* Starting of row of an array */
        	
			out.print("{");
					/*  Inner loop for all columns */           
            for(int i=1;i<=numberOfColumns;i++)
            	{
                out.print("\"" + rsMetaData.getColumnName(i) + "\":\""  + 
                rs.getString(rsMetaData.getColumnName(i)) + "\""); 
                if(i<numberOfColumns)
		        	out.print(",");
                }
        	/* Starting of row of an array */
            out.print("}");
            /* This if statement serves two purpose, first one is it's takes cursor to the next record and it's 
                also check whether it is not at EOF, if not it prints a comma and a newline, as you know 
                each row in json data is in curly braces and separated by comma. i.e. 
               {"Name":"Simon","Age":"26"}, and if reaches EOF prints the closing bracket of the array 
               and exists loop */
            if(rs.next())
                out.print(",\n");
            else
                {
                out.print("]");
                break;
                }
        }
/*        Object closed and released.*/        stmt.close();
        rs.close();
        stmt=null;
        rs=null;
   
    }
    catch(SQLException e)
    {
        out.println("SQL Error encountered "+e.getMessage());
    }
    conn.close();
    conn=null;    
    %>