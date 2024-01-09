<%@page import="DB.DB"%>
<%@page import="java.sql.*"%>
<%
    String name = (String) session.getAttribute("name");
    String pkey = request.getParameter("pkey");
    String tkey = request.getParameter("tkey");
    Connection con = new DB().Connect();
    PreparedStatement p = con.prepareStatement("SELECT * FROM filereq WHERE name=? AND fkey=?");
    p.setString(1, name);
    p.setString(2, pkey);

    ResultSet rs = p.executeQuery();
    if (rs.next()) {
        String filename = rs.getString("fname");
        String filepath = "C:\\files\\";

        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

        try (java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename)) {
            int i;
            while ((i = fileInputStream.read()) != -1) {
                out.write(i);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        out.println("<script>alert('You Entered the Wrong Key.');</script>");
    }
%>
