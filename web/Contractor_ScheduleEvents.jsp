<%-- 
    Document   : Contractor_ScheduleEvents
    Created on : Mar 28, 2016, 3:47:37 AM
    Author     : Krist
--%>

<%@page import="Entity.Contractor_User"%>
<%@page import="Entity.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Citizen"%>
<%@page import="Entity.Request"%>
<%@page import="Entity.Contractor_Has_Project"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Contractor_User c = (Contractor_User) session.getAttribute("user");%>
<% ArrayList<Request> rList = (ArrayList<Request>) request.getAttribute("rList");

%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Schedule Adjustment Requests</title>
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
                                <span class="username">Hello <b><u><%//=c.getName()%></u></b>!</span>
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
                        <a href="Contractor_Home">
                            <i class="fa fa-dashboard"></i>
                            <span>Home</span>
                        </a>
                    </li>

                    <li>
                        <a href="Contractor_ViewProjectList">
                            <i class="fa fa-dashboard"></i>
                            <span>View All Projects</span>
                        </a>
                    </li>

                    <li class="sub-menu">
                        <a href="javascript:;" >
                            <i class="fa fa-tasks"></i>
                            <span>Bidding</span>
                        </a>
                        <ul class="sub">
                            <li><a  href="Contractor_HandleInvitations">&nbsp; &nbsp; &nbsp; &nbsp;Handle Invitations</a></li>
                            <li><a  href="Contractor_ViewHistory">&nbsp; &nbsp; &nbsp; &nbsp; View History</a></li>
                        </ul>
                    </li>

                    <li class="sub-menu">
                        <a href="javascript:;" >
                            <i class="fa fa-tasks"></i>
                            <span>Implementation</span>
                        </a>
                        <ul class="sub">
                            <li><a  href="Contractor_ViewProjectList">&nbsp; &nbsp; &nbsp; &nbsp;Monitor Projects</a></li>
                            <li><a  href="Contractor_ViewAR">&nbsp; &nbsp; &nbsp; &nbsp; View Accomplishment Reports</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="Contractor_ScheduleChange">
                            <i class="fa fa-dashboard"></i>
                            <span>Schedule Change</span>
                        </a>
                    </li>

                    <li>
                        <a href="Contractor_ActivityandNotification">
                            <i class="fa fa-dashboard"></i>
                            <span>View Activity and Notifications</span>
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
                                                            <th>Reason</th>
                                                            <th>Date requested</th>
                                                            <th></th>

                                                    <span class="pull-right">
                                                        <button id="adjustM" class="btn btn-success btn-sm">Request for change</button>
                                                    </span>

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
                                                                <%=rList.get(r).getReason()%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%=rList.get(r).getDateRequested()%>
                                                            </td>
                                                            <td class="p-name">
                                                                <button id="<%=rList.get(r).getId()%>" onclick="getSched(this)" class="btn btn-success btn-sm pull-right">View Details</button>
                                                            </td>


                                                        </tr>

                                                        <%}%>
                                                    </tbody>
                                                    <%}%>


                                                </table>



                                            </div>



                                            <!--approved-->
                                            <div class="tab-pane " id="approved">
                                                <div class="row">
                                                    <div class="col-md-12">


                                                    </div>
                                                </div>

                                                <table class="table table-hover p-table">
                                                    <thead>
                                                        <tr>

                                                            <th>Event</th>
                                                            <th>Reason</th>
                                                            <th>Date requested</th>
                                                            <th>Remarks</th>
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
                                                                <%=rList.get(r).getReason()%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%=rList.get(r).getDateRequested()%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%=rList.get(r).getRemarks()%>
                                                            </td>
                                                            <td class="p-name">
                                                                <button id="<%=rList.get(r).getId()%>" onclick="getSched(this)" class="btn btn-success btn-sm pull-right">View Details</button>
                                                            </td>

                                                        </tr>

                                                        <%}%>
                                                    </tbody>
                                                    <%}%>


                                                </table>

                                            </div>

                                            <!--REJECTED-->
                                            <div class="tab-pane " id="rejected">
                                                <div class="row">
                                                    <div class="col-md-12">


                                                    </div>
                                                </div>

                                                <table class="table table-hover p-table">
                                                    <thead>
                                                        <tr>

                                                            <th>Event</th>
                                                            <th>Reason</th>
                                                            <th>Date requested</th>
                                                            <th>Remarks</th>
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
                                                                <%=rList.get(r).getReason()%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%=rList.get(r).getDateRequested()%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%=rList.get(r).getRemarks()%>
                                                            </td>
                                                            <td class="p-name">
                                                                <button id="<%=rList.get(r).getId()%>" onclick="getSched(this)" class="btn btn-success btn-sm pull-right">View Details</button>
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

        <form action="Contractor_SendRequest">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Request change Schedule</h4>
                        </div>
                        <div class="modal-body">

                            Project: <select name="projectsel" id="projectsel"></select><br>
                            <p>Schedule: <select name="schedule" id="schedule"></select><br>
                            <p> Start: <input name="start" id="start" type="date"> <br>
                            <p> End: <input name="end" id="end" type="date"> <br>
                            <p> Reason: <textarea name="reason"></textarea>

                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                            <input type="submit" class="btn btn-success" >
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="modal fade" id="viewDetailsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Modal Tittle</h4>
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
    </body>
    <script>
                                                                    $(document).ready(function () {
                                                                        $.ajax({
                                                                            type: 'POST',
                                                                            url: 'getprojects',
                                                                            dataType: 'json',
                                                                            cache: false,
                                                                            success: function (fc) {
                                                                                $("#projectsel").empty();
                                                                                $("#projectsel").append($("<option></option>").text("Select Option"));
                                                                                $.each(fc, function (i) {
                                                                                    $("#projectsel").append(
                                                                                            $("<option></option>")
                                                                                            .text(fc[i].name)
                                                                                            .val(fc[i].id)
                                                                                            )
                                                                                            ;
                                                                                });
                                                                            }
                                                                        });
                                                                    });

                                                                    $(document).on("change", "#projectsel", function () {
                                                                        $.ajax({
                                                                            type: 'POST',
                                                                            url: 'getprojsched',
                                                                            dataType: 'json',
                                                                            data: {projId: $('#projectsel').val()},
                                                                            cache: false,
                                                                            success: function (fc) {
                                                                                $("#schedule").empty();
                                                                                $("#schedule").append($("<option></option>").text("Select Option"));
                                                                                $.each(fc, function (i) {
                                                                                    $("#schedule").append(
                                                                                            $("<option></option>")
                                                                                            .text(fc[i].event)
                                                                                            .val(fc[i].id)
                                                                                            )
                                                                                            ;
                                                                                });
                                                                            }
                                                                        });

                                                                    });
                                                                    $('#adjustM').on("click", function () {
                                                                        $('#myModal').modal();
                                                                    });

                                                                    function getSched(button) {
                                                                        console.log(button.id);
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

                                                                    $(document).on("change", "#schedule", function () {
                                                                        $.ajax({
                                                                            type: 'POST',
                                                                            url: 'getactivitysched',
                                                                            dataType: 'json',
                                                                            data: {schedId: $('#schedule').val()},
                                                                            cache: false,
                                                                            success: function (fc) {
                                                                                $("#start").val();
                                                                                $("#end").val();
                                                                                var st = moment(fc[0]).format('YYYY-MM-DD');
                                                                                var en = moment(fc[1]).format('YYYY-MM-DD');
                                                                                $("#start").val(st);
                                                                                $("#end").val(en);

                                                                            }
                                                                        });
                                                                    });
    </script>
</html>
