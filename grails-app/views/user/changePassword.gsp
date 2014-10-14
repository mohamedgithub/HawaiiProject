<div class="page-signin" data-ng-app="ChangePassword">



    <div class="signin-body" data-ng-controller="ChangePasswordController">
        <div class="form-container">
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
    </div>
</div>    
                    
<!--                        <div class="form-group">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                </span>
                                <input type="password"class="form-control"placeholder="Old Password" required data-ng-model="password.old">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                </span>
                                <input type="password"class="form-control"placeholder="New Password" required data-ng-model="password.newpassword">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                </span>
                                <input type="password"class="form-control"placeholder="Confirm New Password" required data-ng-model="password.retype">
                            </div>
                        </div>-->
                        

<!--                <section>
                    <p class="text-center"><a href="javascript:;">Forgot your password?</a></p>
                    <p class="text-center text-muted text-small">Don't have an account yet? <a href="#/pages/signup">Sign up</a></p>
                </section>-->

