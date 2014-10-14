angular.module('listExamples', [])
        .controller('ExampleController', ['$scope', '$http', function($scope, $http) {

            var info = [];
        
            $scope.delete = function(index) {
                var del  = confirm("U want to delete ?");
                if(del) {
                    $http.post("includes/deleteItem",{
                        deleteInfo: $scope.userList[index]
                    }).success(function(data) {
                        $scope.userList.splice(index, 1);
                    });
               }
            };

            $scope.showUserList = function() {
                $http.post("includes/show").success(function(data) {
                    $scope.userList = data;
                });
            };

            $scope.showUserList();

            $scope.submitForms = function() {
                $http.post("includes/saveItem",
                        {
                            info: $scope.info
                        }
                ).success(function(data) {
                    alert('Saved successfully');
                    $scope.info = '';
                    $scope.showUserList();
                });
            };
        }
    ]);

