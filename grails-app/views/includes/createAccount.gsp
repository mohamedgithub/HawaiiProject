<div class="page-signup" data-ng-app="app.account">
    <div class="signup-body" ng-controller="AccountCtrl">
<!--        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="col-md-offset-5">Create An Account</div> 
                    </div>
                </div>
            </div>
        </div>-->
        <div class="container">
            <div class="form-container">
                <section>
                    <form class="form-horizontal" ng-submit="accountCreation()">
                        <div class="form-group">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                                <input  type="text" class="form-control" placeholder="User name" ng-model="newUser.name" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                </span>
                                <input type="password" class="form-control" placeholder="Password" ng-model="newUser.password" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="divider"></div>
                            <button type="submit" class="btn btn-primary btn-block btn-lg"><span data-i18n="Create_an_account"></span></button>
                        </div>
                    </form>
                </section>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12"></div>    
        </div>
        <div class="panel panel-primary" data-ng-show="userList.length > 0">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-3"><span data-i18n="Name"></span></div>
                    <div class="col-md-3"><span data-i18n="Role"></span></div>
                    <div class="col-md-3"><span data-i18n="Action"></span></div>
                </div>
            </div>
            <div class="panel-body">
                <div class="row" ng-repeat="user in userList">
                    <div class="col-md-3">{{user.username}}</div>
                    <div class="col-md-3">User</div>
                    <div class="col-md-3">
                        <button class="btn btn-primary" ng-click="deleteUser($index)">Delete </button>
                    </div>
                    
<!--                    <div class="col-md-4">{{user.password}}</div>-->
<!--                    <div class="col-md-2">
                        <button class="btn btn-primary" ng-click="delete($index)">Delete </button>
                    </div>-->
                    <hr>
                </div>
            </div>
        </div>
    </div>
</div>