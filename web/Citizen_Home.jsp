<%-- 
    Document   : Citizen_Home
    Created on : 02 4, 16, 9:19:29 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Testimonial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Citizen c = (Citizen) session.getAttribute("user");%>
<%int mytestimonialnumber = (Integer) request.getAttribute("mytestimonialnumber");%>
<%ArrayList<Testimonial> testilist = (ArrayList<Testimonial>) request.getAttribute("toptesti");%>
<%int unlikedtestimonial = (Integer) request.getAttribute("unlikedtestimonial");%>
<%ArrayList<Integer> subscribers = (ArrayList<Integer>) request.getAttribute("Subscribers");%>


<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Home</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />

    </head>

    <body>

        <section id="container" class="">
            <header class="header green-bg">

                <div class="sidebar-toggle-box">
                    <div data-original-title="Toggle Navigation" data-placement="right" class="fa fa-bars tooltips"></div>
                </div>

                <a href="index.html" class="logo" >COGITO<span></span></a>

                <div class="nav notify-row" id="top_menu">

                    <ul class="nav top-menu">
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-tasks"></i>
                                <span class="badge bg-success"><!--NUMBER OF TASKS--></span>
                            </a>
                            <ul class="dropdown-menu extended tasks-bar">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">You have __ pending tasks</p>
                                </li>
                            </ul>
                        </li>

                        <li id="header_notification_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                                <i class="fa fa-bell-o"></i>
                                <span class="badge bg-warning"><!--NUMBER OF NOTIFICATIONS--></span>
                            </a>
                            <ul class="dropdown-menu extended notification">
                                <div class="notify-arrow notify-arrow-yellow"></div>
                                <li>
                                    <p class="yellow">You have __ new notifications</p>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="top-nav ">
                    <ul class="nav pull-right top-menu">

                        <li>
                            <input type="text" class="form-control search" placeholder="">
                        </li>

                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <img alt="" src="img/avatar1_small.jpg">
                                <span class="username">Hello <b><u><%=c.getFirstName()%></u></b>!</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
                                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                                <li><a href="#"><i class="fa fa-bell-o"></i> Notification</a></li>
                                <li><a href="Logout"><i class="fa fa-key"></i> Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </header>
        </section>

        <aside>
            <div id="sidebar"  class="nav-collapse ">
                <ul class="sidebar-menu" id="nav-accordion">

                    <li>
                        <a href="Citizen_Home" class="active">
                            <i class="fa fa-dashboard"></i>
                            <span>Home</span>
                        </a>
                    </li>

                    <li>
                        <a href="Citizen_SearchTestimonial">
                            <i class="fa fa-book"></i>
                            <span>Testimonials</span>
                        </a>
                    </li>

                    <li>
                        <a href="Citizen_ProjectsImplemented">
                            <i class="fa fa-book"></i>
                            <span>Projects Implemented</span>
                        </a>
                    </li>

                    <li>
                        <a href="Citizen_NotificationActivity">
                            <i class="fa fa-book"></i>
                            <span>Notification and Activity</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>

        <section id="main-content">
            <section class="wrapper site-min-height">
                <section class="panel">
                    <header class="panel-heading">
                        Las Pinas City Projects Implemented
                    </header>
                    <br>
                    <div class="panel-body">
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                                <li data-target="#myCarousel" data-slide-to="3"></li>
                            </ol>

                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <center>  <img src="carousel1.jpg" alt="court"> </center>
                                </div>

                                <div class="item">
                                    <center> <img src="carousel2.jpg" alt="Chania"> </center>
                                </div>

                                <div class="item">
                                    <center><img src="carousel3.jpg" alt="Flower"> </center>
                                </div>

                                <div class="item">
                                    <center><img src="carousel4.jpg" alt="Flower"></center>
                                </div>
                            </div>

                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div> 

                        <header class="panel-heading">
                            Trending Testimonials
                        </header>  
                        <div class="directory-info-row">
                            <div class="row">

                                <%for (int x = 0; x < testilist.size(); x++) {

                                %>
                                <div class="col-md-6 col-sm-6">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <div class="media">
                                                <a class="pull-left" href="#">
                                                    <img class="thumb media-object" src="<%=testilist.get(x).getFolderName() +"/"+ testilist.get(x).getFiles().get(0).getFileName()%>" alt="" style="width: 250px;height: 250px;">
                                                </a>
                                                <div class="media-body">
                                                    <h4>#<%out.print(x+1);%></h4>
                                                    
                                                    <h4><%out.print(testilist.get(x).getTitle());%></h4>
                                                    <h5>
                                                        <%out.print(testilist.get(x).getDateUploaded());%>
                                                    </h5>
                                                    <h5>
                                                        Number of Subscribers: <%out.print(subscribers.get(x));%>
                                                    </h5>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%}
                                %>

                                		  

                                <header class="panel-heading">
                                    Statistics
                                </header>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <section class="panel">
                                            <div class="panel-body">
                                                <ul class="summary-list">
                                                    <li>
                                                        <a href="javascript:;">
                                                            <i class="fa fa-file-text-o"></i>
                                                            <%out.print(mytestimonialnumber);%> Testimonials
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:;">
                                                            <i class=" fa fa-chain-broken"></i>
                                                            <%out.print(unlikedtestimonial);%> Unlinked Testimonials
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </section>
        <!--main content end-->
        <!--footer start-->
        <footer class="site-footer">
            <div class="text-center">
                2016 &copy; KAYA
                <a href="#" class="go-top">
                    <i class="fa fa-angle-up"></i>
                </a>
            </div>
        </footer>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>
        <script src="js/slidebars.min.js"></script>
    </body>
</html>
