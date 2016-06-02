<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entity.Testimonial"%>
<%@page import="Entity.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Employee"%>
<!DOCTYPE html>
<html lang="en">


    <% Employee e = (Employee) session.getAttribute("user");
       ArrayList<Schedule> schedule = (ArrayList<Schedule>) request.getAttribute("allsched"); 
        
    %>


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
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />

        <!--right slidebar-->
        <link href="css/slidebars.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet" />

        <!--dynamic table-->
        <link href="assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet" />
        <link href="assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/data-tables/DT_bootstrap.css" />

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
                            <a href="GS_Home" class="active">
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
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <!-- page start-->
                    <section class="panel">
                        <header class="panel-heading">
                            Project Status Report
                        </header>
                        <div class="panel-body">

<%

                                   long total = 0; 


%>
                            <table class="table table-hover p-table">
                                <thead>
                                    <tr>
                                        <td>
                                         Schedule   
                                        </td>    
                                        <td>
                                         Target End date  
                                        </td>
                                        <td>
                                         Actual End date  
                                        </td>
                                        <td>
                                         Remarks
                                        </td>
                                        <td>
                                         Days  
                                        </td>
                                    </tr>    
                                </thead>
                                <tbody>
                                    <%
                                    
                                    for(int x =0; x < schedule.size();x++){
                                   
                                          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                              Date convertedCurrentDate1 = sdf.parse(schedule.get(x).getEnddate());
                                              String date1 = sdf.format(convertedCurrentDate1);
                                              
                                              String date2 = "";
                                              long diffDays = 0;
                                              
                                              if(schedule.get(x).getActualenddate() != null){
                                              Date convertedCurrentDate2 = sdf.parse(schedule.get(x).getActualenddate());
                                              date2 = sdf.format(convertedCurrentDate2);
                                              
                                              
                                              long diff = Math.abs(convertedCurrentDate1.getTime() - convertedCurrentDate2.getTime());
                                               diffDays = diff / (24 * 60 * 60 * 1000);
                                              
                                               total += diffDays;
                                              }
                                              
                                              
                                        
                                        
                                    %>
                                    <tr>
                                       <td>
                                         <%out.print(schedule.get(x).getEvent());%>   
                                        </td>    
                                        <td>
                                         <%out.print(schedule.get(x).getEnddate());%>   
                                        </td>
                                        
                                        <%
                                        if(schedule.get(x).getActualenddate() != null){
                                        %>
                                        
                                        <td>
                                         <%out.print(schedule.get(x).getActualenddate());%>   
                                        </td>
                                        
                                        <%
                                        } else {
                                        
                                        %>
                                        
                                        <td>
                                         <%out.print(schedule.get(x).getEnddate());%>   
                                        </td>
                                        
                                        
                                        <%
                                        
                                        }
                                        %>
                                        
                                        <%
                                        if(diffDays > 0){
                                        %>
                                        <td>
                                            <font color="blue"> Ahead </font>
                                        </td>
                                        <%
                                        }
                                        
                                        if(diffDays == 0){
                                        %>
                                        <td>
                                            <font color="green"> On-time </font>
                                        </td>
                                        <%
                                        }
                                        if(diffDays < 0 ){
                                        %>
                                        
                                        <td>
                                            <font color="red"> Delayed </font>
                                        </td>
                                        
                                        <%
                                        }
                                        %>
                                        
                                        <%
                                        if(diffDays > 0 || diffDays < 0){
                                        %>
                                        <td>
                                         <%out.print(diffDays);%> 
                                        </td> 
                                        <%
                                        }
                                        
                                        
                                        %>
                                       
                                    </tr>  
                                    <%
                                    }
                                    
                                    %>
                                    
                                    <tr>
                                        <%if(total > 0){ %>
                                        <td>
                                            <h3>Status: Project is ahead <%out.print(total);%> days</h3>
                                        </td>
                                        
                                        <%
                                        }
                                        else if(total < 0){ 
                                        %>
                                        
                                        <td>
                                            <h3>Status: Project is delayed <%out.print(total);%> days</h3>
                                        </td>
                                        
                                        <%
                                        }
                                        else {
                                        %>
                                        
                                        <td>
                                            <h3>Status: Project on schedule</h3>
                                        </td>
                                        
                                        <%
                                        
                                        }
                                        %>
                                        
                                    <tr>    
                                    
                                    
                                </tbody>
                                
                            </table>    
                            
                            


                        </div>
                    </section>


                    <!-- page end-->
                </section>
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

         

        <!--footer end-->
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/jquery-ui-1.9.2.custom.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript" src="assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>
        <script src="js/respond.min.js" ></script>

        <!--right slidebar-->
        <script src="js/slidebars.min.js"></script>

        <!--dynamic table initialization -->
        <script src="js/dynamic_table_init.js"></script>


        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>
    </body>
</html>
