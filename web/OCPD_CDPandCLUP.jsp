<%-- 
    Document   : GS_CDPandCLUP
    Created on : 09 2, 15, 8:51:02 AM
    Author     : User
--%>

<%@page import="Entity.Employee"%>
<%@page import="Entity.PlanningDocument"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% Employee e = (Employee) session.getAttribute("user");%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>CDP and CLUP</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/dropzone/css/dropzone.css" rel="stylesheet"/>
        <!--right slidebar-->
        <link href="css/slidebars.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
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
                                <!--
                                SAMPLE CODE FOR MESSAGE:
                                
            <li>
                <a href="#">
                    <span class="photo"><img alt="avatar" src="./img/avatar-mini.jpg"></span>
                          <span class="subject">
                          <span class="from">Jonathan Smith</span>
                          <span class="time">Just now</span>
                          </span>
                          <span class="message">
                              Hello, this is an example msg.
                          </span>
                </a>
            </li>
           
                               ADD THE CODE BELOW IF AT LEAST ONE(?) MESSAGE IS LISTED
            <li>
                <a href="#">See all messages</a>
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
                            <a href="OCPD_Home">
                                <i class="fa fa-dashboard"></i>
                                <span>Home</span>
                            </a>
                        </li>


                        <li>
                            <a href="OCPD_ViewPlanningDocument" class="active">
                                <i class="fa fa-book"></i>
                                <span>CLUP and CDP</span>
                            </a>
                        </li>

                        <!--multi level menu start-->
                        <li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa fa-tasks"></i>
                                <span>Project Proposals</span>
                            </a>
                            <ul class="sub">
                                <li><a  href="OCPD_ViewProjectList">&nbsp; &nbsp; &nbsp; &nbsp; View Project Proposals</a></li>
                                <li class="sub-menu">
                                    <a  href="">&nbsp; &nbsp; &nbsp; &nbsp; Monitor Projects</a>
                                    <ul class="sub">
                                        <li><a  href="OCPD_Timeline.jsp">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; View Timeline</a></li>
                                        <li class="sub-menu">
                                            <a  href="OCPD_ViewProjectStatus">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; View Project Status</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!--multi level menu end-->
                        <li>
                            <a href="OCPD_NotificationList">
                                <i class="fa fa-book"></i>
                                <span>Notifications</span>
                            </a>
                        </li>
                        <li>
                            <a href="OCPD_ActivityList">
                                <i class="fa fa-book"></i>
                                <span>Department Activity Log</span>
                            </a>
                        </li>

                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>

            <section id="main-content">
                <section class="wrapper site-min-height">
                    <section class="panel">
                        <!-- page start-->

                        <%

                            ArrayList<PlanningDocument> documents = (ArrayList<PlanningDocument>) request.getAttribute("documents");

                        %>

                        <h3>CDP and CLUP <button type="button" data-toggle="modal" class="btn btn-success " style="margin-left: 70%;" href="#uploadModal"><i class="fa fa-cloud-upload"></i> Upload</button></h3>
                        <br>
                        <h4>&nbsp;&nbsp;&nbsp; 2016</h4>
                        <br>

                        <%  for (int x = 0; x < documents.size(); x++) {

                                String type = documents.get(x).getType();
                                String displayType = null;
                                if (type.equalsIgnoreCase("CLUP")) {
                                    displayType = "Comprehensive Land Use Plan";
                                } else {
                                    displayType = "Comprehensive Development Plan";
                                }

                                String dateUploaded = documents.get(x).getDateUploaded();
                                String[] date = dateUploaded.split("-");
                                String[] months = {"January", "February", "March", "April",
                                    "May", "June", "July", "August", "September", "October",
                                    "November", "December",};
                                String dateUploaded2 = months[Integer.parseInt(date[1]) - 1] + " " + date[2] + " " + date[0];
                                String URL = documents.get(x).getUrl();
                                String Title = documents.get(x).getName();
                        %>

                        <form name="UploadRevision" action="OCPD_UploadRevisedDocument" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="Document_ID" value="<%=documents.get(x).getId()%>">    
                            <article class="media" style="padding-left: 60px">
                                <a class="pull-left thumb p-thumb">
                                    <img src="img/product1.jpg">
                                </a>
                                <div class="media-body">
                                    <%=displayType%> (<%=type%>)
                                    <p></p>

                                    File Name: <%=Title%>
                                    <p></p>
                                    <p>Date Posted: <%=dateUploaded2%></p>
                                </div>

                            </article>

                            <a href="<%=URL%>" target="_blank"><button type="button" class="btn btn-success" style="margin-left: 60px; width: 100px; margin-top: -5px;"><i class="fa fa-eye"></i> View </button> </a>
                            <button type="button" class="btn btn-info "style="width: 150px; margin-top: -5px;" data-toggle="modal" href="#updateModal"><i class="fa fa-refresh"></i> Upload Revision</button>
                            <a href="<%=URL%>" download><button type="button" class="btn btn-white">
                                    <i class="fa fa-download"></i>
                                </button></a>
                        </form>

                        <%}%>

                        <!-- page end-->
                    </section>
                </section>
            </section>

            <div class="modal fade modal-dialog-center " id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog ">

                    <div class="modal-content-wrap">
                        <form name="uploadDocument" action="OCPD_UploadCDPCLUP" method="POST" enctype="multipart/form-data">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Upload CDP and CLUP</h4>
                                </div>
                                <div class="modal-body">


                                    <div class="panel-body">

                                        <select name="type">
                                            <option value="CDP">CDP</option>
                                            <option value="CLUP">CLUP</option>
                                        </select>
                                        <br>
                                        <br>
                                        <input type="file" name="uploadFile">

                                    </div>



                                </div>
                                <div class="modal-footer">
                                    <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                    <button class="btn btn-success" type="submit"> Upload</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade modal-dialog-center " id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog ">

                    <div class="modal-content-wrap">
                        <form name="uploadDocument" action="OCPD_UdateDocument" method="POST" enctype="multipart/form-data">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Update CDP and CLUP</h4>
                                </div>
                                <div class="modal-body">


                                    <div class="panel-body">

                                        <select name="type">
                                            <option value="CDP">CDP</option>
                                            <option value="CLUP">CLUP</option>
                                        </select>
                                        <br>
                                        <br>
                                        <input type="file" name="updateFile">

                                    </div>



                                </div>
                                <div class="modal-footer">
                                    <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                    <button class="btn btn-success" type="submit"> Upload</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>           
            <!--main content end-->

            <!--main content end-->

            <!-- Right Slidebar start -->
            <div class="sb-slidebar sb-right sb-style-overlay">
                <h5 class="side-title"> Pending Tasks</h5>
                <!--SAMPLE CODE FOR TASK + PROGRESS BAR
                        
                              <ul class="p-task tasks-bar">
                    <li>
                        <a href="#">
                            <div class="task-info">
                                <div class="desc">Dashboard v1.3</div>
                                <div class="percent">40%</div>
                            </div>
                            <div class="progress progress-striped">
                                <div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success">
                                    <span class="sr-only">40% Complete (success)</span>
                                </div>
                            </div>
                        </a>
                    </li>
                              </ul>  -->

            </div>
            <!-- Right Slidebar end -->

        </section>

        <!--vertical center Modal start-->
        <div class="modal fade modal-dialog-center " id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content-wrap">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Upload CDP and CLUP</h4>
                        </div>
                        <div class="modal-body">

                            <div class="panel-body">
                                <form action="assets/dropzone/upload.php" class="dropzone" id="my-awesome-dropzone"></form>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-warning" type="button"> Upload</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- vertical center Modal end -->




        <!-- js placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/slidebars.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="assets/dropzone/dropzone.js"></script>
        <script src="js/respond.min.js" ></script>

        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>
    </body>
</html>
