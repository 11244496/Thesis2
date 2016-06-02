<%-- 
    Document   : GS_Home
    Created on : 09 2, 15, 8:50:49 AM
    Author     : User
--%>

<%@page import="Entity.Material"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Project"%>
<%@page import="Entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Employee e = (Employee) session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>Template</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" >

        <!--right slidebar-->
        <link href="css/slidebars.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet" >

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
        
<!--        <script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
                    <script>

               $(function () {
            var $value = $('#value');
            var $input = $('#quantity');
            $input.on('keydown', function () {
            setTimeout(function () {
            $value.html($input.val());
            }, 0);
            });
            });   
                    </script>
         <meta charset="utf-8">           -->
               <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>      
                    
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
            <!--sidebar end-->
            
            
            <%
            
            Project project = (Project) request.getAttribute("project");
            ArrayList<Material> materials = (ArrayList<Material>) request.getAttribute("materials");
            
            %>

            
            
            <!--main content start-->
            <section id="main-content">
                
                
                
                <section class="wrapper site-min-height">
                    <section class="panel">				
                     
                        
                            <div class="panel-body">
                                
                                <label>Project Name: </label>  <%out.print(project.getName());%>       


                                   <span class="pull-right"> <label>Project Status Report: </label> <form action="GS_FullProgressReport">
                                           <input type="hidden" name="projectidd" value="<%=project.getId()%>">
                                           
                                           <button type="submit" id="" class="btn btn-info btn-sm">Project Status Report</button></form></span>
                   <br>
                                
                                
                                
                            </div>
                            <hr>
                            <div class="panel-body">
                                <form action="GS_SubmitProgressEntry">
                                    <input type="hidden" name="projectid" value="<%=project.getId()%>">   
                                    
                                    
                                <table class="table table-hover p-table">
                                    <thead>
                                        <tr>
                                            <th style='text-align: center;' colspan = '3'>Payment</th>
                                            

                                        </tr>
                                    </thead>
                                    <thead>
                                    <tr>    
                                    <th style='text-align: center;'>Material</th>   
                                    <th style='text-align: center;'>Quantity</th>
                                    <th style='text-align: center;'>Project %</th>
                                    
                                    </tr>
                                    </thead>        

                                    <tbody>
                                        <%
                                        for(int x = 0; x < materials.size(); x++){
                                        
                                        %>
                                        <tr>
                                            <td><center><input name="material" value="<%=materials.get(x).getName()%>" readonly>
                                    </center>
                                    
                                            </td>
                                            <td><center><input id="quantity" name="quantity" required>
                                            </center>
                                            </td>
                                            <td><center>
                                                <input id="percentage" name="percentage" value="<%=materials.get(x).getPercentage()%>" readonly>
                                                </center>
                                            </td>
                                            
                                        </tr>
                                        <%
                                        }
                                        %>




                                    </tbody>
                                </table> 
                                    <center>
                                    <button  class="btn btn-success" type="submit">Submit entry</button> 
                                    </center>
                                </form>
                                
                                
                            </div>
                            
                                
                        

                        <!-- page end-->
                    </section>
                </section>
                <!--main content end-->

                <!-- Right Slidebar start -->
                <div class="sb-slidebar sb-right sb-style-overlay">
                    <h5 class="side-title"> Pending Tasks</h5>
                </div>

            </section>
<!--                                        <script>
                                         
                     $('input').keyup(function(){ // run anytime the value changes

                            var firstValue = parseFloat($('#quantity').val()) || 0; // get value of field
                            var secondValue = parseFloat($('#percentage').val()) || 0; // convert it to a float

 
                            $('#value').html(firstValue * secondValue); // output it
                            });
                                        
                                            
                                            
                                            
                
                                        </script>    
                                        -->
    
                                        
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
    </body>
</html>

