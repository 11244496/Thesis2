<%-- 
    Document   : GS_ProjectStatus
    Created on : 09 2, 15, 8:52:38 AM
    Author     : User
--%>

<%@page import="Entity.Employee"%>
<%@page import="Entity.Project"%>
<%@page import="Entity.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%Employee e = (Employee) session.getAttribute("user");%>
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
                        <!-- settings end -->
                        <!-- inbox dropdown start-->
                        <li id="header_inbox_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-important"><!--NUMBER OF MESSAGES UNREAD--></span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-red"></div>
                                <li>
                                    <p class="red">You have __ new messages</p>
                                </li>
                                <!--
                                SAMPLE CODE FOR MESSAGE:
                                
            <li>
                <a href="#">
                    <span class="photo"><img alt="avatar" src="./img/avatar-mini.jpg"></span>
                          <span class="subject">
                          <span class="from">Jonathan Smith</span>
                          <span class="time">Just now</span>
                          </span>
                          <span class="message">
                              Hello, this is an example msg.
                          </span>
                </a>
            </li>
           
                               ADD THE CODE BELOW IF AT LEAST ONE(?) MESSAGE IS LISTED
            <li>
                <a href="#">See all messages</a>
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
            <%

                ArrayList<Schedule> implementationschedule = (ArrayList<Schedule>) request.getAttribute("implementationschedule");
                Project project = (Project) request.getAttribute("project");

            %>

            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <!-- page start-->
                    <section class="panel">
                        <header class="panel-heading">
                            Checklist for Inspection

                        </header>
                        <br>
                        <div class="panel-body">
                            <style type="text/css">
                                .tg  {border-collapse:collapse;border-spacing:0;}
                                .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 70px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
                                .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 70px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
                            </style>

                            <form action="GS_UpdateTask" method="POST">
                                
                                <input type="hidden" name="projID" value="<%=project.getId()%>">

                                <table class="tg">

                                    <%                                    if (implementationschedule.size() != 0) {
                                            for (int x = 0; x < implementationschedule.size(); x++) {
                                    %>

                                    <tr>
                                        <th class="tg-031e" colspan="5" style='text-align: center;'><h3><%out.print(implementationschedule.get(x).getEvent());%></h3></th>
                                    </tr>

                                    <tr>
                                        <th class="tg-031e"><b>Tasks</b></th>
                                        <th class="tg-031e"><b>Start Date</b></th>
                                        <th class="tg-031e"><b>End Date</b></th>
                                        <th class="tg-031e"><b>Status</b></th>
                                        <th class="tg-031e"><b>Remarks</b></th>
                                    </tr>

                                    <%  if (implementationschedule.get(x).getTasks().size() != 0) {
                                            for (int y = 0; y < implementationschedule.get(x).getTasks().size(); y++) {%>
                                    <tr>
                                        <th class="tg-031e"  style='text-align: center;'><%out.print(implementationschedule.get(x).getTasks().get(y).getName());%></th>
                                        <th class="tg-031e"  style='text-align: center;'><%out.print(implementationschedule.get(x).getTasks().get(y).getStartDate());%></th>
                                        <th class="tg-031e"  style='text-align: center;'><%out.print(implementationschedule.get(x).getTasks().get(y).getEndDate());%></th>
                                        <th class="tg-031e" style='text-align: center;'>
                                            <%if(implementationschedule.get(x).getTasks().get(y).getStatus().equalsIgnoreCase("Pending")){%>
                                            <input type="checkbox" class="scheduleID" name="taskID" value="<%=implementationschedule.get(x).getTasks().get(y).getId()%>">Finished
                                            <%}else{%>
                                            <input type="checkbox" class="scheduleID" checked name="taskID" value="<%=implementationschedule.get(x).getTasks().get(y).getId()%>">Finished
                                            <%}%>
                                        </th>
                                        <th class="tg-031e" style='text-align: center;'><input type="text" name="remarks" value=".">
                                            <input type="hidden" name="allTaskID" value="<%=implementationschedule.get(x).getTasks().get(y).getId()%>">
                                        </th>
                                    </tr>

                                    <%}
                                        }%>
                                    <%}
                                        }%>

                                </table>       
                                <br>

                                <div class="form-group">
                                    <br>
                                    <label>Date Inspected:</label><br><br>
                                    <label>Time Inspected:</label><br><br>
                                    <label>Approved  by:</label>
                                </div>


                                <center>
                                    <button class="button btn-success" name="UpdateTasks" type="submit">Update</button>
                                </center>


                            </form> 

                        </div>
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
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="js/respond.min.js" ></script>

        <!--this page plugins-->

        <script type="text/javascript" src="assets/fuelux/js/spinner.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap-fileupload/bootstrap-fileupload.js"></script>
        <script type="text/javascript" src="assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
        <script type="text/javascript" src="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
        <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="assets/bootstrap-daterangepicker/moment.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
        <script type="text/javascript" src="assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
        <script type="text/javascript" src="assets/jquery-multi-select/js/jquery.multi-select.js"></script>
        <script type="text/javascript" src="assets/jquery-multi-select/js/jquery.quicksearch.js"></script>


        <!--summernote-->
        <script src="assets/summernote/dist/summernote.min.js"></script>

        <!--right slidebar-->
        <script src="js/slidebars.min.js"></script>

        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>
        <!--this page  script only-->
        <script src="js/advanced-form-components.js"></script>

        <script>

            jQuery(document).ready(function () {

                $('.summernote').summernote({
                    height: 200, // set editor height

                    minHeight: null, // set minimum height of editor
                    maxHeight: null, // set maximum height of editor

                    focus: true                 // set focus to editable area after initializing summernote
                });
            });

        </script>

    </body>
</html>
