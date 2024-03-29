

<header class="clearfix" data-ng-controller="LangCtrl">
    <div data-ng-if="language == '_ar'">
        <asset:stylesheet src="main_ar.css"/>
    </div>
    <div data-ng-if="language != '_ar'">
        <asset:stylesheet src="main.css"/>
    </div>
    <a href="#/" data-toggle-min-nav class="toggle-min"><i class="fa fa-bars"></i></a>
    
    <!-- Logo -->
    <div class="logo">
        <a href="#/">
            <span><span data-i18n="main_title"></span></span>
        </a>
    </div>

    <!-- needs to be put after logo to make it working-->
    <div class="menu-button" toggle-off-canvas>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>

    <div class="top-nav">
        <ul class="nav-left list-unstyled">
            <li class="dropdown">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-comment-o"></i>
                    <span class="badge badge-success">2</span>
                </a>
                <div class="dropdown-menu with-arrow panel panel-default">
                    <div class="panel-heading">
                        You have 2 messages.
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="javascript:;" class="media">
                                <span class="pull-left media-icon">
                                    <span class="round-icon sm bg-info"><i class="fa fa-comment-o"></i></span>
                                </span>
                                <div class="media-body">
                                    <span class="block">Jane sent you a message</span>
                                    <span class="text-muted">3 hours ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="javascript:;" class="media">
                                <span class="pull-left media-icon">
                                    <span class="round-icon sm bg-danger"><i class="fa fa-comment-o"></i></span>
                                </span>
                                <div class="media-body">
                                    <span class="block">Lynda sent you a mail</span>
                                    <span class="text-muted">9 hours ago</span>
                                </div>
                            </a>
                        </li>                       
                    </ul>
                    <div class="panel-footer">
                        <a href="javascript:;">Show all messages.</a>
                    </div>
                </div>
            </li>
            <li class="dropdown">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge badge-info">3</span>
                </a>
                <div class="dropdown-menu with-arrow panel panel-default">
                    <div class="panel-heading">
                        You have 3 mails.
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="javascript:;" class="media">
                                <span class="pull-left media-icon">
                                    <span class="round-icon sm bg-warning"><i class="fa fa-envelope-o"></i></span>
                                </span>
                                <div class="media-body">
                                    <span class="block">Lisa sent you a mail</span>
                                    <span class="text-muted block">2min ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="javascript:;" class="media">
                                <span class="pull-left media-icon">
                                    <span class="round-icon sm bg-info"><i class="fa fa-envelope-o"></i></span>
                                </span>
                                <div class="media-body">
                                    <span class="block">Jane sent you a mail</span>
                                    <span class="text-muted">3 hours ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="javascript:;" class="media">
                                <span class="pull-left media-icon">
                                    <span class="round-icon sm bg-success"><i class="fa fa-envelope-o"></i></span>
                                </span>
                                <div class="media-body">
                                    <span class="block">Lynda sent you a mail</span>
                                    <span class="text-muted">9 hours ago</span>
                                </div>
                            </a>
                        </li>                       
                    </ul>
                    <div class="panel-footer">
                        <a href="javascript:;">Show all mails.</a>
                    </div>
                </div>
            </li>
            <li class="dropdown">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bell-o nav-icon"></i>
                    <span class="badge badge-warning">3</span>
                </a>
                <div class="dropdown-menu with-arrow panel panel-default">
                    <div class="panel-heading">
                        You have 3 notifications.
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="javascript:;" class="media">
                                <span class="pull-left media-icon">
                                    <span class="round-icon sm bg-success"><i class="fa fa-bell-o"></i></span>
                                </span>
                                <div class="media-body">
                                    <span class="block">New tasks needs to be done</span>
                                    <span class="text-muted block">2min ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="javascript:;" class="media">
                                <span class="pull-left media-icon">
                                    <span class="round-icon sm bg-info"><i class="fa fa-bell-o"></i></span>
                                </span>
                                <div class="media-body">
                                    <span class="block">Change your password</span>
                                    <span class="text-muted">3 hours ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="javascript:;" class="media">
                                <span class="pull-left media-icon">
                                    <span class="round-icon sm bg-danger"><i class="fa fa-bell-o"></i></span>
                                </span>
                                <div class="media-body">
                                    <span class="block">New feature added</span>
                                    <span class="text-muted">9 hours ago</span>
                                </div>
                            </a>
                        </li>                       
                    </ul>
                    <div class="panel-footer">
                        <a href="javascript:;">Show all notifications.</a>
                    </div>
                </div>
            </li>
        </ul>

        <ul class="nav-right pull-right list-unstyled">
            <li class="dropdown langs text-normal" >
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    {{lang}}
                </a>
                <ul class="dropdown-menu with-arrow pull-right list-langs" role="menu">
                    <li><a href="javascript:;" data-ng-click="setLang('English')"> <div class="flag flags-american"></div> English</a></li>
                    <li><a href="javascript:;" data-ng-click="setLang('Spanish')"> <div class="flag flags-spain"></div> Spanish</a></li>
                    <li><a href="javascript:;" data-ng-click="setLang('Arab')"> <div class="flag flags-american"></div> Arab</a></li>
<!--                    <li data-ng-show="lang !== 'English' ">
                        <a href="javascript:;" data-ng-click="setLang('English')"><div class="flag flags-american"></div> English</a></li>
                    <li data-ng-show="lang !== 'Español' ">
                        <a href="javascript:;" data-ng-click="setLang('Español')"><div class="flag flags-spain"></div> Español</a></li>
                    <li data-ng-show="lang !== '日本語' ">
                        <a href="javascript:;" data-ng-click="setLang('日本語')"><div class="flag flags-japan"></div> 日本語</a></li>-->
                </ul>
            </li>
<!--             <li class="dropdown">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="fa fa-magic nav-icon"></span>
                </a>
                <ul class="dropdown-menu pull-right color-switch" data-ui-color-switch>
                    <li><a href="javascript:;" class="color-option color-some_color" data-style="some_color"></a></li>
                </ul>
            </li> -->
            <li class="dropdown text-normal nav-profile">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <img src="images/{{file}}" alt="" class="img-circle img30_30">
                    <span class="hidden-xs headName">
                        <span>{{headName}}</span>
                    </span>
                </a>
                <ul class="dropdown-menu with-arrow pull-right">
                    <li>
                        <a href="#/user/profile">
                            <i class="fa fa-user"></i>
                            <span data-i18n="my_profile"></span>
                        </a>
                    </li>
                    <li>
                        <a href="#/app/changePassword">
                            <i class="fa fa-lock"></i>
                            <span data-i18n="change_password"></span>
                        </a>
                    </li>
                    <li>
                        <a href="#/tasks">
                            <i class="fa fa-check"></i>
                            <span data-i18n="my_tasks"></span>
                        </a>
                    </li>
                    <li>
                        <a href="#/app/lockscreen">
                            <i class="fa fa-lock"></i>
                            <span data-i18n="lock_screen"></span>
                        </a>
                    </li>
                    <li>
                        <g:link class="logout" controller="logout"> <i class="fa fa-sign-out"></i><span data-i18n="log_out"></span></g:link>
                    </li>
                </ul>
            </li>
        </ul>        
    </div>
</header>