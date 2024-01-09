<%@page import="DB.DB"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.OutputStream" %>

<%
    String name = (String) session.getAttribute("name");
    String pkey = request.getParameter("pkey");
    String tkey = request.getParameter("tkey");
    Connection con = new DB().Connect();
    PreparedStatement p=con.prepareStatement("select * from filereq where name='"+name+"' and fkey='"+pkey+"'");
    ResultSet rs = p.executeQuery();
    if (rs.next()) {
        String filename = rs.getString("fname");
        String filepath = "C:\\files\\"; // Make sure the path is correct
        
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

        java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);
        OutputStream outStream = response.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = fileInputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
        fileInputStream.close();
        outStream.close();
        
        // Forward to User_Home.jsp after the file download
        RequestDispatcher rd = request.getRequestDispatcher("User_Home.jsp");
        rd.forward(request, response);
    } else {
        out.println("<script>"
                + "alert('You Entered the Wrong Key.....')"
                + "</script>");
        // Forward to User_Home.jsp even in case of failure
        RequestDispatcher rd = request.getRequestDispatcher("User_Home.jsp");
        rd.include(request, response);
    }
%>
