
<%@page import="Entity.Eligibility_Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Project"%>
<%@page import="Entity.Employee"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Employee bac = (Employee) session.getAttribute("user");%>
<%
    ArrayList<Eligibility_Document> documents = (ArrayList<Eligibility_Document>) request.getAttribute("documents");
    int contprojID1 = documents.get(0).getContractor_has_project().getID();
%>
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

    <body onload="checkTable(<%=contprojID1%>)">

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
            Eligibility_Document doc = (Eligibility_Document) request.getAttribute("doc");

            String projID = (String) request.getAttribute("projID");
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


                                    <section class="panel">


                                        <div class="panel-body bio-graph-info">

                                            <header class="panel-heading">
                                                Document Review
                                            </header>
                                            <center>            
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <section class="panel">
                                                            <div class="panel-body">
                                                                <ul class="summary-list">
                                                                    <li>
                                                                        <a href="javascript:;">
                                                                            <i class="fa fa-file-text-o"></i>
                                                                            <%=doc.getApproved()%> Approved Documents
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:;">
                                                                            <i class="fa fa-file-text-o"></i>
                                                                            <%=doc.getPending()%> Pending Documents
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:;">
                                                                            <i class="fa fa-file-text-o"></i>
                                                                            <%=doc.getPending_Action_Needed()%> Document/s with needed action
                                                                        </a>
                                                                    </li>

                                                                </ul>
                                                            </div>
                                                        </section>
                                                    </div>
                                                </div>
                                            </center>             





                                        </div>




                                    </section>







                                    <div class="panel-body">

                                        <table class="table table-hover p-table">
                                            <thead>
                                                <tr>
                                                    <th>Document</th>
                                                    <th>Date Uploaded</th>
                                                    <th>Status</th>



                                                    <th></th>
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


                                            %>
                                            <input type="hidden" value="<%=contprojID1%>" id="contId">

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
                                                        <button id="approve1" class="btn btn-success" type="button" style="width: 100px"  onClick="javascript:approveDocument(<%=docIDxx%>,<%=contprojID1%>)">Approve</button>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-danger" type="button" style="width: 100px" onClick="javascript:getFile2(<%=docIDxx%>)">Hold</button>       
                                                    </td>


                                                </tr>
                                            </tbody>
                                            <%}%>


                                        </table>
                                        <hr>

                                        <form action="BAC_ConfirmContractor">

                                            <input type="hidden" name="contractor_has_projectID" value="<%=contprojID1%>">
                                            <input type="hidden" name="projID" value="<%=projID%>">

                                            <center>      
                                                <button id="confirmContractor" class="btn btn-success" type="submit" style="height: 60px;width: 200px;" disabled><font size="4">Confirm contractor</font></button>        
                                            </center>
                                        </form>    


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


            <div class="modal fade" id="eligibilitydocuments2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-open">
                    <div class="modal-content">

                        <form action="BAC_HoldContractorDocument">
                            <input type="hidden" name="contractor_has_project" value="<%=contprojID1%>">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 id="doctype2" name="documentType" class="modal-title"></h4>
                                <h5 id="dateuploaded2"> Date posted: <%//=dateuploaded%></h5>
                            </div>
                            <div class="modal-body">
                                <textarea name="comment" style="resize: none; width: 100%; height: 280px;"></textarea>

                            </div>
                            <div class="modal-footer">

                                <input type="hidden" id="eligibility_document_id" name="eligibility_document_id" value="">


                                <button class="btn btn-danger" type="submit">Enter</button>
                                <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>

                            </div>
                        </form>

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
                        var path = file.FolderName + "/" + file.FileName;
                        var dateuploaded = file.DateUploaded;
                        var docType = file.type;
                        $('#eligibility_document_id').val(file.ID);
                        $('#doctype2').text(docType);
                        $('#dateuploaded2').text("Date uploaded: " + dateuploaded);
                        $('#eligibilitydocuments2').modal();

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

                        var dateuploaded = file.DateUploaded;
                        var docType = file.type;
                        $('#eligibility_document_id3').val(file.ID);
                        $('#doctype3').text(docType);
                        $('#dateuploaded3').text("Date uploaded: " + dateuploaded);
                        $('#message').text(file.BAC_Remarks);
                        $('#eligibilitydocuments3').modal();

                    }
                });

            }
        </script>

        <script>
            function approveDocument(docid, cont) {
                console.log(docid);

                $.ajax({
                    type: 'POST',
                    url: 'BAC_approvedocument',
                    dataType: 'json',
                    cache: false,
                    data: {documentID: docid},
                    success: function (file) {
                        var status = file;
                        $('#stat').text(status);
                        window.location.reload();
                        checkTable(cont);
                    }

                });




            }
        </script>



        <script>
            function checkTable(cont) {

                $.ajax({
                    type: 'POST',
                    url: 'BAC_checkalldocuments',
                    dataType: 'json',
                    cache: false,
                    data: {contprojID: cont},
                    success: function (text) {
                        console.log(text);

                        if (text === "Y") {

                            document.getElementById("confirmContractor").disabled = false;

                        }
                        else {
                            document.getElementById("confirmContractor").disabled = true;
                            ;
                        }


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
