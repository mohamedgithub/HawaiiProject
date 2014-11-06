angular.module('app.account', [])
        .controller('AccountCtrl', ['$scope', '$http', function($scope, $http) {
               
                $scope.newUser = {};
                $scope.showUserList = function() {
                    $http.post("user/showUserList").success(function(data) {
                        $scope.userList = data;
                        $scope.newUser = '';
                    });
                };

                $scope.showUserList();
                
                $scope.accountCreation = function() {
                    $http.post("user/createAccount",
                        {
                            newUser: $scope.newUser
                        }
                    ).success(function(data) {
                        $scope.showUserList();
                    });
                };
                
                $scope.deleteUser = function(index) {
                    var del  = confirm("U want to delete ?");
                    if(del) {
                        $http.post("user/deleteUser",{
                            userId: $scope.userList[index].id
                        }).success(function(data) {
//                            alert("Successfully Deleted");
                            $scope.userList.splice(index, 1);
                        });
                    }
                };
        }
            
    ]);


