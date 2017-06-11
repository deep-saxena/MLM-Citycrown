/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import MyPack.RSum;
import MyPack.Sum;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 *
 */
public class gen extends HttpServlet {
    protected synchronized void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection c=null,c1=null,c2=null;
        try 
        {
            int sno;
            int leftpoint=0,rightpoint=0;
            int leftpoint1=0,rightpoint1=0;
            String id;
            int amount;
            String date;
            Sum s = new Sum();
            Date cdate=new Date();
           
            RSum Rsum= new RSum();
            Class.forName("com.mysql.jdbc.Driver");
            c=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            c1=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            c2=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            String query="select * from regtable";
            PreparedStatement ps=c.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
           //     c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            // c1=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
           //  c2=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
                
                
                            id=rs.getString(1);
                            leftpoint=s.getleftsum(id);
                            rightpoint=Rsum.getrightsum(id);
                            
                            
                            
                            
                            String query1="select * from points where id=?";
                            PreparedStatement ps1=c1.prepareStatement(query1);
                            ps1.setString(1, id);
                            ResultSet rs1=ps1.executeQuery();
                                if(rs1.next())
                                {
                                String query2="update points set leftpoint=? ,rightpoint=? where id=?";
                                PreparedStatement ps2=c2.prepareStatement(query2);
                                ps2.setInt(1, leftpoint);
                                ps2.setInt(2, rightpoint);
                                ps2.setString(3, id);
                                ps2.executeUpdate();
                                ps2.close();
                                }
                                else
                                {
                                String query3="insert into points values(?,?,?)";
                                PreparedStatement ps3=c2.prepareStatement(query3);
                                ps3.setString(1, id);
                                ps3.setInt(2,leftpoint);
                                ps3.setInt(3,rightpoint);
                                ps3.executeUpdate();
                                ps3.close();
                                }       
                               
           }
             
           
            
          //   c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
             String query1="select * from points";
             PreparedStatement ps1=c.prepareStatement(query1);
             PreparedStatement ps2;
             ResultSet rs1=ps1.executeQuery();
             long total_bal,prev_bal,due_bal;
             String query2,query3;
             ResultSet rs2;
             Statement st,st1;
             while(rs1.next())
             { prev_bal=0;
                 id=rs1.getString(1).trim();
                 total_bal=10*s.minimum(Integer.parseInt(rs1.getString(2)), Integer.parseInt(rs1.getString(3)));
                 
           //  c1=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
             
                
             query2="select amount from cum_sum where id="+id;
             st=c1.createStatement();
             rs2=st.executeQuery(query2);
             if(rs2.next())
             {
               prev_bal=Long.parseLong(rs2.getString(1));
             
             }
             
             due_bal=total_bal-prev_bal;
             
             if(due_bal>0)
             { //c2=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
               st1=c2.createStatement();
               PreparedStatement ps13=c.prepareStatement("select * from cheques order by sno desc");
               ResultSet rset=ps13.executeQuery();
               if(rset.next())
               {
                sno=rset.getInt(5);
               }
              else
               {
                sno=0;
               }
               sno=sno+1;
                                                
               query3="insert into cheques values(?,?,?,?,?)";
               ps2=c2.prepareStatement(query3);
               ps2.setString(1,id);
               ps2.setInt(2,(int)due_bal);
               ps2.setString(3,new java.util.Date().toString());
               ps2.setString(4, "YES");
               ps2.setInt(5, sno);
               ps2.executeUpdate();
               
                             
             
             }
                    
             
             } //end of while
            // c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
             query1="delete from cum_sum";
             ps1=c.prepareStatement(query1);
             ps1.executeUpdate();
             query1="select * from points";
             ps1=c.prepareStatement(query1);
             rs1=ps1.executeQuery();
             while(rs1.next())
             { id=rs1.getString(1).trim();
               total_bal=10*s.minimum(Integer.parseInt(rs1.getString(2)), Integer.parseInt(rs1.getString(3)));
                if(total_bal>0)
                {
                
                  query2="insert into cum_sum values(?,?)";
                  c2= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
                  ps2=c2.prepareStatement(query2);
                  ps2.setString(1,id);
                  ps2.setLong(2,total_bal);
                  ps2.executeUpdate();
                }
               
             
             
             }
             
             
          
            
            
        response.sendRedirect("admin/generate_cheques.jsp");
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
            finally {
            try {
                out.close();
                c.close();
                c1.close();
                c2.close();
            } catch (SQLException ex) {
                Logger.getLogger(gen.class.getName()).log(Level.SEVERE, null, ex);
            }
          
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
