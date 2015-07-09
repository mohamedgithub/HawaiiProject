<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample title</title>
    </head>
    <body>
        <div class="container" ng-controller="SeasonCtrl">
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
                <div class="alert alert-danger" data-ng-show="seasonExistError" role="alert">{{seasonExistError}}</div>
            </div>
            <div class="custom-row">  
                <div class="alert alert-danger" data-ng-show="dateError" role="alert">{{dateError}}</div>
            </div>
            <div class="custom-row">  
                <div class="alert alert-danger" data-ng-show="nameError" role="alert">{{nameError}}</div>
            </div>
            <div class="row" style="padding-top: 30px;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-2 custom-left">
                            <label>Season Name: </label>
                        </div>
                        <div class="col-md-3" >
                            <input type="text" class="form-control" name="costPrice" ng-model="season.name" style="width: 244px; margin-left: 10px" required="">
                        </div>
                    </div>
                </div>
            </div>
            <div>&nbsp;&nbsp;</div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-2 custom-left">
                            <label>Start Date:</label>
                        </div>
                        <div class="col-md-3" >
                            <input type="text" class="form-control" datepicker-popup="dd-MMM-yyyy" ng-model="season.startDate"  required="" open="opened"/>
                        </div>
                    </div>
                </div>
            
            <div>&nbsp;&nbsp;</div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-2 custom-left">
                            <label>End Date:</label>
                        </div>
                        <div class="col-md-3" >
                            <input type="text"  class="form-control" datepicker-popup="dd-MMM-yyyy" ng-model="season.endDate" required="" open="opened"/>
                        </div>
                    </div>
                </div>
                <div>&nbsp;&nbsp;</div>
                <div class="form-group">
                    <div class="col-md-offset-3 col-sm-3">
                        <button type="submit" class="button-left btn btn-primary" style="margin-left: 90px;">Submit</button>
                    </div>
                </div>
        <div class="container">
            <div class="row my-row-top" style="margin-left: 5px;margin-right: 30px;">
                <table table class=" table table-hover table table-bordered  table table-striped"> 
                    <tr>
                       <th class="primary">Season Name</th>
                       <th class="primary">Start Date</th>
                       <th class="primary">End Date</th>
                       <th class="primary">Action</th>
                    </tr>
                    <tr ng-repeat="season in seasonDetails">
                        <td>{{season.seasonType}}</td> 
                        <td>{{season.startdate | date:'medium'}}</td>
                        <td>{{season.enddate | date:'medium'}}</td>
                        <td><button type="button" class="btn btn-primary btn-default" style="margin-left: 10px;" ng-click="deleteSeason($index)">Delete</button>
                        <button type="button" class="btn btn-primary btn-default" style="margin-left: 20px;" ng-click=" editSeason($index)">Edit</button></a></td>
                    </tr>
                </table>
            </div>
        </div>
        </div>
    </body>
</html>