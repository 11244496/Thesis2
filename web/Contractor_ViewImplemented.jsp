<%-- 
    Document   : Citizen_Home
    Created on : 02 4, 16, 9:19:29 AM
    Author     : RoAnn
--%>


<%@page import="Entity.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Contractor_User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Contractor_User c = (Contractor_User) session.getAttribute("user");%>

<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Home</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />

        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />

        <!--right slidebar-->
        <link href="css/slidebars.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet" />

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
                        <a href="javascript:;" class="active">
                            <i class="fa fa-tasks"></i>
                            <span>Implementation</span>
                        </a>
                        <ul class="sub">
                            <li><a  href="Contractor_ViewProjectList" class="active">&nbsp; &nbsp; &nbsp; &nbsp;Monitor Projects</a></li>
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
        <%

            ArrayList<Project> projects = (ArrayList<Project>) request.getAttribute("implementedProjects");
            ArrayList<Project> completed = (ArrayList<Project>) request.getAttribute("completedProjects");


        %>

        <!--main content start-->
        <section id="main-content">
            <section class="wrapper site-min-height">
                <!-- page start-->
                <section class="panel">
                    <div class="col-lg-8" style="padding-left: 0px; padding-right:0px; width:100%;">
                        <div class="row">
                            <div class="col-lg-6" style="width:100%;">



                                <section class="panel" style="width:100%;">
                                    <header class="panel-heading tab-bg-dark-navy-blue">
                                        <ul class="nav nav-tabs nav-justified ">
                                            <li class="active">
                                                <a href="#proposals" data-toggle="tab">
                                                    On-going
                                                </a>
                                            </li>



                                            <li class="">
                                                <a href="#approved" data-toggle="tab">
                                                    Completed Projects
                                                </a>
                                            </li>

                                        </ul>
                                    </header>

                                    <div class="panel-body">
                                        <div class="tab-content tasi-tab">
                                            <div class="tab-pane active" id="proposals">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <header class="panel-heading">
                                                            <h3></h3>

                                                        </header>
                                                        <br>

                                                    </div>








                                                </div>
                                                <table class="table table-hover p-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Type </th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>





                                                        </tr>
                                                    </thead>
                                                    <% for (int a = 0; a < projects.size(); a++) {
                                                            String id = projects.get(a).getId();
                                                            String name = projects.get(a).getName();
                                                            String description = projects.get(a).getDescription();
                                                            String type = projects.get(a).getType();
                                                            String status = projects.get(a).getStatus();
                                                    %>

                                                    <tbody>
                                                        <tr>
                                                            <td class="p-name">
                                                                <%out.print(name);%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%out.print(description);%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%out.print(type);%>
                                                            </td>

                                                            <td>
                                                                <form action="Contractor_ViewBidNotices">
                                                                    <input type="hidden" name="prjid" value="<%=projects.get(a).getId()%>">
                                                                    <input type="hidden" name="contid" value="<%=c.getContractor().getID()%>">
                                                                    <button type="submit" class="btn btn-success" style="width: 90%" value="View proposal details"><i class="fa fa-eye"></i>Bid notices</button>

                                                                </form>
                                                            </td>
                                                            <td>
                                                                <form action="Contractor_ViewProject">
                                                                    <input type="hidden" name="projectID" value="<%=projects.get(a).getId()%>">
                                                                    <button type="submit" class="btn btn-success" style="width: 90%" value="View proposal details"><i class="fa fa-eye"></i>Project details</button>

                                                                </form>
                                                            </td>
                                                            <td>
                                                                <form action="Contractor_ViewProjectCalendar">
                                                                    <input type="hidden" name="projectID2" value="<%=projects.get(a).getId()%>">
                                                                    <button type="submit" class="btn btn-success" style="width: 90%" value="View proposal details">Project calendar</button>
                                                                </form>
                                                            </td>
                                                            <td>
                                                                <form action="Contractor_ViewTasks">
                                                                    <input type="hidden" name="projectID2" value="<%=projects.get(a).getId()%>">
                                                                    <button type="submit" class="btn btn-success" style="width: 90%" value="View proposal details">View Task</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                    <%}%>


                                                </table>



                                            </div>



                                            <!--approved-->
                                            <div class="tab-pane " id="approved">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <header class="panel-heading">
                                                            <h3></h3>

                                                        </header><br>

                                                    </div>







                                                </div>
                                                <table class="table table-hover p-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Type </th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>




                                                        </tr>
                                                    </thead>
                                                    <% for (int a = 0; a < completed.size(); a++) {
                                                            String id = completed.get(a).getId();
                                                            String name1 = completed.get(a).getName();
                                                            String description1 = completed.get(a).getDescription();
                                                            String type1 = completed.get(a).getType();
                                                            String status = completed.get(a).getStatus();
                                                    %>

                                                    <tbody>
                                                        <tr>
                                                            <td class="p-name">
                                                                <%out.print(name1);%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%out.print(description1);%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%out.print(type1);%>
                                                            </td>
                                                            <td>
                                                                <form action="Contractor_ViewProject">
                                                                    <input type="hidden" name="projectID" value="<%=completed.get(a).getId()%>">
                                                                    <button type="submit" class="btn btn-success" style="width: 90%" value="View proposal details"><i class="fa fa-eye"></i>Project details</button>
                                                                </form>
                                                            </td>
                                                            <td>
                                                                <form action="Contractor_ViewTasks">
                                                                    <input type="hidden" name="projectID2" value="<%=completed.get(a).getId()%>">
                                                                    <button type="submit" class="btn btn-success" style="width: 90%" value="View proposal details">View Task</button>
                                                                </form>
                                                            </td>
                                                            <td>
                                                                <form action="Contractor_GenerateAccReport">
                                                                    <input type="hidden" name="projectID2" value="<%=completed.get(a).getId()%>">
                                                                    <button type="submit" class="btn btn-success" style="width: 90%" value="View proposal details">View Accomplishment Report</button>
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



                            </div>
                        </div>

                    </div>
                </section>
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

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/slidebars.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/gritter/js/jquery.gritter.js"></script>
        <script src="js/respond.min.js" ></script>
        <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>

        <!--right slidebar-->
        <script src="js/slidebars.min.js"></script>

        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>

        <!--script for this page only-->
        <script src="js/gritter.js" type="text/javascript"></script>
        <script src="js/pulstate.js" type="text/javascript"></script>
    </body>
</html>
