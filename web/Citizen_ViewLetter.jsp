<%-- 
    Document   : Citizen_ViewLetter
    Created on : 02 28, 16, 5:15:45 PM
    Author     : RoAnn
--%>

<%@page import="Entity.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Testimonial"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Citizen c = (Citizen) session.getAttribute("user");%>
<%Testimonial t = (Testimonial) session.getAttribute("openTestimonial");%>
<%ArrayList<Reply> rList = t.getReplies();%>



<!DOCTYPE html>
<html lang="en">
    <head>

        <title>View Letter</title>
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
                        <a href="Citizen_Home">
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
                        View Letter
                    </header>
                    <br>
                    <div class="panel-body">
                        <form action="Citizen_CreateLetterTestimonial" class="form-horizontal tasi-form" method="POST">
                            <div class="form-group">

                                <label class="col-sm-2 col-sm-2 control-label">Subject </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getTitle()%>">
                                    <br>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">From: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getCitizen().getUser().getUsername()%>">
                                    <br>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">Date Sent: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getDateUploaded()%>">
                                    <br>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">Location: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getLocation()%>">
                                    <br>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">Location Details: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getLocationdetails()%>">
                                    <br>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">Concern </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getConcern()%>">
                                    <br>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">Message </label>
                                <div class="col-sm-10">
                                    <textarea class="wysihtml5 form-control" rows="5" name="content" readonly style="resize: none; background: white; border:0px; "><%=t.getMessage()%></textarea>
                                </div>
                                <center>
                                    <button type="button" class="btn btn-default" onclick="history.go(-1)">Back</button>
                                </center>

                            </div>
                        </form>
                    </div>
                </section>
                <% if (rList.size() >= 1) {%>
                <% for (Reply r : rList) {%>
                <section class="panel">
                    <header class="panel-heading">
                        Reply
                    </header>
                    <br>
                    <div class="panel-body">
                        <div class="form-group">

                            <label class="col-sm-2 col-sm-2 control-label">Sender: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=r.getSender()%>">
                                <br>
                            </div>
                            <label class="col-sm-2 col-sm-2 control-label">Date Sent: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=r.getDateSent()%>">
                                <br>
                            </div>
                            <label class="col-sm-2 col-sm-2 control-label">Message </label>
                            <div class="col-sm-10">
                                <textarea class="wysihtml5 form-control" rows="7" name="content" readonly style="resize: none; background: white; border:0px; "><%=r.getMessage()%></textarea>
                            </div>

                        </div>
                    </div>
                </section>
                <%}%>
                <%}%>
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
