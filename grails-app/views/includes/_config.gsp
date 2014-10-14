<%@ page contentType="text/html;charset=UTF-8" %>
<div class="panel panel-default" data-ng-app="listExamples">
    <div class="panel-heading"><strong><span class="glyphicon glyphicon-th"></span> Sign up Form</strong></div>
    <div class="panel-body"  data-ng-controller="ExampleController">
        <form name="form_signup" class="form-horizontal form-validation" data-ng-submit="submitForms()">
            <div class="form-group">
                <div class="col-sm-3">
                    <label for="">User Name</label>
                </div>
                <div class="col-sm-9">
                    <input  type="text"class="form-control" placeholder="Enter your Name" data-ng-model="info.name" required data-ng-minlength="2" data-ng-maxlength="30">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <label for="">Email</label>
                </div>
                <div class="col-sm-9">
                    <input type="email" class="form-control"placeholder="Enter your Email Name" data-ng-model="info.email" required>
                </div>
            </div>
            <div>
                <button type="submit" class="btn btn-success">Sign up</button>
            </div>
            <hr>
        </form>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-4">Name</div>
                    <div class="col-md-4">Email</div>
                </div>
            </div>
            <div class="panel-body">
                <div class="row" ng-repeat="user in userList">
                    <div class="col-md-4">{{user.name}}</div>
                    <div class="col-md-4">{{user.email}}</div>
                    <div class="col-md-2">
                        <button class="btn btn-primary" ng-click="delete($index)">Delete </button>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</div>









