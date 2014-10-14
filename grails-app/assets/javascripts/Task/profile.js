//angular.module('app.profile', [])
//        .controller('ProfileCtrl', ['$scope', '$http', function($scope, $http) {
//            $scope.showUserName = function() {
//                $http.post("user/getCurrentUserName").success(function(data) {
//                    $scope.userName = data;
//                });
//            };
//            $scope.showUserName();
//            $scope.save = function() {
//                var patt = new RegExp("^\S[a-zA-Z]+\S$");
//                
//                if(patt.test($scope.userName) === true) {
//                    $http.post("user/editProfile",{
//                        userName: $scope.userName
//                    }).success(function(data) {
//                        if(data === "Denied") {
//                            alert("This name already Exist");
//                        } else {
//                            $scope.userName = data;
//                        }
//                    });
//                    
//                } else {
//                    alert("Enter Valid Name");
//                }
//            };
//               
//        }
//]);


