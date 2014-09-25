<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>

<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
        <title>Web Application</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
        <!-- needs images, font... therefore can not be part of ui.css -->

         <link type="text/script" href="${resource(dir: 'bower_components/font-awesome/css/', file: 'font-awesome.min.css')}" />
         <link type="text/script" href="${resource(dir: 'bower_components/weather-icons/css/', file: 'weather-icons.min.css')}" />
      
        <!-- end needs images -->

            <!-- build:css styles/ui.css -->
            <link rel="stylesheet" href="bower_components/morris.js/morris.css">
            <!-- endbuild -->
            <link rel="stylesheet" href="css/main.css">

    </head>
    <body id="app" data-ng-app="app" data-custom-background data-off-canvas-nav="">
      
        <div data-ng-controller="AppCtrl">
            <div data-ng-hide ="isSpecificPage()"
                 data-ng-cloak>
                 
                <section data-ng-include=" 'views/header.html' "
                     id="header" class="top-header"></section>

                <aside data-ng-include=" 'views/nav.html' "
                     id="nav-container"></aside>
            </div>
            </div>

            <div class="view-container">
                <section data-ng-view id="content" class="animate-fade-up"></section>
            </div>
        </div>
         <link type="text/script" href="${resource(dir: 'bower_components/jquery/dist/', file: 'jquery.min.js')}" />
         <link type="text/script" href="${resource(dir: 'bower_components/angular/', file: 'angular.min.js')}" />
         <link type="text/script" href="${resource(dir: 'bower_components/angular-route/', file: 'angular-route.min.js')}" />
         <link type="text/script" href="${resource(dir: 'bower_components/angular-animate/', file: 'angular-animate.min.js')}" />
         <link type="text/script" href="${resource(dir: 'bower_components/underscore/', file: 'underscore-min.js')}" />

        <!-- build:js scripts/vendor.js -->
  
        <!-- endbuild -->

        <!-- build:js scripts/ui.js -->
        <link type="text/script" href="${resource(dir: 'bower_components/angular-bootstrap/', file: 'ui-bootstrap-tpls.min.js')}" />       
         <link type="text/script" href="${resource(dir: 'bower_components/jquery-spinner/dist/', file: 'jquery.spinner.min.js')}" />       
         <link type="text/script" href="${resource(dir: 'bower_components/jquery-spinner/dist/', file: 'jquery.spinner.min.js')}" />               
                
                
        <link type="text/script" href="${resource(dir: 'bower_components/angular-bootstrap/', file: 'ui-bootstrap-tpls.min.js')}" />       
        <link type="text/script" href="${resource(dir: 'bower_components/jquery-spinner/dist/', file: 'jquery.spinner.min.js')}" />       
        <link type="text/script" href="${resource(dir: 'bower_components/seiyria-bootstrap-slider/dist/', file: 'bootstrap-slider.min.js')}" />      
	<link type="text/script" href="${resource(dir: 'bower_components/jquery-steps/build/', file: 'jquery.steps.min.js')}" />        
        <link type="text/script" href="${resource(dir: 'bower_components/toastr/', file: 'toastr.min.js')}" />   	
	<link type="text/script" href="${resource(dir: 'bower_components/bootstrap-file-input/', file: 'bootstrap.file-input.js')}" />   
	<link type="text/script" href="${resource(dir: 'bower_components/jquery.slimscroll/', file: 'jquery.slimscroll.min.js')}" />   
	<link type="text/script" href="${resource(dir: 'bower_components/holderjs/', file: 'holder.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/raphael/', file: 'raphael-min.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/morris.js/', file: 'morris.js')}" />

	<link type="text/script" href="${resource(dir: 'scripts/vendors/', file: 'responsive-tables.js')}" />
 	<link type="text/script" href="${resource(dir: 'scripts/vendors/', file: 'jquery.sparkline.min.js')}" />

	<link type="text/script" href="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.resize.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.pie.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.stack.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/flot.tooltip/js/', file: 'jquery.flot.tooltip.min.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.time.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/gauge.js/dist/', file: 'gauge.min.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/jquery.easy-pie-chart/dist/', file: 'angular.easypiechart.min.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/angular-wizard/dist/', file: 'angular-wizard.min.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/textAngular/dist/', file: 'textAngular-sanitize.min.js')}" />
	<link type="text/script" href="${resource(dir: 'bower_components/textAngular/dist/', file: 'textAngular.min.js')}" />
	<link type="text/script" href="${resource(dir: 'scripts/vendors/', file: 'skycons.js')}" />
        <!-- endbuild -->

        <!-- build:js({.tmp,app}) scripts/app.js -->
         
        <asset:javascript src="app.js"/>
        <asset:javascript src="Chart/ChartCtrl.js"/>
        <asset:javascript src="Chart/ChartDirective.js"/>
        <asset:javascript src="shared/main.js"/>
        <asset:javascript src="shared/directives.js"/>
        <asset:javascript src="shared/localize.js"/>
        <asset:javascript src="UI/UICtrl.js"/>
        <asset:javascript src="UI/UIDirective.js"/>
        <asset:javascript src="UI/UIService.js"/>
        <asset:javascript src="Form/FormDirective.js"/>
        <asset:javascript src="Form/FormCtrl.js"/>
        <asset:javascript src="Form/FormValidation.js"/>
        <asset:javascript src="Table/TableCtrl.js"/>
        <asset:javascript src="Task/Task.js"/>
        

    </body>
</html> -->


