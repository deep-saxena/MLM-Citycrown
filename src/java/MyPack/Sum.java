/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MyPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 *
 */
public class Sum {
    public int minimum(int a,int b)
    {
        if(a>=b)
            return b;
        else 
            return a;
        
    }
    
    public int getleftsum1(String id) throws Exception
    {
        int t;
        String left1,right1;
        if(id.equals("OPEN"))
        {
            return 0;
        }
        else
        {
            if(id.startsWith("10"))
                t=100;
            else
                t=50;
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            String query1="select * from regtable where id=?";
            PreparedStatement ps1=c.prepareStatement(query1);
            ps1.setString(1,id);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();
            left1=rs1.getString(4);
            right1=rs1.getString(5);
            c.close();
         return(getleftsum1(left1)+t+getleftsum1(right1));
     
       
        }
        
    }
    public int getleftsum(String id) throws Exception
    {
        String left,left1,right1;
        int t;
        
            if(id.equals("OPEN"))
            {
                return 0;
            }
            
    
               
            Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            String query="select * from regtable where id=?";
            PreparedStatement ps=c.prepareStatement(query);
            ps.setString(1,id);
            ResultSet rs=ps.executeQuery();
            rs.next();
            left=rs.getString(4);
            c.close();
            return(getleftsum1(left));
            
            
}
    
    
    
}
