<%@page import="DB.DB"%>
<%@page import="java.sql.*"%>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    Connection con = new DB().Connect();

    // Check if the uid and uname already exist in the database
    PreparedStatement checkExisting = con.prepareStatement("SELECT COUNT(*) FROM keyword_request WHERE uid = ? AND uname = ?");
    checkExisting.setString(1, id);
    checkExisting.setString(2, name);
    ResultSet existingResult = checkExisting.executeQuery();
    existingResult.next();
    int existingCount = existingResult.getInt(1);

    if (existingCount > 0) {
        // Record already exists, show an error alert message
        out.println("<script>"
                + "alert('Keyword request for this user already sent to the Sanitizer');"
                + "window.location.href='Send_Keyword.jsp';"
                + "</script>");
    } else {
        // Record doesn't exist, proceed with the insert operation
        PreparedStatement ps = con.prepareStatement("INSERT INTO keyword_request(uid, uname) VALUES (?, ?)");
        ps.setString(1, id);
        ps.setString(2, name);
        ps.executeUpdate();

        // Show success alert message
        out.println("<script>"
                + "alert('Keyword request sent to the Sanitizer');"
                + "window.location.href='Send_Keyword.jsp';"
                + "</script>");
    }
%>
