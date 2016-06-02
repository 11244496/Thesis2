<%-- 
    Document   : GS_ProjectStatus
    Created on : 09 2, 15, 8:52:38 AM
    Author     : User
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Entity.Project_Inspection"%>
<%@page import="Entity.Project"%>
<%@page import="java.util.ArrayList"%>
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
                            <a href="javascript:;" class="active">
                                <i class="fa fa-tasks"></i>
                                <span>Project Proposals</span>
                            </a>
                            <ul class="sub">
                                <li><a  href="GS_CreateProposal.jsp">&nbsp; &nbsp; &nbsp; &nbsp; Create Proposal</a></li>
                                <li><a  href="GS_ViewProjectList">&nbsp; &nbsp; &nbsp; &nbsp; View Project Proposals</a></li>
                                <li><a  href="GS_ViewImplementedProjects" class="active">&nbsp; &nbsp; Monitor Implemented Projects</a></li>
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

                ArrayList<Project> implemented = (ArrayList<Project>) request.getAttribute("pList");
                ArrayList<Project> completed = (ArrayList<Project>) request.getAttribute("fpList");
            %>
            <!--main content start-->

            <section id="main-content">
                <section class="wrapper site-min-height">
                    <!-- page start-->
                    <section class="panel">
                        <div class="col-lg-8" style="padding-left: 0px; padding-right:0px; width:100%;">
                            <div class="row">
                                <div class="col-lg-6" style="width:100%;">
                                    <!--widget start-->
                                    <section class="panel" style="width:100%;">
                                        <header class="panel-heading tab-bg-dark-navy-blue">
                                            <ul class="nav nav-tabs nav-justified ">
                                                <li class="active">
                                                    <a href="#ongoing" data-toggle="tab">
                                                        On-Going
                                                    </a>
                                                </li>

                                                <li class="">
                                                    <a href="#completed" data-toggle="tab">
                                                        Completed
                                                    </a>
                                                </li>
                                            </ul>
                                        </header>

                                        <div class="panel-body">
                                            <div class="tab-content tasi-tab">
                                                <div class="tab-pane active" id="ongoing">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <header class="panel-heading">
                                                                <h3>On-Going Project</h3>

                                                            </header>
                                                            <br>
                                                            <div class="input-group"><input type="text" placeholder="Search Here" class="input-sm form-control" style="width: 500px;">
                                                                <button type="button" class="btn btn-sm btn-success"> Go!</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <table class="table table-hover p-table">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 10%;">Name</th>
                                                                <th style="width: 30%;">Description</th>
                                                                <th style="width: 30%;">Percentage</th>
                                                                <th style="width: 10%;">Task</th>
                                                                <th style="width: 15%;">Progress</th>
                                                                <th style="width: 10%;">Inspection</th>
                                                            </tr>
                                                        </thead>


                                                        <tbody>
                                                            <%                                                                if (!implemented.isEmpty()) {
                                                                    for (int x = 0; x < implemented.size(); x++) {
                                                                        String name = implemented.get(x).getName();
                                                                        String description = implemented.get(x).getDescription();
                                                                        String type = implemented.get(x).getType();
                                                                        String id = implemented.get(x).getId();


                                                            %>
                                                            <tr>
                                                                <td>
                                                                    <a href="GS_ViewProjectDetails?projid=<%=id%>"> <%out.print(name);%> </a>
                                                                </td>
                                                                <td>
                                                                    <%out.print(description);%>
                                                                </td>
                                                                <td class="p-name">   
                                                                    <a class="btn btn-success btn-sm" href="GS_ProjectStatusReport?projid=<%=implemented.get(x).getId()%>">View Status Report</a>
                                                                </td>

                                                                <td class="p-name">   
                                                                    <a class="btn btn-success btn-sm" href="GS_ViewTasks?projid=<%=implemented.get(x).getId()%>">View Task</a>
                                                                </td>
                                                                <td class="p-name">
                                                                    <a class="btn btn-success btn-sm" href="GS_OpenProgressReport?projectid=<%=id%>">Progress Report</a>  
                                                                </td>

                                                                <td class="p-name">
                                                                    <!--Insert Code to check if theres an in-->
                                                                    <% //if (implemented.get(x).getInspection().size() != 0) {

                                                                            //boolean inspectiontoday = false;
                                                                        //Date d = new Date();
                                                                        //SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                                                            //for (int y = 0; y < implemented.get(x).getInspection().size(); y++) {
                                                                        //    if (implemented.get(x).getInspection().get(y).getDateOfInspection().equalsIgnoreCase(df.format(d))) {
                                                                        //        inspectiontoday = true;
                                                                        //    }
                                                                        //}
                                                                        //if (inspectiontoday = false) {
%>

                                                                    <a class="btn btn-success btn-sm" href="GS_CreateInspection?projid=<%=implemented.get(x).getId()%>">Inspection Report</a>  

                                                                    <%//}else if(inspectiontoday = true){

                                                                        //out.print("Inspection submitted");
                                                                        //}
                                                                        //}%>

                                                                    <% //if (implemented.get(x).getInspection().size() == 0) {
                                                                    %>

                                                                    <!--<a class="btn btn-success btn-sm" href="GS_CreateInspection?projid=<%//=implemented.get(x).getId()%>">Inspection Report</a>-->  

                                                                    <%//}%>
                                                                </td>
                                                            </tr>
                                                            <%
                                                                    }
                                                                }
                                                            %>




                                                        </tbody>
                                                    </table>
                                                </div>



                                                <!--approved-->
                                                <div class="tab-pane" id="completed">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <header class="panel-heading">
                                                                <h3>Complete Projects</h3>

                                                            </header><br>

                                                            <div class="input-group"><input type="text" placeholder="Search Here" class="input-sm form-control" style="width: 500px;">
                                                                <button type="button" class="btn btn-sm btn-success"> Go!</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <table class="table table-hover p-table">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 20%;">Name</th>
                                                                <th style="width: 30%;">Description</th>
                                                                <th style="width: 30%;">Date Completed</th>
                                                                <th style="width: 20%;"></th>
                                                            </tr>
                                                        </thead>



                                                        <tbody>
                                                            <%
                                                                if (!completed.isEmpty()) {
                                                                    for (int x = 0; x < completed.size(); x++) {
                                                                        String name = completed.get(x).getName();
                                                                        String description = completed.get(x).getDescription();
                                                                        String type = completed.get(x).getType();
                                                            %>
                                                            <tr>
                                                                <td>
                                                                    <a href="GS_ViewProjectDetails?projid=<%=completed.get(x).getId()%>"> <%out.print(name);%> </a>
                                                                </td>
                                                                <td>
                                                                    <%out.print(description);%>
                                                                </td>
                                                                <td class="p-name">   
                                                                    sample date
                                                                </td>
                                                                <td class="p-name">   
                                                                    <a class="btn btn-success btn-sm" href="GS_ViewTasks?projid=<%=completed.get(x).getId()%>">View Task</a>
                                                                </td>
                                                                <td class="p-name">
                                                                    <a class="btn btn-success btn-sm" href="GS_GenerateAccomplishmentReport?projid=<%=completed.get(x).getId()%>">Generate Accomplishment Report</a> 
                                                                </td>
                                                            </tr>
                                                            <%
                                                                    }
                                                                }
                                                            %>

                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    </section>
                                    <!--widget end-->

                                </div>
                            </div>

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
        <script src="js/slidebars.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="js/respond.min.js" ></script>

        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>
    </body>
</html>
