<%-- 
    Document   : sendreq
    Created on : Aug 2, 2017, 4:40:58 PM
    Author     : DLK 1
--%>
<%@page import="DB.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String fkey = "", fname = "", ename = "", trapdoor = "", timedelay = "", date = "";
    String name = session.getAttribute("name").toString();
    session.setAttribute("name", name);
    String id = request.getParameter("fname");
    Connection con = new DB().Connect();

    // Check if a record with the same 'name' and 'fname' exists in the 'filereq' table
    String checkQuery = "SELECT * FROM filereq WHERE name=? AND fname=?";
    PreparedStatement checkPs = con.prepareStatement(checkQuery);
    checkPs.setString(1, name);
    checkPs.setString(2, id);
    ResultSet checkRs = checkPs.executeQuery();

    if (checkRs.next()) {
        // If a record exists, update its values without inserting a new one
        fkey = checkRs.getString("fkey");
        trapdoor = checkRs.getString("trapdoor");
        timedelay = checkRs.getString("timedelay");
        date = checkRs.getString("date");
    } else {
        // If no record exists, retrieve the values from the 'file' table and insert a new record
        String Query22 = "SELECT * FROM file WHERE fname=?";
        PreparedStatement ps22 = con.prepareStatement(Query22);
        ps22.setString(1, id);
        ResultSet rss = ps22.executeQuery();
        if (rss.next()) {
            fkey = rss.getString("fkey");
            trapdoor = rss.getString("trapdoor");
            timedelay = rss.getString("timedelay");
            date = rss.getString("date");
            //fname=rss.getString("fname");
        }

        PreparedStatement ps = con.prepareStatement("INSERT INTO filereq (name, fname, fkey, trapdoor, date, timedelay) VALUES (?, ?, ?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, id);
        ps.setString(3, fkey);
        ps.setString(4, trapdoor);
        ps.setString(5, date);
        ps.setString(6, timedelay);
        ps.executeUpdate();
    }

    out.println("<script>"
            + "alert('Request Sends to the TA..')"
            + "</script>");
    RequestDispatcher rd = request.getRequestDispatcher("User_Home.jsp");
    rd.include(request, response);    
%>
