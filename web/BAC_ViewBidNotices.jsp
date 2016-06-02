<%-- 
    Document   : Citizen_Home
    Created on : 02 4, 16, 9:19:29 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Bid_Notices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Project"%>
<%@page import="Entity.Employee"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Employee bac = (Employee) session.getAttribute("user");%>
<%

    ArrayList<Bid_Notices> bidnotices = (ArrayList<Bid_Notices>) request.getAttribute("bidNotices");

%>

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
                                <span class="username">Hello <b><u><%=bac.getFirstName()%></u></b>!</span>
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
                        <a href="BAC_Home">
                            <i class="fa fa-dashboard"></i>
                            <span>Home</span>
                        </a>
                    </li>

                    <li>
                        <a href="BAC_ViewContractorList">
                            <i class="fa fa-book"></i>
                            <span>Contractors</span>
                        </a>
                    </li>

                    <li>
                        <a href="BAC_NotificationList">
                            <i class="fa fa-book"></i>
                            <span>Notifications</span>
                        </a>
                    </li>
                    <li>
                        <a href="BAC_ActivityList">
                            <i class="fa fa-book"></i>
                            <span>Department Activity Log</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>


        <section id="main-content">
            <section class="wrapper site-min-height">

                <section class="panel">
                    <header class="panel-heading">
                        Bid notice for:  <%out.print(bidnotices.get(0).getProject().getName());%>
                    </header>
                    <br>
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-md-12">
                                <section class="panel">


                                    <div class="panel-body bio-graph-info">
                                        <!--<h1>New Dashboard BS3 </h1>-->


                                        <%     
                                    
                                        for(int x = 0; x < bidnotices.size(); x++){
                                        String name = bidnotices.get(x).getType();
                                        String src = bidnotices.get(x).getFolderName() + "/" + bidnotices.get(x).getFileName();
                                        %>

                                        <h4><%=name%></h4>
                                        <br>
                                        <center>
                                            <iframe id="frameDoc" src ="<%=src%>" width="870" height="600"></iframe>
                                        </center>
                                        <hr>
                                        <br>

                                        <%

                                        }       
                                        

                                        %>  






                                    </div>




                                </section>






                            </div>

                        </div>



                    </div>




                </section> 

























            </section>













        </section>

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
