angular.module('ChangePassword', [])
    .controller('ChangePasswordController', ['$scope', '$http', function($scope, $http) {
            $scope.password = {};
            $scope.passwordErrors = {};
            $scope.passwordFieldErrors = {};
            $scope.changePassword = function() {
                $http.post("user/checkPassword",
                {   
                    change: $scope.password   
                }       
                ).success(function(data) {
                    if(data.error) {
                         $scope.passwordErrors = data.error; 
                         $scope.password = '';
                    } else {
                        $scope.passwordErrors = {}; 
                    }
                    
                    if(data.fieldErrors) {
                        $scope.passwordFieldErrors = data.fieldErrors; 
                        $scope.password = '';
                    }
                });
            };   
        }
    ]);
    
        


