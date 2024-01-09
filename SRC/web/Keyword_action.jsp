<%@page import="DB.DB"%>
<%@page import="java.sql.*"%>
<%
    String key=request.getParameter("key");
    String uid=request.getParameter("uid");
    String uname=request.getParameter("uname");
    Connection con=new DB().Connect();
    PreparedStatement p=con.prepareStatement("select * from keyword_request where uid='"+uid+"' and uname='"+uname+"' ");
    ResultSet r=p.executeQuery();
    if(r.next()){
        String skey=r.getString("skey");
        if(skey.equals(key)){
             out.println("<script>"
				+"alert('Secret Key Matched.....')"
				+"</script>");
            RequestDispatcher rd=request.getRequestDispatcher("Search_Files.jsp");
            rd.include(request, response);
        }
        else{
             out.println("<script>"
				+"alert('Secret Key Not Matched.....')"
				+"</script>");
            RequestDispatcher rd=request.getRequestDispatcher("Send_Keyword.jsp");
            rd.include(request, response);
        }
    }

%>