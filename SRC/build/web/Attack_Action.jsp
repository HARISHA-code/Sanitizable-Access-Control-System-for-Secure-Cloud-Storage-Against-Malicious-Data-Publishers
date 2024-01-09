<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
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
                                    <li><a href="Attacker_Home.jsp">Home</a></li>
                                    <li class="active"><a href="Attack.jsp">Attack Files</a></li>
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
      <%
        String fname="";
        String oname = request.getParameter("oname");
        String filename=request.getParameter("fname");
        String fkey=request.getParameter("fkey");
        Connection con=new DB().Connect();
        PreparedStatement ps22=con.prepareStatement("select * from file where oname='"+oname+"' and fname='"+filename+"' ");
        System.out.println(ps22);
        ResultSet rss = ps22.executeQuery();
        if(rss.next())
        {
        fname=rss.getString("fname");
        }
            String jspPath = session.getServletContext().getRealPath("/res");
                String txtFilePath = "C://files//"+filename;           
                BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
                StringBuilder sb = new StringBuilder();
                String line;
                while((line = reader.readLine())!= null){
                     sb.append(line+"\n");
                    }
                String book=sb.toString();


        %>
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
                <h2>Attack Files</h2><br><br>                
                <h3><%=filename%></h3>
                        <form action="hack.jsp">
                        <input type="hidden" name="fname" value="<%=filename%>">
                        <input type="hidden" name="fkey" value="<%=fkey%>">
                        <textarea rows="15" cols="40" style="width:600px;height: 250px;"><%=book%></textarea><br><br>
                        <input type="submit" value="Attack">
                        </form>
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