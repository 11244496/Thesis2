<%-- 
    Document   : Citizen_SearchTestimonial
    Created on : 02 4, 16, 9:19:08 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Files"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Testimonial"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Citizen c = (Citizen) session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Search Testimonial</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

        <style>
            table.table { table-layout:fixed; }
            table.table td { overflow: hidden; }
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
                                <span class="username">Hello <b><u><%=c.getFirstName()%></u></b>!</span>
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

            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <ul class="sidebar-menu" id="nav-accordion">

                        <li>
                            <a href="Citizen_Home">
                                <i class="fa fa-dashboard"></i>
                                <span>Home</span>
                            </a>
                        </li>

                        <li>
                            <a href="Citizen_SearchTestimonial" class="active">
                                <i class="fa fa-book"></i>
                                <span>Testimonials</span>
                            </a>
                        </li>

                        <li>
                            <a href="Citizen_ProjectsImplemented">
                                <i class="fa fa-book"></i>
                                <span>Projects Implemented</span>
                            </a>
                        </li>

                        <li>
                            <a href="Citizen_NotificationActivity">
                                <i class="fa fa-book"></i>
                                <span>Notification and Activity</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>
            <%
                ArrayList<Testimonial> myTestimonials = (ArrayList<Testimonial>) request.getAttribute("myTestimonials");
                ArrayList<Testimonial> allTestimonials = (ArrayList<Testimonial>) request.getAttribute("allTestimonials");
                ArrayList<Testimonial> subscribedTestimonials = (ArrayList<Testimonial>) request.getAttribute("subscribedTestimonials");
                ArrayList<Testimonial> trendingTestimonials = (ArrayList<Testimonial>) request.getAttribute("trendingTestimonials");
            %>

            <section id="main-content">
                <section class="wrapper site-min-height">
                    <section class="panel">
                        <header class="panel-heading">
                            Testimonial Search
                        </header>
                        <div class="panel-body">





                            <a href="Citizen_CreateTestimonial.jsp" class="pull-right position"><button type="button" align="right" class="btn btn-primary">Create Image/Video Testimonial </button></a>
                            &nbsp;<a href="Citizen_CreateLetter.jsp" class="pull-right position" style="margin-right: 5px"><button type="button" align="right" class="btn btn-primary">Create Letter Testimonial</button></a>
                            <br>
                            <br>
                            <br>

                            <section class="panel">
                                <header class="panel-heading tab-bg-dark-navy-blue">
                                    <ul class="nav nav-tabs nav-justified ">
                                        <li class="active">
                                            <a href="#all" data-toggle="tab">
                                                All
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#followed" data-toggle="tab">
                                                Followed
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="#mytestimonials" data-toggle="tab">
                                                My Testimonials
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#trending" data-toggle="tab">
                                                Trending
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

                                                            <%                                                                for (int x = 0; x < allTestimonials.size(); x++) {
                                                                    int testID1 = allTestimonials.get(x).getId();
                                                                    Testimonial test1 = allTestimonials.get(x);
                                                                    ArrayList<Files> files = test1.getFiles();
                                                                    String[] split = allTestimonials.get(x).getDateUploaded().split("\\s+");
                                                                    int fileID = 0;

                                                                    if (test1.getCategory().equalsIgnoreCase("video") || test1.getCategory().equalsIgnoreCase("image")) {
                                                            %>
                                                            <tbody>
                                                                <tr>

                                                                    <td>
                                                                        <a href="Citizen_OpenTestimonial?idd=<%=testID1%>"> <%out.print(test1.getTitle());%> </a>
                                                                    </td>
                                                                    <td>
                                                                        <% if (!test1.getCategory().equalsIgnoreCase("letter")) {
                                                                                out.print(test1.getLocation());
                                                                            } else {
                                                                                out.print("-");
                                                                            }%> 
                                                                    </td>
                                                                    <td>
                                                                        <%out.print(test1.getMessage());%> 
                                                                    </td>

                                                                    <td>
                                                                        <%out.print(split[0]);%>
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

                                        <div class="tab-pane" id="followed">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="followed-testimonial">
                                            </div> 
                                            <div class="directory-info-row">


                                                <div class="row">
                                                    <table class="table" data-search-field="#followed-testimonial">

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
                                                            for (int x = 0; x < subscribedTestimonials.size(); x++) {
                                                                int testID = subscribedTestimonials.get(x).getId();
                                                                Testimonial test1 = subscribedTestimonials.get(x);
                                                                ArrayList<Files> files = test1.getFiles();
                                                                String[] split = subscribedTestimonials.get(x).getDateUploaded().split("\\s+");
                                                                int fileID = 0;

                                                                if (test1.getCategory().equalsIgnoreCase("video") || test1.getCategory().equalsIgnoreCase("image")) {
                                                        %>
                                                        <tbody>
                                                            <tr>

                                                                <td>
                                                                    <a href="Citizen_OpenTestimonial?idd=<%=testID%>"> <%out.print(test1.getTitle());%> </a>
                                                                </td>
                                                                <td>
                                                                    <% if (!test1.getCategory().equalsIgnoreCase("letter")) {
                                                                            out.print(test1.getLocation());
                                                                        } else {
                                                                            out.print("-");
                                                                        }%> 
                                                                </td>
                                                                <td>
                                                                    <%out.print(test1.getMessage());%> 
                                                                </td>

                                                                <td>
                                                                    <%out.print(split[0]);%>
                                                                </td>

                                                                <%if (subscribedTestimonials.get(x).getProject().getId() != null) {%>
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
                                                                <td><center>
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
                                                            <%}
                                                                if (isletter == true) {%>
                                                            <img  src="img/leticon.png" width="30" height="30" alt=""> 
                                                            <%}%>

                                                        </center>
                                                        </td>
                                                        </tr>    

                                                        </tbody> 

                                                        <%}
                                                            }%>

                                                    </table>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="tab-pane " id="mytestimonials">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="my-testimonial">
                                            </div> 
                                            <div class="directory-info-row">


                                                <div class="row">
                                                    <table class="table" data-search-field="#my-testimonial">

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
                                                            for (int x = 0; x < myTestimonials.size(); x++) {
                                                                int testID = myTestimonials.get(x).getId();
                                                                Testimonial test1 = myTestimonials.get(x);
                                                                ArrayList<Files> files = test1.getFiles();
                                                                String[] split = myTestimonials.get(x).getDateUploaded().split("\\s+");
                                                                int fileID = 0;
                                                        %>
                                                        <tbody>
                                                            <tr>

                                                                <td>
                                                                    <a href="Citizen_OpenTestimonial?idd=<%=testID%>"> <%out.print(test1.getTitle());%> </a>
                                                                </td>
                                                                <td>
                                                                    <% if (!test1.getCategory().equalsIgnoreCase("letter")) {
                                                                            out.print(test1.getLocation());
                                                                        } else {
                                                                            out.print("-");
                                                                        }%> 
                                                                </td>
                                                                <td>
                                                                    <%out.print(test1.getMessage());%> 
                                                                </td>

                                                                <td>
                                                                    <%out.print(split[0]);%>
                                                                </td>

                                                                <%if (myTestimonials.get(x).getProject().getId() != null) {%>
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

                                                                <td><center>
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
                                                            <%}
                                                                if (isletter == true) {%>
                                                            <img  src="img/leticon.png" width="30" height="30" alt=""> 
                                                            <%}%>

                                                        </center>
                                                        </td>
                                                        </tr>    

                                                        </tbody> 

                                                        <%}%>

                                                    </table>

                                                </div>
                                            </div>


                                        </div>
                                        <div class="tab-pane " id="trending">
                                            <div>
                                                <input size="30" type="text" placeholder="Type to search" id="trending-testimonial">
                                            </div> 
                                            <div class="directory-info-row">


                                                <div class="row">
                                                    <table class="table" data-search-field="#my-testimonial">

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
                                                            for (int x = 0; x < trendingTestimonials.size(); x++) {
                                                                int testID = trendingTestimonials.get(x).getId();
                                                                Testimonial test1 = trendingTestimonials.get(x);
                                                                ArrayList<Files> files = test1.getFiles();
                                                                String[] split = trendingTestimonials.get(x).getDateUploaded().split("\\s+");
                                                                int fileID = 0;
                                                                if (test1.getCategory().equalsIgnoreCase("video") || test1.getCategory().equalsIgnoreCase("image")) {
                                                        %>
                                                        <tbody>
                                                            <tr>

                                                                <td>
                                                                    <a href="Citizen_OpenTestimonial?idd=<%=testID%>"> <%out.print(test1.getTitle());%> </a>
                                                                </td>
                                                                <td>
                                                                    <% if (!test1.getCategory().equalsIgnoreCase("letter")) {
                                                                            out.print(test1.getLocation());
                                                                        } else {
                                                                            out.print("-");

                                                                        }%> 
                                                                </td>
                                                                <td>
                                                                    <%out.print(test1.getMessage());%> 
                                                                </td>

                                                                <td>
                                                                    <%out.print(split[0]);%>
                                                                </td>

                                                                <%if (trendingTestimonials.get(x).getProject().getId() != null) {%>
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
                                                                <td><center>
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
                                                            <%}
                                                                if (isletter == true) {%>
                                                            <img  src="img/leticon.png" width="30" height="30" alt=""> 
                                                            <%}%>

                                                        </center>
                                                        </td>
                                                        </tr>    

                                                        </tbody> 

                                                        <%}
                                                            }%>

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

            <footer class="site-footer">
                <div class="text-center">
                    2016 &copy; KAYA
                    <a href="#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>

            <!-- ===========MODAL POP UP HERE =================== -->

            <%
                String success = (String) request.getAttribute("success");
            %>
            <script>                 //force open a modal using a hidden button                 window.onload = onLoad;
                function onLoad()
                {
                    var success = "<%=success%>";
                    if (success !== null) {
                        if (success === "LetterSuccess") {
                            $("#letterModal").click();
                        }
                        else if (success === "imageSuccess") {
                            $("#imageModal").click();
                        }
                        else if (success === "videoSuccess") {
                            $("#videoModal").click();
                        }
                    } else {
                    }
                }
                ;</script>

            <script>
                $.fn.searchableTable = function () {
                    return this.each(function () {
                        var data = $(this).data(), $rows = $(this).find('tbody > tr'),
                                $searchField = $(data.searchField),
                                $rowsCount;
                        if (data.searchRows) {
                            $rowsCount = $(data.searchRows);
                        }
                        $searchField.keyup(function () {
                            var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                            var $filtered = $rows.show().filter(function () {
                                var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                                return !~text.indexOf(val);
                            }).hide();
                            if ($rowsCount)
                                $rowsCount.text($rows.length - $filtered.length);
                        })
                                .trigger('keyup');
                    });
                };
// Initialize
                $('.table').searchableTable();
            </script>


            <!-- modal -->

            <button id="letterModal" style="visibility: hidden" data-toggle="modal" href="#LetterModal"></button> 
            <div class="modal fade" id="LetterModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Letter Sent</h4>
                        </div>
                        <div class="modal-body">

                            Letter has been successfully sent. Please wait for the reply.

                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Ok</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- modal -->

            <button id="imageModal" style="visibility: hidden" data-toggle="modal" href="#ImageModal"></button> 
            <div class="modal fade" id="ImageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Image Testimonial Sent</h4>
                        </div>
                        <div class="modal-body">

                            The image has been uploaded and testimonial has been sent, please wait for it to be linked with a project.

                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Ok</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- modal -->

            <button id="videoModal" style="visibility: hidden" data-toggle="modal" href="#VideoModal"></button> 
            <div class="modal fade" id="VideoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Video Testimonial Sent</h4>
                        </div>
                        <div class="modal-body">

                            The video has been uploaded and testimonial has been sent, please wait for it to be linked in a project

                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Ok</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--Modal Pop-up End here--> 


            <script src="js/jquery.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
            <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
            <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>
            <script src="js/slidebars.min.js"></script>
    </body>
</html>