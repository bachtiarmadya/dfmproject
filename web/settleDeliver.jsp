<%-- 
    Document   : settleIn
    Created on : Dec 11, 2018, 10:41:10 PM
    Author     : permadi
--%>

<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SerialDataResults"%>
<%@page import="services.Service_settleDelivery"%>
<%@page import="java.util.HashMap"%>
<%-- 
    Document   : index
    Created on : Oct 14, 2018, 7:06:21 PM
    Author     : bachtiar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Dasboard | Data Flow Meter | VHS KAI</title>
        <meta name="description" content="Sufee Admin - HTML5 Admin Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-icon.png">
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
        <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
        <link rel="stylesheet" href="assets/scss/style.css">
        <link href="assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <!-- Left Panel -->

        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">

                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="./"><img src="images/pe_icon.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/pe_icon.png" alt="Logo"></a>
                </div>

                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="index.jsp"> <i class="menu-icon fa fa-dashboard"></i>Home </a>
                        </li>
                        <!-- START More Panel  -->
                        <h3 class="menu-title">MAIN NAVIGATION</h3><!-- /.menu-title -->
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>General</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><a href="about.jsp"><i class="fa fa-edit"></i> About VHS</a></li>
                                <li class="divider"></li>
                                <li><a href="vhs_locmap.jsp"><i class="fa fa-edit"></i> VHS Location Map</a></li>
                                <li class="divider"></li>
                            </ul>
                        </li>

                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><a href="chartbyhour.jsp"><i class="fa fa-pie-chart"></i> By Hour</a></li>
                                <li class="divider"></li>
                                <li><a href="chartbyday.jsp"><i class="fa fa-pie-chart"></i>By Day</a></li>
                                <li class="divider"></li>
                                <li><a href="chartbymonth.jsp"><i class="fa fa-pie-chart"></i>By Month</a></li>
                                <li class="divider"></li>
                                <li><a href="chartbyyear.jsp"><i class="fa fa-pie-chart"></i>By Year</a></li>
                                <li class="divider"></li>
                                <li><a href="chartbylocation.jsp"><i class="fa fa-pie-chart"></i>By Location</a></li>
                                <li class="divider"></li>
                                <li><a href="chartbyflowmeter.jsp"><i class="fa fa-pie-chart"></i>By Flow Meter</a></li>

                            </ul>
                        </li>

                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Settlement Management</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><a href="settleDeliver.jsp"><i class="fa fa-pie-chart"></i> Settlement IN</a></li>
                                <li class="divider"></li>
                                <li><a href="settleRequest.jsp"><i class="fa fa-pie-chart"></i>Settlement OUT</a></li>
                            </ul>
                        </li>

                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-newspaper-o"></i>Report Management</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><i class="menu-icon fa fa-clipboard"></i><a href="todayreport.jsp">Today report</a></li>
                                <li><i class="menu-icon fa fa-clipboard"></i><a href="reportmanagement.jsp">Report data</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-wrench"></i>Maintenance</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><i class="menu-icon fa fa-user"></i><a href="#">User Management</a></li>
                                <li><i class="menu-icon fa fa-location-arrow"></i><a href="#">Site Management</a></li>
                                <li><i class="menu-icon fa fa-image"></i><a href="#">Some Management</a></li>
                            </ul>
                        </li>
                        <!-- END of More Panel -->
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>
        </aside><!-- /#left-panel -->
        <!-- Left Panel -->

        <!-- Right Panel -->
        <div id="right-panel" class="right-panel">

            <!-- Header start here-->
            <header id="header" class="header">
                <div class="header-menu">

                    <div class="col-sm-7">
                        <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                        <div class="header-left">
                            <h3> </h3>
                        </div>
                    </div>

                    <div class="col-sm-5">
                        <div class="user-area dropdown float-right">
                            <div class="navbar-custom-menu">
                                <ul class="nav navbar-nav">
                                    <!-- Messages: style can be found in dropdown.less-->
                                    <li><a href="#"><i class="fa fa-sign-out"></i> <span>Logout</span></a></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </header>
            <div class="breadcrumbs">
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h5>List Settlement</h5>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li class="active">Settlement IN</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header ends here-->
            <!-- BODY START HERE-->

            <div class="card">
                <div class="card">
                    <div class="row">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <form name="search" method="post" action="">
                            <div class="col-xs-3">

                                <div class="form-group">
                                    <label>Date</label> <br>

                                    <p><input class="form-control pull-right" type="text" id="datepicker" name="selectedDate"></p>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                <div class="form-group">
                                    <label>Site </label> <br>
                                    <p><input class="form-control pull-right" type="text" id="datepicker" name="selectedSite"></p>
                                </div>
                            </div>

                            <div class="col-xs-3">
                                <div class="form-group">
                                    <label>&nbsp;</label> <br>
                                    <input type="submit" name="submit" class="btn btn-block btn-success" value="Search">

                                </div>
                            </div>
                        </form>
                    </div>
                    &nbsp;

                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet box green">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="fa fa-globe"></i>List Settlement
                                    </div>
                                    <div class="actions">
                                        <div class="btn-group pull-right">
                                            <button class="btn btn-default dropdown-toggle btn btn-block btn-success" data-toggle="dropdown">Actions</button>&nbsp;&nbsp;
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="#mdlApprove" data-toggle="modal"> Approve </a>
                                                </li>
                                                <li>
                                                    <a href="#mdlReject" data-toggle="modal">  Reject </a>
                                                </li>
                                                <li>
                                                    <a href="#mdlDelete" data-toggle="modal">  Delete </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

                                <div class="portlet-body">
                                    <table class="table table-striped table-bordered table-hover" id="sample_6">
                                        <thead>
                                            <tr>
                                                <th class="table-checkbox">
                                                    <input type="checkbox" onClick="toggle(this)" class="group-checkable" data-set="#sample_6 .checkboxes"/>
                                                </th>
                                                <th scope="col">FLOWMETER</th>
                                                <th>START</th>
                                                <th>FINISH</th>
                                                <th>SALE NUMBER</th>                               
                                                <th>METER NUMBER</th>
                                                <th>DIPO LOCATION</th>
                                                <th>TICKET NO</th>                  
                                                <th>GROSS DELIVER</th>
                                                <th>UOM</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int no = 1;
                                                String tanggal = request.getParameter("selectedDate");
                                                String site = request.getParameter("selectedSite");
                                                Service_settleDelivery service = new Service_settleDelivery();
                                                List<SerialDataResults> DATA = new ArrayList<SerialDataResults>();
                                                String unitId = null, start = null, finish = null, saleNumber = null, meterNumber = null,
                                                        siteId = null, ticketNo = null, grossDeliver = null, avgFlowrate = null, date = null;

                                                String ket = request.getParameter("ket");
                                                if (ket == null) {
                                                    DATA = service.getSettlementData(site, tanggal);
                                                }
                                                for (int x = 0; x < DATA.size(); x++) {

                                                    unitId = DATA.get(x).getUnitId();
                                                    start = DATA.get(x).getStart();
                                                    finish = DATA.get(x).getFinish();
                                                    saleNumber = DATA.get(x).getSaleNumber();
                                                    meterNumber = DATA.get(x).getMeterNumber();
                                                    siteId = DATA.get(x).getSiteId();
                                                    ticketNo = DATA.get(x).getTicketNo();
                                                    grossDeliver = DATA.get(x).getGrossDeliver();
                                                    avgFlowrate = DATA.get(x).getAvgFlowRate();
                                                    date = DATA.get(x).getDate();


                                            %>
                                            <tr class="odd gradeX" data-id=<%=no%>>
                                                <td>
                                                    <input type="checkbox" name="foo" type="checkbox" class="checkboxes" value="1"/>
                                                </td>
                                                <td align="Center" data-toggle="modal" data-target="#exampleModal"><%=DATA.get(x).getUnitId()%> </td>
                                                <td align="Center" data-toggle="modal" data-target="#exampleModal"><%=DATA.get(x).getStart()%> </td>
                                                <td align="Center" data-toggle="modal" data-target="#exampleModal"><%=DATA.get(x).getFinish()%> </td>
                                                <td align="Center" data-toggle="modal" data-target="#exampleModal"><%=DATA.get(x).getSaleNumber()%> </td>
                                                <td align="Center" data-toggle="modal" data-target="#exampleModal"><%=DATA.get(x).getMeterNumber()%> </td>
                                                <td align="left" data-toggle="modal" data-target="#exampleModal"><%=DATA.get(x).getSiteId()%> </td>
                                                <td align="Center" data-toggle="modal" data-target="#exampleModal"><%=DATA.get(x).getTicketNo()%> </td>
                                                <td align="Center" data-toggle="modal" data-target="#exampleModal"><%=DATA.get(x).getGrossDeliver()%></a></td>
                                                <td align="left" >Litres</td>
                                                <td>
                                                    <span class="label label-sm label-info">
                                                        --- </span>
                                                </td>
                                            </tr>
                                            <%no++; }%>
                                        </tbody>
                                    </table>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Detail</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <table class="table table-striped table-bordered">
                                                                    <tr>
                                                                        <td><b>Date</b></td>                                                                 
                                                                        <td> <input type="text" class="form-control" id="id" name="id" value="<%=date%>" readonly="true"/> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Sale number</b></td>                                                                 
                                                                        <td> <input type='text' onkeypress='validate(event)' class="form-control" id="id" name="id" value="<%=saleNumber%>"  /> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Ticket No</b></td>
                                                                        <td> <input type="text" class="form-control" id="id" name="id" value="<%=ticketNo%>" readonly="true"/> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Start</b></td>
                                                                        <td> <input type="text" class="form-control" id="id" name="id" value="<%=start%>" readonly="true"/> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Finish</b></td>
                                                                        <td> <input type="text" class="form-control" id="id" name="id" value="<%=finish%>" readonly="true"/> </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td><b>Site</b></td>
                                                                        <td> <input type="text" class="form-control" id="id" name="id" value="<%=siteId%>" readonly="true"/>  </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Meter Number</b></td>
                                                                        <td> <input type="text" class="form-control" id="id" name="id" value="<%=meterNumber%>" readonly="true"/>  </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Flowmeter</b></td>
                                                                        <td> <input type="text" class="form-control" id="id" name="id" value="<%=unitId%>" readonly="true"/> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Gross deliver</b></td>
                                                                        <td> <input type="text" class="form-control" id="id" name="id" value="<%=grossDeliver%> Litres" readonly="true"/> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Average flow rate</b></td>
                                                                        <td> <input type="text" class="form-control" id="id" name="id" value="<%=avgFlowrate%>" readonly="true"/></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                    <div id="mdlApprove" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Approve Request</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure want to Approve this Request?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn default" data-dismiss="modal" aria-hidden="true">No</button>
                                                    <button data-dismiss="modal" class="btn blue">Yes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="mdlReject" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Reject Request</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="control-label col-md-4">Reason Reject <span class="required">
                                                                        * </span>
                                                                </label>
                                                                <div class="col-md-7">
                                                                    <input type="text" name="resetReason" data-required="1" class="form-control"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn default" data-dismiss="modal" aria-hidden="true">No</button>
                                                    <button data-dismiss="modal" class="btn blue">Yes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="mdlDelete" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Delete Request</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure want to Delete this Request?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn default" data-dismiss="modal" aria-hidden="true">No</button>
                                                    <button data-dismiss="modal" class="btn blue">Yes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END EXAMPLE TABLE PORTLET-->
                        </div>
                    </div>
                </div>
            </div>
                                                                    
            <!-- BODY ENDS HERE-->
            <!-- .content -->
            <!-- Right Panel -->

            <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
            <script src="assets/js/plugins.js"></script>
            <script src="assets/js/main.js"></script>
            <script src="assets/js/lib/chart-js/Chart.bundle.js"></script>
            <script src="assets/js/dashboard.js"></script>
            <script src="assets/js/widgets.js"></script>
            <script src="assets/js/lib/vector-map/jquery.vmap.js"></script>
            <script src="assets/js/lib/vector-map/jquery.vmap.min.js"></script>
            <script src="assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
            <script src="assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>

            <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
            <script src="assets/js/popper.min.js"></script>
            <!--  Chart js -->
            <script src="assets/js/lib/chart-js/Chart.bundle.js"></script>
            <script src="assets/js/lib/chart-js/chartjs-init.js"></script>
            <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="/resources/demos/style.css">
            <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            <script>
                                                                            function toggle(source) {
                                                                                checkboxes = document.getElementsByName('foo');
                                                                                for (var i = 0, n = checkboxes.length; i < n; i++) {
                                                                                    checkboxes[i].checked = source.checked;
                                                                                }
                                                                            }
            </script>          

            <script>
                $(function () {
                    $("#datepicker").datepicker({dateFormat: "dd/mm/y"}).val()
                });

            </script>
            <script>
                $(function () {
                    $('#orderModal').modal({
                        keyboard: true,
                        backdrop: "static",
                        show: false,

                    }).on('show', function () {

                    });

                    $(".table-striped").find('tr[data-id]').on('click', function () {
                        debugger;
                        //do all your operation populate the modal and open the modal now. DOnt need to use show event of modal again

                        $('#orderDetails').html($('<b> Order Id selected: ' + $(this).data('id') + '</b>'));
                        $('#orderModal').modal('show');

                    });

                });
            </script>
            <script>
                function validate(evt) {
                    var theEvent = evt || window.event;

                    // Handle paste
                    if (theEvent.type === 'paste') {
                        key = event.clipboardData.getData('text/plain');
                    } else {
                        // Handle key press
                        var key = theEvent.keyCode || theEvent.which;
                        key = String.fromCharCode(key);
                    }
                    var regex = /[0-9,,\b]|\./;
                    if (!regex.test(key)) {
                        theEvent.returnValue = false;
                        if (theEvent.preventDefault)
                            theEvent.preventDefault();
                    }
                }

            </script>
    </body>
</html>

