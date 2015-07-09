

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Hotel</title>
    </head>
    <body>
        <div class="panel panel-default" ng-controller="Createhotel" >
            <div class="panel-heading panhead">
                <nav class="cl-effect-1" >
                    <a href="#cl-effect-1" class="panel-effect "><span class="branchhead">Create Hotel</span></a>
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
                                            <label for="name" class="control-label">Hotel Name:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" name="country.name" ng-model="hotelDetails.hotelName" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" form-groupcol-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6  col-lg-5">
                                            <label for="name" class="control-label">Country:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" id="country" ng-model="cities" ng-options="country for (country, cities) in countries" required>
                                                <option value="">Select Value</option>
                                            </select>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="name" class="control-label">City:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" id="city" ng-model="suburbs" ng-options="city for city in cities" required>
                                                <option value="">Select Value</option>
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
                                            <label for="name" class="control-label">Address:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <textarea ng-model="hotelDetails.address" required rows="1" cols="2" class="form-control addresslen" required></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6  col-lg-5">
                                            <label for="country" >Phone Number:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" ng-model="hotelDetails.phoneNumber" required>  
                                            <span class="text-danger"  data-ng-show="phoneNumberError">{{phoneNumberError}}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Email ID:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" ng-model="hotelDetails.mailId" required>
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
                                            <label for="country" >Fax:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <input class="form-control" type="text" ng-model="hotelDetails.fax" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6  col-lg-5">
                                            <label for="country" >Room Type:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" ng-model="hotelDetails.roomType" required>
                                                <option value="">Select Value</option>
                                                <option value="Single Member">Single Member</option>
                                                <option value="Double Member">Double Member</option>
                                                <option value="Three Member">Three Member</option>
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
                                            <select class="form-control" ng-model="hotelDetails.supplier" required>
                                                <option value="">Select Value</option>
                                                <option value="Hotel Supplier">Hotel Supplier</option>
                                                <option value="Private Supplier">Private Supplier</option>
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
                                            <label for="country" >Food Type:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" ng-model="hotelDetails.foodType" required>
                                                <option value="">Select Value</option>
                                                <option value="Break Fast">Break Fast</option>
                                                <option value="Lunch">Lunch</option>
                                                <option value="Dinner">Dinner</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6  col-lg-5">
                                            <label for="country" >Basics:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" ng-model="hotelDetails.basis" required>
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
                                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                            <label for="country" >Extras:</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                                            <select class="form-control" ng-model="hotelDetails.extras" required>
                                                <option value="">Select Value</option>
                                                <option value="Bed">Bed</option>
                                                <option value="Pillow">Pillow</option>
                                            </select>
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
                        </div>
                    </div>
                </form>
            </div>
        
            <h2 class="contactadd">Add Contact Person Details</h2>
            <form  autocomplete='off'> 
                <div class="container contacttable">
                    <div class="table-responsive panel panel-default">
                        <table class=" table table-bordered">
                            <thead class="contacttablehead">
                                <tr>
                                    <th class="contacttext">Name</th>
                                    <th class="contacttext">Designation</th>
                                    <th class="contacttext">Email</th>
                                    <th class="contacttext">Phone No</th>
                                    <th class="contacttext">Mobile</th>
                                    <th class="contacttext">Fax</th>
                                    <th class="contacttext">Action</th>
                                </tr>
                            </thead>
                            <tbody id="contact-details">
                                <tr class="clone-tr" >
                                    <td><input type="text" class="form-control" ng-model="newObj.cname" ></td>
                                    <td><input type="text" class="form-control"  ng-model="newObj.cdesignation" ></td>
                                    <td><input type="text" class="form-control" ng-model="newObj.cphone" ng-pattern="/[0-9]/"></td>
                                    <td><input type="text" class="form-control" ng-model="newObj.cmobile" ></div></td>
                                    <td><input type="text" class="form-control" ng-model="newObj.cemail" ></div></td>
                                    <td><input type="text" class="form-control" ng-model="newObj.cfax" ></div></td>                             
                                    <td><span><button type class="btn btn-primary" ng-click="addPersonDetails()">ADD</button></span>
                                    </td>
                                </tr>
                                <tr ng-repeat="Obj in listObj">
                                    <td>{{Obj.cname}}</td>
                                    <td>{{Obj.cdesignation}}</td>
                                    <td>{{Obj.cphone}}</td>
                                    <td>{{Obj.cmobile}}</td>
                                    <td>{{Obj.cemail}}</td>
                                    <td>{{Obj.cfax}}</td>
                                    <td><span class="glyphicon glyphicon-pencil pen" data-ng-click="deleteHotel($index)"></span>&nbsp;&nbsp;
                                    <span class="glyphicon glyphicon-remove pen" data-ng-click="editHotel($index, hotel)"></span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>  

            <div class="container gridtable">
                <div class="table-flip-scroll table-responsive">
                    <table class="table table-bordered">
                        <thead class="tablehead">
                            <tr>
                                <th>S NO</th>
                                <th>Hotel Name</th>
                                <th>Country</th>
                                <th>City</th>
                                <th>Address</th>
                                <th>Phone Number</th>
                                <th>Email ID</th>
                                <th>Fax</th>
                                <th>Room Type</th>
                                <th>Supplier</th>
                                <th>Food Type</th>
                                <th>Basis</th>
                                <th>Extras</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                           <tr data-ng-show="hotelDetail.length == 0" ><td colspan="14">No records found</td></tr>
                            <tr ng-repeat="hotel in hotelDetail" data-ng-hide="hotelDetail.length == 0"> 
                                <td>{{$index+1}}</td>
                                <td>{{hotel.hotelName}}</td>
                                <td>{{hotel.countryName}}</td>
                                <td>{{hotel.cityName}}</td>
                                <td>{{hotel.address}}</td>
                                <td>{{hotel.phoneNumber}}</td>
                                <td>{{hotel.mailId}}</td>
                                <td>{{hotel.fax}}</td>
                                <td>{{hotel.roomType}}</td>
                                <td>{{hotel.supplier}}</td>
                                <td>{{hotel.foodType}}</td>
                                <td>{{hotel.basis}}</td>
                                <td>{{hotel.extras}}</td>
                                <td><span class="glyphicon glyphicon-pencil pen" data-ng-click="deleteHotel($index)"></span>
                                    <span class="glyphicon glyphicon-remove pen" data-ng-click="editHotel($index, hotel)"></span>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

<!--<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Hotel</title>
    </head>
    <body>
        <div class="panel panel-default" ng-controller="Createhotel">
            <div class="panel-heading panhead">
                <nav class="cl-effect-1" >
                    <a href="#cl-effect-1" class="panel-effect">Create Hotel</a>
                </nav>
            </div>
            <div class="panel-body panel-bodyalign">
                <form class="form-inline cntryform" ng-submit="save()" method="POST" autocomplete='off'>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="row">
                                <div class=" col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <label for="country" >Hotel Name:</label>
                                    <input class="form-control" type="text" name="country.name" ng-model="hotelDetails.hotelName" required>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <label for="country" >Country:</label>
                                    <select class="form-control" id="country" ng-model="cities" ng-options="country for (country, cities) in countries" required>
                                        <option value="">Select Value</option>
                                    </select>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <label for="country" >City:</label>
                                    <select class="form-control" id="city" ng-model="suburbs" ng-options="city for city in cities" required>
                                        <option value="">Select Value</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row" style="padding-top: 30px;">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">
                                    <label for="country" >Address:</label>
                                    <input class="form-control" type="text" name="country.address" ng-model="hotelDetails.address" required>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">
                                    <label for="country" >Phone Number:</label>
                                    <input class="form-control" type="text" ng-model="hotelDetails.phoneNumber" required>  
                                    <span class="text-danger"  data-ng-show="phoneNumberError">{{phoneNumberError}}</span>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">
                                    <label for="country" >Email ID:</label>
                                    <input class="form-control" type="text" ng-model="hotelDetails.mailId" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row" style="padding-top: 30px;">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="country" >Fax:</label>
                                    <input class="form-control" style="margin-left: 51px;" type="text" ng-model="hotelDetails.fax" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="country" >Room Type:</label>
                                    <select class="form-control" ng-model="hotelDetails.roomType" style="margin-left: 30px; width: 208px;" required>
                                        <option value="">Select Value</option>
                                        <option value="Single Member">Single Member</option>
                                        <option value="Double Member">Double Member</option>
                                        <option value="Three Member">Three Member</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="country" >Supplier:</label>
                                    <select class="form-control" ng-model="hotelDetails.supplier" style="width: 199px;" required>
                                        <option value="">Select Value</option>
                                        <option value="Hotel Supplier">Hotel Supplier</option>
                                        <option value="Private Supplier">Private Supplier</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row" style="padding-top: 30px;">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="country" >Food Type:</label>
                                    <select class="form-control" ng-model="hotelDetails.foodType" style="margin-left: 10px; width:199px; " required>
                                        <option value="">Select Value</option>
                                        <option value="Break Fast">Break Fast</option>
                                        <option value="Lunch">Lunch</option>
                                        <option value="Dinner">Dinner</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="country" >Basics:</label>
                                    <select class="form-control" ng-model="hotelDetails.basis" style="margin-left: 60px; width: 210px;" required>
                                        <option value="">Select Value</option>
                                        <option value="Sahar">Sahar</option>
                                        <option value="Iftar">Iftar</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="country" >Extras:</label>
                                    <select class="form-control" ng-model="hotelDetails.extras" style="margin-left: 13px; width: 200px;" required>
                                        <option value="">Select Value</option>
                                        <option value="Bed">Bed</option>
                                        <option value="Pillow">Pillow</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 30px;">
                        <div class="col-md-12">
                            <div class="col-md-offset-7 col-md-4" style="margin-left: 648px;">
                                <button type="submit" class="button-left pull-right btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="container gridtable " >
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead class="tablehead">
                            <tr>
                                <th>S NO</th>
                                <th>Hotel Name</th>
                                <th>Country</th>
                                <th>City</th>
                                <th>Address</th>
                                <th>Phone Number</th>
                                <th>Email ID</th>
                                <th>Fax</th>
                                <th>Room Type</th>
                                <th>Supplier</th>
                                <th>Food Type</th>
                                <th>Basis</th>
                                <th>Extras</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                           <tr data-ng-show="hotelDetail.length == 0" ><td colspan="14">No records found</td></tr>
                            <tr ng-repeat="hotel in hotelDetail" data-ng-hide="hotelDetail.length == 0">
                                
                                <td>{{$index+1}}</td>
                                <td>{{hotel.hotelName}}</td>
                                <td>{{hotel.countryName}}</td>
                                <td>{{hotel.cityName}}</td>
                                <td>{{hotel.address}}</td>
                                <td>{{hotel.phoneNumber}}</td>
                                <td>{{hotel.mailId}}</td>
                                <td>{{hotel.fax}}</td>
                                <td>{{hotel.roomType}}</td>
                                <td>{{hotel.supplier}}</td>
                                <td>{{hotel.foodType}}</td>
                                <td>{{hotel.basis}}</td>
                                <td>{{hotel.extras}}</td>
                                <td style="width: 145px;"><button type="button" class="btn btn-primary btn-sm" ng-click="deleteHotel($index)">Delete</button>
                                    <span class="pull-right"><button type="button" class="btn btn-primary btn-sm" style="margin-left: 5px;" ng-click=" editHotel($index, hotel)">Edit</button></span></td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
            </div>
        </div>  
    </body>
</html> -->
