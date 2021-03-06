
<%@page import="util.Db_Connection"%>
<%@page import="util.Strings_Management"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="services.Service_ByDay"%>
<%@page import="controller.Ctl_GraphByHour"%>
<%@page import="model.SerialDataResults"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>


<%
    Connection conn = Db_Connection.getConnection();
    Statement stmt;
    ResultSet rs;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Chart | Data Flow Meter | VHS KAI</title>
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Data KAI</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><a href="dataKai.jsp"><i class="fa fa-pie-chart"></i> Data KAI</a></li>
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
                            <h5>Data liter by Day</h5>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li class="active">Graph / Graph by Day</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header ends here-->
            <div class="row">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="col-xs-3">

                    <div class="form-group">
                        <label>Date</label> <br>
                        <form name="search" method="post" action="">
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input autocomplete="off" type="text" name="date1" class="form-control pull-right" id="datepickerr">
                            </div>

                    </div>
                </div>
                <div class="col-xs-1">
                    <div class="form-group">
                        <label>&nbsp;</label> <br>
                        <input type="submit" name="submit" class="btn btn-block btn-success" value="Search">
                        </form>
                    </div>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            </div>

            <div class="card">

                <div class="active tab-pane" id="graph">
                    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                    <%
                        Gson gsonObj = new Gson();
                        Map<Object, Object> map = null;
                        List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

                        Service_ByDay service1 = new Service_ByDay();
                        List<SerialDataResults> DATA1 = new ArrayList<SerialDataResults>();
                        DATA1 = service1.viewDataByDay();
                        String ket1 = request.getParameter("ket");
                        if (ket1 == null) {
                            DATA1 = service1.viewDataByDay();
                        }
                        for (int x = 0; x < DATA1.size(); x++) {
                            map = new HashMap<Object, Object>();

                            String a = DATA1.get(x).getSumDelivery();
                            int b = Integer.parseInt(a);
                            // Object a =  DATA1.get(x).getSiteId();
                            map.put("label", DATA1.get(x).getDate());
                            map.put("y", b);
                            list.add(map);
                            String dataPoints = gsonObj.toJson(list);

                    %>
                    <script type="text/javascript">


                        window.onload = function () {

                            var chart = new CanvasJS.Chart("chartContainer1", {
                                zoomEnabled: true,
                                panEnabled: true,
                                title: {
                                    text: "Data Liter By Day"
                                },
                                data: [{
                                        indexLabelPlacement: "outside",
                                        showInLegend: true,
                                        color: "LightSeaGreen",
                                        legendText: "<%=DATA1.get(x).getSiteId()%>",
                                        type: "column",
                                        dataPoints: <%out.print(dataPoints);%>,

                                    }]
                            });

                            chart.render();
                        }
                    </script>
                    <% }%>
                </div>


            </div> 
            <!-- BODY START HERE-->

            <div id="chartContainer" style="height: 440px; width: 100%;">
                <div id="Sarah_chart_div" style="border: 1px solid #ccc"></div>
                <div id="chartContainer1" style="border: 1px solid #ccc"></div>

            </div>
            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
            <div>
                <div class="card">
                    <div class="card-header">
                        <%
                            Service_ByDay tanggal = new Service_ByDay();
                        %>
                        <strong class="card-title">Detail by Liter : <% out.print(tanggal.getTanggal()); %> </strong>
                    </div>
                    <div  class="card-body">
                        <form role="form" action="databyhour?data" method="post">
                            <table class="table" id="countit">
                                <thead class="thead-dark">
                                    <tr align="Center">
                                        <th scope="col">#</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Site</th>
                                        <th scope="col">Total In Day</th>
                                        <th scope="col">Uoms</th>
                                    </tr>
                                </thead>              
                                <tbody>
                                    <%
                                        try {
                                            conn = DriverManager.getConnection(Strings_Management.MYSQL_URL, Strings_Management.MYSQL_UNAME, Strings_Management.MYSQL_PASSWORD);
                                            stmt = conn.createStatement();
                                            String sql = "select \"01/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '01/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"02/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '02/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"03/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '03/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"04/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '04/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"05/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '05/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"06/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '06/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"07/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '07/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"08/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '08/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"09/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '09/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"10/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '10/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"11/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '11/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"12/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '12/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"13/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '13/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"14/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '14/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"15/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '15/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"16/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '16/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"17/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '17/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"18/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '18/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"19/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '19/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"20/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '20/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"21/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '21/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"22/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '22/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"23/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '23/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"24/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '24/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"25/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '25/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"26/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '26/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"27/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '27/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"28/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '28/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"29/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '29/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"30/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '30/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' \n"
                                                    + "UNION\n"
                                                    + "SELECT \"31/10/18\" as Date,sum(gross_deliver),site_id,\"Litres\" as uoms FROM `serial_data_results` \n"
                                                    + "WHERE SUBSTR(finish,1,8) = '31/10/18' AND site_id = 'JATINEGARA' AND `duplicate` = '' AND `unit_id` = '12345' ";
                                            rs = stmt.executeQuery(sql);
                                            int no = 1;
                                            while (rs.next()) {
                                    %>
                                    <tr>
                                        <td align="Center" ><%= no++%></td>
                                        <td align="center"><%=rs.getString("Date")%></td>
                                        <td align="center"><%=rs.getString("site_id")%></td>
                                        <td align="center"><%=rs.getString("sum(gross_deliver)")%></td>                                        
                                        <td align="center"><%=rs.getString("uoms")%></td>
                                    </tr>
                                    <%
                                            }
                                            conn.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>

                                </tbody>
                            </table>
                                    


                    </div>
                </div>
            </div>

            <!-- BODY ENDS HERE-->
            <div id="chartContainer" style="height: 440px; width: 100%;">
                <div id="Sarah_chart_div" style="border: 1px solid #ccc"></div>
                <div id="chartContainer1" style="border: 1px solid #ccc"></div>

            </div>
            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
            

            <!-- BODY ENDS HERE-->
        </div> <!-- .content -->
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
    </body>
</html>