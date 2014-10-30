<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    <asset:stylesheet src="main.css"/>
</head>
<body>
    <div class="container">
        <div class="row"  data-ng-app="app.signUp">
            <div class="col-md-12"  ng-controller="signUpCtrl">
                <div>&nbsp;&nbsp</div>
                 <div ng-if="success == 'success'">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-md-offset-1">
                            <div class="alert alert-success" role="alert"><span>Account Created Successfully</span>
                                <a href="http://localhost:8080/Hawaii/login/auth" class="pull-right text-success"><u>Login</u></a>
                            </div>
                        </div>    
                    </div>
                </div>
                
                <div class="panel panel-info signUpPanel">
                    <div class="panel-heading">Create an Account <a href="http://localhost:8080/Hawaii/login/auth" class="pull-right text-success"><u>Login</u></a>      </div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" ng-submit="accountCreation()">
                            <div class="form-group">
                                <label  class="col-sm-3 control-label">User Name:</label>
                                <div class="col-sm-4">
                                    <input type="text"  class="form-control" ng-model="newUser.name" required="" placeholder="Enter User Name">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-md-offset-4">
                                    <span class="text-danger">{{userNameError}}</span>
                                </div>
                            </div>
                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Password:</label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" ng-model="newUser.password" required="" placeholder="Password">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-md-offset-4">
                                    <span class="text-danger">{{passwordError}}</span>
                                </div>
                            </div>
                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Confirm Password:</label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" ng-model="newUser.confirmPassword" required="" placeholder="Confirm Password">
                                </div>
                            </div>
                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Email:</label>
                                <div class="col-sm-4">
                                    <input type="email" class="form-control" ng-model="newUser.email" required="" placeholder="Email">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-md-offset-4">
                                    <span class="text-danger">{{emailError}}</span>
                                </div>
                            </div>
                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Location :</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" ng-model="newUser.location" required="" placeholder="Location">
                                </div>
                            </div>
                            <div class="form-group">
                              <label  class="col-sm-3 control-label">Phone Number:</label>
                                <div class="col-sm-4">
                                    <input type="number" class="form-control" ng-model="newUser.phoneNumber" required="" placeholder="Contact Number">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-6 col-md-offset-6">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${resource(dir: 'bower_components/angular/', file: 'angular.min.js')}" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>
    <asset:javascript src="Task/SignUp.js"/>
</body>
<!--<div class="row">
        <div class="col-md-12">
            <div>
                <a href="http://localhost:8080/Hawaii/login/auth" class="pull-right">
                <button class="btn btn-primary">Back</button>
                </a>
            </div>
        </div>
    </div>-->