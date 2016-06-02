<%-- 
    Document   : OCPD_Home
    Created on : 09 2, 15, 7:52:33 AM
    Author     : User
--%>

<%@page import="Entity.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Employee"%>
<%@page import="Entity.Testimonial"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Testimonial t = (Testimonial) session.getAttribute("openTestimonial");%>
<%Employee e = (Employee) session.getAttribute("user");%>
<%ArrayList<Reply> rList = t.getReplies();%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>View Letter</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

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
                            <a href="GS_ViewTestimonials">
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
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <section class="panel">
                        <header class="panel-heading">
                            View Letter
                            <span class="pull-right">
                                <button type="button" id="showReply" class="btn btn-success btn-sm" onclick="showReplyDiv()"><i class="fa  fa-pencil"> </i> Write a reply</button>
                            </span>
                        </header>
                        <br>
                        <div class="panel-body">
                            <form action="Citizen_CreateLetterTestimonial" class="form-horizontal tasi-form" method="POST">
                                <div class="form-group">

                                    <label class="col-sm-2 col-sm-2 control-label">Subject </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getTitle()%>">
                                        <br>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label">From: </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getCitizen().getUser().getUsername()%>">
                                        <br>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label">Date Sent: </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getDateUploaded()%>">
                                        <br>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label">Location: </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getLocation()%>">
                                        <br>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label">Location Details: </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getLocationdetails()%>">
                                        <br>
                                    </div>    
                                    <label class="col-sm-2 col-sm-2 control-label">Concern </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=t.getConcern()%>">
                                        <br>
                                    </div>
                                    <label class="col-sm-2 col-sm-2 control-label">Message </label>
                                    <div class="col-sm-10">
                                        <textarea class="wysihtml5 form-control" rows="5" name="content" readonly style="resize: none; background: white; border:0px; "><%=t.getMessage()%></textarea>
                                    </div>
                                    <center>
                                        <button type="button" class="btn btn-default" onclick="history.go(-1)">Back</button>
                                    </center>

                                </div>
                            </form>
                        </div>
                    </section>

                    <div style="display:none;" id="replyDiv">
                        <section class="panel">
                            <header class="panel-heading">
                                Write a Reply
                            </header>
                            <br>
                            <div class="panel-body">
                                <form action="GS_ReplyTestimonial" class="form-horizontal tasi-form" method="POST">
                                    <div class="form-group">

                                        <label class="col-sm-2 col-sm-2 control-label">Message </label>
                                        <div class="col-sm-10">
                                            <textarea class="wysihtml5 form-control" rows="5" name="replyMsg"></textarea>
                                            <br>
                                        </div>

                                        <center>
                                            <button type="submit" class="btn btn-success">Submit</button>
                                        </center>

                                    </div>
                                </form>
                            </div>
                        </section>
                    </div>

                    <% if (rList.size() >= 1) {%>
                    <% for (Reply r : rList) {
                            int x = 1;%>
                    <section class="panel">
                        <header class="panel-heading">
                            Reply #<%=x%>
                        </header>
                        <br>
                        <div class="panel-body">
                            <div class="form-group">

                                <label class="col-sm-2 col-sm-2 control-label">Sender: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=r.getSender()%>">
                                    <br>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">Date Sent: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=r.getDateSent()%>">
                                    <br>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">Message </label>
                                <div class="col-sm-10">
                                    <textarea class="wysihtml5 form-control" rows="7" name="content" readonly style="resize: none; background: white; border:0px; "><%=r.getMessage()%></textarea>
                                </div>

                            </div>
                        </div>
                    </section>
                    <%x++;
                        }%>
                    <%}%>
                </section>
            </section>



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

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/slidebars.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="js/respond.min.js" ></script>

        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>
        <script>
                                            function showReplyDiv() {
                                                $('#replyDiv').show();
                                            }
        </script>
    </body>
</html>
