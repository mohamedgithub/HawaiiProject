angular.module('app.product', ['ngRoute'])
        .controller('productCtrl', ['$scope', '$upload','$http','$location', function($scope,$upload, $http) {
            $scope.product = {};
            $scope.success = '';
            
            $scope.productCreation = function() {
                $upload.http({
                url: 'Product/save', //upload.php script, node.js route, or servlet url
//                data: {product: $scope.product},
                file: file,
                fileFormDataName: "file"
                }).progress(function(evt) {
//                    console.log('percent: ' + parseInt(100.0 * evt.loaded / evt.total));
                }).success(function(data, status, headers, config) {
                    // file is uploaded successfully
                console.log(data);
            });

            };
        }
    ]);
                
                
                
                
                
                
                
                
//                if($scope.newUser.password === $scope.newUser.confirmPassword) {
//                    $http.post("Product/save",{
//                        productDetails: $scope.product
//                        
//                    }).success(function(data) {
//                        if(data === 'success') {
//                            $scope.success = data;
//                            $scope.newUser.name='';
//                            $scope.newUser.password='';
//                            $scope.newUser.email='';
//                            $scope.newUser.phoneNumber='';
//                            $scope.newUser.location='';
//                            $scope.newUser.confirmPassword='';
//                            $scope.emailError ='';
//                            $scope.passwordError='';
//                            $scope.userNameError = "";
//                        } else if(data === 'failed') {
//                            $scope.userNameError = "User Name already Exist";
//                            $scope.emailError ='';
//                            $scope.passwordError='';
//                        } else {
//                            $scope.userNameError = "";
//                            $scope.emailError = 'This Email already exist';
//                            $scope.passwordError='';
//                        }
//                    }); 
//                } else {
//                    $scope.success = '';
//                    $scope.userNameError = "";
//                    $scope.passwordError="Password and Confirm password mismatched";
//                    $scope.emailError ='';
//                }
           

      

