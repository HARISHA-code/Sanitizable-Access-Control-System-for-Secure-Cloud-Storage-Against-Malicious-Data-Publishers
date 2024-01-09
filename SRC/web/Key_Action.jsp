<%-- 
    Document   : sendkey
    Created on : Aug 2, 2017, 5:14:33 PM
    Author     : DLK 1
--%>

<%@page import="DB.DB"%>
<%@page import="algorithm.CipherHelper"%>
<%@page import="algorithm.mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id,email="";
    id=request.getParameter("id");
    String name=request.getParameter("name");
    String fname=request.getParameter("fname");
    String fkey=request.getParameter("fkey");
    String trapdoor=request.getParameter("trap");
    Connection con=new DB().Connect();
    PreparedStatement ps=con.prepareStatement("select * from user_register where name='"+name+"'  ");
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
    email=rs.getString("mail");
    }
    mail m=new mail(); 
    String subject="File Private and Trapdoor Key";
    String message="File Key :  "+fkey;
    String m1="Trapdoor Key : "+trapdoor;
    String m2="File NAme : "+fname;
    String mall=m2+" "+m1+" "+message;
    System.out.println(message);
    System.out.println(m1);
    System.out.println(m2);
    m.sendFromGMail("projecttechciti", "obhpolzkxhyjcata",email, subject,mall);
    PreparedStatement p=con.prepareStatement("update filereq set status='Active' where id='"+id+"' ");
    p.executeUpdate();
    out.println("<script>"
                            +"alert('Key Generated to User Mail Id.')"
                            +"</script>");        
    RequestDispatcher rd=request.getRequestDispatcher("Send_Key.jsp");
    rd.include(request, response);
%>