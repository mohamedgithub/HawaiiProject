<div class="page page-lock" ng-app="app.lockscreen">

    <div class="lock-centered clearfix">
        <div class="lock-container">
            <section class="lock-box">
                <div class="lock-user">{{main.name}}</div>
                <div class="lock-img"><img src="images/g1.jpg" alt=""></div>
                <div class="lock-pwd">
                    <form ng-controller="LockCtrl">
                        <div class="form-group">
                            <input type="password" ng-model="password" ng-minlength="5" placeholder="Password" class="form-control" required="">
                            <a ng-click="checkPassword()" class="btn-submit">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                    </form>
                </div>            
            </section>
        </div>
    </div>
</div>
