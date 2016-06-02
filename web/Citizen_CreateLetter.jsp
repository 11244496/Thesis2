<%-- 
    Document   : Citizen_CreateLetter
    Created on : 02 8, 16, 7:46:44 PM
    Author     : RoAnn
--%>


<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Citizen c = (Citizen) session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Create Letter</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>
            function showDiv(sel) {
                if (sel.value == "New Project")
                    document.getElementById('concernInput').style.display = "none";
                else if (sel.value == "Maintenance")
                    document.getElementById('concernInput').style.display = "none";
                else
                    document.getElementById('concernInput').style.display = "block";
            }
        </script>
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
                                <span class="username">Hello <b><u><%=c.getFirstName()%></u></b>!</span>
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
                        <a href="Citizen_Home">
                            <i class="fa fa-dashboard"></i>
                            <span>Home</span>
                        </a>
                    </li>

                    <li>
                        <a href="Citizen_SearchTestimonial">
                            <i class="fa fa-book"></i>
                            <span>Testimonials</span>
                        </a>
                    </li>

                    <li>
                        <a href="Citizen_ProjectsImplemented">
                            <i class="fa fa-book"></i>
                            <span>Projects Implemented</span>
                        </a>
                    </li>

                    <li>
                        <a href="Citizen_NotificationActivity">
                            <i class="fa fa-book"></i>
                            <span>Notification and Activity</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>

        <section id="main-content">
            <section class="wrapper site-min-height">
                <section class="panel">
                    <header class="panel-heading">
                        Create Letter
                    </header>
                    <br>
                    <div class="panel-body">
                        <form action="Citizen_CreateLetterTestimonial" class="form-horizontal tasi-form" method="POST">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Subject <i class="formAsterisk">*</i></label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="subject">
                                    <span class="help-block">Input subject of testimonial.</span>
                                    <br>
                                </div>
                                <label class="col-sm-2 col-sm-2 control-label">Area of concern <i class="formAsterisk">*</i></label>
                                <div class="col-sm-10">
                                    <select class="form-control" rows="10" name="type" onchange="showDiv(this)">
                                        <option value="" disabled="" selected="">Select category</option>
                                        <option value="New Project">Suggest project</option>
                                        <option value="Maintenance">Maintenance/Repair</option>
                                        <option value="other">Other</option>
                                    </select>
                                    <span class="help-block">Input category</span>
                                    <br>
                                    <div style="display:none;" id="concernInput">
                                        <input type="text" class="form-control" name="concern">

                                        <br>
                                    </div>
                                </div>

                                <label class="col-sm-2 col-sm-2 control-label">Location</label>
                                <div class="col-sm-10">
                                    <select class="form-control regField" name="testimoniallocation">
                                        <option value="" disabled selected>Select Barangay</option>
                                        <option value="Almanza Uno">Almanza Uno</option>
                                        <option value="Daniel Fajardo">Daniel Fajardo</option>
                                        <option value="Elias Aldana">Elias Aldana</option>
                                        <option value="Ilaya">Ilaya</option>
                                        <option value="Manuyo Uno">Manuyo Uno</option>
                                        <option value="Pamplona Uno">Pamplona Uno</option>
                                        <option value="Pulang Lupa Uno">Pulang Lupa Uno</option>
                                        <option value="Talon Uno">Talon Uno</option>
                                        <option value="Zapote">Zapote</option>
                                        <option value="Almanza Dos">Almanza Dos</option>
                                        <option value="B.F. International Village">B.F. International Village</option>
                                        <option value="Manuyo Dos">Manuyo Dos</option>
                                        <option value="Palmpona Dos">Pamplona Dos</option>
                                        <option value="Pamplona Tres">Pamplona Tres</option>
                                        <option value="Pilar">Pilar</option>
                                        <option value="Pulang Lupa Dos">Pulang Lupa Dos</option>
                                        <option value="Talon Dos">Talon Dos</option>
                                        <option value="Talon Tres">Talon Tres</option>
                                        <option value="Talon Kuatro">Talon Kuatro</option>
                                        <option value="Talon Singko">Talon Singko</option>
                                    </select>
                                    <span class="help-block">Input Barangay.</span>
                                    <br>
                                </div>

                                <label class="col-sm-2 col-sm-2 control-label">Location Deatils</label>
                                <div class="col-sm-10">
                                    <textarea class="wysihtml5 form-control" rows="10" name="testimoniallocationdetails"></textarea>
                                    <span class="help-block">Input location details.</span>
                                </div>


                                <label class="col-sm-2 col-sm-2 control-label">Message <i class="formAsterisk">*</i></label>
                                <div class="col-sm-10">
                                    <textarea class="wysihtml5 form-control" rows="10" name="content"></textarea>
                                    <span class="help-block">Input message</span>
                                    <br>
                                </div>


                                <center>
                                    <button type="submit" class="btn btn-success">Send</button>
                                    <button type="button" class="btn btn-danger">Cancel</button>
                                </center>

                            </div>
                        </form>
                    </div>
                </section>
            </section>
        </section>

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