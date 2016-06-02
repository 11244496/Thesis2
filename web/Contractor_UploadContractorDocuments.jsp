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
<%

    Project project = (Project) request.getAttribute("projectInfo");

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


        <section id="main-content">
            <section class="wrapper site-min-height">

                <section class="panel">
                    <header class="panel-heading">
                        Submission of documents for the project: <%=project.getName()%>
                    </header>
                    <br>
                    <div class="panel-body">
                        1. Call for bidders for this project will be closed on _________  <br>
                        2. All of the documents indicated should be submitted on or before the given time period <br>
                        3. All of the documents indicated should be complete and ready for submission at the time you will respond to the invitation for bidders. <br>
                        4. Only those with complete submission of documents shall proceed to eligibility check <br>
                        5. For the eligibility check, the local government unit shall evaluate all of the submitted documents. In any case, the government office shall respond back to the submitted documents
                    </div>
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-md-12">
                                <section class="panel">


                                    <div class="panel-body">


                                        <form action="Contractor_UploadContractorDocuments" class="form-horizontal tasi-form" method="POST" enctype="multipart/form-data">

                                            <input type="hidden" name="ProjectID" value="<%=project.getId()%>">
                                            <input type="hidden" name="ProjectName" value="<%=project.getName()%>">
                                            <center>
                                                <h4>Legal Documents</h4>
                                            </center>
                                            <hr>
                                            <div>
                                                <label>
                                                    1. Registration Certificate from the Securities and Exchange Commission (SEC), Department of Trade and Industry (DTI) for Sole 
                                                    Proprietorship, Cooperative Development Authority (CDA) for cooperatives, or any proof of such registration.    
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="SEC / DTI / CDA registration " type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br>
                                            <hr>
                                            <div>
                                                <label>
                                                    2. Mayor's permit issued by the City or Municipality where the principal place of business of the prospective bidder is located.    
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Mayor's permit" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br>
                                            <hr>
                                            <div>
                                                <label>
                                                    3. Duly signed statement of all on-going/completed government and private contracts within the last ten (10) years reckoned from the date of submission and receipt of bids, including contracts awarded but not yet started, if any.   
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="On-going / Completed government and private contracts" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><hr>
                                            <div>
                                                <label>
                                                    4. Latest income tax return (ITR) through the Electronic Filing Payment System (EEPS) under E.O 398 2005, which must have
                                                    a Payment Confirmation Form of Tax Return (PCFTR) and business tax returns filed electronically (EEPS) one year preceding the date 
                                                    of submission.   
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Income Tax Return (ITR)" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><hr>
                                            <div>
                                                <label>
                                                    5. Duly signed Computation of net financial contracting capacity (NFCC) which shall be at least equal to the ABC to be bid.   
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Net financial contracting capacity" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><hr>
                                            <div>
                                                <label>
                                                    6. Cash, Cashier's / Manager's Check, Bank Draft / Guarantee Confirmed by a Universal or Commercial Bank, in the amount equal to at least
                                                    5.0% of the ABC.  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Cash, Cashier's / Manager's Check, Bank Draft / Guarantee" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><hr>
                                            <div>
                                                <label>
                                                    7. Irrevocable letter of credit issued by a universal or commercial bank, in the amount of 2.0% of the ABC.   
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Letter of credit" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>
                                            <div>
                                                <label>
                                                    8. Surety Bond, in the amount of 5.0% of the ABC.   
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <input name="Surety bond" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><hr>

                                            <center>
                                                <h4>Technical Documents</h4>
                                            </center>
                                            <hr>
                                            <div>
                                                <label>
                                                    1. Original copy of Bid Security  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <input name="Bid Security" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>

                                            <br><br><hr>
                                            <div>
                                                <label>
                                                    2. Authority of the Signing Official   
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <input name="Authority of the signing official" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br>
                                            <br><hr>
                                            <div>
                                                <label>
                                                    3. Duly signed Construction Schedule, PERT-CPM and S-Curve   
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <input name="Construction Schedule" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>
                                            <div>
                                                <label>
                                                    4. Duly Signed Manpower Schedule  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Manpower Schedule" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    5. Duly Signed Construction Methods in Narrative Form  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Construction Methods" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    6. Duly signed Organizational Chart for the Contract to be bid 
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Organizational Chart" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    7. List of Contractor's Personnel to be assigned to the contract 
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Contractor Personnel list" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    8. List of equipment, owned or leased and/or under Purchase Agreements pledged to the proposed contracts. 
                                                </label>    

                                            </div><br>

                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <input name="List of equipment owned" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    9. Duly signed Equipment Utilization schedule  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <input name="Equipment Utilization Schedule" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    10. Duly signed of Affidavit of Site Inspection  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <input name="Affidavit of site Inspection" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    11. Certificate of Non Blacklisted  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Certificate of Non Blacklisted" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    12. Duly signed construction Safety and Health Program  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <input name="Construction Safety and Health Program" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    13. Duly notarized certificate in compliance with existing labor laws and standard  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Certificate of compliance with existing labor laws and standard" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br><hr>

                                            <div>
                                                <label>
                                                    14. Original and duly signed copy of Omnibus Sworn attesting to have complied with responsibilities listed in GPRA IRR-A Sec. 17.7.1  
                                                </label>    

                                            </div>
                                            <br>
                                            <div class="col-md-4">
                                                <img alt src="img/Check.png" style="display: none"/>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input name="Omnibus Sworn" type="file" class="default" style="display:inline-block" multiple/>
                                            </div>
                                            <br><br>


                                            <div class="modal-footer">



                                                <br>
                                                <center>
                                                    <button id="uploadDoc" class="btn btn-success" type="submit">Submit</button>
                                                    <button class="btn btn-default" type="button">Back</button>
                                                </center>
                                            </div>

                                        </form>    














                                    </div>











                                </section>






                            </div>

                        </div>



                    </div>




                </section> 

























            </section>












        </section>


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
