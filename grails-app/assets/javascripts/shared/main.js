(function() {
  'use strict';
  angular.module('app.controllers', []).filter('slug', function ($timeout) {
        return function (val,lang) {
            if(lang === 'EN-US') {
                var values = val.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                    return "$" + values;
            } else if(lang === 'ES-ES'){
                var value = parseFloat(val).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                return "$" + value.replace(/,/g, '.').replace(/.([^.]*)$/, ",$1");
            } else { 
                return parseFloat(val).toFixed(2);
            }
        };       
        }).controller('AppCtrl', [
    '$scope', '$location','$rootScope', function($scope, $location,$rootScope) {        
        $scope.isSpecificPage = function() {
        var path;
        path = $location.path();
        return _.contains(['/404', '/pages/500', '/pages/login', '/pages/signin', '/pages/signin1', '/pages/signin2', '/pages/signup', '/pages/signup1', '/pages/signup2', '/app/lockscreen'], path);
      };
      return $scope.main = {
        brand: 'Capataz',
        name: 'Lisa Doe'
      };
    }
  ]).controller('NavCtrl', [
    '$scope', 'taskStorage', 'filterFilter', function($scope, taskStorage, filterFilter) {
      var tasks;
      tasks = $scope.tasks = taskStorage.get();
      $scope.taskRemainingCount = filterFilter(tasks, {
        completed: false
      }).length;
      return $scope.$on('taskRemaining:changed', function(event, count) {
        return $scope.taskRemainingCount = count;
      });
    }
  ]).controller('DashboardCtrl', ['$scope','$http','$location','$rootScope', function($scope, $http, $location, $rootScope) {
        $scope.profit = [];  
        $http.get("product/getProfit", {
        }).success(function(data) {
            $scope.profit = Math.round(data);
        });  
        $scope.comboChartData = [['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'], ['2014/05', 165, 938, 522, 998, 450, 614.6], ['2014/06', 135, 1120, 599, 1268, 288, 682], ['2014/07', 157, 1167, 587, 807, 397, 623], ['2014/08', 139, 1110, 615, 968, 215, 609.4], ['2014/09', 136, 691, 629, 1026, 366, 569.6]];
        return $scope.salesData = [['Year', 'Sales', 'Expenses'], ['2010', 1000, 400], ['2011', 1170, 460], ['2012', 660, 1120], ['2013', 1030, 540]];
  }]); 
}).call(this);

//# sourceMappingURL=main.js.map
