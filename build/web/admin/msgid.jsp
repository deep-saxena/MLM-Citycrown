<%@page import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String msgid=request.getParameter("id");
                 String qry="select * from regtable where id like '"+msgid+"%'";
                 Connection cn=null;
                 String result="",mid="";
                 try{
                   cn= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
                  Statement st=cn.createStatement();
                  ResultSet rs=st.executeQuery(qry);
                  while(rs.next())
                  { mid=rs.getString(1);
                    String name=rs.getString("name")+"("+mid+")";
                     result=result+"<li><input type='checkbox' name='"+mid+"' value='"+mid+"' />&nbsp;&nbsp;"+name+"</li>";
                  
                  }
                  out.println(result);
                  
                 }
                                   
                 
                 catch(Exception ex)
                 { out.println(ex.getMessage()); }
                 finally
                 {cn.close();}
          


%>