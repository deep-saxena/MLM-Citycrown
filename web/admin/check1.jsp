<%@page import="java.sql.*"%>
<%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
    try
    {
           String rz="<tr style='background-color: moccasin;line-height: 25px'><th>Client Id</th><th>Sponser Id</th><th>Parent Id</th><th>Left Child</th><th>Right Child</th><th>Name</th><th>Address</th><th>Phone No</th><th>Date of Birth</th><th>Nominee</th><th>E-mail id</th><th></th></tr>";
           String re=""; 
           String str=request.getParameter("cc1");
           String str1=request.getParameter("cname");
            
            String query="select * from regtable where id like '"+str+"%' and name like '"+str1+"%'";
            PreparedStatement ps=c.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                
               re=re+"<tr style='color:#000; line-height: 25px'><td>"+rs.getString(1)+"</td>"+"<td>"+rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(9)+"</td>"+"<td>"+rs.getString(10)+"</td>"+"<td>"+rs.getString(12)+"</td>"+"<td><a href='edit.jsp?mname="+rs.getString(1) +"'>EDIT</a></td>"+"</tr>";
                    
            }
           
            out.println(rz+re);
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
    finally
    {
        c.close();
    }
%>