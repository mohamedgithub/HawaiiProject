(function() {
  'use strict';
  angular.module('app', ['ngRoute', 'ngAnimate','ui.bootstrap', 'easypiechart', 'mgo-angular-wizard', 'textAngular', 'app.ui.ctrls', 'app.ui.directives', 'app.ui.services', 'app.controllers', 'app.directives', 'app.form.validation', 'app.ui.form.ctrls', 'app.ui.form.directives', 'app.tables', 'app.task', 'app.localization', 'app.chart.ctrls', 'app.chart.directives','listExamples','app.account','app.lockscreen']).config([
    '$routeProvider', function($routeProvider) {
      return $routeProvider.when('/', {
        redirectTo: '/dashboard'
      }).when('/dashboard', {
        templateUrl: 'includes/dashboard'
      }).when('/ui/typography', {
        templateUrl: 'views/ui/typography.html'
      }).when('/ui/buttons', {
        templateUrl: 'views/ui/buttons.html'
      }).when('/ui/icons', {
        templateUrl: 'views/ui/icons.html'
      }).when('/ui/grids', {
        templateUrl: 'views/ui/grids.html'
      }).when('/ui/widgets', {
        templateUrl: 'views/ui/widgets.html'
      }).when('/ui/components', {
        templateUrl: 'views/ui/components.html'
      }).when('/ui/timeline', {
        templateUrl: 'views/ui/timeline.html'
      }).when('/forms/elements', {
        templateUrl: 'views/forms/elements.html'
      }).when('/forms/layouts', {
        templateUrl: 'views/forms/layouts.html'
      }).when('/forms/validation', {
        templateUrl: 'views/forms/validation.html'
      }).when('/forms/wizard', {
        templateUrl: 'views/forms/wizard.html'
      }).when('/tables/static', {
        templateUrl: 'views/tables/static.html'
      }).when('/tables/responsive', {
        templateUrl: 'views/tables/responsive.html'
      }).when('/tables/dynamic', {
        templateUrl: 'views/tables/dynamic.html'
      }).when('/charts/others', {
        templateUrl: 'views/charts/charts.html'
      }).when('/charts/morris', {
        templateUrl: 'views/charts/morris.html'
      }).when('/charts/flot', {
        templateUrl: 'views/charts/flot.html'
      }).when('/mail/inbox', {
        templateUrl: 'views/mail/inbox.html'
      }).when('/mail/compose', {
        templateUrl: 'views/mail/compose.html'
      }).when('/mail/single', {
        templateUrl: 'views/mail/single.html'
      }).when('/pages/features', {
        templateUrl: 'views/pages/features.html'
      }).when('/pages/signin', {
        templateUrl: 'views/pages/signin.html'
      }).when('/pages/signup', {
        templateUrl: 'views/pages/signup.html'
      }).when('/app/lockscreen', {
        templateUrl: 'includes/lockscreen'
      }).when('/user/profile', {
        templateUrl: 'includes/showProfile'
      }).when('/404', {
        templateUrl: 'views/pages/404.html'
      }).when('/pages/500', {
        templateUrl: 'views/pages/500.html'
      }).when('/pages/blank', {
        templateUrl: 'views/pages/blank.html'
      }).when('/pages/invoice', {
        templateUrl: 'views/pages/invoice.html'
      }).when('/tasks', {
        templateUrl: 'views/tasks/tasks.html'
      }).when('/app/config', {
        templateUrl: 'includes/config'
      }).when('/app/account', {
        templateUrl: 'includes/account'
      }).otherwise({
        redirectTo: '/404'
      });
    }
  ]);

}).call(this);