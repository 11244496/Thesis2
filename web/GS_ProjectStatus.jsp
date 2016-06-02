<%-- 
    Document   : GS_ProjectStatus
    Created on : 09 2, 15, 8:52:38 AM
    Author     : User
--%>

<%@page import="Entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Employee e = (Employee) session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>Template</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

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

                        <!-- inbox dropdown end -->
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
                                <span class="username">Hello <b><u><%out.print(e.getFirstName());%></u></b>!</span>
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

                        <!-- user login dropdown end -->
                        <li class="sb-toggle-right">
                            <i class="fa  fa-align-right"></i>
                        </li>
                    </ul>
                </div>
            </header>
            <!--header end-->
            <!--sidebar start-->
            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">
                        <li>
                            <a href="GS_Home">
                                <i class="fa fa-dashboard"></i>
                                <span>Home</span>
                            </a>
                        </li>

                        <li>
                            <a href="GS_ViewTestimonials">
                                <i class="fa fa-dashboard"></i>
                                <span>View Citizen Testimonials</span>
                            </a>
                        </li>	

                        <!--multi level menu start-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-tasks"></i>
                                <span>Project Proposals</span>
                            </a>
                            <ul class="sub">
                                <li><a  href="GS_CreateProposal.jsp">&nbsp; &nbsp; &nbsp; &nbsp; Create Proposal</a></li>
                                <li><a  href="GS_ViewProjectList">&nbsp; &nbsp; &nbsp; &nbsp; View Project Proposals</a></li>
                                <li><a  href="GS_ViewImplementedProjects">&nbsp; &nbsp; Monitor Implemented Projects</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="GS_ScheduleChange">
                                <i class="fa fa-dashboard"></i>
                                <span>Schedule Change Requests</span>
                            </a>
                        </li>
                        <!--multi level menu end-->
                        <li>
                            <a href="GS_DisplayCDPCLUP">
                                <i class="fa fa-book"></i>
                                <span>View CLUP and CDP</span>
                            </a>
                        </li>

                        <li>
                            <a href="GS_ViewAR.jsp">
                                <i class="fa fa-book"></i>
                                <span>View Accomplishment Report</span>
                            </a>
                        </li>


                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->

            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <!-- page start-->
                    <section class="panel">
                        <header class="panel-heading">
                            Project Status
                            <span class="pull-right">
                                <button type="button" id="loading-btn" class="btn btn-warning btn-xs"><i class="fa fa-refresh"></i> Refresh</button>
                                <a href="#" class=" btn btn-success btn-xs"> Create New Project</a>
                            </span>
                        </header>
                        <div class="panel-body">
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="input-group"><input type="text" placeholder="Search Here" class="input-sm form-control"> <span class="input-group-btn">
                                            <button type="button" class="btn btn-sm btn-success"> Go!</button> </span></div>
                                </div>
                            </div>
                        </div>
                        <table class="table table-hover p-table">
                            <thead>
                                <tr>
                                    <th>Project Name</th>
                                    <th>Team Member</th>
                                    <th>Project Progress</th>
                                    <th>Project Status</th>
                                    <th>Custom</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">New Dashboard BS3</a>
                                        <br>
                                        <small>Created 27.11.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 87%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>87% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">Creative Portfolio</a>
                                        <br>
                                        <small>Created 21.10.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 65%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>65% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">Directory & listing</a>
                                        <br>
                                        <small>Created 2.09.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-2.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 55%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>55% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">New Dashboard BS3</a>
                                        <br>
                                        <small>Created 27.11.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 87%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>87% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">Creative Portfolio</a>
                                        <br>
                                        <small>Created 21.10.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 65%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>65% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">Directory & listing</a>
                                        <br>
                                        <small>Created 2.09.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-2.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 55%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>55% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">New Dashboard BS3</a>
                                        <br>
                                        <small>Created 27.11.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 87%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>87% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">Creative Portfolio</a>
                                        <br>
                                        <small>Created 21.10.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 65%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>65% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">Directory & listing</a>
                                        <br>
                                        <small>Created 2.09.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-2.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 55%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>55% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">New Dashboard BS3</a>
                                        <br>
                                        <small>Created 27.11.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 87%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>87% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">Creative Portfolio</a>
                                        <br>
                                        <small>Created 21.10.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 65%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>65% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-name">
                                        <a href="project_details.html">Directory & listing</a>
                                        <br>
                                        <small>Created 2.09.2014</small>
                                    </td>
                                    <td class="p-team">
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/chat-avatar2.jpg"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-1.png"></a>
                                        <a href="#"><img alt="image" class="" src="img/pro-ac-2.png"></a>
                                    </td>
                                    <td class="p-progress">
                                        <div class="progress progress-xs">
                                            <div style="width: 55%;" class="progress-bar progress-bar-success"></div>
                                        </div>
                                        <small>55% Complete </small>
                                    </td>
                                    <td>
                                        <span class="label label-primary">Active</span>
                                    </td>
                                    <td>
                                        <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </section>
                    <!-- page end-->
                </section>
            </section>
            <!--main content end-->


        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/slidebars.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="js/respond.min.js" ></script>

        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>
    </body>
</html>
