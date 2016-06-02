<%@page import="Entity.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Citizen c = (Citizen) session.getAttribute("user");%>

<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">


        <title>View Projects Implemented</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />

        <!--right slidebar-->
        <link href="css/slidebars.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <section id="container" class="">
            <!--header start-->
            <header class="header green-bg">
                <div class="sidebar-toggle-box">
                    <div data-original-title="Toggle Navigation" data-placement="right" class="fa fa-bars tooltips"></div>
                </div>
                <!--logo start-->
                <a href="index.html" class="logo" >COGITO<span></span></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->
                    <ul class="nav top-menu">
                        <!-- settings start -->
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
                                <!--REFER TO RIGHT SIDEBAR FOR SAMPLE CODE OF TASK + PROGRESS BAR
      
                          ADD THE CODE BELOW IF AT LEAST ONE(?) TASK IS LISTED
                          
                          <li class="external">
          <a href="#">See All Tasks</a>
      </li>
                          
                                -->
                            </ul>
                        </li>
                        <!-- settings end -->
                        <!-- notification dropdown start-->
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
                                <!--
                                SAMPLE CODE FOR NOTIFICATION
            <li>
                <a href="#">
                    <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                    Server #3 overloaded.
                    <span class="small italic">34 mins</span>
                </a>
            </li>

                               ADD THE CODE BELOW IF AT LEAST ONE(?) NOTIFICATION IS LISTED

            <li>
                <a href="#">See all notifications</a>
            </li>
                                -->
                            </ul>
                        </li>
                        <!-- notification dropdown end -->
                    </ul>
                </div>
                <div class="top-nav ">
                    <ul class="nav pull-right top-menu">
                        <li>
                            <input type="text" class="form-control search" placeholder="">
                        </li>
                        <!-- user login dropdown start-->
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
            <!--header end-->
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
            <!--main content start-->
            <%

                ArrayList<Project> Oprojects = (ArrayList<Project>) request.getAttribute("Oprojects");
                ArrayList<Project> Fprojects = (ArrayList<Project>) request.getAttribute("Fprojects");

            %>


            <section id="main-content">
                <section class="wrapper site-min-height">
                    <!-- page start-->
                    <section class="panel">
                        <header class="panel-heading">
                            Projects Implemented
                        </header>
                        <div class="panel-body">

                            <section class="panel">
                                <header class="panel-heading tab-bg-dark-navy-blue">
                                    <ul class="nav nav-tabs nav-justified ">
                                        <li class="active">
                                            <a href="#PFinished" data-toggle="tab">
                                                Projects Finished
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#POngoing" data-toggle="tab">
                                                Projects On-going
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#PLinked" data-toggle="tab">
                                                Linked Projects
                                            </a>
                                        </li>
                                    </ul>
                                </header>

                                <div class="panel-body">
                                    <div class="tab-content tasi-tab">
                                        <div class="tab-pane active" id="PFinished">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="ProjectFinished">
                                            </div>
                                            <div class="form-group">
                                                <div class="directory-info-row">                                                    
                                                    <div class="row">
                                                        <table class="table" data-search-field="#ProjectFinished">

                                                            <thead>
                                                                <tr>

                                                                    <th style="width: 15%; text-align: center">Title</th>
                                                                    <th style="width: 15%; text-align: center">Category</th>
                                                                    <th style="width: 30%; text-align: center">Description</th>
                                                                    <th style="width: 10%; text-align: center">Date Submitted</th>
                                                                    <th style="width: 10%; text-align: center">Date Finished</th>
                                                                    <th style="width: 10%; text-align: center"></th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%for (Project p : Fprojects) {

                                                                %>

                                                                <tr>
                                                                    <td class="p-name"><%=p.getName()%></td>
                                                                    <td class="p-name"><%=p.getType()%></td>
                                                                    <td class="p-name"><%=p.getDescription()%></td>
                                                                    <td class="p-name"><%=p.getDatesubmitted()%></td>
                                                                    <td class="p-name">Insert Date Finished</td>
                                                                    <td>
                                                                        <form action="Citizen_ViewProjectDetails">
                                                                            <input type="hidden" name="projid" value="<%=p.getId()%>">

                                                                            <button type="submit" class="btn btn-success btn-xs" value="View details"><i class="fa fa-eye"></i> View details</button>

                                                                        </form>
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                    }%>
                                                            </tbody>
                                                        </table>    
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tab-pane" id="POngoing">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="ProjectOngoing">
                                            </div> 
                                            <div class="directory-info-row">


                                                <div class="row">
                                                    <table class="table" data-search-field="#ProjectOngoing">

                                                        <thead>
                                                            <tr>

                                                                <th style="width: 15%; text-align: center">Title</th>
                                                                <th style="width: 15%; text-align: center">Category</th>
                                                                <th style="width: 30%; text-align: center">Description</th>
                                                                <th style="width: 10%; text-align: center">Date Submitted</th>
                                                                <th style="width: 15%; text-align: center">Status</th>
                                                                <th style="width: 10%; text-align: center"></th>

                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <%for (Project p : Oprojects) {

                                                            %>

                                                            <tr>
                                                                <td class="p-name"><%=p.getName()%></td>
                                                                <td class="p-name"><%=p.getType()%></td>
                                                                <td class="p-name"><%=p.getDescription()%></td>
                                                                <td class="p-name"><%=p.getDatesubmitted()%></td>
                                                                <td class="p-name"><%=p.getStatus()%></td>
                                                                <td>
                                                                    <form action="Citizen_ViewProjectDetails">
                                                                        <input type="hidden" name="projid" value="<%=p.getId()%>">

                                                                        <button type="submit" class="btn btn-success btn-xs" value="View details"><i class="fa fa-eye"></i> View details</button>

                                                                    </form>
                                                                </td>
                                                            </tr>
                                                            <%
                                                                    }%>
                                                        </tbody>

                                                    </table>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="tab-pane " id="mytestimonials">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="ProjectLinked">
                                            </div> 
                                            <div class="directory-info-row">


                                                <div class="row">
                                                    <table class="table" data-search-field="#my-testimonial">

                                                        <thead>
                                                            <tr>

                                                                <th style="width: 15%; text-align: center">Title</th>
                                                                <th style="width: 15%; text-align: center">Category</th>
                                                                <th style="width: 20%; text-align: center">Description</th>
                                                                <th style="width: 10%; text-align: center">Date Submitted</th>
                                                                <th style="width: 15%; text-align: center">Status</th>
                                                                <th style="width: 10%; text-align: center">Linked Testimonial</th>
                                                                <th style="width: 10%; text-align: center"></th>

                                                            </tr>
                                                        </thead>

                                                    </table>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </section>

                        </div>
                    </section>


                    <!-- page end-->
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
        <!--footer end-->
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/slidebars.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/gritter/js/jquery.gritter.js"></script>
        <script src="js/respond.min.js" ></script>
        <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>

        <!--right slidebar-->
        <script src="js/slidebars.min.js"></script>

        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>

        <!--script for this page only-->
        <script src="js/gritter.js" type="text/javascript"></script>
        <script src="js/pulstate.js" type="text/javascript"></script>
    </body>
</html>
