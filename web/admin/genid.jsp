<%@page import="java.sql.Statement"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

        <%
            int nid=Integer.parseInt(request.getParameter("id"));
            String ptype=request.getParameter("plan");
            int i;
            String guid="",qry,result="";
            String source,target="";
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            
            try
            {
            Statement st=cn.createStatement();
            ResultSet rs;
            ServletContext sc=getServletContext();
             String path=sc.getRealPath("user_images");
             source=sc.getRealPath("user.jpg");

             for(i=1;i<=nid;i++)
             {
                guid="";
                qry="";
                guid=guid+ptype;
                
                guid=guid+(Long.toString((long)(Math.random()*100000000)));
                
                qry="select id from admintable where id='"+guid+"'";
                rs=st.executeQuery(qry);
                if(rs.next() || guid.length()!=10)
                {
                    i--;
                }
                else
                {
                   rs=st.executeQuery("select COUNT(*) from admintable");
                     rs.next();
                     int rowcount=Integer.parseInt(rs.getString(1));
                     if(rowcount==0)
                     {
                      String qry2;
                      qry2="insert into regtable values('"+guid+"','OPEN','OPEN','OPEN','OPEN','admin','address','0000000000','0000-00-00','abc','admin','admin@admin.com')";
                      st.executeUpdate(qry2);
                      //create a folder OPEN containing default image in user_images. To be used in show_tree.jsp
                           File f=new File(path+"\\OPEN\\");
                           f.mkdir();
                           target=path+"\\OPEN\\user.jpg";        
                            FileInputStream in = new FileInputStream(source);
                            FileOutputStream out1 = new FileOutputStream(target);
                            // Transfer bytes from in to out
                            byte[] buf = new byte[1024];
                            int len;
                            while ((len = in.read(buf)) > 0) 
                            {
                              out1.write(buf, 0, len);
                            }
                            in.close();
                            out1.close();
                    }

                    
                    st.executeUpdate("insert into admintable values('"+guid+"','NO')");
                    result=result+"<li class='text3' type='square'>"+guid+"</li>";
                    
                    //copying default user image into each user's directory
                     File f=new File(path+"\\"+guid+"\\");
                      f.mkdir();
                     File f1=new File(path+"\\"+guid+"\\profilepic\\");
                      f1.mkdir();
                      target=path+"\\"+guid+"\\profilepic\\user.jpg";
                       FileInputStream in = new FileInputStream(source);
                       FileOutputStream out1 = new FileOutputStream(target);

       // Transfer bytes from in to out
           byte[] buf = new byte[1024];
            int len;
            while ((len = in.read(buf)) > 0) {
                 out1.write(buf, 0, len);
                                 }
               in.close();
               out1.close();

                }
             }//end of loop
             
             
             
             rs=st.executeQuery("select id from admintable limit 1");
             if(rs.next())
             {
               String firstid=rs.getString(1);
               st.executeUpdate("update admintable set isused='YES' where id="+firstid);
             }
             out.println(result);
            }
            catch(Exception e)
            {
                out.println(e.getMessage());
            }
            finally
            {
             cn.close();   
            }
            %>
