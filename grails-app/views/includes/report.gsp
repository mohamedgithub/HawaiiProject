<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sale Report</title>
    </head>
    <body>
        <h1 class="row-list">Sales Report</h1>
        <div class="container" ng-controller="ReportCtrl">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
                <table table class=" table table-hover table table-bordered  table table-striped" > 
                    <tr>
                       <th class="primary">Product Name</th>
                       <th class="primary">Cost</th>
                       <th class="primary">Quantity</th>
                       <th class="primary">Total</th>
                       <th class="primary">Profit</th>
                       <th class="primary">Date</th>
                    </tr>
                    <tr ng-repeat="report in purchaseReport">
                        <td>{{report.productName}}</td> 
                        <td>{{report.sellingPrice}}</td>
                        <td>{{report.quantity}}</td>
                        <td>{{report.total}}</td>
                        <td>{{report.profit | currency:"&#8377;"}}</td>
                        <td>{{report.date | date:'medium'}}</td>
                    </tr>
                </table>
            </div>
        </div>
        </div>
    </body>
</html>
