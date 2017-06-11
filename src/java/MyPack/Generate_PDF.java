
package MyPack;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.ServletContext;

public class Generate_PDF {
    
    public static String gen_pdf(String path)
    {
      Document document = new Document();
      String filename="Transaction_"+Generate_OTP.get_OTP()+".pdf";
      
      try
    {     PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(path+"\\"+filename));
       
          Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
        Statement st=cn.createStatement();
         ResultSet rs;
          String uid="",pass="";
        rs=st.executeQuery("select * from admin_details");
        while(rs.next())
        { uid=rs.getString(1).trim();
          pass=rs.getString(2).trim();
        }
        String file_pass=uid+pass;
        writer.setEncryption(file_pass.getBytes(),
                file_pass.getBytes(), PdfWriter.ALLOW_PRINTING,
                PdfWriter.ENCRYPTION_AES_128);
    
    
        document.open(); 
        PdfPTable table = new PdfPTable(4); // 3 columns.
        table.setWidthPercentage(100); //Width 100%
        table.setSpacingBefore(10f); //Space before table
        table.setSpacingAfter(10f); //Space after table
 
        //Set Column widths
        float[] columnWidths = {1f, 1f, 1f,1f};
        table.setWidths(columnWidths);
 
        PdfPCell cell1 = new PdfPCell(new Paragraph("ID"));
        cell1.setBorderColor(BaseColor.BLUE);
        cell1.setPaddingLeft(10);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        PdfPCell cell2 = new PdfPCell(new Paragraph("Amount"));
        cell2.setBorderColor(BaseColor.GREEN);
        cell2.setPaddingLeft(10);
        cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        PdfPCell cell3 = new PdfPCell(new Paragraph("Date"));
        cell3.setBorderColor(BaseColor.RED);
        cell3.setPaddingLeft(10);
        cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
        PdfPCell cell4 = new PdfPCell(new Paragraph("Pending?"));
        cell4.setBorderColor(BaseColor.BLACK);
        cell4.setPaddingLeft(10);
        cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
        //To avoid having the cell border and the content overlap, if you are having thick cell borders
        //cell1.setUserBorderPadding(true);
        //cell2.setUserBorderPadding(true);
        //cell3.setUserBorderPadding(true);
 
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        table.addCell(cell4);
        //now add entries from database into pdf file..
        
        
        st=cn.createStatement();
        rs=st.executeQuery("select * from cheques");
        while (rs.next())
        { PdfPCell cell11 = new PdfPCell(new Paragraph(rs.getString(1)));
        cell11.setBorderColor(BaseColor.BLUE);
        cell11.setPaddingLeft(10);
        cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell11.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        PdfPCell cell22 = new PdfPCell(new Paragraph(rs.getString(2)));
        cell22.setBorderColor(BaseColor.GREEN);
        cell22.setPaddingLeft(10);
        cell22.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell22.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        PdfPCell cell33 = new PdfPCell(new Paragraph(rs.getString(3)));
        cell33.setBorderColor(BaseColor.RED);
        cell33.setPaddingLeft(10);
        cell33.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell33.setVerticalAlignment(Element.ALIGN_MIDDLE);
        PdfPCell cell44 = new PdfPCell(new Paragraph(rs.getString(4)));
        cell44.setBorderColor(BaseColor.BLACK);
        cell44.setPaddingLeft(10);
        cell44.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell44.setVerticalAlignment(Element.ALIGN_MIDDLE);
        //To avoid having the cell border and the content overlap, if you are having thick cell borders
        //cell1.setUserBorderPadding(true);
        //cell2.setUserBorderPadding(true);
        //cell3.setUserBorderPadding(true);
 
        table.addCell(cell11);
        table.addCell(cell22);
        table.addCell(cell33);
        table.addCell(cell44);
        
           
        
        } //end of while
        
        
 
        
        
        Date d=new Date();
        document.add(new Paragraph("CityCrown Payment History !!"));
        document.add(new Paragraph("Created On : "+d));
        
        document.add(table);
 
        document.close();
        writer.close();
        
    } 
      catch(Exception e)
    {   filename=e.getMessage();
        e.printStackTrace();
    }
      finally{ return filename;}
    }
    
}
