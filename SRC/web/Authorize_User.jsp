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
    <title>Sanitizable Acces</title>

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
                                    <li><a href="Broker_Home.jsp">Home</a></li>
                                    <li><a href="Authorize_Provider.jsp">Authorize Data Owners</a></li>
                                    <li class="active"><a href="Authorize_User.jsp">Authorize Data Users</a></li> 
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
                <h2>View All Receiver And Authorize Them</h2><br><br>                
                <table>
                    <tr>
                        <td style='color:navy; font-weight: bold;'>Id</td>
                        <td style='color:navy; font-weight: bold;'>Name</td>
                        <td style='color:navy; font-weight: bold;'>Mobile</td>
                        <td style='color:navy; font-weight: bold;'>Mail</td>
                        <td style='color:navy; font-weight: bold;'>Profile Picture</td>
                        <td style='color:navy; font-weight: bold;'>Status</td>
                    </tr>
                    <%
                        Connection con=new DB().Connect();
                        PreparedStatement ps=con.prepareStatement("select * from user_register ");
                        ResultSet r=ps.executeQuery();
                        while(r.next()){
                    %>
                    <tr>
                        <td style='font-weight: bold;'><%=r.getString("id")%></td>
                        <td style='font-weight: bold;'><%=r.getString("name")%></td>
                        <td style='font-weight: bold;'><%=r.getString("mobile")%></td>
                        <td style='font-weight: bold;'><%=r.getString("mail")%></td>
                        <td style='font-weight: bold;'><img src='dataset/<%=r.getString("profile")%>' style='width: 30px; height: 30px;'></td>
                        
                         <%
                        if((r.getString("status")).equalsIgnoreCase("Accept")){
                        %>    
                        <td style='font-weight: bold; color:red;'>Already Authorized</td>
                        <%}
                        else{
                        %>
                        <td style='font-weight: bold;'><a href='Accept_User?id=<%=r.getString("id")%>&&name=<%=r.getString("name")%>' style='color:green;'>Click Here</a></td>
                    </tr><%}}%>
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