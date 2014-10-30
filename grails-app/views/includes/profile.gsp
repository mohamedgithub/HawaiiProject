<div class="row" ng-controller="ProfileCtrl">
    <div class="col-md-6">
        <section class="panel panel-default customPanel">
                <div class="panel-heading"><strong><span class="glyphicon glyphicon-th"></span>User Profile</strong></div>
                <div class="panel-body">
                    <form role="form" name="myForm" ng-submit="save()" autocomplete='off'>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4">
                                <span class="text-success" ng-show="success" data-i18n="saved_successfully"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4">
                                <span ng-show="showSaving"><img src="images/loader.png" alt="" class="img-circle img30_30">Saving...</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label> <span data-i18n="user_name"></span></label>
                            <input type="text" name="userName" class="form-control" ng-model="user.userName" required=""  />
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4">
                                <span class="text-danger">{{spaceError}}</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-4">
                                <span class="text-danger">{{nameError}}</span>
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
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Default Language</label>
                                    <select ng-model="user.myLanguage" ng-options="defaultLanguage.name for defaultLanguage in defaultLanguages">                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-8">
                                <button type="submit" class="btn btn-success cancelbtn"><span data-i18n="save"></span></button>&nbsp;
                                <button class="btn btn-primary cancelbtn" ng-click="cancel()"><span data-i18n="cancel"></span></button>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                <label>Image Upload</label>
                                <g:uploadForm name="myUpload" controller="user" action="getImage" >
                                    <input type="file" name="myFile" id="myFile" />
                                    <g:submitButton name="upload" class="save pull-right btn btn-primary" id="imgButton" value="Upload" />
                                </g:uploadForm>
                            </div>
                        </div>
                    </div>
                    <div>
                       <img src="images/{{file}}" alt="" class="img80_80"/>
                    </div>
                </div>
            </section>
    </div>
</div>


<asset:javascript src="Task/ImageUpload.js"/>

