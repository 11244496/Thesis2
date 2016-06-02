<%-- 
    Document   : index
    Created on : 01 31, 16, 9:22:34 PM
    Author     : RoAnn
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <style>
            .regField{
                width: 80%;
            }
            .regFieldTitle{
                margin-left:10%;
            }
            .regHeading{
                margin-left:10%
            }
        </style>
    </head>

    <body class="login-body">
        <div class="container"><br><br><br>
            <center><img src="img/final3_trans.png">

                <form class="form-signin" action="Login" method="GET"> 
                    <h2 class="form-signin-heading">COGITO: Las Piñas Project Management System</h2><br>

                    <div class="login-wrap">

                        <input type="text" class="form-control" name="username" placeholder="Username" autofocus>
                        <input type="password" class="form-control" name="password" placeholder="Password">
                        <label class="checkbox">
                            <span class="pull-left">
                                <input type="checkbox" value="remember-me"> Remember me
                            </span>
                            <span class="pull-right">
                                <a data-toggle="modal" href="#forgotpassword"> Forgot Password?</a>
                            </span>

                            <br>
                        </label>

                        <button class="btn btn-lg btn-info" type="button" style="width: 130px" data-toggle="modal" href="#register">Register</button>
                        <button class="btn btn-lg btn-success" type="submit" style="width: 130px">Sign in</button>

                        <br>
                    </div>
                </form>

                <!--MODAL FOR FORGOT PASSWORD-->
                <div class="modal fade " id="forgotpassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <form class="form-horizontal" id="default" action="Register">


                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Forgot Password</h4>
                                </div>
                                <div class="modal-body">


                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label"><span class="asterisk">*</span>Username:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="username">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label"><span class="asterisk">*</span>Password:</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{5,}" title="Must have at least 5 characters, including UPPER/lowercase letters and number" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label"><span class="asterisk">*</span>Confirm Password:</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" name="password" id="confirmP" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{5,}" title="Must be the same password as above" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label"><span class="asterisk">*</span>Name:</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" placeholder="First Name" name="fn">
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" placeholder="Middle Name" name="mn">
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" placeholder="Last Name" name="ln">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label"><span class="asterisk">*</span>Address: </label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" placeholder="House no. and Street" name="housenostreet">
                                        </div>

                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" placeholder="Village/Barangay" name="barangay">
                                        </div>

                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" placeholder="Postal Code" name="postal">
                                        </div>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="province" value="Metro Manila" readonly>
                                        </div>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="city" value="Las Piñas" readonly>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                    <button class="btn btn-success" type="submit" onclick="confirmForm(this)">Submit</button>
                                </div>
                            </form>  
                        </div>
                    </div>
                </div>

                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="forgotpassword" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Forgot Password ?</h4>
                            </div>
                            <div class="modal-body">


                                <p>Enter your e-mail address below to reset your password.</p>
                                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                <button class="btn btn-success" type="button">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- MODAL FOR REGISTER -->
                <div class="modal fade " id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" >
                        <div class="modal-content" style="width: 50%;">

                            <form class="form-horizontal" id="default" action="Register">


                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Create new account</h4>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group">
                                        <label class="control-label pull-left regFieldTitle">Email Address: <i class="formAsterisk">*</i></label>
                                        <input type="text" class="form-control regField" name="username">
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label pull-left regFieldTitle">Password: <i class="formAsterisk">*</i></label>
                                        <input type="password" class="form-control regField" name="password"  id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{5,}" title="Must have at least 5 characters, including UPPER/lowercase letters and number" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label pull-left regFieldTitle">Confirm Password:  <i class="formAsterisk">*</i></label>
                                        <input type="password" class="form-control regField" name="password" id="confirmP" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{5,}" title="Must be the same password as above" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label pull-left regFieldTitle">First Name:  <i class="formAsterisk">*</i></label>
                                        <input type="text" class="form-control regField" name="fn" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label pull-left regFieldTitle">Middle Name:  <i class="formAsterisk">*</i></label>
                                        <input type="text" class="form-control regField" name="mn" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label pull-left regFieldTitle">Last Name:  <i class="formAsterisk">*</i></label>
                                        <input type="text" class="form-control regField" name="ln" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label pull-left regFieldTitle">Address:  <i class="formAsterisk">*</i></label>
                                        <input type="text" class="form-control regField" placeholder="House no. and Street" name="housenostreet">

                                        <select class="form-control regField" name="barangay" style="margin-top:5%">
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
                                            <option value="Pamplona Dos">Pamplona Dos</option>
                                            <option value="Pamplona Tres">Pamplona Tres</option>
                                            <option value="Pilar">Pilar</option>
                                            <option value="Pulang Lupa Dos">Pulang Lupa Dos</option>
                                            <option value="Talon Dos">Talon Dos</option>
                                            <option value="Talon Tres">Talon Tres</option>
                                            <option value="Talon Kuatro">Talon Kuatro</option>
                                            <option value="Talon Singko">Talon Singko</option>
                                        </select>

                                        <input type="text" readonly class="form-control regField" value="Las Pinas City" style="margin-top:5%">
                                        <input type="text"  class="form-control regField" name="postal" placeholder="Postal Code" style="margin-top:5%">

                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                    <button class="btn btn-success" type="submit" onclick="confirmForm(this)">Submit</button>
                                </div>
                            </form>  
                        </div>
                    </div>
                </div>                                



                <!-- ===========MODAL POP UP HERE =================== -->

                <%
                    String username = (String) request.getAttribute("username");
                    String success = (String) request.getAttribute("success");
                %>
                <script>
                    //force open a modal using a hidden button
                    window.onload = onLoad;
                    function onLoad()
                    {

                        var success = "<%=success%>";
                        if (success !== null) {

                            if (success === "success") {
                                $("#successModal").click();
                            }
                            else {
                            }

                        } else {
                        }


                    }
                    ;</script>

                <!-- modal -->

                <button id="successModal" style="visibility: hidden" data-toggle="modal" href="#confirmModal"></button> 
                <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Registration Successful</h4>
                            </div>
                            <div class="modal-body">

                                Your Account <%out.print(username);%> has been successfully registered. You may now log-in as a Citizen and contribute in the projects
                                of Las Pinas City Government

                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-default" type="button">Ok</button>
                            </div>
                        </div>
                    </div>
                </div>


        </div>



        <!-- js placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

    </body>
</html>

