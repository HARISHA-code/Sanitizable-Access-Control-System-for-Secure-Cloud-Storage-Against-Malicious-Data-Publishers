<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="algorithm.CipherHelper"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="DB.DB"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="algorithm.Stopwords"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="algorithm.TFIDFCalculator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    int zz=0;
    int count=1;
    String fname;
    String ffname;
    Set <String>fin = new LinkedHashSet<String>();
    Set oo = new HashSet();
    Map ma = new LinkedHashMap();
    Map na = new LinkedHashMap();
    ArrayList mmm = new ArrayList();
    ArrayList <String>all = new ArrayList<String>();
    List lis = new ArrayList();
    List lis1 = new ArrayList();
    String cont="";
    String name=session.getAttribute("name").toString();
    session.setAttribute("name", name);
    String key=request.getParameter("key");
    Stopwords sspp=new Stopwords();
    LinkedList<String> stoppp=new LinkedList<String>();
    stoppp = sspp.words(key);        
    String result1=""; 
    for(String zob : stoppp)
    {
        result1+=zob+" ";
    }
    result1 = result1.replaceAll("[,]"," "); 
    key=result1;
    key=key.toLowerCase();
    System.out.println(key);
    
    String[] arr = key.split(" "); 
    Connection con=new DB().Connect();
    PreparedStatement zop = con.prepareStatement("truncate table val");
    zop.executeUpdate();
    PreparedStatement yop = con.prepareStatement("truncate table result");
    yop.executeUpdate();    
    PreparedStatement pssw=con.prepareStatement("select * from file");
    ResultSet rssw = pssw.executeQuery();   
    int iyz=0;
    while(rssw.next())
    {
        iyz=iyz+1;
    }
    TFIDFCalculator calc = new TFIDFCalculator();
    for (String ss : arr) 
    {
        lis1.add(ss);
        ss=ss.toLowerCase();
        String sql="select * from file where content  like '%"+ss+"%' OR fname like '%"+ss+"%'";
        PreparedStatement pss=con.prepareStatement(sql);
        ResultSet rss = pss.executeQuery();             
        while(rss.next())
        {       
            int c=0;
            fname=rss.getString("fname");
            oo.add(rss.getString("fname"));
            cont=rss.getString("content"); 
            cont=cont.toLowerCase();   
            c= cont.split(ss).length - 1;    
            PreparedStatement ps = con.prepareStatement("insert into val (fname,ke,count) values ('"+fname+"','"+ss+"','"+c+"') ");
            ps.executeUpdate();
        }
    }    
    String sql="select fname from file";
    PreparedStatement pss=con.prepareStatement(sql);
    List <String>god = new ArrayList<String>();
    ResultSet rss = pss.executeQuery();
    while(rss.next())
    {
        int temp=0;
        ffname=rss.getString("fname");
        String sp="select * from val where fname='"+ffname+"' ";
        PreparedStatement sn=con.prepareStatement(sp);
        ResultSet snn = sn.executeQuery();
        while(snn.next())
        {
            temp+=snn.getInt("count");
        }
        if(temp!=0)
        {
            PreparedStatement uu = con.prepareStatement("insert into result (fname,count) values ('"+ffname+"','"+temp+"') ");
            uu.executeUpdate();    
        }    
    }
    //Extra Coding
    PreparedStatement del=con.prepareStatement("truncate table highlevel");
    del.executeUpdate();

    PreparedStatement p=con.prepareStatement("select * from result");
    ResultSet s = p.executeQuery();
    while(s.next())
    {
        String file=s.getString("fname");System.out.println("First loop");
        PreparedStatement p1=con.prepareStatement("select * from file where fname='"+file+"' ");
        ResultSet s1 = p1.executeQuery();
        while(s1.next())
        {
            String conts=s1.getString("sto");System.out.println("Second loop");
            String word[]=conts.split(" ");
            String qur[]=key.split(" ");
            int cou=0; int high=0;
            for(int i=0;i<qur.length;i++)
            {
                int dummy=0;
                for(int j=0;j<word.length;j++)
                {
                    if(qur[i].equalsIgnoreCase(word[j]))
                    {
                        high++;
                        if(dummy==0)
                        {
                            dummy++;
                            cou++;
                        }
                    }
                }
            }
            if(cou>=qur.length)
            {
                PreparedStatement insert=con.prepareStatement("insert into highlevel values('"+file+"','"+high+"') ");
                insert.executeUpdate();
            }
        }
    }
    List <String>rel=new ArrayList<String>();
    //High Priority Files
    PreparedStatement p1=con.prepareStatement("SELECT * FROM highlevel ORDER BY rank+0 DESC");
    ResultSet s1 = p1.executeQuery();
    String zzz="";
    while(s1.next())
    {
        String file=s1.getString("filename");
        String rank=s1.getString("rank");
        fin.add(file);
        System.out.println("Relevance Count is "+Math.log((1+(8/(Integer.parseInt(rank))))));
        zzz +="Relevance Count of File  "+file+"  is : "+Math.log((1+(8/(Integer.parseInt(rank)))));
        zzz+=" </br>";zzz+=" </br>";
    }          
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Verifiable and Attribute-keyword</title>

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
        String name1=session.getAttribute("name").toString();
    %>
    <header class="header-area">
        <!-- Main Header Start -->
        <div class="main-header-area">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between" id="hamiNav">

                        <!-- Logo -->
                        <a class="nav-brand" href="#"><img src="dataset/<%=pic%>" alt="" style='border-radius: 40px; margin-top: 10px; height: 50px; width: 60px;'><label  style='margin-left: 10px; color:orangered;'><%=name1%> Dashboard</label></a>
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
                                    <li><a href="User_Home.jsp">Home</a></li>
                                    <li  class="active"><a href="Search_Files.jsp">Search Files</a></li>
                                    <li><a href="View_Request_Status.jsp">View Request Status</a></li>
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
                 <%
                List <String>god1=new ArrayList<String>();
                System.out.println("Final "+fin);
                int  y;
                y=fin.size(); 
                Iterator itr = fin.iterator();
                while(itr.hasNext())
                {          
                   god.add((String)itr.next());
                } 
                if(god.isEmpty())
                {
                %>
                <h3>No files found for the given search criteria.</h3>
                <%
                }
                else
                {
                    int kk = 10; // Set a default value for kk (number of results to display)
                    if(kk<y)
                    {
                        for(int i=0;i<kk; i++)
                        {
                            god1.add(god.get(i));
                        }
                    }
                    else
                    {
                    for(String zzmo: god)
                    {
                       god1.add(zzmo);
                   }
                    }
                    for(String vel:god1)
                    {
                 %>
                 <%=vel%>&emsp;<a href="Send_Request.jsp?fname=<%=vel%>" style='color:green;'>Download</a> <br><br>
                 <%
                    }
                }
     %>
       <br><br><h4 style='color:navy;'><%=zzz%></h4>
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
