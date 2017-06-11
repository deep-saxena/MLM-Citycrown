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
import java.util.ArrayList;

public class getRecord {
    public ArrayList getrecord(String id)
            
    {
         ArrayList a=new ArrayList();
               String sid="";
               String parent="";
               String lchild="";
               String rchild="";
               String name="";        
               String address="";
               String phone="";        
               String dob="";
               String nominee="";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            String query="select * from regtable where id=?";
            PreparedStatement ps=c.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                sid=rs.getString(2);
                parent=rs.getString(3);
                lchild=rs.getString(4);
                rchild=rs.getString(5);
                name=rs.getString(6);        
                address=rs.getString(7);
                phone=rs.getString(8);        
                dob=rs.getString(9);
                nominee=rs.getString(10);
                        
                        
            }
        
        a.add(sid);
        a.add(parent);
        a.add(lchild);
        a.add(rchild);
        a.add(name);
        a.add(address);
        a.add(phone);
        a.add(dob);
        a.add(nominee);
        
        
        
        }
        catch(Exception e)
        {
            
        }
        return a;
    }
            
    
}
 