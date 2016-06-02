

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
<%Contractor_User c = (Contractor_User) session.getAttribute("user");%>
<%Project p = (Project) request.getAttribute("project");%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>View Project</title>

        <!-- Bootstrap core CSS -->
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
            .editablelegend {color:#00ffaa;}
            .uneditablelegend {color:#ff6666;}
        </style>
        <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->
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
                                    <p class="yellow">You have XX notifications</p>
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
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <img alt="" src="img/avatar1_small.jpg">
                                <span class="username">Hello <b><u><%=c.getName()%></u></b>!</span>
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


                            <section class="panel">
                                <div class="bio-graph-heading project-heading">
                                    <strong>Schedule</strong>
                                </div>
                                <div class="panel-body bio-graph-info">
                                    <div id='calendar' style="height: 100%; width: 100%"></div>
                                </div>
                                <center><button class="btn btn-success" onclick="submitTask()">Save All Tasks</button></center>
                                <br>
                            </section>
                            <input type="hidden" id="projId" value="<%=p.getId()%>" name="projId">
                            <script>
                                $('document').ready(function () {
                                    $.ajax({
                                        url: 'getscheduleforview',
                                        type: 'POST',
                                        dataType: 'json',
                                        data: {projId: $('#projId').val()},
                                        success: function (sched) {

                                            $('#calendar').fullCalendar({
                                                defaultView: 'month',
                                                schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
                                                header: {
                                                    left: '',
                                                    center: 'title',
                                                    right: 'today prev,next'

                                                },
                                                eventClick: function (event, jsEvent, view) {
                                                    sortTasksFinal();
                                                    $("#eventTag").val(event.title);
                                                    viewTasks(event.title);
                                                    $("#saveTaskB").click(function () {
                                                        saveTask();
                                                    });
                                                    var st = moment(event.start).format('YYYY-MM-DD');
                                                    var en = moment(event.end).format('YYYY-MM-DD');
                                                    $('#taskStart').val(st);
                                                    $('#taskEnd').val(en);


                                                }

                                            });
                                            inputActivities(sched);
                                        }
                                    });
                                });

                                function inputActivities(sched) {
                                    schedulevalue.length = 0;
                                    $.each(sched, function (i) {
                                        if (sched[i].stage === "Implementation") {
                                            var my_events = {
                                                events: [
                                                    {
                                                        title: sched[i].event,
                                                        start: sched[i].startdate,
                                                        end: sched[i].enddate,
                                                        dept: sched[i].dept,
                                                        stage: sched[i].stage,
                                                    }
                                                ]
                                            };
                                            var schedule = {
                                                title: sched[i].event,
                                                start: sched[i].startdate,
                                                end: sched[i].enddate,
                                                dept: sched[i].dept,
                                                stage: sched[i].stage,
                                                status: sched[i].status
                                            };
                                            schedulevalue.push(schedule);
                                            $('#calendar').fullCalendar('addEventSource', my_events);
                                        }
                                    });
                                }

                            </script>

                            <input type="hidden" name="" id="projectID" value="<%=p.getId()%>">


                            <input type="hidden" name="taskNo" value="tasksTemp[i][7]"><input type="hidden" name="type" value="tasksTemp[i][6]">
                            <div id="fullCalModal" class="modal fade " data-keyboard="false" data-backdrop="static">
                                <div class="modal-dialog">

                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span> <span class="sr-only">close</span></button>
                                            <h4 id="modalTitle" class="modal-title"></h4>
                                            <input type="hidden" id="eventTag">
                                        </div>

                                        <div id="fullCalModalBody" class="modal-body">


                                        </div>
                                        <div class="modal-footer">
                                            <span class="pull-left"><button type="button" class="btn btn-info" id="showTaskMod" >Add Task</button></span>
                                            <button type="button" class="btn btn-success" id="saveTaskB">Save</button>
                                            <button type="button" class="btn btn-default" id="closeModalB" onclick="closeModal()">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>   

                            <div id="displayTasks" class="modal fade " data-keyboard="false" data-backdrop="static">
                                <div class="modal-dialog">

                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span> <span class="sr-only">close</span></button>
                                            <h4 id="modalTitle2" class="modal-title"></h4>
                                        </div>

                                        <div id="modalBody" class="modal-body" style="overflow-y: auto;">
                                            <fieldset title="Description" class="step" id="default-step-0">
                                                <legend> </legend>
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">Task</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" name="taskName" id="taskName" value=""><br>                                                                        
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">Description</label>
                                                    <div class="col-lg-10">
                                                        <textarea class="form-control" name="taskDesc" id="taskDesc" cols="60" rows="3"></textarea><br>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">Start</label>
                                                    <div class="col-lg-10">
                                                        <input type="date" class="form-control" name="taskStart" id="taskStart" cols="60" rows="5"></textarea><br>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">End</label>
                                                    <div class="col-lg-10">
                                                        <input type="date" class="form-control" name="taskEnd" id="taskEnd" cols="60" rows="5"><br>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">Person in charge</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control" name="taskPerson"  id="taskPerson" cols="60" rows="5"><br>
                                                    </div>
                                                </div>

                                            </fieldset>
                                            <center><button type="button" class="btn btn-info" id="addTaskB">Add Task</button></center>

                                        </div>
                                        <div class="modal-footer">
                                            <span class="pull-left"><button type="button" class="btn btn-info" id="viewTasksB" >View Tasks</button></span>
                                            <button type="button" class="btn btn-default" id="closeModalB" onclick="closeModal()">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>

                    </div>

                    <!-- page end-->
                </section>

            </section>



        </section>





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
        <!--
                <script>
                     $('#scheduleB').click(function () {
                        $('#comHead').text("Schedule");
                        $('#detailsTA').hide();
                        $('#materialsTA').hide();
                        $('#scheduleTA').show();
                        $('#testimonialTA').hide();
                        $('#addComments').modal();
                    });
        
        
        
                </script>-->
        <script>
                                                $(document).ready(function () {
                                                    $.ajax({
                                                        type: 'POST',
                                                        url: 'gettasks',
                                                        dataType: 'json',
                                                        data: {projId: $('#projectID').val()},
                                                        cache: false,
                                                        success: function (tasks) {
                                                            $.each(tasks, function (i) {
                                                                var task = [tasks[i].schedule2.event, tasks[i].name, tasks[i].description, tasks[i].startDate, tasks[i].endDate, tasks[i].personInCharge, "Final", tasksFinal.length];
                                                                tasksFinal.push(task);
                                                            });
                                                        }

                                                    });
                                                });
                                                var tasksTemp = [];
                                                var tasksFinal = [];
                                                var taskValue = [];
                                                var schedulevalue = [];

                                                function showAddTaskForm() {
                                                    $('#modalTitle2').html($('#eventTag').val());
                                                    $('#displayTasks').modal();
                                                    $('#addTaskB').text("Add");
                                                    $("#addTaskB").click(function () {
                                                        addTask();
                                                    });
                                                    $("#viewTasksB").click(function () {
                                                        viewTasks();
                                                    });
                                                    $('#fullCalModal').modal('hide');
                                                }

                                                function addTask() {
                                                    var task = [];
                                                    if ($('#taskName').val() !== '') {
                                                        task = [$("#eventTag").val(), $('#taskName').val(), $('#taskDesc').val(), $('#taskStart').val(), $('#taskEnd').val(), $('#taskPerson').val(), "Temporary", tasksTemp.length];
                                                        tasksTemp.push(task);
                                                    }
                                                    $('#taskName').val('');
                                                    $('#taskDesc').val('');
                                                    $('#taskStart').val('');
                                                    $('#taskEnd').val('');
                                                    $('#taskPerson').val('');

                                                    viewTasks();

                                                }

                                                function saveTask() {
                                                    var task = [];
                                                    $.each(tasksTemp, function (i) {
                                                        task = [tasksTemp[0], tasksTemp[0], tasksTemp[0], tasksTemp[0], tasksTemp[0], tasksTemp[0], "Final", tasksFinal.length];

                                                        tasksFinal.push(tasksTemp[i]);
                                                    });
                                                    $('#fullCalModalBody').empty();
                                                    $('#displayTasks').modal('hide');
                                                    $('#fullCalModal').modal('hide');
                                                    tasksTemp.length = 0;
                                                }

                                                function closeModal() {
                                                    if (tasksTemp.length > 0) {
                                                        viewTasks();
                                                        if (confirm("You have tasks that weren't saved. Are you sure you want to close this?")) {
                                                            $('#fullCalModalBody').empty();
                                                            $('#displayTasks').modal('hide');
                                                            $('#fullCalModal').modal('hide');
                                                            tasksTemp.length = 0;
                                                        }
                                                        else
                                                            return false;

                                                    }
                                                    else {
                                                        $('#fullCalModalBody').empty();
                                                        $('#displayTasks').modal('hide');
                                                        $('#fullCalModal').modal('hide');

                                                    }


                                                }

                                                function viewTasks() {
                                                    var event = $("#eventTag").val();
                                                    if (getTaskCount(event) < 1) {
                                                        $('#fullCalModalBody').empty();
                                                        $("<center><header class=\"panel-heading\" id=\"noTask\">No tasks for this activity yet</header></center>").appendTo("#fullCalModalBody");
                                                    }
                                                    else {
                                                        $('#fullCalModalBody').html('');
                                                        $.each(tasksFinal, function (i) {
                                                            if (tasksFinal[i][0] === event) {
                                                                $("<span class=\"pull-right\" aria-hidden=\"true\"><button type=\"button\" class=\"btn btn-info btn-sm\" onclick=\"editView(this)\" id=\"" + i + "-Final\"><i class=\"fa fa-pencil\"></i>&nbsp</button><button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"deleteTask(this)\" id=\"" + i + "-Final\"><i class=\"fa fa-times\"></i></button></span>").appendTo("#fullCalModalBody");
                                                                $("<b> <p class=\"control-label\" style=\" font-size: medium;\">Task: " + tasksFinal[i][1] + "</p></b>").appendTo("#fullCalModalBody");

                                                                if (tasksFinal[i][2] !== "")
                                                                    $("<p class=\"control-label\">Description: " + tasksFinal[i][2] + "</p>").appendTo("#fullCalModalBody");

                                                                if (tasksFinal[i][3] !== "")
                                                                    $("<p class=\"control-label\">Start: " + tasksFinal[i][3] + "</p>").appendTo("#fullCalModalBody");

                                                                if (tasksFinal[i][4] !== "")
                                                                    $("<p class=\"control-label\">End: " + tasksFinal[i][4] + "</p>").appendTo("#fullCalModalBody");

                                                                if (tasksFinal[i][5] !== "")
                                                                    $("<p class=\"control-label\">Person in Charge: " + tasksFinal[i][5] + "</p>").appendTo("#fullCalModalBody");
                                                                $("<header class=\"panel-heading\"></header>").appendTo("#fullCalModalBody");

                                                            }

                                                        });

                                                        $.each(tasksTemp, function (i) {
                                                            if (tasksTemp[i][0] === event) {
                                                                $("<span class=\"pull-right\" aria-hidden=\"true\"><button type=\"button\" class=\"btn btn-info btn-sm\" onclick=\"editView(this)\" id=\"" + i + "-" + tasksTemp[i][6] + "\"><i class=\"fa fa-pencil\"></i>&nbsp</button><button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"deleteTask(this)\" id=\"" + i + "-" + tasksTemp[i][6] + "\"><i class=\"fa fa-times\"></i></button></span>").appendTo("#fullCalModalBody");
                                                                $("<b> <p class=\"control-label\" style=\" font-size: medium;\">Task: " + tasksTemp[i][1] + "</p></b>").appendTo("#fullCalModalBody");

                                                                if (tasksTemp[i][2] !== "")
                                                                    $(" <p class=\"control-label\">Description: " + tasksTemp[i][2] + "</p>").appendTo("#fullCalModalBody");

                                                                if (tasksTemp[i][3] !== "")
                                                                    $(" <p class=\"control-label\">Start: " + tasksTemp[i][3] + "</p>").appendTo("#fullCalModalBody");

                                                                if (tasksTemp[i][4] !== "")
                                                                    $(" <p class=\"control-label\">End: " + tasksTemp[i][4] + "</p>").appendTo("#fullCalModalBody");

                                                                if (tasksTemp[i][5] !== "")
                                                                    $(" <p class=\"control-label\">Person in Charge: " + tasksTemp[i][5] + "</p>").appendTo("#fullCalModalBody");
                                                                $("<header class=\"panel-heading\"></header>").appendTo("#fullCalModalBody");

                                                            }

                                                        });

                                                    }
                                                    $('#modalTitle').html($('#eventTag').val());
                                                    $('#fullCalModal').modal();
                                                    $("#addTaskB").click(function () {
                                                        addTask();
                                                    });
                                                    $("#showTaskMod").click(function () {
                                                        showAddTaskForm();
                                                    });
                                                    $('#displayTasks').modal('hide');


                                                }

                                                function getTaskCount() {
                                                    var counter = 0;
                                                    var event = $("#eventTag").val();

                                                    $.each(tasksTemp, function (i) {
                                                        if (tasksTemp[i][0] === event) {
                                                            counter++;
                                                        }
                                                    });

                                                    $.each(tasksFinal, function (i) {
                                                        if (tasksFinal[i][0] === event)
                                                            counter++;
                                                    });
                                                    return counter;
                                                }

                                                function editView(button) {
                                                    var taskNoStatus = button.id;
                                                    var getSched = taskNoStatus.split('-');
                                                    var task = [];
                                                    if (getSched[1] === "Temporary") {
                                                        task = tasksTemp[getSched[0]];
                                                    }
                                                    else if (getSched[1] === "Final") {
                                                        task = tasksFinal[getSched[0]];
                                                    }

                                                    $('#modalTitle2').html($('#eventTag').val());
                                                    $('#taskName').val(task[1]);
                                                    $('#taskDesc').val(task[2]);
                                                    $('#taskStart').val(task[3]);
                                                    $('#taskEnd').val(task[4]);
                                                    $('#taskPerson').val(task[5]);
                                                    $('#displayTasks').modal();
                                                    $('#addTaskB').text("Save Changes");
                                                    $("#addTaskB").click(function () {
                                                        editTask(taskNoStatus);
                                                    });
                                                    $("#viewTasksB").click(function () {
                                                        viewTasks();
                                                    });
                                                    $('#fullCalModal').modal('hide');

                                                    return getSched;
                                                }

                                                function editTask(taskNoStatus) {
                                                    var getSched = taskNoStatus.split('-');
                                                    var task = [];

                                                    if (getSched[1] === "Temporary") {
                                                        tasksTemp[getSched[0]] = task;
                                                        if ($('#taskName').val() !== '') {
                                                            task = [$("#eventTag").val(), $('#taskName').val(), $('#taskDesc').val(), $('#taskStart').val(), $('#taskEnd').val(), $('#taskPerson').val(), "Temporary", getSched[0]];
                                                        }

                                                    }
                                                    else if (getSched[1] === "Final") {
                                                        tasksFinal[getSched[0]] = task;
                                                        if ($('#taskName').val() !== '') {
                                                            task = [$("#eventTag").val(), $('#taskName').val(), $('#taskDesc').val(), $('#taskStart').val(), $('#taskEnd').val(), $('#taskPerson').val(), "Temporary", getSched[0]];
                                                        }

                                                    }

                                                    $('#taskName').val('');
                                                    $('#taskDesc').val('');
                                                    $('#taskStart').val('');
                                                    $('#taskEnd').val('');
                                                    $('#taskPerson').val('');

                                                    viewTasks();

                                                }

                                                function deleteTask(button) {
                                                    var taskNoStatus = button.id;
                                                    var getSched = taskNoStatus.split('-');
                                                    if (getSched[1] === "Temporary") {
                                                        tasksTemp.splice(getSched[0], 1);
                                                    }
                                                    else if (getSched[1] === "Final") {
                                                        tasksFinal.splice(getSched[0], 1);
                                                    }
                                                    viewTasks();
                                                }

                                                function submitTask() {

                                                    for (x = 0; x < tasksFinal.length; x++) {

                                                        var task = {
                                                            Activity: tasksFinal[x][0],
                                                            Task: tasksFinal[x][1],
                                                            Description: tasksFinal[x][2],
                                                            StartDate: tasksFinal[x][3],
                                                            EndDate: tasksFinal[x][4],
                                                            PersonInCharge: tasksFinal[x][5],
                                                            Status: tasksFinal[x][6],
                                                            Index: tasksFinal[x][7]
                                                        };
                                                        taskValue.push(task);
                                                    }

                                                    $.ajax({
                                                        type: 'post',
                                                        url: 'Contractor_AddTask',
                                                        dataType: 'json',
                                                        data:
                                                                {
                                                                    projectid: $('#projectID').val(),
                                                                    eventvalues: JSON.stringify(schedulevalue),
                                                                    taskvalues: JSON.stringify(taskValue)
                                                                },
                                                        cache: false,
                                                        success: function () {
                                                            alert("Tasks have been saved");
                                                        }
                                                    });
                                                }

                                                function sortTasksFinal() {
                                                    tasksFinal.sort(function (a, b) {
                                                        return new Date(a[3]).getTime() - new Date(b[3]).getTime();
                                                    });

                                                }
        </script>





    </body>

</html>