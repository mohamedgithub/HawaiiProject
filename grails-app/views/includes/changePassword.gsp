<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        
    </head>
    <body>
        <div class="container container-top" data-ng-controller="ChangePasswordController">
            <form name="myUpload" role="form" class="form-horizontal status" data-ng-submit="changePassword()" method="POST" autocomplete='off'>
                <div class="col-md-offset-1 col-md-10 col-md-1">
                    <h3 class="bg-success"><span data-ng-show="passwordFieldErrors.success" data-i18n="{{passwordFieldErrors.success}}"></span></h3>
                </div>
                <div class="col-md-offset-1 col-md-10 col-md-1">
                    <h4 class="bg-danger"><span data-ng-show="passwordFieldErrors.equalPassword" data-i18n="{{passwordFieldErrors.equalPassword}}"></span></h4>
                </div>
                <div>&nbsp;&nbsp;</div>
                <div class="form-group">
                    <label  class="col-sm-3 control-label">Old Password</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" required="" placeholder="Old Password" data-ng-model="password.oldPassword">
                        <span class="text-danger pull-left" data-ng-show="passwordFieldErrors.oldPasswordIncorrect" data-i18n="{{passwordFieldErrors.oldPasswordIncorrect}}"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-3 control-label">New Password</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" required="" placeholder="New Password" data-ng-model="password.newPassword">
                        <span data-ng-show="passwordErrors.newPassword" class="pull-left text-danger" data-i18n="{{passwordErrors.newPassword}}"></span>
                        <span data-ng-show="passwordFieldErrors.mismatch" class="pull-left text-danger" data-i18n="{{passwordFieldErrors.mismatch}}"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-3 control-label">Confirm Password</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" required="" placeholder="Confirm Password" data-ng-model="password.confirmPassword"> 
                        <span data-ng-show="passwordErrors.confirmPassword" class="pull-left text-danger" data-i18n="{{passwordErrors.confirmPassword}}"></span>
                        <span data-ng-show="passwordFieldErrors.mismatch" class="pull-left text-danger" data-i18n="{{passwordFieldErrors.mismatch}}"></span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-offset-5 col-md-7">
                                <button type="submit" class="btn btn-primary" style="margin-left: 30px;">Reset Password</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>    
        </div>
    </body>
</html>
<!--
<%@ page contentType="text/html;charset=UTF-8" %>
 <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Reset</title>
    </head>
<body  data-ng-app="ChangePassword">
    <div class="container" data-ng-controller="ChangePasswordController">
        
            <form class="form-horizontal" role="form" data-ng-submit="changePassword()">
                <div class="row">
                    <h3 class="bg-success"><span data-ng-show="passwordFieldErrors.success" data-i18n="{{passwordFieldErrors.success}}"></span></h3>
                </div>
                <div class="row">
                    <h4 class="bg-danger"><span data-ng-show="passwordFieldErrors.equalPassword" data-i18n="{{passwordFieldErrors.equalPassword}}"></span></h4>
                </div>
                
                <div>&nbsp;&nbsp;</div>
                
                <div class="form-group">
                    <label for="inputEmail" class="col-md-4 control-label"><span data-i18n="old_password"></span></label>
                    <div class="col-md-8">
                        <input type="password" class="form-control" required="" placeholder="Old Password" data-ng-model="password.oldPassword">
                        <span class="text-danger pull-left" data-ng-show="passwordFieldErrors.oldPasswordIncorrect" data-i18n="{{passwordFieldErrors.oldPasswordIncorrect}}"></span> 
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="inputEmail" class="col-md-4 control-label"><span data-i18n="new_password"></span></label>
                    <div class="col-md-8">
                        <input type="password"class="form-control" required="" placeholder="New Password" data-ng-model="password.newPassword">
                        <span data-ng-show="passwordErrors.newPassword" class="pull-left text-danger" data-i18n="{{passwordErrors.newPassword}}"></span>
                        <span data-ng-show="passwordFieldErrors.mismatch" class="pull-left text-danger" data-i18n="{{passwordFieldErrors.mismatch}}"></span>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="inputEmail" class="col-md-4 control-label"><span data-i18n="confirm_password"></span></label>
                    <div class="col-md-8">    
                        <input type="password"class="form-control" required="" placeholder="Confirm Password" data-ng-model="password.confirmPassword">
                        <span data-ng-show="passwordErrors.confirmPassword" class="pull-left text-danger" data-i18n="{{passwordErrors.confirmPassword}}"></span>
                        <span data-ng-show="passwordFieldErrors.mismatch" class="pull-left text-danger" data-i18n="{{passwordFieldErrors.mismatch}}"></span>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-offset-5 col-md-7">
                                <button type="submit" class="btn btn-primary pull-right"><span data-i18n="reset_password"></span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>  -->
