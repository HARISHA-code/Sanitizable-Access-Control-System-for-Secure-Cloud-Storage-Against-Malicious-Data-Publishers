/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package provider;

import DB.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Provider_Login_Action extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        try{
            String name=request.getParameter("user");
            String pass=request.getParameter("pass");
            System.out.println("username.."+name+" "+pass);
            Connection con=new DB().Connect();
            PreparedStatement ps=con.prepareStatement("select * from provider_register where name='"+name+"' and password='"+pass+"' and status='Accept' ");
            System.out.println(ps);
            ResultSet r=ps.executeQuery();
            if(r.next()){
                String pid=r.getString("id");
                String mail=r.getString("mail");
                String pic=r.getString("profile");
                session.setAttribute("name",name);
                session.setAttribute("pid", pid);
                session.setAttribute("pic", pic);
                System.out.println("pname"+name+"pid"+pid+"pic"+pic+"mail"+mail);
                out.println("<script type=\"text/javascript\">"); 			
                out.println("alert(\"Welcome  "+name+"\")");
                out.println("</script>"); 
                RequestDispatcher rd=request.getRequestDispatcher("Provider_Home.jsp");
                rd.include(request, response);  
            }
            else{
                out.println("<script type=\"text/javascript\">"); 			
            out.println("alert(\"Invalid Login\")");
            out.println("</script>"); 
            RequestDispatcher rd=request.getRequestDispatcher("Provider_Login.jsp");
            rd.include(request, response);  
            }
           
        }
        catch(Exception e){
            System.out.println(e);
            out.println("<script type=\"text/javascript\">"); 			
            out.println("alert(\"Invalid Login\")");
            out.println("</script>"); 
            RequestDispatcher rd=request.getRequestDispatcher("Provider_Login.jsp");
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
