<%-- 
    Document   : OCPD_CompiledProjects
    Created on : 03 17, 16, 2:29:25 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Files"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Entity.Schedule"%>
<%@page import="Entity.Material"%>
<%@page import="Entity.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Project"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>Compiled Proposals</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

    <style type='text/css'>
        #rnd_container {background: #FFFFFF; margin:1px;}  


        @media print
        {
            #header {display: none}
            #cssmenu { display: none; }
            #printpage { display: none; }
            #pageHeader{display: none;}
        }

    </style>

    <body>


        <!-- page start-->

        <%
            ArrayList<Project> pList = (ArrayList<Project>) request.getAttribute("pList");
            ArrayList<Float> costs = (ArrayList<Float>) request.getAttribute("cList");
        %>

        <section class="panel">
            <center>
                <br><br>
                <img src="img/icon_lpc.png">
                <header class="panel-heading">
                    <h3>City Government of Las Pinas</h3>
                </header><br>



                <section class="panel">

                    <%for (Project p : pList) {
                            int x = 0;
                    %>

                    <strong><%=p.getName()%></strong>

                    <div class="panel-body bio-graph-info">
                        <!--<h1>New Dashboard BS3 </h1>-->

                        <div>
                            <p><span class="bold">Description </span>: <%=p.getDescription()%></p>
                        </div><br>
                        <div>
                            <p><span class="bold">Category </span>: <%=p.getType()%> - <%=p.getCategory().getSubCategory()%></p>
                        </div><br>

                        <div>
                            <p><span class="bold">Location </span>: </p>
                        </div><br>

                        <div>
                            <p><span class="bold">Program Components </span> :

                            <table class="table" style="width:50%; text-align: center" >
                                <tr>
                                    <th><center>Component</center></th>
                                <th><center>Duration</center></th>
                                </tr>
                                <% for (Schedule c : p.getSchedule()) {
                                        if (c.getStage().equalsIgnoreCase("Implementation")) {
                                            String startdate = c.getStartdate();
                                            String enddate = c.getEnddate();
                                            String[] date = startdate.split("-");
                                            String[] months = {"January", "February", "March", "April",
                                                "May", "June", "July", "August", "September", "October",
                                                "November", "December",};
                                            startdate = months[Integer.parseInt(date[1]) - 1] + " " + date[2] + " " + date[0];
                                            date = enddate.split("-");
                                            enddate = months[Integer.parseInt(date[1]) - 1] + " " + date[2] + " " + date[0];
                                %>
                                <tr>
                                    <td><%=c.getEvent()%></td>
                                    <td><%=startdate%> - <%=enddate%></td>
                                </tr>
                                <%}
                                    }%>
                            </table>

                            </p>
                        </div><br>

                        <p><u><span class="bold">Program Works</span></u> </p>
                        <table class="table" style="width:50%; text-align: center">
                            <tr>
                                <th><center>Item Description</center></th>
                            <th><center>% of Total</center></th>
                            <th><center>Quantity</center></th>
                            <th><center>Unit</center></th>
                            <th><center>Unit Price</center></th>
                            <th><center>Total Cost per item</center></th>

                            </tr>
                            <% for (Material m : p.getMaterials()) {

                            %>
                            <tr>
                                <td><%=m.getName()%></td>
                                <td><%=m.getPercentage()%></td>
                                <td><%=m.getQuantity()%></td>
                                <td><%=m.getUnit().getUnit()%></td>
                                <td><%=m.getUnitprice()%></td>
                                <td><%=m.getUnitprice() * m.getQuantity()%></td>

                            </tr>
                            <%}
                                float cost = costs.get(x);
                                DecimalFormat df = new DecimalFormat("#,###.00");%>

                            <tr>
                                <td colspan="5">Total Cost: </td>
                                <td>PHP <%=df.format(cost)%></td>
                            </tr>    
                                
                            <tr>
                                <td colspan="5">Indirect Cost 17% of Total Cost: </td>
                                <td>PHP <%=df.format(cost * 0.17)%></td>
                            </tr>
                            
                            <tr>
                                <td colspan="5">Tax 5% of Total Cost + Indirect Cost: </td>
                                <td>PHP <%=df.format((cost * 0.17)*.05)%></td>
                            </tr>
                                
                            <tr>
                                <td colspan="5">Estimated cost: </td>
                                <td>PHP <%=df.format(cost + (cost * 0.17) + ((cost * 0.17)*.05))%></td>
                            </tr>


                        </table>
                        <br>

                        <div>
                            <p><span class="bold">Date Submitted</span> : <%=p.getDatesubmitted()%></p>


                        </div>
                        <br>
                        <table class="table" style="width:50%; text-align: center">
                            <tr>
                                <th><center>Project <%out.print(p.getName());%> has the following files:</center></th>
                            </tr>
                            <% for (Files f : p.getFiles()) {

                            %>
                            <tr>
                                <td><%=f.getFileName()%></td>
                            </tr>
                            <%}%>
                        </table>

                        <hr style="height: 1px; background: black; width: 60%">
                    </div>

                    <%x++;
                        }%>        

                </section>
                <div id="printpage">
                    <button onclick="myFunction()">Print</button>
                    <button onclick="cancel()">Cancel</button> <br>
                </div>
            </center>

        </section>
        <!-- page end-->

        <!--main content end-->
        <script>
            function myFunction() {
                window.print();
            }

            function cancel() {
                window.close();
            }
        </script>

    </body>



</html>
