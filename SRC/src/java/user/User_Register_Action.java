/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import DB.DB;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.ResultSet;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
public class User_Register_Action extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            HttpSession session=request.getSession();
            
            ServletContext sc=request.getSession().getServletContext();
            
            List<String> ms = new ArrayList<String>();
            String finalimage = "";
            boolean isMultipart = ServletFileUpload.isMultipartContent(
                    request);
            List<String> m = new ArrayList<String>();
            File savedFile;
            
            if (!isMultipart) {
                
                System.out.println("File Not Uploaded");
            }
            else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                
                try {
                    items = upload.parseRequest(request);
                    
                }
                catch (FileUploadException e)
                {
                    e.printStackTrace();
                }
                Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    List<String> al = new ArrayList<String>();
                    
                    String sss = "";
                    FileItem item = (FileItem) itr.next();
                    String value = "";
                    String a[];
                    if (item.isFormField()) {
                        String name = item.getFieldName();
                        //System.out.println("name: "+name+'\n');
                        value = item.getString();
                        // System.out.println("value: "+value);
                        al.add(value);
                        for (int i = 0; i < al.size(); i++) {
                            sss += al.get(i);
                            System.out.println("is this image" + sss);
                            
                            
                        }
                        
                        a = sss.split("-");
                        for (int i = 0; i < a.length; i++) {
                            
                            String am = a[i];
                            System.out.println("aaaaaaaaaaaaaaaa" + a[i]);
                            m.add(a[i]);
                        }
                    } else {
                        
                        String itemName = item.getName();
                        
                        
                        String reg = "[.*]";
                        String replacingtext = "";
                        
                        Pattern pattern = Pattern.compile(reg);
                        Matcher matcher = pattern.matcher(itemName);
                        StringBuffer buffer = new StringBuffer();
                        
                        while (matcher.find())
                        {
                            matcher.appendReplacement(buffer, replacingtext);
                        }
                        int IndexOf = itemName.indexOf(".");
                        int Indexf = itemName.indexOf(".");
                        String domainName = itemName.substring(IndexOf);
                        
                        finalimage = buffer.toString() + domainName;
                        System.out.println("Final Image===" + finalimage);
                        ms.add(finalimage);
                        ms.get(0);
                        String  fn=ms.get(0);
                        System.out.println("trying to put all in store");
                        savedFile = new File(sc.getRealPath("dataset")+"\\"+finalimage);
                        
                        String a0=request.getParameter(value);
                        
                        try
                        {
                            item.write(savedFile);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        
                    }
                }
            }

            Connection con=new DB().Connect();
            
             // Check if the user already exists in the database
            PreparedStatement checkPs = con.prepareStatement("SELECT * FROM user_register WHERE name=?");
            checkPs.setString(1, m.get(0)); // Assuming m.get(0) contains the username
            ResultSet resultSet = checkPs.executeQuery();

            if (resultSet.next()) {
                // User already exists, show an error message
                out.println("<script>"
                            +"alert('User already exists. Please try a different username.')"
                            +"</script>");
                RequestDispatcher rd = request.getRequestDispatcher("User_Register.jsp");
                rd.include(request, response);
            } else {
                // User does not exist, proceed with the registration
                PreparedStatement ps = con.prepareStatement("INSERT INTO user_register (name, password, mobile, mail, city, profile) VALUES (?, ?, ?, ?, ?, ?)");
                ps.setString(1, m.get(0)); // Assuming m.get(0) contains the name
                ps.setString(2, m.get(1)); // Assuming m.get(1) contains the password
                ps.setString(3, m.get(2)); // Assuming m.get(2) contains the mobile
                ps.setString(4, m.get(3)); // Assuming m.get(3) contains the mail
                ps.setString(5, m.get(4)); // Assuming m.get(4) contains the city
                ps.setString(6, ms.get(0)); // Assuming ms.get(0) contains the profile
                ps.executeUpdate();

                out.println("<script>"
                            +"alert('Registered Successfully')"
                            +"</script>");

                RequestDispatcher rd = request.getRequestDispatcher("User_Login.jsp");
                rd.include(request, response);
            }
        } catch (SQLException ex) {
            out.println("<script>"
                        +"alert('Please Try Again.')"
                        +"</script>");
            RequestDispatcher rd = request.getRequestDispatcher("User_Register.jsp");
            rd.include(request, response);
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
