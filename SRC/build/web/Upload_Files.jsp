<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="algorithm.CipherHelper"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
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
    <%
        String pic=(String)session.getAttribute("pic");
        String name=session.getAttribute("name").toString();
    %>
    <header class="header-area">
        <!-- Main Header Start -->
        <div class="main-header-area">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between" id="hamiNav">

                        <!-- Logo -->
                        <a class="nav-brand" href="#"><img src="dataset/<%=pic%>" alt="" style='border-radius: 40px; margin-top: 10px; height: 50px; width: 60px;'><label  style='margin-left: 10px; color:orangered;'><%=name%> Dashboard</label></a>
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
                                    <li><a href="Provider_Home.jsp">Home</a></li>
                                    <li  class="active"><a href="Upload_Files.jsp">Upload Files</a></li>
                                    <li><a href="Send_Files.jsp">Send File Request to Proxy</a></li>
                                    <li><a href="Manage_Files.jsp">View & Manage Files</a></li>
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
                        width: 50%;
                        margin-left: 20%;
                    }
                    h2{
                        font-family: cursive;
                        font-weight: bold;
                        font-size: 30px;
                        color:darkblue;
                    }
                    td,input{
                        margin-bottom: 10px;
                    }
                    h4{
                        font-size: 20px;
                        color:navy;
                    }
                    
                </style>
                <h2>Upload Files</h2><br><br>
                <%
                    
                    String id=session.getAttribute("pid").toString();
                    System.out.println(name+"  "+id);
                    Random r = new Random(); 
                    String x = Integer.toString(r.nextInt(10000));
                    CipherHelper cc = new CipherHelper();
                    String tkey=cc.cipher("12345678",x);
                    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
                    Calendar calobj = Calendar.getInstance();
                    String d=df.format(calobj.getTime());
                    System.out.println(d);
                %>
                <form action='Upload' method="post" enctype="multipart/form-data">
                <table>
                    <input type='hidden' name='id' value='<%=id%>'>
                    <input type='hidden' name='name' value='<%=name%>'>
                    <tr><td style='color:blue; font-size: 20px;'><strong>File key: </strong></td><td><input type="text" name="pkey" value='<%=x%>' style="border-radius: 2px;"></td></tr>
                    <tr><td style='color:blue; font-size: 20px;'><strong>Date: </strong></td><td><input type="text" name="date" value="<%=d%>" style="border-radius: 2px;"></td></tr>
                    <tr><td style='color:blue; font-size: 20px;'><strong>Trapdoor: </strong></td><td><input type="text" name="tkey" value="<%=tkey%>" style="border-radius: 2px;"></td></tr>
                    <tr><td style='color:blue; font-size: 20px;'><strong>Upload File:</strong></td><td><input type="file" name="file" style="border-radius: 2px;"></td></tr>
                    <tr><td align='center' colspan="2"><input type="submit" Value='Upload' style="border-radius: 2px; width: 100px; height: 30px;padding: 5px; text-align: center; background-color: lightblue; color:darkblue;"</td></tr>
                </table></form><br>
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