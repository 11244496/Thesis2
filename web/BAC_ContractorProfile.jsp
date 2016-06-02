<%-- 
    Document   : Citizen_Home
    Created on : 02 4, 16, 9:19:29 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Contractor_User"%>
<%@page import="Entity.Contractor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Project"%>
<%@page import="Entity.Employee"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Employee bac = (Employee) session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Home</title>
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


        <%

            Contractor contractor = (Contractor) request.getAttribute("contractorProfile");
            ArrayList<Contractor_User> officers = (ArrayList<Contractor_User>) request.getAttribute("contractorOfficers");
            ArrayList<Project> projectsImpl = (ArrayList<Project>) request.getAttribute("projectsImpl");
            ArrayList<Project> projectsDone = (ArrayList<Project>) request.getAttribute("projectsDone");
            ArrayList<Project> allProjects = (ArrayList<Project>) request.getAttribute("allProjects");


        %>

        <!--main content start-->
        <section id="main-content">
            <section class="wrapper">
                <!-- page start-->
                <div class="row">
                    <aside class="profile-nav col-lg-3">
                        <section class="panel">
                            <div class="user-heading round">
                                <a href="#">

                                </a>
                                <h1><%=contractor.getName()%></h1>
                                <p>Some text?</p>
                            </div>

                            <ul class="nav nav-pills nav-stacked">

                                <li><a href="profile-edit.html"> <i class="fa fa-edit"></i> Edit profile</a></li>
                            </ul>

                        </section>
                    </aside>
                    <aside class="profile-info col-lg-9">

                        <section class="panel">
                            <div class="bio-graph-heading">
                                Contractor's managed projects
                            </div>
                            <div class="panel-body bio-graph-info">

                                <div class="row">

                                    <div class="panel-body">
                                        <table class="table table-hover p-table">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Description</th>
                                                    <th>Status</th>


                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <% for (int a = 0; a < allProjects.size(); a++) {

                                            %>

                                            <tbody>
                                                <tr>
                                                    <td class="p-name">
                                                        <%out.print(allProjects.get(a).getName());%>
                                                    </td>
                                                    <td class="p-name">
                                                        <%out.print(allProjects.get(a).getDescription());%>
                                                    </td>
                                                    <td class="p-name">
                                                        <%out.print(allProjects.get(a).getStatus());%>
                                                    </td>

                                                    <td>
                                                        <form action="BAC_ViewProject">
                                                            <input type="hidden" name="projectID" value="<%=allProjects.get(a).getId()%>">

                                                            <button type="submit" class="btn btn-success btn-xs" value="View proposal details"><i class="fa fa-eye"></i> View project details</button>

                                                        </form>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <%}%>


                                        </table>


                                    </div>
                                </div>
                            </div>
                        </section>










                    </aside>


                </div>



                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>

                <br>

                <center>                                          
                    <div>
                        <button class="btn btn-default" type="button" onclick="history.go(-1)">Back</button>
                    </div>
                </center>

                <!-- page end-->
            </section>
        </section>
        <!--main content end-->

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
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>
        <script src="js/slidebars.min.js"></script>
    </body>
</html>
