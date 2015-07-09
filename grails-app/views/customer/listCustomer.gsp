<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CUSTOMER LIST</title>
    </head> 
    <body>
        <div class="container">
            <div class ="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-8">
                        <h1>CUSTOMER LIST</h1>
                    </div>
                </div>
            </div>
            <div class="page" ng-controller="CustomerCtrl">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <form>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                        <input type="text" class="form-control" placeholder="Search" ng-model="Search">
                                    </div>      
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <section class="panel panel-default">
                    <div class="panel-heading"><strong><span class="glyphicon glyphicon-th"></span>CUSTOMER LIST</strong></div>
                    <div class="panel-body">

                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Customer Name</th>
                                        <th>Customer Number</th>
                                        <th>Amount</th>
                                        <th>Interest</th>
                                        <th>Guarantor Name</th>
                                        <th>Guarantor Number</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="customer in customers | filter:Search">
                                        <td><a href="" ng-click="showCustomer($index)">{{customer.customerName}}</a></td>
                                        <td>{{customer.customerPhoneNumber}}</td>
                                        <td>{{customer.amount}}</td>
                                        <td>{{customer.interest}}</td>
                                        <td>{{customer.guarantorName}}</td>
                                        <td>{{customer.guarantorPhoneNumber}}</td>
                                        <td><button type="button" class="btn btn-sm btn-danger" ng-click="deleteCustomer($index)"><i class="glyphicon glyphicon-trash"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button type="button" class="btn btn-sm btn-primary" ng-click=" editCustomer($index)"><i class="glyphicon glyphicon-edit"></i></button></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>
