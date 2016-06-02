<%-- 
    Document   : GS_ViewProjectList
    Created on : 03 18, 16, 10:04:52 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Employee"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entity.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%Employee e = (Employee) session.getAttribute("user");%>
<%ArrayList<Project> pList = (ArrayList<Project>) request.getAttribute("pList");%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>List of Projects</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!--dynamic table-->
        <link href="assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet" />
        <link href="assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/data-tables/DT_bootstrap.css" />
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
        <style>
            table, td, th{
                text-align: center;
            }
        </style>
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
                            <a href="javascript:;" class="active">
                                <i class="fa fa-tasks"></i>
                                <span>Project Proposals</span>
                            </a>
                            <ul class="sub">
                                <li><a  href="GS_CreateProposal.jsp">&nbsp; &nbsp; &nbsp; &nbsp; Create Proposal</a></li>
                                <li><a  href="GS_ViewProjectList" class="active">&nbsp; &nbsp; &nbsp; &nbsp; View Project Proposals</a></li>
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
                        <div class="col-lg-8" style="padding-left: 0px; padding-right:0px; width:100%;">
                            <div class="row">
                                <div class="col-lg-6" style="width:100%;">
                                    <!--widget start-->
                                    <section class="panel" style="width:100%;">
                                        <header class="panel-heading tab-bg-dark-navy-blue">
                                            <ul class="nav nav-tabs nav-justified ">
                                                <li class="active">
                                                    <a href="#proposals" data-toggle="tab">
                                                        Pending
                                                    </a>
                                                </li>

                                                <li class="">
                                                    <a href="#rejected" data-toggle="tab">
                                                        On-Hold
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#compile" data-toggle="tab">
                                                        For Compilation
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#approved" data-toggle="tab">
                                                        Approved
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#draft" data-toggle="tab">
                                                        Drafts
                                                    </a>
                                                </li>
                                            </ul>
                                        </header>

                                        <div class="panel-body">
                                            <div class="tab-content tasi-tab">
                                                <div class="tab-pane active" id="proposals">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <header class="panel-heading">
                                                                <h3>Pending Proposals</h3>

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
                                                                <th style="width: 15%; text-align: center">Title</th>
                                                                <th style="width: 15%; text-align: center">Category</th>
                                                                <th style="width: 30%; text-align: center">Description</th>
                                                                <th style="width: 10%; text-align: center">Date Submitted</th>
                                                                <th style="width: 15%; text-align: center">Status</th>
                                                                <th style="width: 10%; text-align: center"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%for (Project p : pList) {
                                                                    if (p.getStatus().equalsIgnoreCase("Pending")) {
                                                            %>

                                                            <tr>
                                                                <td class="p-name"><%=p.getName()%></td>
                                                                <td class="p-name"><%=p.getType()%></td>
                                                                <td class="p-name"><%=p.getDescription()%></td>
                                                                <td class="p-name"><%=p.getDatesubmitted()%></td>
                                                                <td class="p-name"><%=p.getStatus()%></td>
                                                                <td>
                                                                    <form action="GS_ViewProjectDetails">
                                                                        <input type="hidden" name="projid" value="<%=p.getId()%>">

                                                                        <button type="submit" class="btn btn-success btn-xs" value="View details"><i class="fa fa-eye"></i> View details</button>

                                                                    </form>
                                                                </td>
                                                            </tr>
                                                            <%}
                                                                }%>
                                                        </tbody>


                                                    </table>



                                                </div>



                                                <!--approved-->
                                                <div class="tab-pane" id="approved">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <header class="panel-heading">
                                                                <h3>Approved Projects</h3>

                                                            </header><br>

                                                            <div class="input-group"><input type="text" placeholder="Search Here" class="input-sm form-control" style="width: 500px;">
                                                                <button type="button" class="btn btn-sm btn-success"> Go!</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <table class="table table-hover p-table">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 15%;">Title</th>
                                                                <th style="width: 15%;">Category</th>
                                                                <th style="width: 30%;">Description</th>
                                                                <th style="width: 10%;">Date Submitted</th>
                                                                <th style="width: 15%; text-align: center">Status</th>
                                                                <th style="width: 10%; text-align: center"></th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <%for (Project p : pList) {
                                                                    if (!(p.getStatus().equalsIgnoreCase("Pending")) && !(p.getStatus().equalsIgnoreCase("On-Hold")) && !(p.getStatus().equalsIgnoreCase("For Compilation"))){
                                                            %>

                                                            <tr>
                                                                <td class="p-name"><%=p.getName()%></td>
                                                                <td class="p-name"><%=p.getType()%></td>
                                                                <td class="p-name"><%=p.getDescription()%></td>
                                                                <td class="p-name"><%=p.getDatesubmitted()%></td>
                                                                <td class="p-name"><%=p.getStatus()%></td>
                                                                <td>
                                                                    <form action="GS_ViewProjectDetails">
                                                                        <button type="submit" class="btn btn-success btn-xs" value="View proposal details">View proposal details</button>
                                                                        <input type="hidden" name="projid" value="<%=p.getId()%>">
                                                                    </form>

                                                                </td>
                                                            </tr>
                                                            <%}
                                                                }%>
                                                        </tbody>
                                                    </table>

                                                </div>


                                                <!--rejected-->
                                                <div class="tab-pane " id="rejected">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <header class="panel-heading">
                                                                <h3>On-Hold Projects</h3>

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
                                                                <th style="width: 20%;">Title</th>
                                                                <th style="width: 15%;">Category</th>
                                                                <th style="width: 25%;">Description</th>
                                                                <th style="width: 10%;">Date Submitted</th>
                                                                <th style="width: 15%; text-align: center">Status</th>
                                                                <th style="width: 10%; text-align: center"></th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <%for (Project p : pList) {
                                                                    if (p.getStatus().equalsIgnoreCase("On-Hold")) {
                                                            %>

                                                            <tr>
                                                                <td class="p-name"><%=p.getName()%></td>
                                                                <td class="p-name"><%=p.getType()%></td>
                                                                <td class="p-name"><%=p.getDescription()%></td>
                                                                <td class="p-name"><%=p.getDatesubmitted()%></td>
                                                                <td class="p-name"><%=p.getStatus()%></td>
                                                                <td>
                                                                    <form action="GS_ViewProjectDetails">
                                                                        <input type="hidden" name="projid" value="<%=p.getId()%>">

                                                                        <button type="submit" class="btn btn-success btn-xs" value="View details"><i class="fa fa-eye"></i> View details</button>

                                                                    </form>
                                                                </td>
                                                            </tr>
                                                            <%}
                                                                }%>
                                                        </tbody>
                                                    </table>                                          
                                                </div>

                                                <!--for compilation-->
                                                <div class="tab-pane " id="compile">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <header class="panel-heading">
                                                                <h3>Compile Projects</h3>

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
                                                                <th style="width: 20%;">Title</th>
                                                                <th style="width: 15%;">Category</th>
                                                                <th style="width: 25%;">Description</th>
                                                                <th style="width: 10%;">Date Submitted</th>
                                                                <th style="width: 15%; text-align: center">Status</th>
                                                                <th style="width: 10%; text-align: center"></th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <%for (Project p : pList) {
                                                                    if (p.getStatus().equalsIgnoreCase("For Compilation")) {
                                                            %>

                                                            <tr>
                                                                <td class="p-name"><%=p.getName()%></td>
                                                                <td class="p-name"><%=p.getType()%></td>
                                                                <td class="p-name"><%=p.getDescription()%></td>
                                                                <td class="p-name"><%=p.getDatesubmitted()%></td>
                                                                <td class="p-name"><%=p.getStatus()%></td>
                                                                <td>
                                                                    <form action="GS_ViewProjectDetails">
                                                                        <input type="hidden" name="projid" value="<%=p.getId()%>">

                                                                        <button type="submit" class="btn btn-success btn-xs" value="View details"><i class="fa fa-eye"></i> View details</button>

                                                                    </form>
                                                                </td>
                                                            </tr>
                                                            <%}
                                                                }%>
                                                        </tbody>
                                                    </table>   
                                                </div>    
                                                <div class="tab-pane " id="draft">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <header class="panel-heading">
                                                                <h3>Drafts</h3>

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
                                                                <th style="width: 20%;">Title</th>
                                                                <th style="width: 15%;">Category</th>
                                                                <th style="width: 25%;">Description</th>
                                                                <th style="width: 10%;">Date Submitted</th>
                                                                <th style="width: 15%; text-align: center">Status</th>
                                                                <th style="width: 10%; text-align: center"></th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <%for (Project p : pList) {
                                                                    if (p.getStatus().equalsIgnoreCase("Draft")) {
                                                            %>

                                                            <tr>
                                                                <td class="p-name"><%=p.getName()%></td>
                                                                <td class="p-name"><%=p.getType()%></td>
                                                                <td class="p-name"><%=p.getDescription()%></td>
                                                                <td class="p-name"><%=p.getDatesubmitted()%></td>
                                                                <td class="p-name"><%=p.getStatus()%></td>
                                                                <td>
                                                                    <form action="GS_ViewProjectDetails">
                                                                        <input type="hidden" name="projid" value="<%=p.getId()%>">

                                                                        <button type="submit" class="btn btn-success btn-xs" value="View details"><i class="fa fa-eye"></i> View details</button>

                                                                    </form>
                                                                </td>
                                                            </tr>
                                                            <%}
                                                                }%>
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
        <script>
            function setBudget(id) {
                $.ajax({
                    type: 'POST',
                    url: 'setbudget',
                    dataType: 'json',
                    data: {projid: id, budget: $('#budget').val()},
                    cache: false,
                    success: function () {
                        $("#approved").load(location.href + " #approved");
                    }
                });
            }
        </script>
        <script src="js/jquery.js"></script>
        <script src="js/jquery-ui-1.9.2.custom.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript" src="assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>
        <script src="js/respond.min.js" ></script>

        <!--right slidebar-->
        <script src="js/slidebars.min.js"></script>

        <!--dynamic table initialization -->
        <script src="js/dynamic_table_init.js"></script>


        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>
        <script src="js/OCPD_Monitor.js"></script>
    </body>
</html>

