<%@page import="DB.DB"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%
    String filename=request.getParameter("fname");
    String fkey=request.getParameter("fkey");
   
    Connection con=new DB().Connect();
    PreparedStatement ps=con.prepareStatement("update file set status='Attacked' where fname='"+filename+"' and fkey='"+fkey+"' ");
    ps.executeUpdate();
    System.out.println(ps);
    out.println("<script>"
                    +"alert('File Attacked')"
                    +"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("Attacker_Home.jsp");
    rd.include(request, response); 
    
%>