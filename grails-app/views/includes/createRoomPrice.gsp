<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Room Price</title>
    </head>
    <body>
        <div class="panel panel-default" ng-controller="CreateRoomPriceCtrl" >
            <div class="panel-heading panhead">
                <nav class="cl-effect-1" >
                    <a href="#cl-effect-1" class="panel-effect "><span class="branchhead">Create Room Price</span></a>
                </nav>
            </div>
            
            <div class="panel-body panel-bodyalign">
                <form class="form-horizontal branchformalign" action="" method="POST" ng-submit="save()" autocomplete='off'>
                    <div class="row branchform">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="name" class="control-label">From Date:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input type="text" class="form-control" datepicker-popup="dd-MMM-yyyy" ng-model="CreateRoomPrice.startDate"  required="" open="opened"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" form-groupcol-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6  col-lg-5">
                                            <label for="name" class="control-label">To Date:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input type="text"  class="form-control" datepicker-popup="dd-MMM-yyyy" ng-model="CreateRoomPrice.endDate" required="" open="opened"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Room Type:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" ng-model="CreateRoomPrice.roomType" required>
                                                <option value="">Select Value</option>
                                                <option value="Single Member">Single Member</option>
                                                <option value="Double Member">Double Member</option>
                                                <option value="Three Member">Three Member</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                   
                    <div class="row branchform">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Basics:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" ng-model="CreateRoomPrice.basis" required>
                                                <option value="">Select Value</option>
                                                <option value="Sahar">Sahar</option>
                                                <option value="Iftar">Iftar</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6  col-lg-5">
                                            <label for="country" >Rate Code:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" ng-model="CreateRoomPrice.rateCode" required>
                                                <option value="">Select Value</option>
                                                <option value="Per Room Per Night">Per Room Per Night</option>
                                                <option value="Per Room Per Stay">Per Room Per Stay</option>
                                                <option value="Per Pax Per Night">Per Pax Per Night</option>
                                                <option value="Per Pax Per Stay">Per Pax Per Stay</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Supplier:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" ng-model="CreateRoomPrice.supplier" required>
                                                <option value="">Select Value</option>
                                                <option value="A">Class A</option>
                                                <option value="B">Class B</option>
                                                <option value="C">Class C</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                    
                    <div class="row branchform">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Cost:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" ng-model="CreateRoomPrice.costPrice" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6  col-lg-5">
                                            <label for="country" >Commission %:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" ng-model="CreateRoomPrice.commission" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Selling Price:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" ng-model="CreateRoomPrice.sellingPrice" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row branchform">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Currency:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" ng-model="CreateRoomPrice.currency" required>
                                                <option value="">Select Value</option>
                                                <option value="SAR">SAR</option>
                                                <option value="INR">INR</option>
                                                <option value="USD">USD</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6  col-lg-5">
                                            <label for="country" >Conversion Rate:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" ng-model="CreateRoomPrice.conversionRate" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Selling Price:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" ng-model="CreateRoomPrice.sellingPrice" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                            
                    <div class="row branchform">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Cost ORS:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" ng-model="CreateRoomPrice.ors" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                                                
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="col-xs-offset-5 col-xs-7 col-sm-offset-8 col-sm-4 col-md-offset-8 col-md-4 col-lg-offset-10 col-lg-2" >
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>    
            </div>
        </div>
    </body>
</html>
