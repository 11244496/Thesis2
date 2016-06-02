<%-- 
    Document   : GS_ViewProjectDetails
    Created on : 03 18, 16, 9:57:47 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Project_Inspection"%>
<%@page import="Entity.Project_Progress"%>
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
<%Project p = (Project) session.getAttribute("project");%>
<%float cost = (Float) session.getAttribute("cost");%>
<%ArrayList<Material> materials = p.getMaterials();%>
<%ArrayList<Schedule> schedule = p.getSchedule();%>
<%ArrayList<Files> files = p.getFiles();%>
<%ArrayList<Testimonial> tList = (ArrayList<Testimonial>) session.getAttribute("testimonials");%>
<%DecimalFormat df = new DecimalFormat("#,###.00");%>
<%Employee e = (Employee) session.getAttribute("user");%>
<%ArrayList<Project_Progress> pp = (ArrayList<Project_Progress>) session.getAttribute("pp");%>
<%ArrayList<Project_Inspection> pi = (ArrayList<Project_Inspection>) session.getAttribute("pi");%>
<%    ArrayList<Schedule> sched = (ArrayList<Schedule>) request.getAttribute("allsched");
%>

<%ArrayList<Files> pfiles = (ArrayList<Files>) session.getAttribute("pFiles");%>
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

        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0; margin-left: 2cm;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 20px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 20px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg .tg-s6z2{text-align:center}
            .tg .tg-baqh{text-align:center;vertical-align:top}
            .tg .tg-yw4l{vertical-align:top}
        </style>  



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

            <section id="main-content">
                <section class="wrapper site-min-height">
                    <!-- page start-->
                    <section class="panel">

                        <header class="panel-heading">
                            <h3>Accomplishment Report</h3>

                            <span class="pull-right">
                            </span>
                        </header>
                    </section>

                    <div class="row">

                        <div class="col-md-12">
                            <section class="panel">
                                <div class="bio-graph-heading project-heading">
                                    <strong><%=p.getName()%> </strong>
                                </div><p>
                                <div class="panel-body bio-graph-info">
                                    <!--<h1>New Dashboard BS3 </h1>-->
                                    <div class="row">
                                        <div class="col-lg-5" >
                                            <section class="panel">
                                                <div class="panel-body">


                                                    <!------------------------------------------------------DETAILS------------------------------------------>
                                                    <div>
                                                        <p><span class="bold">Project ID: </span></p>
                                                        <p><%=p.getId()%></p>
                                                    </div><br>

                                                    <div>
                                                        <p><span class="bold">Brief description: </span></p>
                                                        <p><%=p.getDescription()%></p>
                                                    </div><br>

                                                    <div>
                                                        <p><span class="bold">Category </span>:</p>
                                                        <p><%=p.getType()%>&nbsp;-&nbsp;<%=p.getCategory().getSubCategory()%></p>
                                                    </div><br>
                                                    <div>
                                                        <p><span class="bold">Date Submitted</span> :</p>
                                                        <p><%=p.getDatesubmitted()%></p>
                                                    </div><br>
                                                    <%if (p.getBudget() != 0) {%>

                                                    <div>
                                                        <p><span class="bold">Budget</span> :</p>
                                                        <p>PHP <%=df.format(p.getBudget())%></p>
                                                    </div><br>
                                                    <%}%>
                                                    <div>
                                                        <p><span class="bold">Additional Files:</span> :</p>
                                                        <p>FILE.doc</p>
                                                    </div>

                                                    <br>  

                                                    <p><span class="bold">Project Progress:</span> :</p>

                                                    <%
                                                        double percentage = (Double) session.getAttribute("percentage");
                                                    %>

                                                    <div class="progress progress-striped active ">
                                                        <div style="width: <%=percentage%>%;" class="progress-bar progress-bar-success"></div>
                                                    </div>
                                                    <small>Current Status: <%out.print(p.getStatus());%></small>



                                                </div>
                                            </section>
                                        </div>

                                        <!------------------------------------------------------LOCATION------------------------------------------>

                                        <div class="col-lg-6">
                                            <section class="panel">
                                                <div class="panel-body">                            
                                                    <div><p><span class="bold">Location: </span> :</p></div>
                                                    <div class="panel-body bio-graph-info">
                                                        <center>
                                                            <div id="map" style="height: 500px; width: 575px; margin: 0; padding: 0;"></div>
                                                        </center>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6e73iIoB6fgzlEmgdJBFYO3DX0OhMLw&callback=initMap" async defer></script>

                                <script>
                                    var map;
                                    var markers = <%=session.getAttribute("location")%>;
                                    function initMap() {
                                        map = new google.maps.Map(document.getElementById('map'), {
                                            center: {lat: 14.45, lng: 120.98},
                                            zoom: 14
                                        });

                                        markers.forEach(function (coor) {
                                            var geocoder = new google.maps.Geocoder;
                                            var latLng = new google.maps.LatLng(coor.longs, coor.lats);
                                            var marker = new google.maps.Marker({
                                                position: latLng,
                                                map: map
                                            });

                                            var infowindow = new google.maps.InfoWindow;

                                            marker.addListener('click', function () {
                                                geocodeLatLng(geocoder, map, infowindow, latLng);
                                            });
                                        });

                                    }

                                    function geocodeLatLng(geocoder, map, infowindow, latLng) {
                                        var latlng = latLng;
                                        geocoder.geocode({'location': latlng}, function (results, status) {
                                            if (status === google.maps.GeocoderStatus.OK) {
                                                if (results[0]) {
                                                    var marker = new google.maps.Marker({
                                                        position: latlng,
                                                        map: map
                                                    });
                                                    infowindow.setContent(results[0].formatted_address);
                                                    infowindow.open(map, marker);
                                                } else {
                                                    window.alert('No results found');
                                                }
                                            } else {
                                                window.alert('Geocoder failed due to: ' + status);
                                            }
                                        });
                                    }

                                </script>
                            </section>
                            <div class="row">

                                <!------------------------------------------------------MATERIALS------------------------------------------>

                                <section class="panel">

                                    <div class="col-lg-12">
                                        <div class="bio-graph-heading project-heading">
                                            <strong>Program Works</strong>
                                        </div>

                                        <section class="panel">
                                            <div class="panel-body">
                                                <table class="table" style="width:100%; text-align: center">
                                                    <tr>
                                                        <th><center>Item Description</center></th>
                                                    <th><center>% of Total</center></th>
                                                    <th><center>Quantity</center></th>
                                                    <th><center>Unit</center></th>
                                                    <th><center>Unit Price</center></th>
                                                    <th><center>Total</center></th>
                                                    </tr>
                                                    <% for (Material m : materials) {%>
                                                    <tr>
                                                        <td><%=m.getName()%></td>
                                                        <td><%=m.getPercentage()%></td>
                                                        <td><%=m.getQuantity()%></td>
                                                        <td><%=m.getUnit().getUnit()%></td>
                                                        <td><%=m.getUnitprice()%></td>
                                                        <td><%=m.getUnitprice() * m.getQuantity()%></td>
                                                    </tr>
                                                    <%}%>
                                                    <tr>
                                                        <td>Total cost: </td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td>PHP <%=df.format(cost)%></td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="5">Indirect Cost 17% of Total Cost: </td>
                                                        <td>PHP <%=df.format(cost * 0.17)%></td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="5">Tax 5% of Total Cost + Indirect Cost: </td>
                                                        <td>PHP <%=df.format((cost * 0.17) * .05)%></td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="5">Estimated cost: </td>
                                                        <td>PHP <%=df.format(cost + (cost * 0.17) + ((cost * 0.17) * .05))%></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </section>
                                    </div>
                                </section>                                                 
                            </div>

                            <!------------------------------------------------------SCHEDULE------------------------------------------>


                            <section class="panel">
                                <div class="bio-graph-heading project-heading">
                                    <strong>Schedule</strong>
                                </div>
                                <div class="panel-body bio-graph-info">
                                    <div id='calendar' style="height: 100%; width: 100%"></div>
                                    <br>

                                </div>

                                <center>
                                    <button class="btn btn-success" data-toggle="modal" type="button" value="Materials" id="taskSchedule">Show Subtasks</button>
                                </center>
                                <br>             


                                <div class="modal fade" id="TaskModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                                                <h4 class="modal-title">View Tasks</h4>
                                            </div>
                                            <div class="modal-body">

                                                <table  class="display table table-bordered table-striped" id="projectTask">
                                                    <thead id="tasktablehead">



                                                    </thead>
                                                    <tbody id="tasktablebody">



                                                    </tbody>
                                                </table>


                                            </div>
                                            <div class="modal-footer">
                                                <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="AddRemarks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                                                <h4 class="modal-title">Add Remarks</h4>
                                            </div>
                                            <div class="modal-body">



                                            </div>
                                            <div class="modal-footer">
                                                <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

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
                                                }
                                            });
                                            inputActivities(sched);
                                        }
                                    });
                                });

                                function inputActivities(sched) {
                                    $.each(sched, function (i) {
                                        var color;
                                        if (sched[i].dept === "GS")
                                            color = '#00ffaa';
                                        else if (sched[i].dept === "OCPD")
                                            color = '#ff6666';
                                        else if (sched[i].dept === "BAC")
                                            color = '#ff6666';
                                        var my_events = {
                                            events: [
                                                {
                                                    title: sched[i].event,
                                                    start: sched[i].startdate,
                                                    end: sched[i].enddate,
                                                    dept: sched[i].dept,
                                                    stage: sched[i].stage,
                                                    color: color
                                                }
                                            ]
                                        };

                                        $('#calendar').fullCalendar('addEventSource', my_events);
                                    });
                                }

                            </script>

                            <!------------------------------------------------------UPLOADS------------------------------------------>
                            <section class="panel">
                                <div class="bio-graph-heading project-heading">
                                    <strong>Citizen Testimonials</strong>
                                </div>
                                <div class="panel-body bio-graph-info" style="height: 250px;">
                                    <div class="DocumentList2">
                                        <div class="row2">
                                            <%String url = null;%>
                                            <%for (Testimonial t : tList) {
                                                    for (Files f : t.getFiles()) {
                                                        url = t.getFolderName() + "/" + f.getFileName();
                                                        if (f.getType().equalsIgnoreCase("image")) {%>

                                            <div class="col-lg-3 DocumentItem2">
                                                <img src="<%=url%>" style="width:100%; height:100%">
                                                <br/>
                                                <button type="button" value="<%=f.getId()%>" class="btn btn-info btn-sm" onclick="getTestimonial(<%=f.getId()%>)" style="width:100%; position: absolute; bottom:0;">View Details</button>                                        
                                            </div>

                                            <%} else if (f.getType().equalsIgnoreCase("video")) {%>

                                            <div class="col-lg-3 DocumentItem2">
                                                <video style="position: absolute; width: 100%; height: 100%; top:0px; left:0px;">
                                                    <source src="<%=url%>" type="video/mp4">
                                                </video>
                                                <br/>
                                                <button type="button" class="btn btn-info btn-sm" style="width:100%; position: absolute; bottom:0;" onclick="getTestimonial(<%=f.getId()%>)">View Details</button>                                        
                                            </div>

                                            <%} else if (f.getType().equalsIgnoreCase("document")) {%>
                                            <div class="col-lg-3 DocumentItem2">
                                                <img src="img/docu.png" style="width:50px; height:50px; vertical-align: middle;">
                                                <br/>
                                                <button type="button" value="<%=f.getId()%>" class="btn btn-info btn-sm" onclick="getTestimonial(<%=f.getId()%>)" style="width:100%; position: absolute; bottom:0;">View Details</button>                                        
                                            </div>

                                            <%}
                                                    }
                                                }%>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <!------------------------------------------------------GS UPLOADS------------------------------------------>
                            <section class="panel">
                                <div class="bio-graph-heading project-heading">
                                    <strong>Project Proposals</strong>
                                </div>
                                <div class="panel-body bio-graph-info" style="height: 250px;">
                                    <div class="DocumentList2">
                                        <div class="row2">
                                            <%
                                                for (Files f : pfiles) {

                                                    url = p.getFoldername() + "/" + f.getFileName();
                                                    if (f.getType().equalsIgnoreCase("image")) {%>

                                            <div class="col-lg-3 DocumentItem2">
                                                <img src="<%=url%>" style="width:100%; height:100%">
                                                <br/>
                                                <button type="button" value="<%=f.getId()%>" class="btn btn-info btn-sm" onclick="getProjectFiles(<%=f.getId()%>)" style="width:100%; position: absolute; bottom:0;">View Details</button>                                        
                                            </div>

                                            <%} else if (f.getType().equalsIgnoreCase("video")) {%>

                                            <div class="col-lg-3 DocumentItem2">
                                                <video style="position: absolute; width: 100%; height: 100%; top:0px; left:0px;">
                                                    <source src="<%=url%>" type="video/mp4">
                                                </video>
                                                <br/>
                                                <button type="button" class="btn btn-info btn-sm" style="width:100%; position: absolute; bottom:0;" onclick="getProjectFiles(<%=f.getId()%>)">View Details</button>                                        
                                            </div>

                                            <%} else if (f.getType().equalsIgnoreCase("document")) {%>
                                            <div class="col-lg-3 DocumentItem2">
                                                <img src="img/docu.png" style="width:50px; height:50px; vertical-align: middle;">
                                                <br/>
                                                <button type="button" value="<%=f.getId()%>" class="btn btn-info btn-sm" onclick="getProjectFiles(<%=f.getId()%>)" style="width:100%; position: absolute; bottom:0;">View Details</button>                                        
                                            </div>

                                            <%}

                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <section class="panel">
                                <div class="row">

                                    <div class="col-md-12">
                                        <section class="panel">

                                            <%for (int x = 0; x < sched.size(); x++) {

                                                    if (sched.get(x).getTasks().size() != 0) {
                                            %>

                                            <div class="bio-graph-heading project-heading">
                                                <strong><%out.print(sched.get(x).getEvent());%></strong>
                                                <br>
                                                <small>Status: <%out.print(sched.get(x).getStatus());%></small>
                                                <br>
                                                <small>Start Date: <%out.print(sched.get(x).getStartdate());%> - End Date: <%out.print(sched.get(x).getEnddate());%></small>
                                            </div><p>
                                            <div class="panel-body bio-graph-info">
                                                <!--<h1>New Dashboard BS3 </h1>-->
                                                <div class="row">
                                                    <div class="col-lg-13" >
                                                        <section class="panel">
                                                            <div class="panel-body">

                                                                <table  class="display table table-bordered table-striped" id="projectTask">
                                                                    <thead id="tasktablehead">
                                                                        <tr>    
                                                                            <th style='text-align: center;'>Name</th>
                                                                            <th style='text-align: center;'>Description</th>
                                                                            <th style='text-align: center;'>Start Date</th>
                                                                            <th style='text-align: center;'>End Date</th>
                                                                            <th style='text-align: center;'>Person In Charge</th>
                                                                            <th style='text-align: center;'>Status</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <%for (int y = 0; y < sched.get(x).getTasks().size(); y++) {%>

                                                                    <tbody id="tasktablebody">
                                                                        <tr>
                                                                            <td style='text-align: center;'><%out.print(sched.get(x).getTasks().get(y).getName());%></td>
                                                                            <td style='text-align: center;'><%out.print(sched.get(x).getTasks().get(y).getDescription());%></td>
                                                                            <td style='text-align: center;'><%out.print(sched.get(x).getTasks().get(y).getStartDate());%></td>
                                                                            <td style='text-align: center;'><%out.print(sched.get(x).getTasks().get(y).getEndDate());%></td>
                                                                            <td style='text-align: center;'><%out.print(sched.get(x).getTasks().get(y).getPersonInCharge());%></td>
                                                                            <td style='text-align: center;'><%out.print(sched.get(x).getTasks().get(y).getStatus());%></td>


                                                                        </tr>
                                                                    </tbody>


                                                                    <%}%>
                                                                </table>
                                                            </div>


                                                        </section>
                                                    </div>


                                                </div>
                                            </div>

                                            <%}
                                                }%>
                                        </section>



                                    </div>   


                                </div>


                                <!-- page end-->
                            </section>             


                            <section class="panel">				
                                <div class="panel-body">

                                    <label>Progress Report</label>      


                                </div>



                                <div class="panel-body"  style="overflow: scroll;">




                                    <%
                                        //                                for(int y = 0; y < pp.size();y++){

                                    %>
                                    <table class="tg">

                                        <tr>
                                            <th class="tg-s6z2" colspan="3">Payment </th>

                                        </tr>
                                        <tr>
                                            <td class="tg-baqh">Quantity</td>
                                            <td class="tg-baqh">Project %</td>
                                            <td class="tg-baqh">Value of Work</td>


                                        </tr>
                                        <%                                        for (int x = 0; x < pp.size(); x++) {

                                        %>
                                        <tr>
                                            <td class="tg-yw4l"><%=pp.get(x).getQuantity()%></td>
                                            <td class="tg-yw4l"><%=pp.get(x).getProject_percentage()%></td>
                                            <td class="tg-yw4l"><%=pp.get(x).getValue_of_work()%></td>

                                        </tr>
                                        <%

                                            }
                                        %>

                                    </table>









                                </div>




                                <!-- page end-->
                            </section>           












                        </div>

                    </div>

                    <!-- page end-->
                </section>

            </section>


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

            <div id="projectFiles" class="modal fade " data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog">

                    <div class="modal-content" style="">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span> <span class="sr-only">close</span></button>
                            <h4 id="" class="modal-title">Project File</h4>
                        </div>
                        <div id="modalBody" class="modal-body" style="overflow-y: auto;">
                            <div id="pfDisplay"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" id="closeModalB" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="sb-slidebar sb-right sb-style-overlay">
                <h5 class="side-title"> Pending Tasks</h5>
            </div>

        </section>



        <script>
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

            function getProjectFiles(id) {
                $.ajax({
                    type: 'POST',
                    url: 'getprojectfiles',
                    dataType: 'json',
                    data: {testId: id}, cache: false,
                    success: function (f) {
                        $('#pfDisplay').empty();
                        var url = "<%=p.getFoldername()%>" + "/" + f.fileName;
                        if (f.type === "Video") {
                            $("<div data-p=\"144.50\"><video><source src=" + url + " type=\"video/mp4\"><source src=" + url + " type=\"video/ogg\"></video></div>").appendTo("#pfDisplay");

                        }
                        else if (f.type === "Image") {
                            $("<img src=\"" + url + "\" style=\"max-width: 570px; height:400px;\">").appendTo("#pfDisplay");

                        }

                        else if (f.type === "Document") {
                            $("#docH").remove();
                            $("<header id=\"docH\" class=\"panel-heading\">File: " + "<a class=\"panel-heading\" href=\"" + url + "\">" + f.fileName + "</a> </header>").appendTo("#pfDisplay");
                        }
                        $('#projectFiles').modal();
                    }
                });
            }

        </script>

        <!-- js placed at the end of the document so the pages load faster -->
        <!--<script src="js/jquery.js"></script>-->
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/slidebars.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="js/respond.min.js" ></script>
        <script src="js/bootstrap.js"></script>
        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>

        <script>

            var tasksFinal = [];
            var pid = "<%=p.getId()%>";

            function viewTasks() {
                if (getTaskCount() < 1) {
                    $('#fullCalModalBody').empty();
                    $("<center><header class=\"panel-heading\" id=\"noTask\">No tasks for this activity yet</header></center>").appendTo("#fullCalModalBody");
                }
                else {
                    $('#fullCalModalBody').html('');
                    $.each(tasksFinal, function (i) {
//                            $("<span class=\"pull-right\" aria-hidden=\"true\"><button type=\"button\" class=\"btn btn-info btn-sm\" onclick=\"editView(this)\" id=\"" + i + "-Final\"><i class=\"fa fa-pencil\"></i>&nbsp</button><button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"deleteTask(this)\" id=\"" + i + "-Final\"><i class=\"fa fa-times\"></i></button></span>").appendTo("#fullCalModalBody");
                        $("<b> <p class=\"control-label\" style=\" font-size: medium;\">Activity " + tasksFinal[i][0] + "</p></b>").appendTo("#fullCalModalBody");

                        $("<p class=\"control-label\">Description: " + tasksFinal[i][1] + "</p>").appendTo("#fullCalModalBody");
                        if (tasksFinal[i][2] !== "")
                            $("<p class=\"control-label\">Description: " + tasksFinal[i][2] + "</p>").appendTo("#fullCalModalBody");

                        if (tasksFinal[i][3] !== "")
                            $("<p class=\"control-label\">Start: " + tasksFinal[i][3] + "</p>").appendTo("#fullCalModalBody");

                        if (tasksFinal[i][4] !== "")
                            $("<p class=\"control-label\">End: " + tasksFinal[i][4] + "</p>").appendTo("#fullCalModalBody");

                        if (tasksFinal[i][5] !== "")
                            $("<p class=\"control-label\">Person in Charge: " + tasksFinal[i][5] + "</p>").appendTo("#fullCalModalBody");
                        $("<header class=\"panel-heading\"></header>").appendTo("#fullCalModalBody");



                    });

                }
                $('#modalTitle').html("Subtasks");
                $('#fullCalModal').show();


            }

            function getTaskCount() {
                var counter = 0;

                $.each(tasksFinal, function () {
                    counter++;
                });
                return counter;
            }


        </script>

        <script>
            $('#setCompile').click(function () {
                $('#processProj').attr('action', 'OCPD_SetForCompile').submit();
            });


            $('#onHold').click(function () {
                var url = 'OCPD_ProjectDetailsComments.jsp';
                $(location).attr('href', url);
            });
        </script>
        <script>

            $('#onHold').click(function () {
                //$('#processProj').attr('action', 'OCPD_PutOnHold').submit();
                $('#viewLetter').modal();
            });
            $('#cancel').click(function () {
                history.go(-1);
            });

            $('#detailsB').click(function () {
                $('#comHead').text("Project Details");
                $('#detailsTA').show();
                $('#materialsTA').hide();
                $('#scheduleTA').hide();
                $('#testimonialTA').hide();
                $('#addComments').modal();
                $('#comModalSave').modal();
            });

            $('#materialsB').click(function () {
                $('#comHead').text("Materials");
                $('#detailsTA').hide();
                $('#materialsTA').show();
                $('#scheduleTA').hide();
                $('#testimonialTA').hide();
                $('#addComments').modal();
            });

            $('#scheduleB').click(function () {
                $('#comHead').text("Schedule");
                $('#detailsTA').hide();
                $('#materialsTA').hide();
                $('#scheduleTA').show();
                $('#testimonialTA').hide();
                $('#addComments').modal();
            });

            $('#testimonialB').click(function () {
                $('#comHead').text("Citizen Testimonial");
                $('#detailsTA').hide();
                $('#materialsTA').hide();
                $('#scheduleTA').hide();
                $('#testimonialTA').show();
                $('#addComments').modal();
            });

            $('#meetingDetails').click(function () {
                $('#viewLetter').modal();
            });

            $('#taskSchedule').click(function () {
                $('#TaskModal').modal();
                $.ajax({
                    type: 'POST',
                    url: 'gettasks',
                    dataType: 'json',
                    data: {projId: pid},
                    cache: false,
                    success: function (tasks) {
                        $("#tasktablehead").empty();
                        $("#tasktablebody").empty();

                        $.each(tasks, function (i) {
                            var task = [tasks[i].schedule2.event, tasks[i].name, tasks[i].description, tasks[i].startDate, tasks[i].endDate, tasks[i].personInCharge];
                            if (i === 0 || tasks[i].schedule2.event !== tasks[i - 1].schedule2.event) {
                                var row = $("<tr>");
                                $("#tasktablehead").append(row);
                                row.append($("<th style='text-align: center;' colspan = '6'>" + tasks[i].schedule2.event + " </th></tr>"));


                                var row2 = $("<tr>");
                                $("#tasktablehead").append(row2);
                                row2.append($("<th style='text-align: center;'>Name</th>"));
                                row2.append($("<th style='text-align: center;'>Description</th>"));
                                row2.append($("<th style='text-align: center;'>Start Date</th>"));
                                row2.append($("<th style='text-align: center;'>End Date</th>"));
                                row2.append($("<th style='text-align: center;'>Person In Charge</th></tr>"));
                                row2.append($("<th style='text-align: center;'></th></tr>"));

                            }

                            var data = $("<tr>");
                            $("#tasktablebody").append(data);
                            data.append($("<td>" + tasks[i].name + "</td>"));
                            data.append($("<td>" + tasks[i].description + "</td>"));
                            data.append($("<td>" + tasks[i].startDate + "</td>"));
                            data.append($("<td>" + tasks[i].endDate + "</td>"));
                            data.append($("<td>" + tasks[i].personInCharge + "</td>"));
                            data.append($("<td style='text-align: center;'><button type='button' id='AddRemarksButton' data-toggle='modal' class='btn btn-success'>Add Remarks</button></td></tr>"));
                        });
                    }

                });


            });


            $('#AddRemarksButton').click(function () {
                $('#AddRemarks').modal();
            });



        </script>

    </body>

</html>