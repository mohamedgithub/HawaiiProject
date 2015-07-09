<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Creation</title>
    </head>
    <body>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><strong>Edit Customer</strong></h3>
            </div>
            <div class="panel-body" ng-controller="EditCustomerDetailCtrl">
                <div class="container-page">
                    <form name="myform" class="form-horizontal status" ng-submit="updateCustomer()" method="POST" autocomplete='off'>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Customer Name:</label>
                                                </div>
                                                <div class="col-md-2" >
                                                    <input type="text" class="form-control" name="customerName" ng-model="customer.customerName" style="width: 244px; margin-left: 10px" required="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Guarantor Name:</label>
                                                </div>
                                                <div class="col-md-2" >
                                                    <input type="text" class="form-control" name="guarantorName" ng-model="customer.guarantorName" style="width: 244px; margin-left: 10px" required="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>&nbsp;&nbsp;</div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Customer Phone:</label>
                                                </div>
                                                <div class="col-md-2" >
                                                    <input type="number" class="form-control" name="customerPhoneNumber" ng-model="customer.customerPhoneNumber" style="width: 244px; margin-left: 10px" required="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Guarantor Phone:</label>
                                                </div>
                                                <div class="col-md-2" >
                                                    <input type="number" class="form-control" name="guarantorPhoneNumber" ng-model="customer.guarantorPhoneNumber" style="width: 244px; margin-left: 10px" required="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                            
                              <div>&nbsp;&nbsp;</div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Amount:</label>
                                                </div>
                                                <div class="col-md-2" >
                                                    <input type="number" class="form-control" name="customerPhoneNumber" ng-model="customer.customerAmount" style="width: 244px; margin-left: 10px" required="">
                                                </div>
                                            </div>
                                        </div>
                                       <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Address:</label>
                                                </div>
                                                <div class="col-md-2" >
                                                    <textarea class="form-control" name="guarantorAddress" ng-model="customer.guarantorAddress" rows="1" cols="2" class="form-control addresslen" style="width: 244px; margin-left: 10px" required=""></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div>&nbsp;&nbsp;</div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Interest Amount:</label>
                                                </div>
                                                <div class="col-md-2" >
                                                    <input type="number" class="form-control" name="customerPhoneNumber" ng-model="customer.customerInterestAmount" style="width: 244px; margin-left: 10px" required="">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="col-md-offset-4 col-md-6">
                                                        <button type="submit" class="button-left btn btn-w-md btn btn-primary">Submit</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            
                              <div>&nbsp;&nbsp;</div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Address:</label>
                                                </div>
                                                <div class="col-md-2" >
                                                    <textarea class="form-control" name="guarantorAddress" ng-model="customer.customerAddress" rows="2" cols="2" class="form-control addresslen" style="width: 244px; margin-left: 10px" required=""></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
    </body>
</html>
