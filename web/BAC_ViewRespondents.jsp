<%-- 
    Document   : Citizen_Home
    Created on : 02 4, 16, 9:19:29 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Contractor_Has_Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Project"%>
<%@page import="Entity.Employee"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Employee bac = (Employee) session.getAttribute("user");%>
<%boolean isFailed = (Boolean) request.getAttribute("isFailed");%>
<%int itbId = (Integer) request.getAttribute("itbId");%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>View Respondents</title>
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






        <%

            ArrayList<Contractor_Has_Project> contractors = (ArrayList<Contractor_Has_Project>) session.getAttribute("contractors");
            Project project = (Project) request.getAttribute("projectDetails");

            String projID = (String) request.getAttribute("project_id");
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
                                    <div class="panel-body">

                                        <table class="table table-hover p-table">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Status</th>


                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th>
                                                        <span class="pull-right">
                                                            <%if (!project.getStatus().equalsIgnoreCase("For Negotiation")) {%>
                                                            <%if (!isFailed) {%><a class="btn btn-danger" data-toggle="modal" href="#failedbidM">Declare Failure of Bid</a><%}%>
                                                            <%if (isFailed) {%><a class="btn btn-danger" data-toggle="modal" id="negotiatedB">Invite contractors to bid</a><%}%>
                                                            <%}%>
                                                        </span>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <%

                                                for (int x = 0; x < contractors.size(); x++) {
                                                    int idd = contractors.get(x).getID();
                                                    int id = contractors.get(x).getContractor().getID();
                                                    String name = contractors.get(x).getContractor().getName();
                                                    String status = contractors.get(x).getStatus();
                                            %>

                                            <tbody>
                                                <tr>
                                                    <td class="p-name">
                                                        <%out.print(name);%>
                                                    </td>
                                                    <td class="p-name">
                                                        <%out.print(status);%>
                                                    </td>

                                                    <td>
                                                        <form action="BAC_ViewContractorProfile">
                                                            <input type="hidden" name="contractorID" value="<%=id%>">
                                                            <input type="hidden" name="itbId" value="<%=itbId%>">
                                                            <button type="submit" style="width: 100%" class="btn btn-success" value=""><i class="fa fa-eye"></i>Open profile</button>

                                                        </form>
                                                    </td>
                                                    <td>
                                                        <form action="BAC_ViewEligibilityDocuments">
                                                            <input type="hidden" name="contractor_has_projectID" value="<%=idd%>">
                                                            <input type="hidden" name="projID" value="<%=projID%>">

                                                            <input type="hidden" name="itbId" value="<%=itbId%>">
                                                            <button type="submit" style="width: 100%" class="btn btn-success" value="">Open documents</button>

                                                        </form>
                                                    </td>

                                                    <%

                                                        if (status.equals("Eligible to bid")) {

                                                    %>
                                                    <td>
                                                        <form action="BAC_PlaceAward">
                                                            <input type="hidden" name="contractor_has_projectID" value="<%=idd%>">
                                                            <input type="hidden" name="projID" value="<%=projID%>">
                                                            <input type="hidden" name="itbId" value="<%=itbId%>">

                                                            <button type="submit" style="width: 100%" class="btn btn-success" value="">Select as winning bidder</button>

                                                        </form>
                                                    </td>

                                                    <%
                                                        }

                                                    %>
                                                </tr>
                                            </tbody>
                                            <%}%>


                                        </table>






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
        <form action ="BAC_SetFailBid">
            <div class="modal fade" id="failedbidM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Declare Failure of Bidding</h4>
                        </div>
                        <div id="modalBody" class="modal-body" style="overflow-y: auto;">
                            <fieldset title="Description" class="step" id="default-step-0">
                                <legend> </legend>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label">Reason: </label>
                                    <div class="col-lg-10">
                                        <textarea class="form-control" style="resize: none;" name="failReason" id="taskDesc" cols="60" rows="3"></textarea>
                                        <br>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label">Tentative Schedule for Re-post</label>
                                    <div class="col-lg-10">
                                        <input type="date" class="form-control" name="failStart" id="taskStart" cols="60" rows="5"></textarea>
                                    </div>
                                </div>


                            </fieldset>

                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                            <input type="submit" class="btn btn-success" value="Submit">
                            <input type="hidden" name="projId" value="<%=projID%>">
                            <input type="hidden" name="itbId" value="<%=itbId%>">
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="modal fade" id="negotiatedM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Negotiated Procurement</h4>
                    </div>
                    <div id="modalBody" class="modal-body" style="overflow-y: auto;">
                        <fieldset title="Description" class="step" id="default-step-0">
                            <span class="help-block" style="color:red"><center><i>*This project had gone through two failed bids</i></center></span>

                            <div class="form-group">
                                <center>
                                    <table border="0" id="tableN" cellpadding="3" cellspacing="0" style="width: 90%">
                                        <tr>
                                            <th>Idle Contractors</th>
                                            <th></th>
                                            <th>Selected Contractors</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <select name="list1" id="list1" size="9" MULTIPLE style="width: 200px">
                                                </select>
                                            </td>
                                            <td align="center" valign="middle">
                                                <input type="Button" value=">>" class="btn btn-info btn-sm" id="button1"><br>
                                                <br>
                                                <input type="Button" value="<<" class="btn btn-info btn-sm" id="button2">
                                            </td>
                                            <td>
                                                <select name="list2" id="list2" size="9" MULTIPLE style="width: 200px">
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                    <br>
                                </center>
                                <br>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label">Message</label>
                                    <div class="col-lg-10">
                                        <textarea class="form-control" name="messageN" id="messageN" cols="60" rows="3"></textarea>
                                    </div><br>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" id="sendInv" value="Send Invitation">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                        <input type="hidden" name="projId" id="projId" value="<%=projID%>">
                        <input type="hidden" name="itbId" id="itbId" value="<%=itbId%>">

                    </div>

                </div>

            </div>
        </div>



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
        <script>
            var arr = [];
            $(function () {
                $("#button1").click(function () {
                    $("#list1 > option:selected").each(function () {
                        $(this).remove().appendTo("#list2");
                        arr.push($(this).val());


                    });
                });

                $("#button2").click(function () {
                    $("#list2 > option:selected").each(function () {
                        $(this).remove().appendTo("#list1");
                        $.each(arr, function (i) {
                            if ($(this).val() === arr[i]) {
                                arr.splice(i, 1);
                            }
                        });
                    });
                });
            });

            $('#negotiatedB').click(function () {
                $.ajax({
                    type: 'post',
                    url: 'generateidlecontractors',
                    dataType: 'json',
                    cache: false,
                    success: function (data) {
                        $("#list1").empty();
                        $.each(data, function (i) {
                            $('#list1').append('<option value="' + data[i].ID + '">' + data[i].Name + '</option>');
                        });

                    }
                });
                $('#negotiatedM').modal();

            });

            $('#sendInv').click(function () {

                $.ajax({
                    type: 'post',
                    url: 'BAC_SendBidInvitation',
                    dataType: 'json',
                    data: {itbId: $('#itbId').val(), projId: $('#projId').val(), messageN: $('#messageN').val(), contractor: JSON.stringify(arr)},
                    cache: false,
                    success: function (data) {
                        alert("Invitations has been sent");
                        window.location = data.url;
                    }

                });

            });
        </script>
    </body>
</html>

