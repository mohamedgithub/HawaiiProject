<%@ page contentType="text/html;charset=UTF-8" %>
<div class="customepanel panel panel-default" data-ng-app="listExamples">
    <div class="panel-heading"><strong><span class="glyphicon glyphicon-th"></span><span data-i18n="signup_form"></span></strong></div>
    <div class="panel-body"  data-ng-controller="ConfigCtrl">
        <form name="form_signup" class="form-horizontal form-validation" data-ng-submit="submitForms()">
            <div class="form-group">
                <div class="col-sm-3">
                    <label for=""><span data-i18n="user_name"></span></label>
                </div>
                <div class="col-sm-9">
                    <input  type="text"class="form-control" placeholder="Enter your Name" data-ng-model="info.name" required data-ng-minlength="2" data-ng-maxlength="30">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <label for=""><span data-i18n="email"></span></label>
                </div>
                <div class="col-sm-9">
                    <input type="email" class="form-control"placeholder="Enter your Email Name" data-ng-model="info.email" required>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3 col-md-offset-10 bootBtn">
                            <button type="submit" class="btn btn-success"><span data-i18n="save"></span></button>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </form>
        <div class="panel panel-primary" ng-show="userList.length >= 1">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-4"><span data-i18n="user_name"></span></div>
                    <div class="col-md-4"><span data-i18n="email"></span></div>
                </div>
            </div>
            <div class="panel-body">
                <div class="row" ng-repeat="user in userList">
                    <div class="col-md-4">{{user.name}}</div>
                    <div class="col-md-4">{{user.email}}</div>
                    <div class="col-md-2">
                        <button class="btn btn-primary" ng-click="delete($index)"><span data-i18n="delete"></span></button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-md-offset-4"">
                        <span ng-show="showSaving"><img src="images/loader.png" alt="" class="img-circle img30_30">Saving...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>









