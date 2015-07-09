<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Room List</title>
  </head>
  <body>
      <h1 class="row-list">Room Details</h1> 
    <div class="row my-row-top" style="margin-left: 5px;margin-right: 30px;" ng-controller="RoomListCtrl">
            <table table class=" table table-hover table table-bordered  table table-striped"> 
                <tr>
                   <th class="primary">Room Type</th>
                   <th class="primary">Views</th>
                   <th class="primary">Season</th>
                   <th class="primary">Weekend Days</th>
                   <th class="primary">Weekend Cost Price</th>
                   <th class="primary">Working Days</th>
                   <th class="primary">Working Cost Price</th>
                   <th class="primary">Action</th>
                </tr>
                <tr ng-repeat="room in rooms">
                    <td>{{room.roomType}}</td> 
                    <td>{{room.view}}</td>
                    <td>{{room.seasonType}}</td>
                    <td><span ng-repeat="week in room.weekendDays">{{week | date:dateFormat}}<br></span></td>
                    <td>{{room.weekendCostPrice}}</td>
                    <td><span ng-repeat="work in room.workingDays">{{work | date:dateFormat}}<br></span></td>
                    <td>{{room.costPrice}}</td>
                    <td><button type="button" class="btn btn-primary btn-default" style="margin-left: 10px;" ng-click="deleteRoom($index)">Delete</button>
                    <button type="button" class="btn btn-primary btn-default" style="margin-left: 20px;" ng-click=" editRoom($index)">Edit</button></a></td>
                </tr>
            </table>  
        </div>
  </body>
</html>
