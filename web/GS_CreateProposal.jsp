<%-- 
    Document   : GS_CreateProposal
    Created on : 09 2, 15, 8:57:31 AM
    Author     : User
--%>

<%@page import="Entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% Employee e = (Employee) session.getAttribute("user");%>
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
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" >

        <!--right slidebar-->
        <link href="css/slidebars.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet" >
        <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" >
        <link rel="stylesheet" type="text/css" href="assets/bootstrap-colorpicker/css/colorpicker.css" >
        <link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker.css" >

        <link href = 'calendar/fullcalendar.css' rel='stylesheet'>
        <link href = 'calendar/scheduler.css' rel='stylesheet'>
        <script src ='calendar/moment.min.js'></script>
        <script src ='calendar/jquery.min.js'></script>
        <script src ='calendar/fullcalendar.js'></script>
        <script src ='calendar/scheduler.js'></script>


        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->

        <style>

            #floating-panel {
                position: absolute;
                top: 10px;
                left: 25%;
                z-index: 5;
                background-color: #fff;
                padding: 5px;
                border: 1px solid #999;
                text-align: center;
                font-family: 'Roboto','sans-serif';
                line-height: 30px;
                padding-left: 10px;
            }
        </style>

        <script>
            var tableinput = [];
            var componentvalues = [];
            var materialstable = [];
            var materialvalues = [];
            var values = [];
            var tasksTemp = [];
            var tasksFinal = [];
            var schedulevalue = [];
            var taskValue = [];
        </script>
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
                            <a href="javascript:;"  class="active">
                                <i class="fa fa-tasks"></i>
                                <span>Project Proposals</span>
                            </a>
                            <ul class="sub">
                                <li><a  href="GS_CreateProposal.jsp"  class="active">&nbsp; &nbsp; &nbsp; &nbsp; Create Proposal</a></li>
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
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel">
                                <header class="panel-heading">
                                    Project Proposal
                                </header>
                                <div class="panel-body">
                                    <div class="stepy-tab">
                                        <ul id="default-titles" class="stepy-titles clearfix">
                                            <li id="default-title-0" class="current-step">
                                                <div>Description</div>
                                            </li>
                                            <li id="default-title-1" class="">
                                                <div>Materials</div>
                                            </li>
                                            <li id="default-title-2" class="">
                                                <div>Program</div>
                                            </li>

                                            <li id="default-title-3" class="">
                                                <div>Schedule</div>
                                            </li>

                                            <li id="default-title-4" class="">
                                                <div>Upload</div>
                                            </li>

                                        </ul>
                                    </div>
                                    <form class="form-horizontal" id="proposalForm" method="post" action="javascript:submitProposal()">
                                        <fieldset title="Description" class="step" id="default-step-0">
                                            <legend> </legend>
                                            <div class="form-group">
                                                <label class="col-lg-2 control-label">Project ID</label>
                                                <div class="col-lg-10">
                                                    <input id="projectID" type="text" class="form-control" name="projectid" readonly>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-2 control-label">Project Name</label>
                                                <div class="col-lg-10">
                                                    <input id="projectname" type="text" class="form-control" name="projectname" value="" placeholder="Enter project name">

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-2 control-label">Project Description</label>
                                                <div class="col-lg-10">
                                                    <textarea id="projectdescription" class="form-control" name="projectdescription" cols="60" rows="5"></textarea>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-sm-2 col-sm-2 control-label">Category</label>
                                                <div class="col-sm-10" id="maincategorydiv">
                                                    <select name="category" id="maincategory">
                                                        <option value="">Select Category</option>
                                                        <option value="Vertical">Vertical</option>
                                                        <option value="Horizontal">Horizontal</option>
                                                        <option value="Maintenance">Maintenance</option>
                                                    </select>
                                                </div>

                                            </div>


                                            <div class="form-group">
                                                <label class="col-sm-2 col-sm-2 control-label">Sub-Category</label>
                                                <div class="col-sm-10" id="subcategorydiv">

                                                    <select name="subcategory" id="subcategory">
                                                        <option value="">Select Category</option>
                                                    </select>

                                                    <input id="OtherSub" type="text" name="OtherSubCategory" placeholder="Input New Sub Category" style="display: none; width: 200px">

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-2 control-label">Location</label>
                                                <div class="col-lg-10">
                                                    <!--Map should be here -->
                                                    <div id="floating-panel">
                                                        <input onclick="removeMarker();" type=button value="Delete Markers">
                                                    </div>
                                                    <div id="map" style="height: 500px; margin: 0; padding: 0; width: 800px"></div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Target Implementation Date</label>
                                                <div class="col-md-3 col-xs-11">
                                                    <input class="form-control form-control-inline input-medium default-date-picker" name="targetimplementationdate" size="16" type="date" id="targetimplementationdate">
                                                    <span class="help-block">Select date</span>
                                                </div>
                                            </div>

                                        </fieldset>
                                        <fieldset title="Materials" class="step" id="default-step-1" >
                                            <legend> </legend>


                                            <div class="form-group">
                                                <label class="col-lg-2 control-label">Program of Works</label>
                                                <div class="col-lg-10">

                                                    <table  class="display table table-bordered table-striped" style="margin-top: 10px" id="general">
                                                        <thead>
                                                            <tr>
                                                                <th style="text-align: center; width:30%;">Item Description</th>
                                                                <th style="text-align: center; width:20%;">% of Total</th>
                                                                <th style="text-align: center; width:10%;">Quantity</th>
                                                                <th style="text-align: center; width: 15%;">Unit</th>
                                                                <th style="text-align: center; width: 25%;">Unit Price</th>
                                                                

                                                            </tr>
                                                        </thead>
                                                        <tbody id="generalbody">


                                                        </tbody>

                                                    </table>

                                                    <button type="button" class="btn btn-default" onclick="addRowGeneral()">Add</button> 
                                                    <button  id="delete" type="button" onclick="myDeleteFunctionGeneral()" class="btn btn-default">Delete</button>
                                                </div>
                                            </div>



                                        </fieldset>

                                        <fieldset title="Program" class="step" id="default-step-2" >
                                            <legend> </legend>

                                            <div class="form-group">
                                                <label class="col-lg-2 control-label">Activities</label>

                                                <!-- page start-->
                                                <div class="col-lg-10" >
                                                    <table  class="display table table-bordered table-striped" id="programworks">
                                                        <thead>
                                                            <tr>
                                                                <th style="text-align: center;">Component</th>
                                                                <th style="text-align: center;">Duration</th>
                                                                <th style="text-align: center;">Unit</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                    <button type="button" class="btn btn-default" onclick="addRowPW()">Add</button> 
                                                    <button  id="delete" type="button" onclick="myDeleteFunctionPW()" class="btn btn-default" >Delete</button>

                                                    <br>
                                                    <center>
                                                        <button type="button" class="btn btn-success" id="PWsave" onclick="setPWtocalendar()" disabled>Save</button> 
                                                    </center>    
                                                </div>


                                            </div>


                                        </fieldset>

                                        <fieldset title="Schedule" class="step" id="default-step-3" >
                                            <legend> </legend>


                                            <style>
                                                .planninglegend {color:#ff3399;}
                                                .biddinglegend {color:#00cc00;}
                                                .implementationlegend {color:#8080ff;}
                                            </style>
                                            <div class="form-group">
                                                <label class="col-lg-2 control-label">Schedule</label>

                                                <div class="col-lg-10">
                                                    <i class="fa fa-square planninglegend"></i>  Planning Events
                                                    <i class="fa fa-square biddinglegend" style="margin-left: 7px"></i>  Bidding Events
                                                    <i class="fa fa-square implementationlegend" style="margin-left: 7px"></i>  Implementation Events
                                                    <div id='calendar' style="height: 100%; width: 100%"></div>
                                                </div>
                                            </div>
                                            <%String list = null;%>  
                                            <script>
                                                $('document').ready(function () {
                                                    $.ajax({
                                                        url: 'getschedule',
                                                        type: 'POST',
                                                        dataType: 'json',
                                                        success: function (sched) {

                                                            $('#calendar').fullCalendar({
                                                                defaultView: 'month',
                                                                schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
                                                                header: {
                                                                    left: '',
                                                                    center: 'title',
                                                                    right: 'today prev,next'
                                                                },
                                                                resources: [
                                                                ],
                                                            });
                                                            inputActivities(sched);
                                                        }
                                                    });
                                                });

                                                function inputActivities(sched) {
                                                    schedulevalue.length = 0;
                                                    $('#calendar').fullCalendar('removeEvents');
                                                    $.each(sched, function (i) {
                                                        $.each(sched[i], function (j) {
                                                            var color;
                                                            if (sched[i][j].stage === "Planning")
                                                                color = '#ff3399';
                                                            else if (sched[i][j].stage === "Bidding")
                                                                color = '#00cc00';
                                                            else if (sched[i][j].stage === "Implementation")
                                                                color = '#8080ff';
                                                            var my_events = {
                                                                events: [
                                                                    {
                                                                        title: sched[i][j].event,
                                                                        start: sched[i][j].startdate,
                                                                        end: sched[i][j].enddate,
                                                                        dept: sched[i][j].dept,
                                                                        stage: sched[i][j].stage,
                                                                        color: color
                                                                    }
                                                                ]
                                                            };
                                                            var schedule = {
                                                                title: sched[i][j].event,
                                                                start: sched[i][j].startdate,
                                                                end: sched[i][j].enddate,
                                                                dept: sched[i][j].dept,
                                                                stage: sched[i][j].stage,
                                                                color: color,
                                                                status: sched[i][j].status
                                                            };
                                                            schedulevalue.push(schedule);
                                                            $('#calendar').fullCalendar('addEventSource', my_events);
                                                        });
                                                    })
                                                }
                                            </script>


                                            <input type="hidden" name="taskNo" value="tasksTemp[i][7]"><input type="hidden" name="type" value="tasksTemp[i][6]">
                                            <div id="fullCalModal" class="modal fade " data-keyboard="false" data-backdrop="static">
                                                <div class="modal-dialog">

                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">Ã—</span> <span class="sr-only">close</span></button>
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
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">Ã—</span> <span class="sr-only">close</span></button>
                                                            <h4 id="modalTitle2" class="modal-title"></h4>
                                                        </div>

                                                        <div id="modalBody" class="modal-body" style="overflow-y: auto;">
                                                            <fieldset title="Description" class="step" id="default-step-0">
                                                                <legend> </legend>
                                                                <div class="form-group">
                                                                    <label class="col-lg-2 control-label">Task</label>
                                                                    <div class="col-lg-10">
                                                                        <input type="text" class="form-control" name="taskName" id="taskName" value="">                                                                        
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-lg-2 control-label">Description</label>
                                                                    <div class="col-lg-10">
                                                                        <textarea class="form-control" name="taskDesc" id="taskDesc" cols="60" rows="3"></textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-lg-2 control-label">Start</label>
                                                                    <div class="col-lg-10">
                                                                        <input type="date" class="form-control" name="taskStart" id="taskStart" cols="60" rows="5"></textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-lg-2 control-label">End</label>
                                                                    <div class="col-lg-10">
                                                                        <input type="date" class="form-control" name="taskEnd" id="taskEnd" cols="60" rows="5">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-lg-2 control-label">Person in charge</label>
                                                                    <div class="col-lg-10">
                                                                        <input class="form-control" name="taskPerson"  id="taskPerson" cols="60" rows="5">
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

                                        </fieldset>

                                        <fieldset title="Upload" class="step" id="default-step-4" >
                                            <legend> </legend>
                                            <label>Upload from Citizen Testimonials</label>
                                            <br>

                                            <div class="form-group">


                                                <label class="col-lg-2 control-label">Input Keywords</label>
                                                <div class="col-lg-10">
                                                    <input id="keywords" name="keywords" type="text" class="default" placeholder="Separate them with ','" style="width: 20%">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 col-sm-2 control-label">Select Testimonial</label>
                                                <div class="col-sm-10" id="maincategorydiv">
                                                    <select name="category" id="citizentestimonial">
                                                        <option value="">Select Testimonial</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div id="citizenfiletable">
                                                    <table class="display table table-bordered table-striped" style="margin-top: 10px" id="citizenTestimonial">
                                                        <tbody id="testimonialbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>  

                                        </fieldset>

                                        <input type="hidden" name="hiddenlocation" id="location" value="">
                                        <input type="hidden" name="actionI" id="actionI">
                                        <button type="button" onclick ="draftbutton()" class="finish btn btn-info" >Save Draft</button>
                                        <button type="button" onclick ="finishbutton()" class="finish btn btn-success">Finish</button>



                                    </form>


                                </div>
                            </section>
                        </div>
                    </div>

                    <!-- page end-->
                </section>

                <!--Modal for Upload Files-->
                <div class="modal fade modal-dialog-center " id="fileUpload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                        <div class="modal-content-wrap">
                            <form name="uploadFiles" action="GS_UploadFile" method="POST" enctype="multipart/form-data">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Upload Proposal Files</h4>
                                    </div>
                                    <div class="modal-body">

                                        <div class="panel-body">

                                            <input type="hidden" id="UploadFileID" name="ProjectID" value="">
                                            <input type="file" name="uploadFile" multiple>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                        <button id="SubmitUpload" class="btn btn-success" type="submit"> Upload</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <div id="testModal" class="modal fade " data-keyboard="false" data-backdrop="static">
                    <div class="modal-dialog">

                        <div class="modal-content" style="">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span> <span class="sr-only">close</span></button>
                                <h4 id="" class="modal-title">Testimonial Details</h4>
                            </div>
                            <div id="modalBody" class="modal-body" style="overflow-y: auto;">
                                <div id="fDisplay"></div>
                                <fieldset title="Description" id="abcd" class="step" id="default-step-0">
                                    <header id="testTitle" class="panel-heading"></header>
                                    <header id="testDate" class="panel-heading"></header>
                                    <header id="testLoc" class="panel-heading"></header>
                                    <header id="testDesc" class="panel-heading"></header>
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" id="closeModalB" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
            <!--main content end-->

        </section>


        <!-- js placed at the end of the document so the pages load faster -->
        <!--        <script src="js/jquery.js"></script>-->
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="js/respond.min.js" ></script>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="js/jquery-ui-1.9.2.custom.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
        <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>

        <!--right slidebar-->
        <script src="js/slidebars.min.js"></script>


        <!--Form Validation-->
        <script src="js/bootstrap-validator.min.js" type="text/javascript"></script>

        <!--Form Wizard-->
        <script src="js/jquery.steps.min.js" type="text/javascript"></script>
        <script src="js/jquery.validate.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>

        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>

        <!--script for this page-->
        <script src="js/jquery.stepy.js"></script>

        <!--script for this page only-->
        <script src="js/editable-table.js"></script>

        <script>

                                            //step wizard
                                            $(function () {
                                                $('#proposalForm').stepy({
                                                    backLabel: 'Previous',
                                                    block: true,
                                                    nextLabel: 'Next',
                                                    titleClick: true,
                                                    titleTarget: '.stepy-tab'
                                                });
                                            });</script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6e73iIoB6fgzlEmgdJBFYO3DX0OhMLw&callback=initMap"
        async defer></script>



        <script>
                                            var map;
                                            var markers = [];
                                            var allPosition = [];
                                            function initMap() {
                                                map = new google.maps.Map(document.getElementById('map'), {
                                                    center: {lat: 14.45, lng: 120.98},
                                                    zoom: 14
                                                });
                                                google.maps.event.addListener(map, 'click', function (event) {
                                                    placeMarker(event.latLng);
                                                });
                                                function placeMarker(location) {
                                                    var marker = new google.maps.Marker({
                                                        position: location,
                                                        map: map
                                                    });
                                                    markers.push(marker);
                                                    latitude = marker.position.lat();
                                                    longitude = marker.position.lng();
                                                    var string = latitude + "&" + longitude;
                                                    allPosition.push(string);
                                                    document.getElementById("location").value = allPosition;
                                                }

                                            }

                                            function removeMarker() {
                                                for (var i = 0; i < markers.length; i++) {
                                                    markers[i].setMap(null);
                                                }
                                                markers = [];
                                                allPosition = [];
                                            }



        </script>

        <!--all AJAX calls go here also those functions in .js is moved here-->

        <!--For Subcategory-->
        <script>
            $(document).on("change", "#maincategory", function () {
                $.ajax({
                    type: 'POST',
                    url: 'getsubcategory',
                    dataType: 'json',
                    data: {maincategory: $('#maincategory').val()},
                    cache: false,
                    success: function (mc) {
                        $("#subcategory").empty();
                        $.each(mc, function (i) {
                            $("#subcategory").append(
                                    $("<option></option>")
                                    .text(mc[i].subCategory)
                                    .val(mc[i].subCategory)
                                    )
                                    ;
                        });
                        $("#subcategory").append(
                                $("<option></option>")
                                .text("Others")
                                .val("Others")
                                );

                    }
                });
                $.ajax({
                    url: 'generateprojectid',
                    data: {maincategory: $('#maincategory').val()},
                    type: 'POST',
                    dataType: 'json',
                    success: function (id) {
                        $('#projectID').val(id);
                    }
                });
                return false;


            });

            $(document).on("change", "#subcategory", function () {
                if ($('#subcategory').val() == "Others") {
                    document.getElementById('OtherSub').style.display = 'block';
                } else
                    document.getElementById('OtherSub').style.display = 'none';
            });


            $(document).on("change", "#subcategory", function () {
                if ($('#subcategory').val() != "Others") {
                    $.ajax({
                        type: 'POST',
                        url: 'getmaterialtable',
                        dataType: 'json',
                        data: {subcategory: $('#subcategory').val(), maincategory: $('#maincategory').val()},
                        cache: false,
                        success: function (material) {
                            $("#generalbody").empty();
                            drawTable(material);
                        }
                    });
                }
            });

            function drawTable(data) {
                for (var i = 0; i < data.length; i++) {

                    var tableID = "general";
                    var table = document.getElementById(tableID);
                    var rowCount = table.rows.length;

                    var row = table.insertRow(-1);
                    var cell1 = row.insertCell(-1);
                    var cell2 = row.insertCell(-1);
                    var cell3 = row.insertCell(-1);
                    var cell4 = row.insertCell(-1);
                    var cell5 = row.insertCell(-1);


                    var material = document.createElement('input');
                    material.type = "text";
                    material.name = "material";
                    material.value = data[i].name;
                    material.style.width = "100%";
                    material.style.height = "100%";
                    material.style.border = "none";
                    material.setAttribute("readOnly", "true");

                    var percentage = document.createElement('input');
                    percentage.type = "text";
                    percentage.name = "percentage";
                    percentage.style.width = "100%";
                    percentage.style.height = "100%";
                    percentage.style.border = "none";

                    var unitprice = document.createElement('input');
                    unitprice.type = "text";
                    unitprice.name = "unitprice";
                    unitprice.value = data[i].unitprice;
                    unitprice.style.width = "100%";
                    unitprice.style.height = "100%";
                    unitprice.style.border = "none";
                    unitprice.class = "unitprice";
                    unitprice.setAttribute("readOnly", "true");

                    var quantity = document.createElement('input');
                    quantity.value = data[i].quantity;
                    quantity.type = "text";
                    quantity.name = "quantity";
                    quantity.style.width = "100%";
                    quantity.style.height = "100%";
                    quantity.style.border = "none";
                    quantity.class = "quantity";

                    var unit = document.createElement('input');
                    unit.type = "text";
                    unit.name = "unit";
                    unit.value = data[i].unit.unit;
                    unit.style.width = "100%";
                    unit.style.height = "100%";
                    unit.style.border = "none";
                    unit.setAttribute("readOnly", "true");


                    cell1.appendChild(material);
                    cell2.appendChild(percentage);
                    cell3.appendChild(quantity);
                    cell4.appendChild(unit);
                    cell5.appendChild(unitprice);
                    
                    materialstable.push(material);
                    materialstable.push(percentage);
                    materialstable.push(quantity);
                    materialstable.push(unit);
                    materialstable.push(unitprice);
                }
            }

            $(document).on("change", "#keywords", function () {
                $.ajax({
                    type: 'POST',
                    url: 'gettestimonialdropdown',
                    dataType: 'json',
                    data: {keywords: $('#keywords').val()},
                    cache: false,
                    success: function (testimonial) {
                        $("#citizentestimonial").empty();
                        $("#citizentestimonial").append($("<option></option>").text("Select Option"));
                        $.each(testimonial, function (i) {
                            $("#citizentestimonial").append(
                                    $("<option></option>")
                                    .text(testimonial[i].title)
                                    .val(testimonial[i].id)
                                    )
                                    ;
                        });
                    }
                });
                return false;
            });

            $(document).on("change", "#citizentestimonial", function () {
                $.ajax({
                    type: 'POST',
                    url: 'gettestimonialtable',
                    dataType: 'json',
                    data: {testimonialid: $('#citizentestimonial').val()},
                    cache: false,
                    success: function (files) {
                        $("#testimonialbody").empty();
                        drawTableC(files);
                    }
                });
            });

            function drawRowC(files) {
                var row = $("<tr />");
                $("#testimonialbody").append(row);
                row.append($("<td> <input type='checkbox' class='filetid' name='filetid' value='" + files.id + "'> </td>"));
                row.append($("<td>" + files.fileName + "</td>"));
                row.append($("<td>" + files.dateUploaded + "</td>"));
                row.append($("<button type='button' value=" + files.id + " class = 'btn btn-info btn-sm' onclick='getTestimonial(" + files.id + ")'>View Testimonial</button>"));
            }

            function getTestimonial(id) {
                $.ajax({
                    type: 'POST',
                    url: 'gettestimonial',
                    dataType: 'json',
                    data: {testId: id},
                    cache: false,
                    success: function (f) {
                        $('#fDisplay').empty();
                        var url = f.testimonial.folderName + "/" + f.fileName;
                        if (f.type === "Video") {
                            $("<div data-p=\"144.50\"><video><source src=" + url + " type=\"video/mp4\"><source src=" + url + " type=\"video/ogg\"></video></div>").appendTo("#fDisplay");

                        }
                        else if (f.type === "Image") {
                            $("<img src=\"" + url + "\" style=\"max-width: 570px; height:400px;\">").appendTo("#fDisplay");

                        }

                        else if (f.type === "Document") {
                            $("#docH").remove();
                            $("<header id=\"docH\" class=\"panel-heading\">File: " + "<a class=\"panel-heading\" href=\"" + url + "\">" + f.fileName + "</a> </header>").appendTo("#abcd");
                        }
                        $('#testTitle').text("Title: " + f.testimonial.title);
                        $('#testDate').text("Date Uploaded: " + f.testimonial.dateUploaded);
                        $('#testLoc').text("Location Details: " + f.testimonial.location + " + " + f.testimonial.locationdetails);
                        $('#testDesc').text("Description: " + f.testimonial.message);
                        $('#testModal').modal();
                    }
                });
            }
            ;

            function drawTableC(data) {
                for (var i = 0; i < data.length; i++) {
                    drawRowC(data[i]);
                }
            }

            function addRowGeneral() {
                //debugger;
                var tableID = "general";
                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;


                var row = table.insertRow(-1);
                var cell1 = row.insertCell(-1);
                var cell2 = row.insertCell(-1);
                var cell3 = row.insertCell(-1);
                var cell4 = row.insertCell(-1);
                var cell5 = row.insertCell(-1);


                var material = document.createElement('input');
                material.type = "text";
                material.name = "material";
                material.style.width = "100%";
                material.style.height = "100%";
                material.style.border = "none";

                var percentage = document.createElement('input');
                percentage.type = "text";
                percentage.name = "percentage";
                percentage.style.width = "100%";
                percentage.style.height = "100%";
                percentage.style.border = "none";

                var unitprice = document.createElement('input');
                unitprice.type = "text";
                unitprice.name = "unitprice";
                unitprice.style.width = "100%";
                unitprice.style.height = "100%";
                unitprice.style.border = "none";
                unitprice.class = "unitprice";

                var quantity = document.createElement('input');
                quantity.type = "text";
                quantity.name = "quantity";
                quantity.style.width = "100%";
                quantity.style.height = "100%";
                quantity.style.border = "none";
                quantity.class = "quantity";

                var array = ["N/A", "pcs", "kg", "ft", "lbs", "cm", "lot", "cu.m", "sq.m"];
                var unit = document.createElement("select");
                unit.setAttribute("id", "myunitSelect");
                unit.name = "unit";

                for (var i = 0; i < array.length; i++) {
                    var option = document.createElement("option");
                    option.setAttribute("value", array[i]);
                    option.text = array[i];
                    unit.appendChild(option);
                }
                unit.style.width = "100%";
                unit.style.height = "100%";
                unit.style.border = "none";

                cell1.appendChild(material);
                cell2.appendChild(percentage);
                cell3.appendChild(quantity);
                cell4.appendChild(unit);
                cell5.appendChild(unitprice);

                //set the components into material array
                materialstable.push(material);
                materialstable.push(percentage);
                materialstable.push(quantity);
                materialstable.push(unit);
                materialstable.push(unitprice);
            }


            //Add Function for total Here
            //$(document).on("change", $('input.unitprice[class="unitprice"],input.quantity[class="quantity"]'), function () {
            //});


            function addRowPW() {                 //debugger;
                var tableID = "programworks";
                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;


                var row = table.insertRow(-1);
                var cell1 = row.insertCell(-1);
                var cell2 = row.insertCell(-1);
                var cell3 = row.insertCell(-1);

                var component = document.createElement('input');
                component.id = "componentid";
                component.type = "text";
                component.name = "component";
                component.style.width = "100%";
                component.style.height = "100%";
                component.style.border = "none";
                tableinput.push(component);


                var duration = document.createElement('input');
                duration.id = "durationid";
                duration.type = "text";
                duration.name = "duration";
                duration.style.width = "100%";
                duration.style.height = "100%";
                duration.style.border = "none";
                tableinput.push(duration);


                var unit = document.createElement('select');
                var arr = ["Day/s", "Week/s", "Month/s"];
                unit.name = "powUnit";
                unit.id = "unitid";
                unit.style.width = "100%";
                unit.style.height = "100%";
                unit.style.border = "none";
                for (var i = 0; i < arr.length; i++) {
                    var option = document.createElement("option");
                    option.value = arr[i];
                    option.text = arr[i];
                    unit.appendChild(option);
                }
                tableinput.push(unit);

                document.getElementById("PWsave").disabled = true;

                cell1.appendChild(component);
                cell2.appendChild(duration);
                cell3.appendChild(unit);

            }

            $(document).ready(function () {
                var form = $("#wizard-validation-form");
                form.validate({
                    errorPlacement: function errorPlacement(error, element) {
                        element.after(error);
                    }
                });
                form.children("div").steps({headerTag: "h3",
                    bodyTag: "section",
                    transitionEffect: "slideLeft",
                    onStepChanging: function (event, currentIndex, newIndex) {
                        form.validate().settings.ignore = ":disabled,:hidden";
                        return form.valid();
                    },
                    onFinishing: function (event, currentIndex) {
                        form.validate().settings.ignore = ":disabled";
                        return form.valid();
                    },
                    onFinished: function (event, currentIndex) {
                        alert("Submitted!");
                    }
                });

            });

            function delBtn(btn) {
                var row = btn.parentNode.parentNode;
                row.parentNode.removeChild(row);
            }

            function myCreateFunction() {
                var table = document.getElementById("costtable");
                var row = table.insertRow(-1);
                var cell1 = row.insertCell(-1).contentEditable = true;
                var cell2 = row.insertCell(-1).contentEditable = true;
                var cell3 = row.insertCell(-1).contentEditable = true;
                var cell4 = row.insertCell(-1).contentEditable = true;

            }

            function myDeleteFunctionGeneral() {

                document.getElementById("general").deleteRow(-1);
                for (x = 0; x < 5; x++) {
                    materialstable.pop();
                }
            }

            function myDeleteFunctionPW() {

                document.getElementById("programworks").deleteRow(-1);

                for (x = 0; x < 3; x++) {
                    tableinput.pop();
                }
            }


            function myDeleteFunction2() {

                document.getElementById("component").deleteRow(-1);

            }

            $(document).on("change", "#componentid,#descriptionid,#unitid", function () {

                if (verifytable() === "true") {
                    document.getElementById("PWsave").disabled = false;

                }
                else
                    document.getElementById("PWsave").disabled = true;

            });


            function verifytable() {
                var temp;

                for (x = 0; x < tableinput.length; x++) {

                    if (tableinput[x].value.length > 0) {
                        temp = "true";
                    }
                    else {
                        temp = "false";
                        return temp;
                    }
                }

                return temp;
            }

            function setPWtocalendar() {
                //ajax call here
                while (values.length > 0) {
                    values.pop();
                }

                for (x = 0; x < tableinput.length; x++) {
                    values.push(tableinput[x].value);
                }
                var json = JSON.stringify(values);

                $.ajax({
                    type: 'POST', url: 'getpwschedule',
                    dataType: 'json',
                    data: {tableinputs: json, targetimplementationdate: $('#targetimplementationdate').val()},
                    cache: false,
                    success: function (sched) {
                        alert("programs are successfully saved");
                        inputActivities(sched);
                    }
                });

            }

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
                                $("&nbsp <p class=\"control-label\">Description: " + tasksFinal[i][2] + "</p>").appendTo("#fullCalModalBody");

                            if (tasksFinal[i][3] !== "")
                                $("&nbsp <p class=\"control-label\">Start: " + tasksFinal[i][3] + "</p>").appendTo("#fullCalModalBody");

                            if (tasksFinal[i][4] !== "")
                                $("&nbsp <p class=\"control-label\">End: " + tasksFinal[i][4] + "</p>").appendTo("#fullCalModalBody");

                            if (tasksFinal[i][5] !== "")
                                $("&nbsp <p class=\"control-label\">Person in Charge: " + tasksFinal[i][5] + "</p>").appendTo("#fullCalModalBody");
                            $("<header class=\"panel-heading\"></header>").appendTo("#fullCalModalBody");

                        }

                    });

                    $.each(tasksTemp, function (i) {
                        if (tasksTemp[i][0] === event) {
                            $("<span class=\"pull-right\" aria-hidden=\"true\"><button type=\"button\" class=\"btn btn-info btn-sm\" onclick=\"editView(this)\" id=\"" + i + "-" + tasksTemp[i][6] + "\"><i class=\"fa fa-pencil\"></i>&nbsp</button><button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"deleteTask(this)\" id=\"" + i + "-" + tasksTemp[i][6] + "\"><i class=\"fa fa-times\"></i></button></span>").appendTo("#fullCalModalBody");
                            $("<b> <p class=\"control-label\" style=\" font-size: medium;\">Task: " + tasksTemp[i][1] + "</p></b>").appendTo("#fullCalModalBody");

                            if (tasksTemp[i][2] !== "")
                                $("&nbsp <p class=\"control-label\">Description: " + tasksTemp[i][2] + "</p>").appendTo("#fullCalModalBody");

                            if (tasksTemp[i][3] !== "")
                                $("&nbsp <p class=\"control-label\">Start: " + tasksTemp[i][3] + "</p>").appendTo("#fullCalModalBody");

                            if (tasksTemp[i][4] !== "")
                                $("&nbsp <p class=\"control-label\">End: " + tasksTemp[i][4] + "</p>").appendTo("#fullCalModalBody");

                            if (tasksTemp[i][5] !== "")
                                $("&nbsp <p class=\"control-label\">Person in Charge: " + tasksTemp[i][5] + "</p>").appendTo("#fullCalModalBody");
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

            function draftbutton() {
                $('#actionI').val("draft");
            }
            function finishbutton() {
                $('#actionI').val("finish");
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

            function saveDraft() {
                var location;
                var details;
                var materials;
                var schedule;
                var upload;
                $.ajax({
                    type: 'POST',
                    url: 'saveasdraft',
                    dataType: 'json',
                    data: {details: details, location: location, materials: materials,
                        schedule: schedule, upload: upload},
                    cache: false,
                    success: function (sched) {
                        //servlet that redirects to list of projects
                    }
                });

            }

            function submitProposal() {

                while (0 < materialstable.length) {

                    var material = {
                        material: materialstable[materialstable.length - 5].value,
                        percentage: materialstable[materialstable.length - 4].value,
                        quantity: materialstable[materialstable.length - 3].value,
                        unit: materialstable[materialstable.length - 2].value,
                        unitprice: materialstable[materialstable.length - 1].value
                    };
                    materialvalues.push(material);
                    materialstable.pop();
                    materialstable.pop();
                    materialstable.pop();
                    materialstable.pop();
                    materialstable.pop();
                }

                while (0 < tableinput.length) {

                    var component = {
                        component: tableinput[tableinput.length - 3].value,
                        duration: tableinput[tableinput.length - 2].value,
                        unit: tableinput[tableinput.length - 1].value
                    };
                    componentvalues.push(component);
                    tableinput.pop();
                    tableinput.pop();
                    tableinput.pop();
                }


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

                var subcategory;

                if ($('#subcategory').val() == "Others") {
                    subcategory = $('#OtherSub').val();
                } else
                    subcategory = $('#subcategory').val();

                var files = $('input[type="checkbox"].filetid:checked').map(function () {
                    return $(this).val();
                }).toArray();
                $.ajax({
                    type: 'post',
                    url: 'GS_SubmitProposal',
                    dataType: 'json',
                    data:
                            {
                                projectid: $('#projectID').val(),
                                projectname: $('#projectname').val(),
                                projectdescription: $('#projectdescription').val(),
                                category: $('#maincategory').val(),
                                subcategory: subcategory,
                                hiddenlocation: $('#location').val(),
                                materialvalues: JSON.stringify(materialvalues),
                                componentvalues: JSON.stringify(componentvalues),
                                eventvalues: JSON.stringify(schedulevalue),
                                tfilevalues: JSON.stringify(files),
                                actionI: $('#actionI').val()
                            },
                    cache: false,
                    success: function (data) {
                        alert("Project has been submitted");
                        window.location = data.url;
                    }
                });
            }

        </script>    

    </body>
</html>
