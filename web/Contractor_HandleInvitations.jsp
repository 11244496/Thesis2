<%-- 
    Document   : Citizen_Home
    Created on : 02 4, 16, 9:19:29 AM
    Author     : RoAnn
--%>

<%@page import="Entity.InvitationToBid"%>
<%@page import="Entity.Contractor_User"%>
<%@page import="Entity.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Citizen"%>
<%@page import="Entity.Contractor_Has_Project"%>
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
                        <a href="Contractor_Home" class="active">
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
                        <a href="">
                            <i class="fa fa-dashboard"></i>
                            <span>Schedule Changes</span>
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

            ArrayList<Project> projects = (ArrayList<Project>) request.getAttribute("projectsWithInvitation");
            ArrayList<InvitationToBid> nego = (ArrayList<InvitationToBid>) request.getAttribute("nego");
            ArrayList<Contractor_Has_Project> respondedProjects = (ArrayList<Contractor_Has_Project>) request.getAttribute("respondedProjects");
        %>
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
                                                    Released with Invitation
                                                </a>
                                            </li>
                                            <li class="">
                                                <a href="#negotiation" data-toggle="tab">
                                                    Invitation for Negotiated Procurement
                                                </a>
                                            </li>
                                            <li class="">
                                                <a href="#approved" data-toggle="tab">
                                                    Projects responded to
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
                                                <table class="table table-hover p-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Description</th>


                                                            <th></th>

                                                        </tr>
                                                    </thead>


                                                    <tbody>
                                                        <%
                                                            for (int x = 0; x < projects.size(); x++) {

                                                                String name = projects.get(x).getName();
                                                                String description = projects.get(x).getDescription();
                                                                String status = projects.get(x).getStatus();


                                                        %>
                                                        <tr>
                                                            <td class="p-name">
                                                                <%=name%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%=description%>
                                                            </td>


                                                            <td>
                                                                <form action="Contractor_ViewProject">
                                                                    <input type="hidden" name="projectID" value="<%=projects.get(x).getId()%>">

                                                                    <button type="submit" class="btn btn-success btn-xs" value="View proposal details"><i class="fa fa-eye"></i>Open invitation</button>

                                                                </form>
                                                            </td>
                                                        </tr>

                                                        <%
                                                            }
                                                        %>

                                                    </tbody>



                                                </table>



                                            </div>

                                            <div class="tab-pane" id="negotiation">
                                                <div class="row">
                                                    <div class="col-md-12">


                                                    </div>
                                                </div>
                                                <table class="table table-hover p-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Purpose of invitation</th>


                                                            <th></th>

                                                        </tr>
                                                    </thead>


                                                    <tbody>
                                                        <%
                                                            for (int x = 0; x < nego.size(); x++) {

                                                                String name = nego.get(x).getProjectID().getName();
                                                                String description = nego.get(x).getProjectID().getDescription();
                                                                String status = nego.get(x).getReason();


                                                        %>
                                                        <tr>
                                                            <td class="p-name">
                                                                <%=name%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%=description%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%=status%>
                                                            </td>


                                                            <td>
                                                                <form action="Contractor_ViewProject">
                                                                    <input type="hidden" name="projectID" value="<%=nego.get(x).getProjectID().getId()%>">

                                                                    <button type="submit" class="btn btn-success btn-xs" value="View proposal details"><i class="fa fa-eye"></i>Open invitation</button>

                                                                </form>
                                                            </td>
                                                        </tr>

                                                        <%
                                                            }
                                                        %>

                                                    </tbody>



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
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Status</th>


                                                        </tr>
                                                    </thead>

                                                    <tbody>

                                                        <%
                                                            for (int y = 0; y < respondedProjects.size(); y++) {
                                                                String iddd = respondedProjects.get(y).getProject().getId();
                                                                String name2 = respondedProjects.get(y).getProject().getName();
                                                                String description = respondedProjects.get(y).getProject().getDescription();
                                                                String Status = respondedProjects.get(y).getStatus();
                                                                int contid = respondedProjects.get(y).getID();
                                                        %>

                                                        <tr>
                                                            <td class="p-name">
                                                                <%=name2%>
                                                            </td>
                                                            <td class="p-name">
                                                                <%=description%> 
                                                            </td>
                                                            <%

                                                                if (Status.equalsIgnoreCase("For eligibility check - Action needed") || Status.equalsIgnoreCase("For eligibility check")) {

                                                            %>
                                                            <td class="p-name">
                                                                <a href="Contractor_ViewEligibilityDocuments?conid=<%=contid%>&projectname=<%=name2%>&iddd=<%=iddd%>"> <%=Status%> </a>
                                                            </td>
                                                            <%

                                                            } else {
                                                            %>

                                                            <td class="p-name">
                                                                <%=Status%>
                                                            </td>

                                                            <%
                                                                }

                                                            %>


                                                        </tr>
                                                    </tbody>
                                                    <%                                                           }
                                                    %>
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
