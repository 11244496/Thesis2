<%-- 
    Document   : Citizen_Home
    Created on : 02 4, 16, 9:19:29 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Eligibility_Document"%>
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
        <%

            ArrayList<Eligibility_Document> documents = (ArrayList<Eligibility_Document>) request.getAttribute("documents");
            String projectName = (String) request.getAttribute("projectName");
            Project project = (Project) request.getAttribute("project");
            String filename = null;
            String foldername = null;
            String dateuploaded = null;
            String documenttype = null;

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
                                        <%                                         int contprojID1 = 0;

                                        %>
                                        <form action="" class="form-horizontal tasi-form" method="POST" enctype="multipart/form-data">
                                            <input type="hidden" name="projectName" value="<%=projectName%>">


                                            <table class="table table-hover p-table">
                                                <thead>
                                                    <tr>
                                                        <th>Document</th>
                                                        <th>Date Uploaded</th>
                                                        <th>Status</th>



                                                        <th></th>

                                                    </tr>
                                                </thead>
                                                <%

                                                    for (int x = 0; x < documents.size(); x++) {
                                                        filename = documents.get(x).getFileName();
                                                        foldername = documents.get(x).getFolderName();
                                                        dateuploaded = documents.get(x).getDateUploaded();
                                                        documenttype = documents.get(x).getType();
                                                        String status = documents.get(x).getStatus();
                                                        int docIDxx = documents.get(x).getID();
                                                        contprojID1 = documents.get(x).getContractor_has_project().getID();
                                                        String fold = foldername.split("/", 4)[3];


                                                %>
                                                <input type="hidden" value="<%=contprojID1%>" id="contId">
                                                <input type="hidden" name="filePath" value="<%=fold + "/" + filename%>">   
                                                <input type="hidden" name="fileType" value="<%=documenttype%>">
                                                <input type="hidden" name="docIDxx1" value="<%=docIDxx%>">

                                                <input type="hidden" name="projectID" value="<%=project.getId()%>"

                                                       <tbody>
                                                    <tr>
                                                        <td class="p-name">
                                                            <a href='javascript:getFile(<%=docIDxx%>)'><%=x + 1%>.  <%out.print(documenttype);%></a>
                                                        </td>
                                                        <td class="p-name">
                                                            <%out.print(dateuploaded);%>
                                                        </td>
                                                        <%
                                                            if (status.equalsIgnoreCase("Pending - Action needed") == true) {
                                                        %>   
                                                        <td id="stat">
                                                            <a href='javascript:getComment(<%=docIDxx%>)'>  <%out.print(status);%> </a>
                                                        </td>
                                                        <%
                                                        } else {

                                                        %> 

                                                        <td id="stat">
                                                            <%out.print(status);%> 
                                                        </td>
                                                        <%

                                                            }
                                                        %>




                                                        <td>
                                                            <a class="btn btn-success" href='javascript:getFile2(<%=docIDxx%>)'>Upload Document</a>
                                                        </td>



                                                    </tr>
                                                </tbody>
                                                <%}%>


                                            </table>
                                        </form>    
                                        <hr>




                                    </div>





                                </section>
                                <!--widget end-->

                            </div>
                        </div>

                    </div>
                </section>
                <!-- page end-->
            </section>

            <div class="modal fade" id="eligibilitydocuments" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 id="doctype" class="modal-title"></h4>
                            <h5 id="dateuploaded"> Date posted: <%//=dateuploaded%></h5>
                        </div>
                        <div class="modal-body">
                            <iframe id="frameDoc" src ="" width="870" height="600"></iframe>


                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>

                        </div>
                    </div>
                </div>
            </div>  

            <div class="modal fade" id="eligibilitydocuments3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <form action="">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 id="doctype3" name="documentType" class="modal-title"></h4>
                                <h5 id="dateuploaded3"> Date posted: <%//=dateuploaded%></h5>
                            </div>
                            <div class="modal-body">
                                <textarea id="message" name="comment" style="resize: none; width: 100%; height: 350px;" readonly></textarea>

                            </div>
                            <div class="modal-footer">

                                <input type="hidden" id="eligibility_document_id3" name="eligibility_document_id" value="">



                                <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>

                            </div>
                        </form>

                    </div>
                </div>
            </div>



            <div class="modal fade top-modal-without-space" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <form action="Contractor_ReUpload" class="form-horizontal tasi-form" method="POST" enctype="multipart/form-data">  
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content-wrap">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h4 class="modal-title">Re upload document</h4>
                                </div>
                                <div class="modal-body">

                                    <center>
                                        <input type="hidden" name="ProjectName" value="<%=project.getName()%>">
                                        <input type="hidden" name="ProjectID" value="<%=project.getId()%>">
                                        <input  type="hidden" id="docID" name="docID" value="">
                                        <input  type="hidden" id="doctype1" name="doctype1" value="">
                                        <input type="hidden" id="dateuploaded1"  name="dateuploaded1" value="">

                                        <input name="Documents" type="file" class="default">
                                    </center>

                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-success" type="submit">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>








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

        <script>
            function chooseFile() {
                $("#fileInput").click();
            }
        </script>

        <script>
            function getFile(docid) {
                console.log(docid);
                $.ajax({
                    type: 'POST',
                    url: 'geteligibilityfile',
                    dataType: 'json',
                    cache: false,
                    data: {documentID: docid},
                    success: function (file) {
                        var path = file.FolderName + "/" + file.FileName;
                        var dateuploaded = file.DateUploaded;
                        var docType = file.type;
                        $('#frameDoc').attr('src', path);
                        $('#doctype').text(docType);
                        $('#dateuploaded').text("Date uploaded: " + dateuploaded);
                        $('#eligibilitydocuments').modal();

                    }
                });

            }
        </script>
        <script>
            function getFile2(docid) {
                console.log(docid);
                $.ajax({
                    type: 'POST',
                    url: 'geteligibilityfile',
                    dataType: 'json',
                    cache: false,
                    data: {documentID: docid},
                    success: function (file) {

                        $('#docID').val(file.ID);
                        $('#doctype1').val(file.type);
                        $('#dateuploaded1').val("Date uploaded: " + file.DateUploaded);
                        $('#uploadModal').modal();

                    }
                });

            }
        </script>
        <script>
            function getComment(docid) {
                console.log(docid);
                $.ajax({
                    type: 'POST',
                    url: 'geteligibilityfile',
                    dataType: 'json',
                    cache: false,
                    data: {documentID: docid},
                    success: function (file) {
//                        var path = file.FolderName + "/" + file.FileName;
                        var dateuploaded = file.DateUploaded;
                        var docType = file.type;
//                        $('#filePath').val(path);
                        $('#eligibility_document_id3').val(file.ID);
                        $('#doctype3').text(docType);
                        $('#dateuploaded3').text("Date uploaded: " + dateuploaded);
                        $('#message').text(file.BAC_Remarks);
                        $('#eligibilitydocuments3').modal();

                    }
                });

            }
        </script>



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>
        <script src="js/slidebars.min.js"></script>
    </body>
</html>
