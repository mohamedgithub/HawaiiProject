(function() {
  'use strict';
  angular.module('app.task', ['angularFileUpload']).factory('taskStorage', function() {
    var DEMO_TASKS, STORAGE_ID;
    STORAGE_ID = 'tasks';
    DEMO_TASKS = '[ {"title": "Finish homework", "completed": true}, {"title": "Make a call", "completed": true}, {"title": "Play games with friends", "completed": false}, {"title": "Shopping", "completed": false} ]';
    return {
      get: function() {
        return JSON.parse(localStorage.getItem(STORAGE_ID) || DEMO_TASKS);
      },
      put: function(tasks) {
        return localStorage.setItem(STORAGE_ID, JSON.stringify(tasks));
      }
    };
  }).directive('taskFocus', [
    '$timeout', function($timeout) {
      return {
        link: function(scope, ele, attrs) {
          return scope.$watch(attrs.taskFocus, function(newVal) {
            if (newVal) {
              return $timeout(function() {
                return ele[0].focus();
              }, 0, false);
            }
          });
        }
      };
    }
  ]).controller('taskCtrl', [
    '$scope', 'taskStorage', 'filterFilter', '$rootScope', 'logger', function($scope, taskStorage, filterFilter, $rootScope, logger) {
      var tasks;
      tasks = $scope.tasks = taskStorage.get();
      $scope.newTask = '';
      $scope.remainingCount = filterFilter(tasks, {
        completed: false
      }).length;
      $scope.editedTask = null;
      $scope.statusFilter = {
        completed: false
      };
      $scope.filter = function(filter) {
        switch (filter) {
          case 'all':
            return $scope.statusFilter = '';
          case 'active':
            return $scope.statusFilter = {
              completed: false
            };
          case 'completed':
            return $scope.statusFilter = {
              completed: true
            };
        }
      };
      $scope.add = function() {
        var newTask;
        newTask = $scope.newTask.trim();
        if (newTask.length === 0) {
          return;
        }
        tasks.push({
          title: newTask,
          completed: false
        });
        logger.logSuccess('New task: "' + newTask + '" added');
        taskStorage.put(tasks);
        $scope.newTask = '';
        return $scope.remainingCount++;
      };
      $scope.edit = function(task) {
        return $scope.editedTask = task;
      };
      $scope.doneEditing = function(task) {
        $scope.editedTask = null;
        task.title = task.title.trim();
        if (!task.title) {
          $scope.remove(task);
        } else {
          logger.log('Task updated');
        }
        return taskStorage.put(tasks);
      };
      $scope.remove = function(task) {
        var index;
        $scope.remainingCount -= task.completed ? 0 : 1;
        index = $scope.tasks.indexOf(task);
        $scope.tasks.splice(index, 1);
        taskStorage.put(tasks);
        return logger.logError('Task removed');
      };
      $scope.completed = function(task) {
        $scope.remainingCount += task.completed ? -1 : 1;
        taskStorage.put(tasks);
        if (task.completed) {
          if ($scope.remainingCount > 0) {
            if ($scope.remainingCount === 1) {
              return logger.log('Almost there! Only ' + $scope.remainingCount + ' task left');
            } else {
              return logger.log('Good job! Only ' + $scope.remainingCount + ' tasks left');
            }
          } else {
            return logger.logSuccess('Congrats! All done :)');
          }
        }
      };
      $scope.clearCompleted = function() {
        $scope.tasks = tasks = tasks.filter(function(val) {
          return !val.completed;
        });
        return taskStorage.put(tasks);
      };
      $scope.markAll = function(completed) {
        tasks.forEach(function(task) {
          return task.completed = completed;
        });
        $scope.remainingCount = completed ? 0 : tasks.length;
        taskStorage.put(tasks);
        if (completed) {
          return logger.logSuccess('Congrats! All done :)');
        }
      };
      $scope.$watch('remainingCount == 0', function(val) {
        return $scope.allChecked = val;
      });
      return $scope.$watch('remainingCount', function(newVal, oldVal) {
        return $rootScope.$broadcast('taskRemaining:changed', newVal);
      });
    }
  ]).controller('BuyCtrl', [
    '$scope','$http','$location','$rootScope','$timeout',function($scope, $http, $location, $rootScope, $timeout) {
        $scope.product = $rootScope.product;  
        $scope.user = [];
        $scope.checkOrder = function() {
            $http.post("product/checkOrder", {
                productDetails:$scope.product,
                user:$scope.user.quantity
            }).success(function(data) {
                $scope.success = data;
                $timeout(function() {
                    $location.path('/app/sale');
                        }, 3000);
            });
        };         
    }
  ]).controller('ReportCtrl', [
    '$scope','$http','$location','$rootScope','$timeout',function($scope, $http, $location, $rootScope, $timeout) {
        $scope.purchaseReport = [];
        $http.get("product/getReport", {
        }).success(function(data) {
           $scope.purchaseReport = data;
        });   
    }
]).controller('ListCtrl', [
    '$scope','$http','$location','$rootScope',function($scope, $http, $location, $rootScope) {
         $scope.products = [];
         $scope.product = [];
         $scope.Listproduct = [];
        $http.get("product/list", {
            }).success(function(data) {
                $scope.products = data;
            });
            
        $scope.deleteProduct = function(index) {
            var deleteProduct = confirm("Do you want to delete ?");
                if(deleteProduct) {
                    $http.post("product/deleteProduct", {
                        productDetails:$scope.products[index]
                    }).success(function(data) {
                    if(data === 'deleted') {
                        $scope.products.splice(index, 1);
                    }
                }); 
            }
        };
        
        $scope.editProduct = function(index) {
            $http.post("product/editProduct", {
                productDetails:$scope.products[index]
            }).success(function(data) {
                $location.path('/app/edit');        
                $rootScope.Listproduct = data;
            });  
        };
        
        $scope.buyProduct = function(index) {
            $http.post("product/buyProduct", {
                productDetails:$scope.products[index]
            }).success(function(data) {
                $location.path('/app/buy');
                $rootScope.product = data;
            });
        };
        
        $http.get("product/getProduct", {
        }).success(function(data) {
           $scope.products = data;
        }); 
    }]).controller('EditController', ['$scope','$http','$location','$rootScope', '$upload','$timeout',function($scope, $http, $location, $rootScope, $upload,$timeout) {
        $scope.products = {};
        $scope.hide = true;
        $scope.products = $rootScope.Listproduct;
        $scope.update = function() {
            var cost = $scope.products.costPrice;    
            var sell = $scope.products.sellingPrice;
            var patt = /^\d*(?:\.\d{0,2}){0,1}$/;
            var validCost = patt.test(cost);
            var validSell = patt.test(sell);
            if (validCost ===  false) {
                $scope.costFormatError = "Enter valid currrency format";
                $scope.costError = '';
                $scope.success = '';
                $scope.sellFormatError ='';
                $scope.productNameError = '';
            } else if(validSell === false) {
                $scope.sellFormatError = "Enter valid currrency format";
                $scope.costError = '';
                $scope.success = '';
                $scope.costFormatError ='';
                $scope.productNameError = '';
            } else {
                $http.post("product/update",{
                    productId: $scope.products
                }).success(function(data) {
                    if(data === "Product already Exist") {
                        $scope.productNameError = data;
                        $scope.costError = '';
                        $scope.success = '';
                        $scope.costFormatError ='';
                        $scope.sellFormatError ='';
                    } else if(data === 'Selling price must be greater then cost price') {
                        $scope.costError = data;
                        $scope.productNameError = '';
                        $scope.success = '';
                        $scope.costFormatError ='';
                        $scope.sellFormatError ='';
                    } else {
                        $scope.success = data;
                        $scope.costError = '';
                        $scope.productNameError = '';
                        $scope.costFormatError ='';
                        $scope.sellFormatError ='';
                        $timeout(function() {
                        $location.path('/app/product');
                        }, 2000);
                    }
                });
            }
        };
        
        $scope.onFileSelect = function($files) {
        var file = $files;
        $scope.upload = function() {
                $scope.upload = $upload.upload({
                url: 'product/upload',
                file: file,
                fileFormDataName: "myFile",
                data:$scope.products
                }).success(function(data) {
                });
            };
        };
    }]).controller('AddProductController', ['$scope','$http','$location','$rootScope','$upload','$timeout',function($scope, $http, $location, $rootScope, $upload, $timeout) {
            $scope.onFileSelect = function($files) {
            var file = $files;
                $scope.save = function() {
                var cost = $scope.product.costPrice;    
                var sell = $scope.product.sellingPrice;    
                var validCost = cost.match(/^\d*(?:\.\d{0,2}){0,1}$/); 
                var validSell = sell.match(/^\d*(?:\.\d{0,2}){0,1}$/);
                if (!validCost) {
                    $scope.costFormatError = "Enter valid currrency format";
                    $scope.costError = '';
                    $scope.success = '';
                    $scope.sellFormatError ='';
                    $scope.productNameError = '';
                } else if(!validSell) {
                    $scope.sellFormatError = "Enter valid currrency format";
                    $scope.costError = '';
                    $scope.success = '';
                    $scope.costFormatError ='';
                    $scope.productNameError = '';
                } else {
                    $scope.upload = $upload.upload({
                    url: 'product/save',
                    file: file,
                    fileFormDataName: "myFile",
                    data:$scope.product
                    }).success(function(data) {
                        if(data === "Product already Exist") {
                            $scope.productNameError = data;
                            $scope.costError = '';
                            $scope.success = '';
                            $scope.costFormatError ='';
                            $scope.sellFormatError ='';
                        } else if(data === 'Selling price must be greater then cost price') {
                            $scope.costError = data;
                            $scope.productNameError = '';
                            $scope.success = '';
                            $scope.costFormatError ='';
                            $scope.sellFormatError ='';
                        } else if(data === 'Your product added successfully') {
                            $scope.success = data;
                            $scope.costError = '';
                            $scope.productNameError = '';
                            $scope.costFormatError ='';
                            $scope.sellFormatError ='';
                            $timeout(function() {
                                $location.path('/app/product');
                            }, 2000);
                        } 
                    }); 
                }
            };
        };
    }]);
}).call(this);
