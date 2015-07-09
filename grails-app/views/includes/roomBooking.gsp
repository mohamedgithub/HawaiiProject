<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Room Booking</title>
 
    </head>
    <body>
        <div class="container" ng-controller="HotelBooking">
            <div>&nbsp;&nbsp;</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-offset-2">
                        <h2> Welcome To Hotel Booking Management System </h2>
                    </div>
                </div>
            </div>
            <div>&nbsp;&nbsp;</div>
            <form name="myform" class="form-horizontal status" ng-submit="save()" method="POST" autocomplete='off'>
            <div class="custom-row">  
                <div class="alert alert-success" data-ng-show="success" role="alert">{{success}}</div>
            </div>
            <div class="custom-row">  
                <div class="alert alert-danger" data-ng-show="roomExistError" role="alert">{{roomExistError}}</div>
            </div>
            <div class="row" style="padding-top: 30px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2 custom-left">
                        <label>Room Types: </label>
                    </div>
                    <div class="col-md-3" >
                        <select class="form-control" ng-model="roomDetails.roomType">
                            <option value="">Select Value</option>
                            <option ng-repeat="room in roomTypes" ng-value="{{roomType.id}}">{{room.roomType}}</option>
                            <span class="text-danger">{{errors.roomTypeError}}</span>
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
                            <option value="">Select Value</option>
                            <option ng-repeat="view in views" ng-value="{{viewType.id}}">{{view.viewTypes}}</option>
                        </select>
                        <span class="text-danger">{{errors.viewTypeError}}</span>
                    </div>
                </div>
            </div>
            <div>&nbsp;&nbsp;</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2 custom-left">
                        <label>Season Types: </label>
                    </div>
                    <div class="col-md-3" >
                        <select class="form-control" ng-model="roomDetails.seasonType">
                            <option value="">Select Value</option>
                            <option ng-repeat="seasonTime in seasonTimes" ng-value="{{seasonType.id}}">{{seasonTime.seasonType}}</option>
                        </select>
                        <span class="text-danger">{{errors.seasonTypeError}}</span>
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
                            <option value="">Select Value</option>
                            <option ng-repeat="day in days" ng-value="{{bookingDay.id}}" required="">{{day.bookingDays}}</option>
                        </select>
                        <span class="text-danger">{{errors.bookingDayError}}</span>
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
                            <input type="checkbox" ng-model="roomDetails.sunday" ng-true-value="SUNDAY" ng-false-value='null'>Sunday
                            <input type="checkbox" ng-model="roomDetails.monday" ng-true-value="MONDAY" ng-false-value='null'>Monday
                            <input type="checkbox" ng-model="roomDetails.tuesday" ng-true-value="TUESDAY" ng-false-value='null'>Tuesday<br>
                            <input type="checkbox" ng-model="roomDetails.wednesday" ng-true-value="WEDNESDAY" ng-false-value='null'>Wednesday 
                            <input type="checkbox" ng-model="roomDetails.thursday" ng-true-value="THURSDAY" ng-false-value='null'>Thursday
                            <input type="checkbox" ng-model="roomDetails.friday" ng-true-value="FRIDAY" ng-false-value='null'>Friday<br>
                            <input type="checkbox" ng-model="roomDetails.saturday" ng-true-value="SATURDAY" ng-false-value='null'>Saturday
                        </div>
                    </div> 
                </div>
            
            <div>&nbsp;&nbsp;</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2 custom-left">
                        <label>Normal Price: </label>
                    </div>
                    <div class="col-md-3" >
                        <input type="text" class="form-control"  data-ng-model="roomDetails.roomPrice"  required="">
                        <span class="text-danger" data-ng-show="costFormatError">{{costFormatError}}</span>
                        <span class="text-danger" data-ng-show="zeroCostFormatError">{{zeroCostFormatError}}</span>
                    </div>
                </div>
            </div>
            <div>&nbsp;&nbsp;</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2 custom-left">
                        <label>WeekEnd Price: </label>
                    </div>
                    <div class="col-md-3" >
                        <input type="text" class="form-control"  data-ng-model="roomDetails.weekendroomPrice"  required="">
                    </div>
                </div>
            </div>
            <div>&nbsp;&nbsp;</div>
            <div class="form-group">
                <div class="col-md-offset-3 col-sm-3">
                    <button type="submit" class="button-left btn btn-primary" style="margin-left: 95px;">Submit</button>
                </div>
            </div>
            </div>
            </form>
        </div>
    </body>
</html>
