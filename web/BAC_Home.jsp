<%-- 
    Document   : Citizen_Home
    Created on : 02 4, 16, 9:19:29 AM
    Author     : RoAnn
--%>

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
                        <a href="BAC_Home" class="active">
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


        <!--main content start-->
        <section id="main-content">
            <%

                ArrayList<Project> projects = (ArrayList<Project>) request.getAttribute("Projects");
                ArrayList<Project> projectsWithInvitation = (ArrayList<Project>) request.getAttribute("Projects with Invitation");
                ArrayList<Project> projectsIMPL = (ArrayList<Project>) request.getAttribute("projectsIMPL");
                ArrayList<Project> projectsNego = (ArrayList<Project>) request.getAttribute("projectsNego");

            %>

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
                                                    Pending 
                                                </a>
                                            </li>

                                            <li class="">
                                                <a href="#approved" data-toggle="tab">
                                                    Projects with invitation to bid
                                                </a>
                                            </li>
                                            <li class="">
                                                <a href="#negotiation" data-toggle="tab">
                                                    Projects for negotiation
                                                </a>
                                            </li>

                                            <li class="">
                                                <a href="#implementation" data-toggle="tab">
                                                    Projects with awarded contractors
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
                                                            <h3>Projects ready for invite</h3>

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
                                                            <th>Budget</th>



                                                            <th></th>

                                                        </tr>
                                                    </thead>
                                                    <% for (int a = 0; a < projects.size(); a++) {
                                                            String id = projects.get(a).getId();
                                                            String name = projects.get(a).getName();
                                                            String description = projects.get(a).getDescription();
                                                            String type = projects.get(a).getType();
                                                            float budget = projects.get(a).getBudget();
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

                                                            <td class="p-name">
                                                                <%out.print(budget);%>
                                                            </td>
                                                            <td>
                                                                <form action="BAC_ViewProject">
                                                                    <input type="hidden" name="projectID" value="<%=id%>">

                                                                    <button type="submit" class="btn btn-success btn-xs" value="View proposal details"><i class="fa fa-eye"></i> View project details</button>

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
                                                            <h3>Projects with released invitation to bid</h3>

                                                        </header><br>

                                                    </div>
                                                </div>

                                                <table class="table table-hover p-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Type </th>
                                                            <th>Status</th>


                                                            <th></th>

                                                        </tr>
                                                    </thead>


                                                    <%

                                                        for (int b = 0; b < projectsWithInvitation.size(); b++) {

                                                            String idd = projectsWithInvitation.get(b).getId();
                                                            String name = projectsWithInvitation.get(b).getName();
                                                            String description = projectsWithInvitation.get(b).getDescription();
                                                            String type = projectsWithInvitation.get(b).getType();
                                                            String status = projectsWithInvitation.get(b).getStatus();
                                                            int responses = projectsWithInvitation.get(b).getResponses();
                                                            int confirmed = projectsWithInvitation.get(b).getConfirmed();
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
                                                            <td></td>


                                                            <td class="p-name">
                                                                <a href="BAC_ViewRespondents?projectid=<%=idd%>"><%out.print(responses + " submissions, " + confirmed + " eligible");%> </a>  

                                                            </td>

                                                            <td>
                                                                <form action="BAC_ViewProjectInvitation">
                                                                    <input type="hidden" name="projectID" value="<%=idd%>">
                                                                    <button type="submit" class="btn btn-success btn-xs" value="View Invitation details">Open Invitation</button>

                                                                </form>


                                                            </td>
                                                            <td>
                                                                <form action="BAC_ViewProject">
                                                                    <input type="hidden" name="projectID" value="<%=idd%>">

                                                                    <button type="submit" class="btn btn-success btn-xs" value="View proposal details"><i class="fa fa-eye"></i> View project details</button>

                                                                </form>

                                                            </td>       
                                                        </tr>
                                                    </tbody>
                                                    <%}%>
                                                </table>

                                            </div>
                                            <div class="tab-pane " id="negotiation">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <header class="panel-heading">
                                                            <h3>Projects for negotiation</h3>

                                                        </header><br>

                                                    </div>
                                                </div>

                                                <table class="table table-hover p-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Type </th>
                                                            <th>Status</th>


                                                            <th></th>

                                                        </tr>
                                                    </thead>


                                                    <%

                                                        for (int b = 0; b < projectsNego.size(); b++) {

                                                            String idd = projectsNego.get(b).getId();
                                                            String name = projectsNego.get(b).getName();
                                                            String description = projectsNego.get(b).getDescription();
                                                            String type = projectsNego.get(b).getType();
                                                            String status = projectsNego.get(b).getStatus();
                                                            int responses = projectsNego.get(b).getResponses();
                                                            int confirmed = projectsNego.get(b).getConfirmed();
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
                                                            <td></td>




                                                            <%

                                                                if (responses != 0 || confirmed != 0) {
                                                            %>
                                                            <td class="p-name">
                                                                <a href="BAC_ViewRespondents?projectid=<%=idd%>"><%out.print(responses + " submissions, " + confirmed + " eligible");%> </a>  

                                                            </td>
                                                            <%
                                                            } else {
                                                            %> 
                                                            <td class="p-name">
                                                                <%out.print(responses + " submissions, " + confirmed + " eligible");%>

                                                            </td>
                                                            <%
                                                                }

                                                            %>

                                                            <td>
                                                                <form action="BAC_ViewProjectInvitation">
                                                                    <input type="hidden" name="projectID" value="<%=idd%>">
                                                                    <button type="submit" class="btn btn-success btn-xs" value="View Invitation details">Open Invitation</button>

                                                                </form>


                                                            </td>
                                                            <td>
                                                                <form action="BAC_ViewProject">
                                                                    <input type="hidden" name="projectID" value="<%=idd%>">

                                                                    <button type="submit" class="btn btn-success btn-xs" value="View proposal details"><i class="fa fa-eye"></i> View project details</button>

                                                                </form>

                                                            </td>       
                                                        </tr>
                                                    </tbody>
                                                    <%}%>
                                                </table>

                                            </div>

                                            <div class="tab-pane " id="implementation">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <header class="panel-heading">
                                                            <h3>Projects with released invitation to bid</h3>

                                                        </header><br>

                                                    </div>
                                                </div>

                                                <table class="table table-hover p-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Type </th>
                                                            <th>Status</th>


                                                            <th>Contractor</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <%

                                                        for (int m = 0; m < projectsIMPL.size(); m++) {
                                                            String name = projectsIMPL.get(m).getName();
                                                            String desc = projectsIMPL.get(m).getDescription();
                                                            String typ = projectsIMPL.get(m).getType();
                                                            String stat = projectsIMPL.get(m).getStatus();
                                                            String contractor_Name = projectsIMPL.get(m).getContractor().getName();

                                                            String prjid = projectsIMPL.get(m).getId();
                                                            int contid = projectsIMPL.get(m).getContractor().getID();//2
                                                    %>



                                                    <tbody>
                                                        <tr>
                                                            <td class="p-name">
                                                                <%out.print(name);%>  
                                                            </td>
                                                            <td class="p-name">
                                                                <%out.print(desc);%>  
                                                            </td>
                                                            <td class="p-name">
                                                                <%out.print(typ);%>   
                                                            </td>

                                                            <td>
                                                                <%out.print(stat);%>   


                                                            </td>
                                                            <td>
                                                                <%out.print(contractor_Name);%>   


                                                            </td>
                                                            <td>
                                                                <form action="BAC_ViewBidNotices">
                                                                    <input type="hidden" name="prjid" value="<%=prjid%>">
                                                                    <input type="hidden" name="contid" value="<%=contid%>">

                                                                    <button class="btn btn-success" type="submit" onClick=""><i class="fa fa-eye">      </i>    View Bid Notices</button>

                                                                </form>

                                                            </td>
                                                            <td>                                                                    

                                                                <form action="BAC_ViewProject">
                                                                    <input type="hidden" name="projectID" value="<%=prjid%>">

                                                                    <button type="submit" class="btn btn-success" value="View proposal details"><i class="fa fa-eye"></i> View project details</button>
                                                                </form>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                    <%
                                                        }
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
