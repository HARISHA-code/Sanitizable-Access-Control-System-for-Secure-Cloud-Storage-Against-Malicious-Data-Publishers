<%-- 
    Document   : sendkey
    Created on : Aug 2, 2017, 5:14:33 PM
    Author     : DLK 1
--%>

<%@page import="java.util.Random"%>
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
    Connection con=new DB().Connect();
    PreparedStatement ps=con.prepareStatement("select * from user_register where name='"+name+"'  ");
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
    email=rs.getString("mail");
    }
    mail m=new mail(); 
    Random r = new Random(); 
     String x = Integer.toString(r.nextInt(10000));
    String subject="Keywird Search Secret Key";
    String message="File Key :  "+x;
    String mall=" "+message;
    m.sendFromGMail("projecttechciti", "obhpolzkxhyjcata",email, subject,mall);
    PreparedStatement p=con.prepareStatement("update keyword_request set status='Active', skey='"+x+"' where uid='"+id+"' and uname='"+name+"' ");
    p.executeUpdate();
    System.out.println(x);
    out.println("<script>"
                            +"alert('Key Generated to User Mail Id.')"
                            +"</script>");        
    RequestDispatcher rd=request.getRequestDispatcher("keyword_request.jsp");
    rd.include(request, response);
%>