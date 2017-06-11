<%@page import="java.util.ArrayList"%>
<%@page import="MyPack.getRecord"%>
<%             getRecord r=new getRecord();
               if(request.getParameter("id").equals("OPEN") || request.getParameter("id").equals(""))
               {
                 out.println("<li></li>");
                 return;
               }
                ArrayList a=r.getrecord(request.getParameter("id"));
               // ServletContext sc=getServletContext();
                String imgpath="..\\..\\user_images\\"+request.getParameter("id")+"\\profilepic\\user.jpg";
                              
                String result22="<table border='0'><tr><td style='padding: 10px'><img src='"+imgpath+"' height='130' width='130' id='namecard' /></td><td style='padding: 20px'>";
                
               String heads[]={"Sponser ID","Name","Phone No"};
               String str[]=new String[9];
               String str1="<ul><b>";
               int i=0;
               for(Object o:a)
               { 
                  
                   str[i++]=o.toString();
               }
               
               //for(i=0;i<3;i++)
               //{
                 str1=str1+"<li>"+heads[0]+" : "+str[0]+"</li>";
                 str1=str1+"<li>"+heads[1]+" : "+str[4]+"</li>";
                 str1=str1+"<li>"+heads[2]+" : "+str[6]+"</li>";
               //}
             out.println(result22+str1+"</b></ul></td></tr></table>");
    
    %>