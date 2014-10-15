angular.module('listExamples', [])
        .controller('ConfigCtrl', ['$scope', '$http', function($scope, $http) {

            var info = [];
    
            $scope.delete = function(index) {
                var del  = confirm("U want to delete ?");
                if(del) {
                    $http.post("user/deleteItem",{
                        deleteInfo: $scope.userList[index]
                    }).success(function(data) {
                        $scope.userList.splice(index, 1);
                    });
               }
            };

            $scope.showUserList = function() {
                $http.post("user/show").success(function(data) {
                    $scope.userList = data;
                });
            };

            $scope.showUserList();

            $scope.submitForms = function() {
                $scope.showSaving = true;
                $http.post("user/saveItem",
                        {
                            info: $scope.info
                        }
                ).success(function(data) {
                    $scope.info = '';
                    $scope.showSaving = false;
                    $scope.showUserList();
                });
            };
        }
    ]);

