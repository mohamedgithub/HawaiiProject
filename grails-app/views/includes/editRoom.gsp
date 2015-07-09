<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Room Details</title>
    </head>
    <body>
        <h1 class="row-list"> Edit Room Details</h1> 
        <div class="container" ng-cloak ng-controller="EditRoomCtrl">
            <div ng-hide="hide">{{products.id}}</div>
            <div class="custom-row">  
                <div class="alert alert-success" data-ng-show="success" role="alert">{{success}}</div>
            </div>
            <div class="custom-row">  
                <div class="alert alert-danger" data-ng-show="roomExistError" role="alert">{{roomExistError}}</div>
            </div>
            <form name="myUpload" class="form-horizontal status" ng-submit="update()" method="POST" autocomplete='off'>
                <div ng-hide="id"><input type="hidden" name="roomId" ng-model="roomDetails.id" class="form-control" required=""/></div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-2 custom-left">
                                <label>Room Types: </label>
                            </div>
                            <div class="col-md-3" >
                                <select class="form-control" ng-model="roomDetails.roomType">
                                    <option ng-repeat="room in roomTypes" ng-value="{{roomType.id}}">{{room.roomType}}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div>&nbsp;&nbsp;</div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-2 custom-left">
                                <label>View Types: </label>
                            </div>
                            <div class="col-md-3" >
                                <select class="form-control" ng-model="roomDetails.viewType">
                                    <option ng-repeat="view in views" ng-value="{{viewType.id}}">{{view.viewTypes}}</option>
                                </select>
                            </div>
                        </div>
                    </div> 
            <div>&nbsp;&nbsp;</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2 custom-left">
                        <label>Season Types: </label>
                    </div>
                    <div class="col-md-3">
                        <select class="form-control" ng-model="roomDetails.seasonType">
                            <option ng-repeat="season in seasonTimes" ng-value="{{seasonType.id}}">{{season.seasonType}}</option>
                        </select>
                    </div>
                </div>
            </div>
            
            <div>&nbsp;&nbsp;</div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2 custom-left">
                        <label>Day Types: </label>
                    </div>
                    <div class="col-md-3" >
                        <select class="form-control" ng-model="roomDetails.bookingDay">
                            
                            <option ng-repeat="day in days" ng-value="{{bookingDay.id}}" >{{day.bookingDays}}</option>
                        </select>
                    </div>
                </div>
            </div> 
            <div>&nbsp;&nbsp;</div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2 custom-left">
                        <label>Weekend Days:</label>
                    </div>
                    <div class="col-md-10">
                        <input type="checkbox" ng-model="roomDetails.sunday" ng-true-value="Sunday" ng-false-value='null'>Sunday
                        <input type="checkbox" ng-model="roomDetails.monday" ng-true-value="Monday" ng-false-value='null'>Monday
                        <input type="checkbox" ng-model="roomDetails.tuesday" ng-true-value="Tuesday" ng-false-value='null'>Tuesday<br>
                        <input type="checkbox" ng-model="roomDetails.wednesday"ng-true-value="Wednesday" ng-false-value='null'>Wednesday 
                        <input type="checkbox" ng-model="roomDetails.thursday"ng-true-value="Thursday" ng-false-value='null'>Thusday
                        <input type="checkbox" ng-model="roomDetails.friday" ng-true-value="Friday" ng-false-value='null'>Friday<br>
                        <input type="checkbox" ng-model="roomDetails.saturday" ng-true-value="Saturday" ng-false-value='null'>Saturday
                    </div>
                </div> 
            </div>
           
            <div>&nbsp;&nbsp;</div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2 custom-left">
                        <label>Price: </label>
                    </div>
                    <div class="col-md-3" >
                        <input type="text" class="form-control" data-ng-model="roomDetails.costPrice" required="">
                        <span class="text-danger" data-ng-show="costFormatError">{{costFormatError}}</span>
                        <span class="text-danger" data-ng-show="zeroCostFormatError">{{zeroCostFormatError}}</span>
                    </div>
                </div>
            </div>
            
            <div>&nbsp;&nbsp;</div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2 custom-left">
                        <label>Weekend Price:</label>
                    </div>
                    <div class="col-md-3" >
                        <input type="text" class="form-control"  data-ng-model="roomDetails.weekendCostPrice"  required="">
                        <span class="text-danger" data-ng-show="costFormatError">{{costFormatError}}</span>
                        <span class="text-danger" data-ng-show="zeroCostFormatError">{{zeroCostFormatError}}</span>
                    </div>
                </div>
            </div>
            
            <div>&nbsp;&nbsp;</div>
            
            <div class="form-group">
                <div class="col-md-offset-3 col-sm-3">
                    <button type="submit" class="button-left btn btn-primary" style="margin-left: 150px;">Submit</button>
                </div>
            </div> 
            </form>
        </div>           
    </body>
</html>
