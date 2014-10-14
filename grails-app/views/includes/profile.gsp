<div class="row" ng-controller="ProfileCtrl">
    <div class="col-md-6">
        <section class="panel panel-default customPanel">
                <div class="panel-heading"><strong><span class="glyphicon glyphicon-th"></span>User Profile</strong></div>
                <div class="panel-body">
                    <form role="form" name="myForm" ng-submit="save()">
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4">
                                <span class="text-success" ng-show="success" data-i18n="saved_successfully"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4"">
                                <span ng-show="showSaving"><img src="images/loader.png" alt="" class="img-circle img30_30">Saving...</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label> <span data-i18n="user_name"></span></label>
                            <input type="text" name="userName" class="form-control" ng-model="user.userName" required="" ng-minlength="3" ng-maxlength="10" />
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4">
                                <span class="text-danger">{{spaceError}}</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4">
                                <span class="error" ng-show="myForm.userName.$error.minlength">
                            Too short!</span>
                                <span class="error" ng-show="myForm.userName.$error.maxlength">
                            Too long!</span><br>
                            </div>
                        </div>
                        <div class="form-group">
                            <label><span data-i18n="email"></span></label>
                            <input type="email" class="form-control" ng-model="user.email" required=""/>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4">
                                <span class="text-danger">{{emailError}}</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Location</label>
                            <input type="text" class="form-control" ng-model="user.location" required=""/>
                        </div>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input type="text" name="phoneNumber" class="form-control" ng-model="user.phoneNumber" required="" ng-minlength="10" ng-maxlength="10"/>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4">
                                <span class="text-danger">{{phoneNumberError}}</span>
                            </div>
                        </div>
                        <div class="col-md-12 col-md-offset-4">
                                <span class="error" ng-show="myForm.phoneNumber.$error.minlength">
                            Number should be 10 digit!</span>
                                <span class="error" ng-show="myForm.phoneNumber.$error.maxlength">
                            Number should be 10 digit!</span><br>
                            </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-8">
                                <button type="submit" class="btn btn-success cancelbtn"><span data-i18n="save"></span></button>&nbsp;
                                <button class="btn btn-primary cancelbtn" ng-click="cancel()"><span data-i18n="cancel"></span></button>
                            </div>
                        </div>
                                
                    </form>      
                </div>
            </section>
    </div>
</div>


   <!-- <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <strong><span class="glyphicon glyphicon-th"></span> Profile Info</strong>
                </div>
                <div class="panel-body">
                    <div class="media">
                        <div class="media-body" ng-controller="ProfileCtrl">
                            <form ng-submit="save()">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-2">
                                            <label>User name</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" ng-model="user.userName" required=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-md-offset-4">
                                        <span class="text-danger">{{nameError}}</span> 
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-2">
                                            <label>Email</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="email" class="form-control" ng-model="user.email" required=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-md-offset-4">
                                        <span class="text-danger">{{emailError}}</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-2">
                                            <label>Location</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" ng-model="user.location" required=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-2">
                                            <label>Phone Number</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" ng-model="user.phoneNumber" required=""/>
                                        </div>
                                    </div>
                                </div>
                          
                                <div class="row">
                                    <div class="col-md-12 col-md-offset-4">
                                        <span class="text-danger">{{phoneNumberError}}</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">&nbsp;
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-6 col-md-offset-4">
                                            <button class="btn btn-primary"> Save</button>
                                            <button class="btn btn-primary" ng-click="cancel()"> Cancel</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-md-offset-4">
                                        <span class="text-success ">{{successMessage}}</span> 
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->

