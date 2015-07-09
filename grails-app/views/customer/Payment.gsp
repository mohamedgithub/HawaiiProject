<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
    </head>
    <body>

        <div class ="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-8">
                    <h1>CUSTOMER PAYMENT</h1>
                </div>
            </div>
        </div>

        <div class="panel" ng-controller="CustomerPaymentCtrl">
            <form name="myform" class="form-horizontal status" method="POST" autocomplete='off' ng-submit="getCustomer()">

                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-offset-1 col-md-3">
                            <form>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                        <input type="text" class="form-control" placeholder="Search" ng-model="customer.phoneNumber">
                                    </div>      
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="panel-body">
                    <section class="panel panel-default">
                        <div class="panel-heading"><strong><span class="glyphicon glyphicon-th"></span>Purchase List</strong></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Customer Name</th>
                                            <th>Customer Number</th>
                                            <th>Amount</th>
                                            <th>Interest</th>
                                            <th>Outstanding Amount</th>
                                            <th>Paid Amount</th>
                                            <th>Paying Amount</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Date</td>
                                            <td>{{customer.customerName}}</td>
                                            <td>{{customer.customerPhoneNumber}}</td>
                                            <td>{{customer.amount}}</td>
                                            <td>{{customer.interest}}</td>
                                            <td>{{customer.outstanding}}</td>
                                            <td>{{customer.paid}}</td>
                                            <td><input type="number" data-ng-model="customer.payingAmount" class="form-control"</td>
                                            <td>
                                                <button type="button" class="btn btn-sm btn-success" ng-click=" savePayment()"><i class="glyphicon glyphicon-ok-sign"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button type="button" class="btn btn-sm btn-danger" ng-click="deleteCustomer($index)"><i class="glyphicon glyphicon-trash"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                </div>
            </form>
        </div>
    </body>
</html>
