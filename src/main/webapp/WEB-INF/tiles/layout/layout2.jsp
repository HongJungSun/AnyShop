<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico">
	
	<!-- jQuery UI CSS파일  -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <title> Any Shop 관리자 페이지  </title>

    <!-- Bootstrap -->
    <link href="resources/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="resources/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="resources/gentelella/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="resources/gentelella/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="resources/gentelella/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="resources/gentelella/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="resources/gentelella/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="resources/gentelella/build/css/custom.min.css" rel="stylesheet">
  </head>

<body class="nav-md">
    <div class="container body">
      <div class="main_container">
        
        
        <tiles:insertAttribute name="left" />
        
        <tiles:insertAttribute name="top" />


        <!-- page content -->
        <div class="right_col" role="main" style="min-height: 1862px;">

          <tiles:insertAttribute name="body" />
                

        </div>
      </div>
    </div>

   <!-- /page content -->


   <!-- jQuery -->
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Bootstrap -->
    <script src="resources/gentelella/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="resources/gentelella/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="resources/gentelella/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="resources/gentelella/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="resources/gentelella/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="resources/gentelella/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="resources/gentelella/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="resources/gentelella/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="resources/gentelella/vendors/Flot/jquery.flot.js"></script>
    <script src="resources/gentelella/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="resources/gentelella/vendors/Flot/jquery.flot.time.js"></script>
    <script src="resources/gentelella/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="resources/gentelella/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="resources/gentelella/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="resources/gentelella/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="resources/gentelella/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="resources/gentelella/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="resources/gentelella/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="resources/gentelella/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="resources/gentelella/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="resources/gentelella/vendors/moment/min/moment.min.js"></script>
    <script src="resources/gentelella/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="resources/gentelella/build/js/custom.min.js"></script>    
	
 
</body>
</html>