angular.module('app.signUp', [])
        .controller('signUpCtrl', ['$scope', '$http','$location', function($scope, $http, $location) {
            $scope.newUser = {};
            $scope.success = '';
            
            $scope.accountCreation = function() {
                if($scope.newUser.password === $scope.newUser.confirmPassword) {
                    $http.post("createUser",{
                        userDetails: $scope.newUser
                    }).success(function(data) {
                        if(data === 'success') {
                            $scope.success = data;
                            $scope.newUser.name='';
                            $scope.newUser.password='';
                            $scope.newUser.email='';
                            $scope.newUser.phoneNumber='';
                            $scope.newUser.location='';
                            $scope.newUser.confirmPassword='';
                            $scope.emailError ='';
                            $scope.passwordError='';
                            $scope.userNameError = "";
                        } else if(data === 'failed') {
                            $scope.userNameError = "User Name already Exist";
                            $scope.emailError ='';
                            $scope.passwordError='';
                        } else {
                            $scope.userNameError = "";
                            $scope.emailError = 'This Email already exist';
                            $scope.passwordError='';
                        }
                    }); 
                } else {
                    $scope.success = '';
                    $scope.userNameError = "";
                    $scope.passwordError="Password and Confirm password mismatched";
                    $scope.emailError ='';
                }
            };

        }]
);


