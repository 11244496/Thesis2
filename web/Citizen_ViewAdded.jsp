<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Citizen"%>
<%@page import="Entity.Files"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Citizen c = (Citizen) session.getAttribute("user");%>
<%ArrayList<Files> fList = (ArrayList<Files>) request.getAttribute("pList");%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">


        <title>View pending files</title>

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
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <!-- page start-->
                    <section class="panel">
                        <header class="panel-heading">
                            View Added Information
                        </header>
                        <br>
                        <div class="panel-body">
                            <div class="col-sm-12">
                                <section class="panel">
                                    <form method="post" action="">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Submission</th>
                                                    <th>Uploader</th>
                                                    <th>Date Uploaded</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (int x = 0; x < fList.size(); x++) {%>
                                                <%String s = fList.get(x).getTestimonial().getFolderName() + "/" + fList.get(x).getFileName();%>
                                                <tr>
                                                    <td><input type="checkbox" name="checked" value="<%=fList.get(x).getId()%>"></td>
                                                    <td>
                                                        <%if (fList.get(x).getType().equalsIgnoreCase("Image")) {%>
                                                        <img data-u="image" style="width: 300px; height:250px;" src="<%=s%>" />

                                                        <%} else if (fList.get(x).getType().equalsIgnoreCase("Video")) {%>
                                                        <video width="300">
                                                            <source src=<%=s%> type="video/mkv">
                                                            <source src=<%=s%> type="video/ogg">
                                                        </video>


                                                        <%} else if (fList.get(x).getType().equalsIgnoreCase("Document")) {%>

                                            <li><a href="<%=s%>"><i class="fa fa-file-text"></i> <%=fList.get(x).getFileName()%></a></li>

                                            <%}%>

                                            </td>
                                            <td><%=fList.get(x).getUploader()%></td>
                                            <td><%=fList.get(x).getDateUploaded()%></td>
                                            </tr>
                                            <%}%>
                                            </tbody>

                                        </table>
                                        <br>
                                        <center>
                                            <button type="submit" formaction="Citizen_ApproveContributions" class="btn btn-success btn-sm" >Approve</button>
                                            <button type="submit" formaction="Citizen_RejectContributions" class="btn btn-info btn-sm" >Reject</button>
                                        </center>
                                    </form>
                                </section>
                            </div>
                        </div>
                    </section>


                    <!-- page end-->
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
