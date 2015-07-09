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
            <div class="panel-body" ng-controller="showCustomerDetailCtrl">
                <div class="container-page">
                    <form name="myform" class="form-horizontal status" ng-submit="updateCustomer()" method="POST" autocomplete='off'>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label>Customer Name:</label>
                                                </div>
                                                <div class="col-md-3" >
                                                    {{showCustomer.customerName}}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label>Customer Phone:</label>
                                                </div>
                                                <div class="col-md-3" >
                                                    {{showCustomer.customerPhoneNumber}}
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
                                                <div class="col-md-3">
                                                    <label>Amount:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    {{showCustomer.customerAmount}}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label>Interest Amount:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    {{showCustomer.customerInterestAmount}}
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
                                                <div class="col-md-3">
                                                    <label> Total Paid Amount:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    {{showCustomer.paidAmount}}
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label>OutStanding Amount:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    {{showCustomer.outStandingAmount}}
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
                                                <div class="col-md-3">
                                                    <label>Last Paid Amount:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    {{1000}}
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label>Last Paid Date:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    {{1000}}
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
                                                <div class="col-md-3">
                                                    <label>Guarantor Name:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    {{showCustomer.guarantorName}}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label>Guarantor Phone:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    {{showCustomer.guarantorPhoneNumber}}
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
