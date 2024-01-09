<%@page import="DB.DB"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Sanitizable Access</title>

    <!-- Favicon -->
    <link rel="icon" href="./img/core-img/favicon.png">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- /Preloader -->

    <!-- Header Area Start -->
    <header class="header-area">
        <!-- Main Header Start -->
        <div class="main-header-area">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between" id="hamiNav">

                        <!-- Logo -->
                        <a class="nav-brand" href="index.html"></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">
                            <!-- Menu Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>
                            <!-- Nav Start -->
                            <div class="classynav">
                                 <ul id="nav" style="color:black;">
                                        <li class="active"><a href="okgsp_Home.jsp">Home</a></li>
                                    <li><a href="keyword_request.jsp">View Secret Key Request</a></li>
                                     <li><a href="Send_Key.jsp">Send Key to User</a></li>
                                     <li><a href="Permit_files.jsp">Permit Files</a></li>
                                    <li><a href="View_All_Permit.jsp">View All Permitted Files</a></li> 
                                    <li><a href="index.jsp">Logout</a></li>
                                </ul>

                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- Price Plan Area Start -->
    <section class="hami-price-plan-area section-padding-100-0">
        <div>
            <center>                
                <style>
                    table{
                        line-height: 25px;
                        width: 80%;
                    }
                    h2{
                        font-family: cursive;
                        font-weight: bold;
                        font-size: 30px;
                        color:darkblue;
                    }
                    table,td,tr{
                        border-collapse: collapse;
                        border: 2px solid #0056b3;
                        text-align: center;
                        padding: 5px;
                        font-size: 15px;
                    }
                    
                </style>
                <h2>Send Keyword Secret Key to the Users</h2><br><br>                
                <table>
                    <tr>
                        <td style='color:navy; font-weight: bold;'>User ID</td>
                        <td style='color:navy; font-weight: bold;'>User Name</td>
                        <td style='color:navy; font-weight: bold;'>Status</td>
                        <td style='color:navy; font-weight: bold;'>Action</td>
                    </tr>
                    
                    <%
                        Connection con=new DB().Connect();
                        PreparedStatement ps=con.prepareStatement("select * from keyword_request where status='waiting' ");
                        ResultSet r=ps.executeQuery();
                        while(r.next()){
                    %> 
                    <tr>
                        <td style='font-weight: bold;'><%=r.getString("uid")%></td>
                        <td style='font-weight: bold;'><%=r.getString("uname")%></td>
                        <td style='font-weight: bold;'><%=r.getString("status")%></td>
                        <td style='font-weight: bold;'><a href='Secret_Action.jsp?id=<%=r.getString("uid")%>&&name=<%=r.getString("uname")%>' style='color:greenyellow;'>Send Key</a></td>
                    </tr><%}%>
                </table>
               </center>
        </div>
    </section>
 
       
    <!-- **** All JS Files ***** -->
    <!-- jQuery 2.2.4 -->
    <script src="js/jquery.min.js"></script>
    <!-- Popper -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- All Plugins -->
    <script src="js/hami.bundle.js"></script>
    <!-- Active -->
    <script src="js/default-assets/active.js"></script>

</body>

</html>