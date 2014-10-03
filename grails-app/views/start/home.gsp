<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
        <title>Web Application</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="${resource(dir: 'bower_components/font-awesome/css/', file: 'font-awesome.min.css')}" />
        <link rel="stylesheet" href="${resource(dir: 'bower_components/weather-icons/css/', file: 'weather-icons.min.css')}" />

        <!--<asset:stylesheet src="main.css"/>-->
        <link rel="stylesheet" href="${resource(dir: 'bower_components/morris.js/', file: 'morris.css')}" type="text/css">
    </head>
    <body id="app" data-ng-app="app" data-custom-background data-off-canvas-nav="">
        <div data-ng-controller="AppCtrl">
            <div data-ng-hide ="isSpecificPage()" data-ng-cloak>
                <section data-ng-include=" 'includes/head' " id="header" class="top-header"> </section>
                <aside data-ng-include=" 'includes/nav' " id="nav-container"></aside>
            </div>
        </div>
        <div class="view-container">
            <section data-ng-view id="content" class="animate-fade-up"></section>
        </div>
       
        <script type="text/javascript" src="${resource(dir: 'bower_components/jquery/dist/', file: 'jquery.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/angular/', file: 'angular.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/angular-route/', file: 'angular-route.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/angular-animate/', file: 'angular-animate.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/underscore/', file: 'underscore-min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/angular-bootstrap/', file: 'ui-bootstrap-tpls.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/jquery-spinner/dist/', file: 'jquery.spinner.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/jquery-spinner/dist/', file: 'jquery.spinner.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/angular-bootstrap/', file: 'ui-bootstrap-tpls.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/jquery-spinner/dist/', file: 'jquery.spinner.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/seiyria-bootstrap-slider/dist/', file: 'bootstrap-slider.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/jquery-steps/build/', file: 'jquery.steps.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/toastr/', file: 'toastr.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/bootstrap-file-input/', file: 'bootstrap.file-input.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/jquery.slimscroll/', file: 'jquery.slimscroll.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/holderjs/', file: 'holder.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/raphael/', file: 'raphael-min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/morris.js/', file: 'morris.js')}" ></script>
        
        <script type="text/javascript" src="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.resize.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.pie.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.stack.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/flot.tooltip/js/', file: 'jquery.flot.tooltip.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/flot/', file: 'jquery.flot.time.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/gauge.js/dist/', file: 'gauge.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/jquery.easy-pie-chart/dist/', file: 'angular.easypiechart.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/angular-wizard/dist/', file: 'angular-wizard.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/textAngular/dist/', file: 'textAngular-sanitize.min.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'bower_components/textAngular/dist/', file: 'textAngular.min.js')}" ></script>

        <g:javascript src="vendors/skycons.js" />		
        <g:javascript src="vendors/jquery.sparkline.min.js" />		
        <g:javascript src="vendors/responsive-tables.js" />		
        
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
        <asset:javascript src="Task/Config.js"/>
    </body>
</html>
