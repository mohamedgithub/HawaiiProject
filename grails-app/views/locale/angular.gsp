<%@ page contentType="text/html;charset=UTF-8" %>
<html ng-app="phonecatApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Angular</title>
        <script type="text/javascript" src="${resource(dir: 'bower_components/angular/', file: 'angular.js')}" ></script>
        <script type="text/javascript" src="${resource(dir: 'js/test/', file: 'test.js')}" ></script>
    </head>
    <body ng-controller="PhoneListCtrl">    
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    Search: <input ng-model="query">
                </div>
                <div class="col-md-10">
                    <ul class="phones">
                        <li ng-repeat="phone in phones | filter:query">{{phone.name}}
                            <p>{{phone.snippet}}</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
