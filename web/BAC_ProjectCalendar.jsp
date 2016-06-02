<%-- 
    Document   : BAC_ProjectCalendar
    Created on : 03 27, 16, 3:24:02 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Contractor_User"%>
<%@page import="Entity.Employee"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entity.Task"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Entity.Material"%>
<%@page import="Entity.Testimonial"%>
<%@page import="Entity.Location"%>
<%@page import="Entity.Files"%>
<%@page import="Entity.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Project"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%Employee bac = (Employee) session.getAttribute("user");%>
<%Project p = (Project) session.getAttribute("projectInfo");%>
<!DOCTYPE html>

<html lang="en">
    <head>

        <title>Project Calendar</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" >

        <!--right slidebar-->
        <link href="css/slidebars.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet">
        <link href = 'calendar/fullcalendar.css' rel='stylesheet'>
        <link href = 'calendar/scheduler.css' rel='stylesheet'>
        <script src ='calendar/moment.min.js'></script>
        <script src ='calendar/jquery.min.js'></script>
        <script src ='calendar/fullcalendar.js'></script>
        <script src ='calendar/scheduler.js'></script>
        <style>
            .DocumentList2
            {
                overflow-x:scroll;
                overflow-y:hidden;
                height:105%;
                white-space: nowrap;
                position: relative;
            }

            .row2 {
                width: 500%;
            }

            .DocumentItem2
            {
                border:1px solid #d9d9d9;
                margin-right: 10px;
                padding:0;
                height:200px;
                width: 200px;
            }
        </style>
        <style>
            .editablelegend {color:#00ffaa;}
            .uneditablelegend {color:#ff6666;}
        </style>
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
        <!--sidebar end-->

        <section id="main-content">
            <section class="wrapper site-min-height">
                <!-- page start-->
                <section class="panel">

                    <header class="panel-heading">
                        <label>Project:</label> <%out.print(p.getName());%>
                        <br>
                        <label>Project Description:</label> <%out.print(p.getDescription());%> 
                        <br>
                        <label>Project Type:</label> <%out.print(p.getType());%>

                        <span class="pull-right">
                        </span>
                    </header>
                </section>

                <div class="row">

                    <div class="col-md-12">



                        <!------------------------------------------------------SCHEDULE------------------------------------------>
                        <style>
                            .planninglegend {color:#ff3399;}
                            .biddinglegend {color:#00cc00;}
                            .implementationlegend {color:#8080ff;}
                        </style>

                        <section class="panel">
                            <div class="bio-graph-heading project-heading">
                                <strong>Schedule</strong>
                            </div>
                            <div class="panel-body bio-graph-info">
                                <i class="fa fa-square planninglegend"></i>  Planning Events
                                <i class="fa fa-square biddinglegend" style="margin-left: 7px"></i>  Bidding Events
                                <i class="fa fa-square implementationlegend" style="margin-left: 7px"></i>  Implementation Events

                                <div id='calendar' style="height: 100%; width: 100%"></div>
                            </div>
                            <br>
                            <center><button class="btn btn-default" onclick="history.go(-1)">Back</button></center>
                            <br>
                        </section>                     

                        <input type="hidden" id="projId" value="<%=p.getId()%>" name="projId">
                        <input type="hidden" name="" id="projectID" value="<%=p.getId()%>">
                    </div>

                </div>
            </section>
        </section>
        <input type="hidden" id="schedId">
        <div class="modal fade" id="adjustModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="adjMheader"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label class="control-label pull-left regFieldTitle">Start Date: </label>
                            <input type="date" class="form-control" id="startDM">
                        </div>

                        <div class="form-group">
                            <label class="control-label pull-left regFieldTitle">End Date: </label>
                            <input type="date" class="form-control" id="endDM">
                        </div>



                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success" id="saveSched" type="button"> Save</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- js placed at the end of the document so the pages load faster -->
        <!--<script src="js/jquery.js"></script>-->
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/slidebars.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="js/respond.min.js" ></script>

        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>
        <script>
                                var cal = <%=session.getAttribute("calendar")%>;
                                $('document').ready(function () {

                                    $('#calendar').fullCalendar({
                                        defaultView: 'month',
                                        schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
                                        header: {
                                            left: '',
                                            center: 'title',
                                            right: 'today prev,next'
                                        }, eventClick: function (event, jsEvent, view) {
                                            if (event.stage === "Bidding") {
                                                if (event.status === "Pending") {
                                                    $('#adjMheader').text(event.title + " - Adjust Schedule");
                                                    var st = moment(event.start).format('YYYY-MM-DD');
                                                    var en = moment(event.end).format('YYYY-MM-DD');

                                                    $('#startDM').val(st);
                                                    $('#endDM').val(en);
                                                    $('#adjustModal').modal();
                                                    $('#schedId').val(event.id);


                                                }
                                            }
                                        }
                                    });
                                    inputActivities(cal);

                                });

                                function inputActivities(sched) {
                                    $('#calendar').fullCalendar('removeEvents');

                                    $.each(sched, function (i) {
                                        var color;
                                        if (sched[i].stage === "Planning")
                                            color = '#ff3399';
                                        else if (sched[i].stage === "Bidding")
                                            color = '#00cc00';
                                        else if (sched[i].stage === "Implementation")
                                            color = '#8080ff';
                                        var my_events = {
                                            events: [
                                                {
                                                    title: sched[i].event,
                                                    start: sched[i].startdate,
                                                    end: sched[i].enddate,
                                                    dept: sched[i].dept,
                                                    stage: sched[i].stage,
                                                    status: sched[i].status,
                                                    color: color,
                                                    id: sched[i].id
                                                }
                                            ]
                                        };

                                        $('#calendar').fullCalendar('addEventSource', my_events);
                                    });
                                }
                                $('#saveSched').click(function () {
                                    $('#adjustModal').hide();
                                    $.ajax({
                                        url: 'adjustschedule',
                                        type: 'POST',
                                        dataType: 'json',
                                        data: {projId: $('#projId').val(), id: $('#schedId').val(),
                                            start: $('#startDM').val(), end: $('#endDM').val()},
                                        success: function (sched) {
                                            inputActivities(sched);
                                        }
                                    });

                                });

        </script>

    </body>

</html>