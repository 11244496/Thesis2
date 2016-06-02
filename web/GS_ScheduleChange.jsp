<%-- 
    Document   : GS_ScheduleChange
    Created on : 04 3, 16, 9:05:42 PM
    Author     : RoAnn
--%>

<%@page import="Entity.Request"%>
<%@page import="Entity.Testimonial"%>
<%@page import="Entity.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Employee"%>
<!DOCTYPE html>
<html lang="en">


    <% Employee e = (Employee) session.getAttribute("user");
        ArrayList<Request> rList = (ArrayList<Request>) request.getAttribute("rList");
    %>


    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">


        <title>Schedule Change Requests</title>

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

        <!--dynamic table-->
        <link href="assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet" />
        <link href="assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/data-tables/DT_bootstrap.css" />

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
                            <a href="GS_ScheduleChange" class="active">
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
                                                        Pending Requests
                                                    </a>
                                                </li>

                                                <li class="">
                                                    <a href="#approved" data-toggle="tab">
                                                        Approved Requests
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#rejected" data-toggle="tab">
                                                        Rejected Requests
                                                    </a>
                                                </li>


                                            </ul>
                                        </header>

                                        <div class="panel-body">
                                            <div class="tab-content tasi-tab">
                                                <div class="tab-pane active" id="proposals">
                                                    <div class="row">
                                                        <div class="col-md-12">

                                                        </div>
                                                    </div>

                                                    <table class="table table-hover p-table" >

                                                        <thead>
                                                            <tr>

                                                                <th>Event</th>
                                                                <th>Requested By</th>
                                                                <th>Reason</th>
                                                                <th>Date requested</th>
                                                                <th></th>

                                                            </tr>
                                                        </thead>
                                                        <%
                                                            for (int r = 0; r < rList.size(); r++) {
                                                        %>

                                                        <tbody>
                                                            <%if (rList.get(r).getStatus().equalsIgnoreCase("Pending")) {%>
                                                            <tr>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getSchedule().getEvent()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getCs().getName() + " - " + rList.get(r).getCs().getContractor().getName()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getReason()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getDateRequested()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <button id="<%=rList.get(r).getId()%>" onclick="getSched(this)" class="btn btn-info btn-sm pull-right">View Details</button><p>
                                                                        <button id="<%=rList.get(r).getId()%>" onclick="approve(this)" class="btn btn-success btn-sm">Approve</button>
                                                                        <button id="<%=rList.get(r).getId()%>" onclick="reject(this)" class="btn btn-danger btn-sm ">Reject</button>
                                                                </td>


                                                            </tr>

                                                            <%}%>
                                                        </tbody>
                                                        <%}%>


                                                    </table>
                                                </div>

                                                <div class="tab-pane " id="approved">
                                                    <div class="row">
                                                        <div class="col-md-12">


                                                        </div>
                                                    </div>

                                                    <table class="table table-hover p-table" >

                                                        <thead>
                                                            <tr>

                                                                <th>Event</th>
                                                                <th>Requested By</th>
                                                                <th>Reason</th>
                                                                <th>Date requested</th>
                                                                <th></th>

                                                            </tr>
                                                        </thead>
                                                        <%
                                                            for (int r = 0; r < rList.size(); r++) {
                                                        %>

                                                        <tbody>
                                                            <%if (rList.get(r).getStatus().equalsIgnoreCase("Approved")) {%>
                                                            <tr>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getSchedule().getEvent()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getCs().getName() + " - " + rList.get(r).getCs().getContractor().getName()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getReason()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getDateRequested()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <button id="<%=rList.get(r).getId()%>" onclick="getSched(this)" class="btn btn-info btn-sm pull-right">View Details</button><p>
                                                                </td>


                                                            </tr>

                                                            <%}%>
                                                        </tbody>
                                                        <%}%>


                                                    </table>

                                                </div>   

                                                <div class="tab-pane " id="rejected">
                                                    <div class="row">
                                                        <div class="col-md-12">


                                                        </div>
                                                    </div>

                                                    <table class="table table-hover p-table" >

                                                        <thead>
                                                            <tr>

                                                                <th>Event</th>
                                                                <th>Requested By</th>
                                                                <th>Reason</th>
                                                                <th>Date requested</th>
                                                                <th></th>

                                                            </tr>
                                                        </thead>
                                                        <%
                                                            for (int r = 0; r < rList.size(); r++) {
                                                        %>

                                                        <tbody>
                                                            <%if (rList.get(r).getStatus().equalsIgnoreCase("Rejected")) {%>
                                                            <tr>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getSchedule().getEvent()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getCs().getName() + " - " + rList.get(r).getCs().getContractor().getName()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getReason()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <%=rList.get(r).getDateRequested()%>
                                                                </td>
                                                                <td class="p-name">
                                                                    <button id="<%=rList.get(r).getId()%>" onclick="getSched(this)" class="btn btn-info btn-sm pull-right">View Details</button><p>
                                                                </td>


                                                            </tr>

                                                            <%}%>
                                                        </tbody>
                                                        <%}%>


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

            <div class="modal fade" id="viewDetailsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Respond to Request</h4>
                        </div>
                        <div class="modal-body">

                            <p>Activity: <input id="scheduleO" readonly>
                            <p> Original start: <input id="startO" readonly>
                            <p> Original end:  <input id="endO" readonly>
                            <p> Requested Start:  <input id="startR" readonly>
                            <p> Requested End: <input id="endR" readonly>
                            <p> Reason for change: <input id="reasonFC" readonly>

                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <form action="GS_ScheduleChangeResponse">
                <div class="modal fade" id="changeStatM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title">Modal Title</h4>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="reqId" id="reqId">
                                <input type="hidden" name="action" id="action">

                                <p> Activity: <input id="scheduleO2" readonly>
                                <p> Original start: <input id="startO2" readonly>
                                <p> Original end:  <input id="endO2" readonly>
                                <p> Requested Start:  <input id="startR2" readonly>
                                <p> Requested End: <input id="endR2" readonly>
                                <p> Reason for change: <input id="reasonFC2" readonly>
                                <p> Remarks: <textarea name="remark"></textarea>

                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                <button type="submit" class="btn btn-success" type="button">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

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
            <script src="js/moment.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
            <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
            <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>
            <script src="js/slidebars.min.js"></script>
            <script>
                                                                        function approve(button) {
                                                                            submitForm("approve", button.id);
                                                                        }

                                                                        function reject(button) {
                                                                            submitForm("reject", button.id);
                                                                        }

                                                                        function submitForm(action, reqid) {
                                                                            $.ajax({
                                                                                type: 'POST',
                                                                                url: 'getscheddetails',
                                                                                dataType: 'json',
                                                                                data: {schedId: reqid},
                                                                                cache: false,
                                                                                success: function (r) {
                                                                                    $('#scheduleO2').val(r.schedule.event);
                                                                                    $('#startO2').val(r.schedule.startdate);
                                                                                    $('#endO2').val(r.schedule.enddate);
                                                                                    $('#startR2').val(r.start);
                                                                                    $('#endR2').val(r.end);
                                                                                    $('#reasonFC2').val(r.reason);

                                                                                }
                                                                            });
                                                                            $('#action').val(action);
                                                                            $('#reqId').val(reqid);
                                                                            $('#changeStatM').modal();
                                                                        }
                                                                        function getSched(button) {
                                                                            $.ajax({
                                                                                type: 'POST',
                                                                                url: 'getscheddetails',
                                                                                dataType: 'json',
                                                                                data: {schedId: button.id},
                                                                                cache: false,
                                                                                success: function (r) {
                                                                                    $('#scheduleO').val(r.schedule.event);
                                                                                    $('#startO').val(r.schedule.startdate);
                                                                                    $('#endO').val(r.schedule.enddate);
                                                                                    $('#startR').val(r.start);
                                                                                    $('#endR').val(r.end);
                                                                                    $('#reasonFC').val(r.reason);

                                                                                }
                                                                            });
                                                                            $('#viewDetailsModal').modal();
                                                                        }
                                                                        ;



            </script>
    </body>

</html>