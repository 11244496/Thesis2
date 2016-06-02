<%-- 
    Document   : OCPD_Home
    Created on : 09 2, 15, 7:52:33 AM
    Author     : User
--%>

<%@page import="Entity.Activity"%>
<%@page import="Entity.Task"%>
<%@page import="Entity.Project"%>
<%@page import="Entity.Schedule"%>
<%@page import="Entity.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%Employee e = (Employee) session.getAttribute("user");
    ArrayList<Schedule> unconfirmedMeeting = (ArrayList<Schedule>) request.getAttribute("unconfirmedMeeting");
    ArrayList<Project> unconfirmedMProjects = (ArrayList<Project>) request.getAttribute("unconfirmedMProjects");

%>
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
                    <!-- notification dropdown start-->
                    <li id="header_notification_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                            <i class="fa fa-bell-o"></i>
                            <span class="badge bg-warning"></span>
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <div class="notify-arrow notify-arrow-yellow"></div>
                            <li>

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
                        <a href="OCPD_Home" class="active">
                            <i class="fa fa-dashboard"></i>
                            <span>Home</span>
                        </a>
                    </li>


                    <li>
                        <a href="OCPD_ViewPlanningDocument">
                            <i class="fa fa-book"></i>
                            <span>CLUP and CDP</span>
                        </a>
                    </li>

                    <!--multi level menu start-->
                    <li class="sub-menu">
                        <a href="javascript:;" >
                            <i class="fa fa-tasks"></i>
                            <span>Project Proposals</span>
                        </a>
                        <ul class="sub">
                            <li><a  href="OCPD_ViewProjectList">&nbsp; &nbsp; &nbsp; &nbsp; View Project Proposals</a></li>
                            <li class="sub-menu">
                                <a  href="">&nbsp; &nbsp; &nbsp; &nbsp; Monitor Projects</a>
                                <ul class="sub">
                                    <li><a  href="OCPD_Timeline.jsp">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; View Timeline</a></li>
                                    <li class="sub-menu">
                                        <a  href="OCPD_ViewProjectStatus">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; View Project Status</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!--multi level menu end-->
                    <li>
                        <a href="OCPD_NotificationList">
                            <i class="fa fa-book"></i>
                            <span>Notifications</span>
                        </a>
                    </li>
                    <li>
                        <a href="OCPD_ActivityList">
                            <i class="fa fa-book"></i>
                            <span>Department Activity Log</span>
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
                        Unconfirmed Meetings
                    </header>
                    <div class="panel-body">



                        <section class="panel">
                            <div class="panel-body">
                                <div class="tab-content tasi-tab">
                                    <div class="tab-pane active" id="unconfirmedMeetings">
                                        <div class="form-group">

                                            <div class="directory-info-row">
                                                <div class="row"> <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>Project</th>
                                                                <th>Scheduled Date</th>
                                                                <th>Scheduled Time</th>
                                                                <th>Agenda</th>
                                                                <th>Remarks</th>
                                                                <th></th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%for (int x = 0; x < unconfirmedMeeting.size(); x++) {
                                                                    if (unconfirmedMeeting.get(x).getDept().equalsIgnoreCase("GS")) {%>)
                                                            <tr>
                                                                <td><%=unconfirmedMProjects.get(x).getName()%></td>
                                                                <td><%=unconfirmedMeeting.get(x).getStartdate()%></td>
                                                                <td><%=unconfirmedMeeting.get(x).getTime()%></td>
                                                                <td>
                                                                    <%for (Task t : unconfirmedMeeting.get(x).getTasks()) {%>
                                                                    <p><%=t.getDescription()%></p>
                                                                    <%}%>
                                                                </td>
                                                                <td><%=unconfirmedMeeting.get(x).getRemarks()%></td>
                                                                <td>
                                                                    <button id="<%=unconfirmedMeeting.get(x).getId()%>" onclick="approveMeeting(this)" class="btn btn-sm btn-success">Approve</button>
                                                                    <button id="<%=unconfirmedMeeting.get(x).getId()%>" onclick="rescheduleModal(this)" class="btn btn-sm btn-danger">Reschedule</button>
                                                                </td>
                                                            </tr>
                                                            <%}%>
                                                            <%}%>
                                                        </tbody>
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



        <!--main content end-->

        <!-- Right Slidebar start -->
        <div class="sb-slidebar sb-right sb-style-overlay">
            <h5 class="side-title"> Pending Tasks</h5>
            <!--SAMPLE CODE FOR TASK + PROGRESS BAR
                    
                          <ul class="p-task tasks-bar">
                <li>
                    <a href="#">
                        <div class="task-info">
                            <div class="desc">Dashboard v1.3</div>
                            <div class="percent">40%</div>
                        </div>
                        <div class="progress progress-striped">
                            <div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success">
                                <span class="sr-only">40% Complete (success)</span>
                            </div>
                        </div>
                    </a>
                </li>
                          </ul>  -->

        </div>
        <!-- Right Slidebar end -->

    </section>


    <div class="modal fade" id="rescheduleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="adjMheader">Reschedule Meeting</h4>
                    <input type="hidden" id="unconId" name="unconId">
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label pull-left regFieldTitle">Set Preferred Date: </label>
                        <input type="date" class="form-control" name="preferredDate" id="preferredDate">
                    </div>
                    <div class="form-group">
                        <label class="control-label pull-left regFieldTitle">Set Preferred Time </label>
                        <input type="time" class="form-control" name="preferredTime" id="preferredTime">
                    </div>
                    <div class="form-group">
                        <label class="control-label pull-left regFieldTitle">Remarks: </label>
                        <textarea class="form-control" name="remarksSched" id="remarksSched"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success" type="button" onclick="submitReschedule()"> Submit</button>
                    <button class="btn btn-default" type="button" data-dismiss="modal"> Close</button>
                </div>
            </div>
        </div>
    </div>                                        
    <script>
        function approveMeeting(button) {
            $.ajax({
                type: 'post',
                url: 'confirmschedule',
                dataType: 'json',
                data:
                        {
                            scheduleID: button.id
                        },
                cache: false,
                success: function () {
                    alert("Meeting has been confirmed.");
                    window.location.reload();
                }
            });
        }

        function rescheduleModal(button) {
            $('#rescheduleModal').modal();
            $('#unconId').val(button.id);
        }


        function submitReschedule() {
            $.ajax({
                type: 'post',
                url: 'UpdateMeetingSched',
                dataType: 'json',
                data:
                        {
                            setDate: $('#preferredDate').val(),
                            setTime: $('#preferredTime').val(),
                            schedID: $('#unconId').val(),
                            remarks: $('#remarksSched').val()
                        },
                cache: false,
                success: function (newdate) {
                    alert("Meeting has been rescheduled on " + newdate + ". Please wait for a confirmation from the OCPD");
                    window.location.reload();
                }
            });
        }
    </script>

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

