<%-- 
    Document   : GS_CitizenProposal
    Created on : 09 2, 15, 8:51:14 AM
    Author     : User
--%>

<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entity.Files"%>
<%@page import="Entity.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Testimonial"%>
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

        <title>View Citizen Proposal</title>

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
        <![endif]-->  </head>

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
                            <a href="GS_ViewTestimonials" class="active">
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
            <!--main content start-->
            <%
                ArrayList<Testimonial> allTestimonials = (ArrayList<Testimonial>) request.getAttribute("allTestimonials");
                ArrayList<Testimonial> allPendingTestimonials = (ArrayList<Testimonial>) request.getAttribute("allPendingTestimonials");
                ArrayList<Testimonial> allRepliedTestimonials = (ArrayList<Testimonial>) request.getAttribute("allRepliedTestimonials");
                ArrayList<Testimonial> allLinkedTestimonials = (ArrayList<Testimonial>) request.getAttribute("allLinkedTestimonials");
            %>

            <section id="main-content">
                <section class="wrapper site-min-height">
                    <section class="panel">
                        <header class="panel-heading">
                            Citizen Testimonials
                        </header>
                        <div class="panel-body">

                            <section class="panel">
                                <header class="panel-heading tab-bg-dark-navy-blue">
                                    <ul class="nav nav-tabs nav-justified ">
                                        <li class="active">
                                            <a href="#all" data-toggle="tab">
                                                All
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#pending" data-toggle="tab">
                                                Pending
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="#replied" data-toggle="tab">
                                                Replied Testimonials
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#linked" data-toggle="tab">
                                                Linked Testimonials
                                            </a>
                                        </li>
                                    </ul>
                                </header>

                                <div class="panel-body">
                                    <div class="tab-content tasi-tab">
                                        <div class="tab-pane active" id="all">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="all-testimonial">
                                            </div>
                                            <div class="form-group">
                                                <div class="directory-info-row">                                                    
                                                    <div class="row">
                                                        <table class="table" data-search-field="#all-testimonial">


                                                            <thead>
                                                                <tr>

                                                                    <th style="width: 15%">Title</th>
                                                                    <th style="width: 10%">Location</th>
                                                                    <th style="width: 25%">Description</th>
                                                                    <th style="width: 10%">Date Uploaded</th>
                                                                    <th style="width: 8%">Project Linked</th>
                                                                    <th style="width: 17%">Uploader</th>    
                                                                    <th style="width: 15%"></th>   

                                                                </tr>
                                                            </thead>

                                                            <%
                                                                if (allTestimonials.size() != 0) {
                                                                    for (int x = 0; x < allTestimonials.size(); x++) {
                                                                        int testID1 = allTestimonials.get(x).getId();
                                                                        Testimonial test1 = allTestimonials.get(x);
                                                                        ArrayList<Files> files = test1.getFiles();
                                                            %>
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <a href="GS_ViewTestimonial?testId=<%=testID1%>"> <%out.print(test1.getTitle());%> </a>
                                                                    </td>
                                                                    <td>
                                                                        <%out.print(test1.getLocation());%> 
                                                                    </td>
                                                                    <td>
                                                                        <%out.print(test1.getMessage());%> 
                                                                    </td>

                                                                    <td>
                                                                        <%out.print(test1.getDateUploaded());%>
                                                                    </td>
                                                                    <%if (allTestimonials.get(x).getProject().getId() != null) {%>
                                                                    <td>
                                                                        Available
                                                                    </td>   
                                                                    <%} else {%>
                                                                    <td>
                                                                        None
                                                                    </td>
                                                                    <%}%>
                                                                    <td>
                                                                        <%out.print(test1.getCitizen().getUser().getUsername());%> 
                                                                    </td> 
                                                                    <td>
                                                                        <%
                                                                            boolean hasimage = false;
                                                                            boolean hasvideo = false;
                                                                            boolean hasdoc = false;
                                                                            boolean isletter = false;
                                                                            if (!test1.getCategory().equalsIgnoreCase("letter")) {

                                                                                for (int a = 0; a < files.size(); a++) {
                                                                                    if (files.get(a).getType().equalsIgnoreCase("image")) {
                                                                                        hasimage = true;
                                                                                    } else if (files.get(a).getType().equalsIgnoreCase("video")) {
                                                                                        hasvideo = true;
                                                                                    } else if (files.get(a).getType().equalsIgnoreCase("document")) {
                                                                                        hasdoc = true;
                                                                                    }
                                                                                }

                                                                            } else {
                                                                                isletter = true;
                                                                            }%>
                                                                        <%if (hasimage == true) {%>        
                                                                        <img  src="img/imgicon.png" width="30" height="30" alt="">
                                                                        <%}
                                                                            if (hasvideo == true) {%>
                                                                        <img  src="img/vidicon.png" width="30" height="30" alt="">
                                                                        <%}
                                                                            if (hasdoc == true) {%>
                                                                        <img  src="img/docicon.png" width="30" height="30" alt="">
                                                                        <%}%>

                                                                    </td>



                                                                </tr>    

                                                            </tbody>  

                                                            <%
                                                                    }
                                                                }
                                                            %>


                                                        </table>    
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="tab-pane" id="pending">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="pending-testimonial">
                                            </div> 
                                            <div class="directory-info-row">


                                                <div class="row">
                                                    <table class="table" data-search-field="#pending-testimonial">

                                                        <thead>
                                                            <tr>

                                                                <th style="width: 15%">Title</th>
                                                                <th style="width: 10%">Location</th>
                                                                <th style="width: 25%">Description</th>
                                                                <th style="width: 10%">Date Uploaded</th>
                                                                <th style="width: 8%">Project Linked</th>
                                                                <th style="width: 17%">Uploader</th>    
                                                                <th style="width: 15%"></th>

                                                            </tr>
                                                        </thead>

                                                        <%
                                                            if (allPendingTestimonials.size() != 0) {
                                                                for (int x = 0; x < allPendingTestimonials.size(); x++) {
                                                                    int testID1 = allPendingTestimonials.get(x).getId();
                                                                    Testimonial test1 = allPendingTestimonials.get(x);
                                                                    ArrayList<Files> files = test1.getFiles();
                                                        %>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <a href="GS_ViewTestimonial?testId=<%=testID1%>"> <%out.print(test1.getTitle());%> </a>
                                                                </td>
                                                                <td>
                                                                    <%out.print(test1.getLocation());%> 
                                                                </td>
                                                                <td>
                                                                    <%out.print(test1.getMessage());%> 
                                                                </td>
                                                                
                                                                <%String color = null;
                                                                Date d = new Date();
                                                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                                String startdate = sdf.format(d);
                                                                LocalDate start = LocalDate.parse(startdate);
                                                                
                                                                String dateonly = allPendingTestimonials.get(x).getDateUploaded().substring(0, 10);
                                                                LocalDate end = LocalDate.parse(dateonly);
                                                                
                                                                long days = ChronoUnit.DAYS.between(end,start);
                                                                if(days < 10){
                                                                    color = "green";
                                                                }else if(days > 10 && days < 30){
                                                                    color = "orange";
                                                                }else if(days > 30){
                                                                    color = "red";
                                                                }
                                                                
                                                                %>
                                                                
                                                                <td>
                                                                    <p style="color:<%=color%>">
                                                                    <%out.print(test1.getDateUploaded());%>
                                                                    </p>
                                                                </td>
                                                                
                                                                
                                                                
                                                                
                                                                <%if (allPendingTestimonials.get(x).getProject().getId() != null) {%>
                                                                <td>
                                                                    Available
                                                                </td>   
                                                                <%} else {%>
                                                                <td>
                                                                    None
                                                                </td>
                                                                <%}%>
                                                                <td>
                                                                    <%out.print(test1.getCitizen().getUser().getUsername());%> 
                                                                </td> 
                                                                <td>
                                                                    <%
                                                                        boolean hasimage = false;
                                                                        boolean hasvideo = false;
                                                                        boolean hasdoc = false;
                                                                        boolean isletter = false;
                                                                        if (!test1.getCategory().equalsIgnoreCase("letter")) {

                                                                            for (int a = 0; a < files.size(); a++) {
                                                                                if (files.get(a).getType().equalsIgnoreCase("image")) {
                                                                                    hasimage = true;
                                                                                } else if (files.get(a).getType().equalsIgnoreCase("video")) {
                                                                                    hasvideo = true;
                                                                                } else if (files.get(a).getType().equalsIgnoreCase("document")) {
                                                                                    hasdoc = true;
                                                                                }
                                                                            }

                                                                        } else {
                                                                            isletter = true;
                                                                        }%>
                                                                    <%if (hasimage == true) {%>        
                                                                    <img  src="img/imgicon.png" width="30" height="30" alt="">
                                                                    <%}
                                                                        if (hasvideo == true) {%>
                                                                    <img  src="img/vidicon.png" width="30" height="30" alt="">
                                                                    <%}
                                                                        if (hasdoc == true) {%>
                                                                    <img  src="img/docicon.png" width="30" height="30" alt="">
                                                                    <%}%>

                                                                </td>



                                                            </tr>    

                                                        </tbody>  

                                                        <%
                                                                }
                                                            }
                                                        %>


                                                    </table>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="tab-pane " id="replied">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="replied-testimonial">
                                            </div> 
                                            <div class="directory-info-row">


                                                <div class="row">
                                                    <table class="table" data-search-field="#replied-testimonial">

                                                        <thead>
                                                            <tr>

                                                                <th style="width: 15%">Title</th>
                                                                <th style="width: 10%">Location</th>
                                                                <th style="width: 25%">Description</th>
                                                                <th style="width: 10%">Date Uploaded</th>
                                                                <th style="width: 8%">Project Linked</th>
                                                                <th style="width: 17%">Uploader</th>    
                                                                <th style="width: 15%"></th>

                                                            </tr>
                                                        </thead>
                                                        <%
                                                            if (allRepliedTestimonials.size() != 0) {
                                                                for (int x = 0; x < allRepliedTestimonials.size(); x++) {
                                                                    int testID1 = allRepliedTestimonials.get(x).getId();
                                                                    Testimonial test1 = allRepliedTestimonials.get(x);
                                                                    ArrayList<Files> files = test1.getFiles();
                                                        %>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <a href="GS_ViewTestimonial?testId=<%=testID1%>"> <%out.print(test1.getTitle());%> </a>
                                                                </td>
                                                                <td>
                                                                    <%out.print(test1.getLocation());%> 
                                                                </td>
                                                                <td>
                                                                    <%out.print(test1.getMessage());%> 
                                                                </td>

                                                                <td>
                                                                    <%out.print(test1.getDateUploaded());%>
                                                                </td>
                                                                <%if (allRepliedTestimonials.get(x).getProject().getId() != null) {%>
                                                                <td>
                                                                    Available
                                                                </td>   
                                                                <%} else {%>
                                                                <td>
                                                                    None
                                                                </td>
                                                                <%}%>
                                                                <td>
                                                                    <%out.print(test1.getCitizen().getUser().getUsername());%> 
                                                                </td> 
                                                                <td>
                                                                    <%
                                                                        boolean hasimage = false;
                                                                        boolean hasvideo = false;
                                                                        boolean hasdoc = false;
                                                                        boolean isletter = false;
                                                                        if (!test1.getCategory().equalsIgnoreCase("letter")) {

                                                                            for (int a = 0; a < files.size(); a++) {
                                                                                if (files.get(a).getType().equalsIgnoreCase("image")) {
                                                                                    hasimage = true;
                                                                                } else if (files.get(a).getType().equalsIgnoreCase("video")) {
                                                                                    hasvideo = true;
                                                                                } else if (files.get(a).getType().equalsIgnoreCase("document")) {
                                                                                    hasdoc = true;
                                                                                }
                                                                            }

                                                                        } else {
                                                                            isletter = true;
                                                                        }%>
                                                                    <%if (hasimage == true) {%>        
                                                                    <img  src="img/imgicon.png" width="30" height="30" alt="">
                                                                    <%}
                                                                        if (hasvideo == true) {%>
                                                                    <img  src="img/vidicon.png" width="30" height="30" alt="">
                                                                    <%}
                                                                        if (hasdoc == true) {%>
                                                                    <img  src="img/docicon.png" width="30" height="30" alt="">
                                                                    <%}%>

                                                                </td>



                                                            </tr>    

                                                        </tbody>  

                                                        <%
                                                                }
                                                            }
                                                        %>

                                                    </table>

                                                </div>
                                            </div>


                                        </div>
                                        <div class="tab-pane " id="linked">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="linked-testimonial">
                                            </div> 
                                            <div class="directory-info-row">


                                                <div class="row">
                                                    <table class="table" data-search-field="#linked-testimonial">

                                                        <thead>
                                                            <tr>

                                                                <th style="width: 15%">Title</th>
                                                                <th style="width: 10%">Location</th>
                                                                <th style="width: 25%">Description</th>
                                                                <th style="width: 10%">Date Uploaded</th>
                                                                <th style="width: 8%">Project Linked</th>
                                                                <th style="width: 17%">Uploader</th>    
                                                                <th style="width: 15%"></th>

                                                            </tr>
                                                        </thead>

                                                        <%
                                                            if (allLinkedTestimonials.size() != 0) {
                                                                for (int x = 0; x < allLinkedTestimonials.size(); x++) {
                                                                    int testID1 = allLinkedTestimonials.get(x).getId();
                                                                    Testimonial test1 = allLinkedTestimonials.get(x);
                                                                    ArrayList<Files> files = test1.getFiles();
                                                        %>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <a href="GS_ViewTestimonial?testId=<%=testID1%>"> <%out.print(test1.getTitle());%> </a>
                                                                </td>
                                                                <td>
                                                                    <%out.print(test1.getLocation());%> 
                                                                </td>
                                                                <td>
                                                                    <%out.print(test1.getMessage());%> 
                                                                </td>

                                                                <td>
                                                                    <%out.print(test1.getDateUploaded());%>
                                                                </td>
                                                                <%if (allLinkedTestimonials.get(x).getProject().getId() != null) {%>
                                                                <td>
                                                                    Available
                                                                </td>   
                                                                <%} else {%>
                                                                <td>
                                                                    None
                                                                </td>
                                                                <%}%>
                                                                <td>
                                                                    <%out.print(test1.getCitizen().getUser().getUsername());%> 
                                                                </td> 
                                                                <td>
                                                                    <%
                                                                        boolean hasimage = false;
                                                                        boolean hasvideo = false;
                                                                        boolean hasdoc = false;
                                                                        boolean isletter = false;
                                                                        if (!test1.getCategory().equalsIgnoreCase("letter")) {

                                                                            for (int a = 0; a < files.size(); a++) {
                                                                                if (files.get(a).getType().equalsIgnoreCase("image")) {
                                                                                    hasimage = true;
                                                                                } else if (files.get(a).getType().equalsIgnoreCase("video")) {
                                                                                    hasvideo = true;
                                                                                } else if (files.get(a).getType().equalsIgnoreCase("document")) {
                                                                                    hasdoc = true;
                                                                                }
                                                                            }

                                                                        } else {
                                                                            isletter = true;
                                                                        }%>
                                                                    <%if (hasimage == true) {%>        
                                                                    <img  src="img/imgicon.png" width="30" height="30" alt="">
                                                                    <%}
                                                                        if (hasvideo == true) {%>
                                                                    <img  src="img/vidicon.png" width="30" height="30" alt="">
                                                                    <%}
                                                                        if (hasdoc == true) {%>
                                                                    <img  src="img/docicon.png" width="30" height="30" alt="">
                                                                    <%}%>

                                                                </td>



                                                            </tr>    

                                                        </tbody>  

                                                        <%
                                                                }
                                                            }
                                                        %>

                                                    </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                        </div>
                    </section>
                </section>
            </section>
        </section>
        <!--main content end-->


        <!-- js placed at the end of the document so the pages load faster -->

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
    </body>
</html>

