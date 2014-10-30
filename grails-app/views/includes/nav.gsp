<%@ page contentType="text/html;charset=UTF-8" %>{{language}}
    <div id="nav-wrapper" data-ng-controller="NavCtrl">
    <ul id="nav" data-collapse-nav data-slim-scroll data-highlight-active>
        <li><a href="#/dashboard"><i class="fa fa-dashboard"><span class="icon-bg bg-danger"></span></i><span data-i18n="Dashboard"></span> </a></li>
        <li>
            <a href="#/includes"><i class="fa fa-file-text-o"><span class="icon-bg bg-violet"></span></i><span data-i18n="configuration"></span></a>
            <ul>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li><a href="#/app/account"><i class="fa fa-caret-right"></i><span data-i18n="account_creation"></span></a></li>
                </sec:ifAnyGranted>
                <li><a href="#/app/config"><i class="fa fa-caret-right"></i><span data-i18n="configuration"></span></a></li>
                <li><a href="#/app/product"><i class="fa fa-caret-right"></i>Product</a></li>
                <li><a href="#/app/sale"><i class="fa fa-caret-right"></i>Product List</a></li>
            </ul>
        </li>
    </ul>
</div>

<!--        <li>
            <a href="#/ui"><i class="fa fa-magic"><span class="icon-bg bg-orange"></span></i><span data-i18n="ui_kit"></span></a>
            <ul>
                <li><a href="#/ui/buttons"><i class="fa fa-caret-right"></i><span data-i18n="buttons"></span></a></li>
                <li><a href="#/ui/typography"><i class="fa fa-caret-right"></i><span data-i18n="typography"></span></a></li>
                <li><a href="#/ui/widgets"><i class="fa fa-caret-right"></i><span data-i18n="widgets"></span> <span class="badge badge-success">12</span></a></li>
                <li><a href="#/ui/grids"><i class="fa fa-caret-right"></i><span data-i18n="grids"></span></a></li>
                <li><a href="#/ui/icons"><i class="fa fa-caret-right"></i><span data-i18n="icons"></span></a></li>
                <li><a href="#/ui/components"><i class="fa fa-caret-right"></i><span data-i18n="components"></span> <span class="badge badge-info">14</span></a></li>
                <li><a href="#/ui/timeline"><i class="fa fa-caret-right"></i><span data-i18n="time_line"></span></a></li>
            </ul>
        </li>
        <li>
            <a href="#/table"><i class="fa fa-table"><span class="icon-bg bg-warning"></span></i><span data-i18n="Tables"></span></a>
            <ul>
                <li><a href="#/tables/static"><i class="fa fa-caret-right"></i><span data-i18n="static_tables"></span></a></li>
                <li><a href="#/tables/responsive"><i class="fa fa-caret-right"></i><span data-i18n="responsive_tables"></span></a></li>
                <li><a href="#/tables/dynamic"><i class="fa fa-caret-right"></i><span data-i18n="dynamic_tables"></span></a></li>
            </ul>
        </li>
        <li>
            <a href="#/form"><i class="fa fa-pencil"><span class="icon-bg bg-success"></span></i><span data-i18n="Forms"></span></a>
            <ul class="sub-nav">
                <li><a href="#/forms/elements"><i class="fa fa-caret-right"></i><span data-i18n="form_elements"></span> <span class="badge badge-warning">13</span></a></li>
                <li><a href="#/forms/validation"><i class="fa fa-caret-right"></i><span data-i18n="form_validation"></span></a></li>
                <li><a href="#/forms/wizard"><i class="fa fa-caret-right"></i><span data-i18n="form_wizard"></span></a></li>
                <li><a href="#/forms/layouts"><i class="fa fa-caret-right"></i><span data-i18n="form_layouts"></span></a></li>
            </ul>
        </li>
        <li class="nav-task">
            <a href="#/tasks">
                <i class="fa fa-tasks"><span class="icon-bg bg-info"></span></i><span data-i18n="Tasks"></span>
                <span class="badge badge-danger main-badge" data-ng-show="taskRemainingCount > 0">{{taskRemainingCount}}</span>
            </a>
        </li>
        <li>
            <a href="#/charts"><i class="fa fa-bar-chart-o"><span class="icon-bg bg-primary-light"></span></i><span data-i18n="Charts"></span></a>
            <ul>
                <li><a href="#/charts/morris"><i class="fa fa-caret-right"></i><span data-i18n="morris_charts"></span></a></li>
                <li><a href="#/charts/flot"><i class="fa fa-caret-right"></i><span data-i18n="flot_charts"></span></a></li>
                <li><a href="#/charts/others"><i class="fa fa-caret-right"></i><span data-i18n="other_charts"></span></a></li>
            </ul>
        </li>
        <li>
            <a href="#/mail"><i class="fa fa-envelope-o"><span class="icon-bg bg-primary"></span></i><span data-i18n="Mail"></span></a>
            <ul>
                <li><a href="#/mail/inbox"><i class="fa fa-caret-right"></i><span data-i18n="inbox"></span></a></li>
                <li><a href="#/mail/compose"><i class="fa fa-caret-right"></i><span data-i18n="compose"></span></a></li>
                <li><a href="#/mail/single"><i class="fa fa-caret-right"></i><span data-i18n="single_mail"></span></a></li>
            </ul>
        </li>
        <li>
            <a href="#/pages"><i class="fa fa-file-text-o"><span class="icon-bg bg-violet"></span></i><span data-i18n="Pages"></span></a>
            <ul>
                <li><a href="#/pages/signin"><i class="fa fa-caret-right"></i><span data-i18n="sign_in"></span></a></li>
                <li><a href="#/pages/signup"><i class="fa fa-caret-right"></i><span data-i18n="sign_up"></span></a></li>
                <li><a href="#/pages/lock-screen"><i class="fa fa-caret-right"></i><span data-i18n="lock_screen"></span></a></li>
                <li><a href="#/pages/profile"><i class="fa fa-caret-right"></i><span data-i18n="user_profile"></span></a></li>
                <li><a href="#/pages/404"><i class="fa fa-caret-right"></i>404 <span data-i18n="error"></span></a></li>
                <li><a href="#/pages/500"><i class="fa fa-caret-right"></i>500 <span data-i18n="error"></span></a></li>
                <li><a href="#/pages/blank"><i class="fa fa-caret-right"></i><span data-i18n="blank_page"></span></a></li>
                 <li><a href="#/pages/invoice"><i class="fa fa-caret-right"></i><span data-i18n="Invoice"></span></a></li> 
            </ul>
        </li>-->


