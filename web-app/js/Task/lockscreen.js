angular.module('app.lockscreen', [])
    .run(function($rootScope) {
        $rootScope.lockScreen = function(response) {
           
            if(response === false) {
                alert("Wrong Password");
            } else {
                alert("unlock");
            }
        };
    })
        .controller('LockCtrl', ['$scope', '$http','$location','$window','$rootScope', function($scope, $http, $location, $window, $rootScope) {
            $rootScope.lockScreen(false);
            $scope.checkPassword = function() {
                $http.post("includes/checkPassword",
                    {
                        password: $scope.password
                    }
                ).success(function(data) {
                    if(data === 'ok' ) {
                        $rootScope.lockScreen(true); 
                        $window.history.back();
                    } else {
                        $rootScope.lockScreen(false);
                    }
                });
            };
        }
    ]);

