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
    ])

            .controller('CustomerCtrl', [
                '$scope', '$http', '$location', '$rootScope', '$timeout', 'logger', function($scope, $http, $location, $rootScope, $timeout, logger) {
                    $scope.customer = {};
                    $scope.editCustomer = {};
                    $scope.customers = [];
                    
                    $scope.save = function() {
                        var patt = /^\d{10}$/;
                        var customerPhoneNumber = patt.test($scope.customer.customerPhoneNumber);
                        var guarantorPhoneNumber = patt.test($scope.customer.guarantorPhoneNumber);
                        if (customerPhoneNumber === false) {
                            logger.logError("Enter valid customer phone number");
                        } else if(guarantorPhoneNumber === false) {
                            logger.logError("Enter valid guarantor phone number");
                        }  else if($scope.customer.customerPhoneNumber === $scope.customer.guarantorPhoneNumber) {
                            logger.logError("customer and guarantor phone number should n't be same");
                        } else {
                            $http.post("customer/saveCustomer", {
                                customer: $scope.customer
                            }).success(function(data) {
                                if (data === "Success") {
                                    logger.logSuccess("Customer created successfully");
                                    $scope.customer = "";
                                } else if (data === "Failed") {
                                    logger.logError("Customer already exist");
                                }
                            });
                        }
                    };
                    
                    $http.get("customer/listCustomer", {
                    }).success(function(data) {
                        $scope.customers = data;
                    });
                    
                    $scope.showCustomer = function(index) {
                        $http.post("customer/showCustomer/", {
                                showId: $scope.customers[index].id
                            }).success(function(data) {
                                $rootScope.customer = data;
                                $location.path('/app/showCustomer');
                            })
                    };
                    
                    $scope.deleteCustomer = function(index) {
                        var deleteCustomer = confirm("Do you want to delete ?");
                        if (deleteCustomer) {
                            $http.post("customer/deleteCustomer/", {
                                deleteId: $scope.customers[index]
                            }).success(function(data) {
                                if (data === 'deleted') {
                                    $scope.customers.splice(index, 1);
                                    logger.logSuccess("Customer deleted successfully");
                                }
                            });
                        }
                    };
                    
                    $scope.editCustomer = function(index) {
                        $http.post("customer/editCustomer", {
                            editId: $scope.customers[index].id
                        }).success(function(data) {
                            $rootScope.editCustomer = data;
                            $location.path('/app/editCustomer');
                        });
                    };
                }])
            
                .controller('showCustomerDetailCtrl', [
                '$scope', '$http', '$location', '$rootScope', '$timeout', 'logger', function($scope, $http, $location, $rootScope, $timeout, logger) {
                   
                   $scope.showCustomer = {} 
                    $scope.showCustomer.customerName = $rootScope.customer.customerName;
                    $scope.showCustomer.guarantorName = $rootScope.customer.guarantorName;
                    $scope.showCustomer.customerPhoneNumber = Number($rootScope.customer.customerPhoneNumber);
                    $scope.showCustomer.guarantorPhoneNumber = Number($rootScope.customer.guarantorPhoneNumber);
                    $scope.showCustomer.customerAmount = $rootScope.customer.amount;
                    $scope.showCustomer.guarantorAddress = $rootScope.customer.guarantorAddress;
                    $scope.showCustomer.customerInterestAmount = $rootScope.customer.interest;
                    $scope.showCustomer.customerAddress = $rootScope.customer.customerAddress;
                    $scope.showCustomer.paidAmount = $rootScope.customer.paidAmount;
                    $scope.showCustomer.outStandingAmount = $rootScope.customer.outStandingAmount;
                
                }]) 

                .controller('EditCustomerDetailCtrl', [
                '$scope', '$http', '$location', '$rootScope', '$timeout', 'logger', function($scope, $http, $location, $rootScope, $timeout, logger) {
                    $scope.customer = {}      
                    
                    $scope.customer.customerName = $rootScope.editCustomer.customerName;
                    $scope.customer.guarantorName = $rootScope.editCustomer.guarantorName;
                    $scope.customer.customerPhoneNumber = Number($rootScope.editCustomer.customerPhoneNumber);
                    $scope.customer.guarantorPhoneNumber = Number($rootScope.editCustomer.guarantorPhoneNumber);
                    $scope.customer.customerAmount = $rootScope.editCustomer.amount;
                    $scope.customer.guarantorAddress = $rootScope.editCustomer.guarantorAddress;
                    $scope.customer.customerInterestAmount = $rootScope.editCustomer.interest;
                    $scope.customer.customerAddress = $rootScope.editCustomer.customerAddress;
                    $scope.customer.id = $rootScope.editCustomer.id;
                    
                    $scope.updateCustomer = function() {
                        var patt = /^\d{10}$/;
                        var customerPhoneNumber = patt.test($scope.customer.customerPhoneNumber);
                        var guarantorPhoneNumber = patt.test($scope.customer.guarantorPhoneNumber);
                        if (customerPhoneNumber === false) {
                            logger.logError("Enter valid customer phone number");
                        } else if(guarantorPhoneNumber === false) {
                            logger.logError("Enter valid guarantor phone number");
                        }  else if($scope.customer.customerPhoneNumber === $scope.customer.guarantorPhoneNumber) {
                            logger.logError("customer and guarantor phone number should n't be same");
                        } else {
                            $http.post("customer/updateCustomer", {
                                customer: $scope.customer
                            }).success(function(data) {
                                if (data === "Success") {
                                    logger.logSuccess("Customer updated successfully");
                                    $timeout(function() {
                                            $location.path('/app/listCustomer');
                                        }, 2000);
                                    $scope.customer = "";
                                } else if (data === "Failed") {
                                    logger.logError("Customer phone number exist");
                                }
                            });
                        }
                    };
                }])
            
            .controller('CustomerPaymentCtrl', [
                '$scope', '$http', '$location', '$rootScope', '$timeout','logger', function($scope, $http, $location, $rootScope, $timeout, logger) {
                  $scope.getCustomer = function() {
                    
                      var patt = /^\d{10}$/;
                        var customerPhoneNumber = patt.test($scope.customer.phoneNumber);
                        if (customerPhoneNumber === false) {
                            logger.logError("Enter valid customer phone number");
                        } else {
                            $http.post("customer/getCustomer", {
                                phoneNumber: $scope.customer.phoneNumber
                            }).success(function(data) {
                                $scope.customer = data;
                            });
                        }
                  };
                  
                  $scope.savePayment = function() {
                        $http.post("customer/savePayment", {
                            customerPayment: $scope.customer
                        }).success(function(data) {
                            $rootScope.editCustomer = data;
                            $location.path('/app/editCustomer');
                        });
                    };
                  
            }])
            
            
            
            
            
            
            
            
            
            
            //Hotel ManageMent   
            .controller('Createhotel', [
                '$scope', '$http', '$location', '$rootScope', '$timeout', function($scope, $http, $location, $rootScope, $timeout) {
                    $scope.countries = ['America', 'Australia', 'India'];
                    $scope.countries = {
                        'America':
                                ['San Francisco', 'Los Angeles'],
                        'Australia':
                                ['Sydney', 'Melbourn'],
                        'India':
                                ['Mumbai', 'Chennai']
                    };
                    $scope.hotelDetails = {};
                    $scope.hotelDetail = [];

                    $scope.save = function() {
                        if (angular.isUndefined($scope.rowIndex) || $scope.rowIndex === '') {
                            angular.forEach($scope.countries, function(value, key) {
                                if (value === $scope.cities) {
                                    $scope.hotelDetails.countryName = key;
                                }
                            });
                            angular.forEach($scope.cities, function(value, key) {
                                if (value === $scope.suburbs) {
                                    $scope.hotelDetails.cityName = value;
                                }
                            });
                            var patt = /^\d{10}$/;
                            var result = patt.test($scope.hotelDetails.phoneNumber);
                            if (result === false) {
                                $scope.phoneNumberError = 'Enter valid phone number';
                            } else {
                                $scope.phoneNumberError = '';
                                $scope.hotelDetail.push($scope.hotelDetails);
                                $scope.hotelDetails = {};
                            }
                        } else {
                            var patt = /^\d{10}$/;
                            var result = patt.test($scope.hotelDetails.phoneNumber);
                            if (result === false) {
                                $scope.phoneNumberError = 'Enter valid phone number';
                            } else {
                                angular.forEach($scope.countries, function(value, key) {
                                    if (value === $scope.cities) {
                                        $scope.hotelDetails.countryName = key;
                                    }
                                });
                                angular.forEach($scope.cities, function(value, key) {
                                    if (value === $scope.suburbs) {
                                        $scope.hotelDetails.cityName = value;
                                    }
                                });
                                $scope.phoneNumberError = '';
                                $scope.hotelDetail[$scope.rowIndex] = angular.copy($scope.hotelDetails);
                                $scope.rowIndex = '';

                                $scope.hotelDetails = {};
                            }
                        }
                    };
                    $scope.deleteHotel = function(index) {
                        var deleteHotel = confirm("Do you want to delete ?");
                        if (deleteHotel) {
                            $scope.hotelDetail.splice(index, 1);
                        }
                    };
                    $scope.editHotel = function(index, hotel) {
                        $scope.rowIndex = index;
                        $scope.hotelDetails = angular.copy(hotel);
                    };

                    $scope.listObj = []
                    $scope.addPersonDetails = function() {
                        $scope.listObj.push($scope.newObj)
                        $scope.newObj = '';
                    }
                }
            ])
// Create Room Price     
            .controller('CreateRoomPriceCtrl', [
                '$scope', '$http', '$location', '$rootScope', '$timeout', function($scope, $http, $location, $rootScope, $timeout) {

                    $scope.save = function() {
                        console.log($scope.CreateRoomPrice)
                    }


                }])


// Create Food Price
            .controller('CreateFoodPriceCtrl', ['$scope', '$http', '$location', '$rootScope', '$timeout', function($scope, $http, $location, $rootScope, $timeout) {

                }])

            .controller('BuyCtrl', [
                '$scope', '$http', '$location', '$rootScope', '$timeout', function($scope, $http, $location, $rootScope, $timeout) {
                    $scope.product = $rootScope.product;
                    $scope.user = [];
                    $scope.checkOrder = function() {
                        $http.post("product/checkOrder", {
                            productDetails: $scope.product,
                            user: $scope.user.quantity
                        }).success(function(data) {
                            $scope.success = data;
                            $timeout(function() {
                                $location.path('/app/sale');
                            }, 3000);
                        });
                    };
                }
            ]).controller('ReportCtrl', [
        '$scope', '$http', '$location', '$rootScope', '$timeout', function($scope, $http, $location, $rootScope, $timeout) {
            $scope.purchaseReport = [];
            $http.get("product/getReport", {
            }).success(function(data) {

            });
        }]).
            controller('HotelBooking', [
                '$scope', '$http', '$location', '$rootScope', '$timeout', function($scope, $http, $location, $rootScope, $timeout) {
                    $scope.roomTypes = [];
                    $scope.views = [];
                    $scope.seasonTimes = [];
                    $scope.days = [];
                    $http.get("product/getDetails", {
                    }).success(function(data) {
                        $scope.roomTypes = data.roomTypes;
                        $scope.views = data.views;
                        $scope.seasonTimes = data.seasonTimes;
                        $scope.days = data.days;
                    });
                    $scope.save = function() {
                        if ($scope.roomDetails.roomPrice <= 1) {
                            $scope.zeroCostFormatError = "Enter valid currrency format";
                            $scope.costFormatError = "";
                            $scope.success = '';
                            $scope.roomExistError = '';
                            $scope.errors = '';
                        } else {
                            var cost = $scope.roomDetails.roomPrice;
                            var patt = /^\d*(?:\.\d{0,2}){0,1}$/;
                            var validroomPrice = patt.test(cost);
                            if (validroomPrice === false) {
                                $scope.costFormatError = "Enter valid currrency format";
                                $scope.success = '';
                                $scope.roomExistError = '';
                                $scope.zeroCostFormatError = "";
                                $scope.errors = '';
                            } else {
                                $http.post("product/roomSave", {
                                    saveRoomDetails: $scope.roomDetails
                                }).success(function(data) {
                                    if (data.error) {
                                        $scope.roomExistError = '';
                                        $scope.costFormatError = '';
                                        $scope.success = '';
                                        $scope.zeroCostFormatError = "";
                                        $scope.errors = data.error;
                                    }
                                    if (data === "Exist") {
                                        $scope.roomExistError = 'Your selected room already exist';
                                        $scope.costFormatError = '';
                                        $scope.success = '';
                                        $scope.zeroCostFormatError = "";
                                        $scope.errors = '';
                                    }
                                    if (data === "Success") {
                                        $scope.costFormatError = '';
                                        $scope.roomExistError = '';
                                        $scope.zeroCostFormatError = "";
                                        $scope.success = 'Your selected room added successfully';
                                        $scope.errors = '';
//                    $timeout(function() {
//                    $location.path('/app/roomList');
//                    }, 3000);
                                    }
                                });
                            }
                            ;
                        }
                    };
             }]).
            controller('SeasonCtrl', [
                '$scope', '$http', '$location', '$rootScope', '$timeout', function($scope, $http, $location, $rootScope, $timeout) {

                    $http.get("product/getDetails", {
                    }).success(function(data) {
                        $scope.days = data.days;
                    });

                    $http.get("product/getSeasonDetails", {
                    }).success(function(data) {
                        $scope.seasonDetails = data;
                    });

                    $scope.deleteSeason = function(index) {
                        var deleteSeason = confirm("Do you want to delete ?");
                        if (deleteSeason) {
                            $http.post("product/deleteSeason", {
                                deleteId: $scope.seasonDetails[index]
                            }).success(function(data) {
                                if (data === 'deleted') {
                                    $scope.seasonDetails.splice(index, 1);
                                }
                            });
                        }
                    };

                    $scope.editSeason = function(index) {
                        $http.post("product/editSeason", {
                            editId: $scope.seasonDetails[index]
                        }).success(function(data) {
                            $rootScope.editSeason = data;
                            $location.path('/app/editSeason');
                        });
                    };
                    $scope.save = function() {
                        if (Date.parse($scope.season.endDate) < Date.parse($scope.season.startDate)) {
                            $scope.dateError = 'Invalid end date';
                            $scope.seasonExistError = '';
                            $scope.success = '';
                            $scope.nameError = '';
                        } else {
                            var startDate = new Date($scope.season.startDate),
                                    m1 = ("0" + (startDate.getMonth() + 1)).slice(-2),
                                    day1 = ("0" + startDate.getDate()).slice(-2);

                            var endDate = new Date($scope.season.endDate),
                                    m2 = ("0" + (endDate.getMonth() + 1)).slice(-2),
                                    day2 = ("0" + endDate.getDate()).slice(-2);
                            $scope.startDate = [startDate.getFullYear(), m1, day1].join("/");
                            $scope.endDate = [endDate.getFullYear(), m2, day2].join("/");
                            $http.post("product/saveSeason", {
                                saveSeasonDetails: $scope.season,
                                startDate: $scope.startDate,
                                endDate: $scope.endDate
                            }).success(function(data) {
                                if (data === 'Exist') {
                                    $scope.nameError = 'Name already exist';
                                    $scope.dateError = '';
                                    $scope.success = '';
                                }
                                if (data === 'Success') {
                                    $scope.success = 'Your selected season created successfully';
                                    $scope.dateError = '';
                                    $scope.nameError = '';
                                    $http.get("product/getSeasonDetails", {
                                    }).success(function(data) {
                                        $scope.seasonDetails = data;
                                    });
                                }
                                if (data === 'Date Exist') {
                                    alert(data);
                                }
                            });
                        }
                    };
                }]).
            controller('EditSeasonCtrl', ['$scope', '$http', '$location', '$rootScope', '$timeout', function($scope, $http, $location, $rootScope, $timeout) {

                    $scope.season = {};
                    $scope.season.id = $rootScope.editSeason.id;
                    $scope.season.name = $rootScope.editSeason.seasonType;
                    $scope.season.startDate = $rootScope.editSeason.startdate;
                    $scope.season.endDate = $rootScope.editSeason.enddate;

                    $scope.update = function() {
                        if (Date.parse($scope.season.endDate) < Date.parse($scope.season.startDate)) {
                            $scope.dateError = 'Invalid end date';
                            $scope.seasonExistError = '';
                            $scope.success = '';
                            $scope.nameError = '';
                        } else {
                            var startDate = new Date($scope.season.startDate),
                                    m1 = ("0" + (startDate.getMonth() + 1)).slice(-2),
                                    day1 = ("0" + startDate.getDate()).slice(-2);

                            var endDate = new Date($scope.season.endDate),
                                    m2 = ("0" + (endDate.getMonth() + 1)).slice(-2),
                                    day2 = ("0" + endDate.getDate()).slice(-2);
                            $scope.startDate = [startDate.getFullYear(), m1, day1].join("/");
                            $scope.endDate = [endDate.getFullYear(), m2, day2].join("/");
                            $http.post("product/updateSeason", {
                                saveSeasonDetails: $scope.season,
                                startDate: $scope.startDate,
                                endDate: $scope.endDate
                            }).success(function(data) {
                                if (data === 'Season Exist') {
                                    $scope.seasonExistError = 'Season Name already exist';
                                    $scope.dateError = '';
                                    $scope.success = '';
                                }
                                if (data === 'Updated') {
                                    $scope.success = 'Your selected season Updated successfully';
                                    $scope.dateError = '';
                                    $scope.seasonExistError = '';
                                }
                            });
                        }
                    };
                }]).
            controller('RoomListCtrl', [
                '$scope', '$http', '$location', '$rootScope', function($scope, $http, $location, $rootScope) {
                    $scope.rooms = {};
                    $scope.room = [];
                    $http.get("product/getRoomDetails", {
                    }).success(function(data) {
                        $scope.rooms = data;
                    });
                    $scope.deleteRoom = function(index) {
                        var deleteRoom = confirm("Do you want to delete ?");
                        if (deleteRoom) {
                            $http.post("product/deleteRoom", {
                                deleteId: $scope.rooms[index]
                            }).success(function(data) {
                                if (data === 'deleted') {
                                    $scope.rooms.splice(index, 1);
                                }
                            });
                        }
                    };

                    $scope.editRoom = function(index) {
                        $http.post("product/editRoom", {
                            editId: $scope.rooms[index]
                        }).success(function(data) {
                            $rootScope.room = data;
                            $location.path('/app/editRoom');
                        });
                    };
                }]).
            controller('EditRoomCtrl', ['$scope', '$http', '$location', '$rootScope', '$timeout', function($scope, $http, $location, $rootScope, $timeout) {
                    $scope.roomTypes = [];
                    $scope.views = [];
                    $scope.seasonTimes = [];
                    $scope.days = [];
                    $scope.roomDetails = {};
                    $scope.rooms = $rootScope.room;
                    $http.get("product/getDetails", {
                    }).success(function(data) {
                        $scope.roomTypes = data.roomTypes;
                        $scope.views = data.views;
                        $scope.seasonTimes = data.seasonTimes;
                        $scope.days = data.days;
                        $rootScope.days = data.days;
                    });

                    $scope.roomDetails.id = $scope.rooms.id;
                    $scope.roomDetails.roomType = $scope.rooms.roomType;
                    $scope.roomDetails.viewType = $scope.rooms.view;
                    $scope.roomDetails.seasonType = $scope.rooms.seasonType;
                    $scope.roomDetails.bookingDay = $scope.rooms.bookingDays;
                    $scope.roomDetails.costPrice = $scope.rooms.costPrice;
                    $scope.roomDetails.weekendCostPrice = $scope.rooms.weekendCostPrice;

//        $scope.roomDetails.sunday = $scope.rooms.sunday;
//        $scope.roomDetails.monday = $scope.rooms.monday;
//        $scope.roomDetails.tuesday = $scope.rooms.tuesday;
//        $scope.roomDetails.wednesday = $scope.rooms.wednesday;
//        $scope.roomDetails.thursday = $scope.rooms.thursday;
//        $scope.roomDetails.friday = $scope.rooms.friday;
//        $scope.roomDetails.saturday = $scope.rooms.saturday;

                    $scope.update = function() {
                        if ($scope.roomDetails.roomPrice <= 1) {
                            $scope.zeroCostFormatError = "Enter valid currrency format";
                            $scope.costFormatError = "";
                            $scope.success = '';
                            $scope.roomExistError = '';
                            $scope.errors = '';
                        } else {
                            var cost = $scope.roomDetails.costPrice;
                            var patt = /^\d*(?:\.\d{0,2}){0,1}$/;
                            var validroomPrice = patt.test(cost);
                            if (validroomPrice === false) {
                                $scope.costFormatError = "Enter valid currrency format";
                                $scope.zeroCostFormatError = '';
                                $scope.success = '';
                                $scope.roomExistError = '';
                            } else {
                                $http.post("product/updateRoom", {
                                    saveRoomDetails: $scope.roomDetails
                                }).success(function(data) {
                                    if (data === "Exist") {
                                        $scope.roomExistError = 'Your selected room already exist';
                                        $scope.costFormatError = '';
                                        $scope.zeroCostFormatError = '';
                                        $scope.success = '';
                                    }
                                    if (data === 'Success') {
                                        $scope.costFormatError = '';
                                        $scope.roomExistError = '';
                                        $scope.zeroCostFormatError = '';
                                        $scope.success = 'Your selected room updated successfully';
                                        $timeout(function() {
                                            $location.path('/app/roomList');
                                        }, 3000);
                                    }
                                });
                            }
                        }
                        ;
                    };
                }]).
            controller('ListCtrl', [
                '$scope', '$http', '$location', '$rootScope', function($scope, $http, $location, $rootScope) {
                    $scope.products = [];
                    $scope.product = [];
                    $scope.Listproduct = [];
                    $http.get("product/list", {
                    }).success(function(data) {
                        $scope.products = data;
                    });

                    $scope.deleteProduct = function(index) {
                        var deleteProduct = confirm("Do you want to delete ?");
                        if (deleteProduct) {
                            $http.post("product/deleteProduct", {
                                productDetails: $scope.products[index]
                            }).success(function(data) {
                                if (data === 'deleted') {
                                    $scope.products.splice(index, 1);
                                }
                            });
                        }
                    };

                    $scope.editProduct = function(index) {
                        $http.post("product/editProduct", {
                            productDetails: $scope.products[index]
                        }).success(function(data) {
                            $location.path('/app/edit');
                            $rootScope.Listproduct = data;
                        });
                    };

                    $scope.buyProduct = function(index) {
                        $http.post("product/buyProduct", {
                            productDetails: $scope.products[index]
                        }).success(function(data) {
                            $location.path('/app/buy');
                            $rootScope.product = data;
                        });
                    };

                    $http.get("product/getProduct", {
                    }).success(function(data) {
                        $scope.products = data;
                    });
                }]).
            controller('EditController', ['$scope', '$http', '$location', '$rootScope', '$upload', '$timeout', function($scope, $http, $location, $rootScope, $upload, $timeout) {
                    $scope.products = {};
                    $scope.hide = true;
                    $scope.products = $rootScope.Listproduct;
                    $scope.update = function() {
                        var cost = $scope.products.costPrice;
                        var sell = $scope.products.sellingPrice;
                        var patt = /^\d*(?:\.\d{0,2}){0,1}$/;
                        var validCost = patt.test(cost);
                        var validSell = patt.test(sell);
                        if (validCost === false) {
                            $scope.costFormatError = "Enter valid currrency format";
                            $scope.costError = '';
                            $scope.success = '';
                            $scope.sellFormatError = '';
                            $scope.productNameError = '';
                        } else if (validSell === false) {
                            $scope.sellFormatError = "Enter valid currrency format";
                            $scope.costError = '';
                            $scope.success = '';
                            $scope.costFormatError = '';
                            $scope.productNameError = '';
                        } else {
                            $http.post("product/update", {
                                productId: $scope.products
                            }).success(function(data) {
                                if (data === "Product already Exist") {
                                    $scope.productNameError = data;
                                    $scope.costError = '';
                                    $scope.success = '';
                                    $scope.costFormatError = '';
                                    $scope.sellFormatError = '';
                                } else if (data === 'Selling price must be greater then cost price') {
                                    $scope.costError = data;
                                    $scope.productNameError = '';
                                    $scope.success = '';
                                    $scope.costFormatError = '';
                                    $scope.sellFormatError = '';
                                } else {
                                    $scope.success = data;
                                    $scope.costError = '';
                                    $scope.productNameError = '';
                                    $scope.costFormatError = '';
                                    $scope.sellFormatError = '';
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
                                data: $scope.products
                            }).success(function(data) {
                            });
                        };
                    };
                }]).
            controller('AddProductController', ['$scope', '$http', '$location', '$rootScope', '$upload', '$timeout', function($scope, $http, $location, $rootScope, $upload, $timeout) {
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
                                $scope.sellFormatError = '';
                                $scope.productNameError = '';
                            } else if (!validSell) {
                                $scope.sellFormatError = "Enter valid currrency format";
                                $scope.costError = '';
                                $scope.success = '';
                                $scope.costFormatError = '';
                                $scope.productNameError = '';
                            } else {
                                $scope.upload = $upload.upload({
                                    url: 'product/save',
                                    file: file,
                                    fileFormDataName: "myFile",
                                    data: $scope.product
                                }).success(function(data) {
                                    if (data === "Product already Exist") {
                                        $scope.productNameError = data;
                                        $scope.costError = '';
                                        $scope.success = '';
                                        $scope.costFormatError = '';
                                        $scope.sellFormatError = '';
                                    } else if (data === 'Selling price must be greater then cost price') {
                                        $scope.costError = data;
                                        $scope.productNameError = '';
                                        $scope.success = '';
                                        $scope.costFormatError = '';
                                        $scope.sellFormatError = '';
                                    } else if (data === 'Your product added successfully') {
                                        $scope.success = data;
                                        $scope.costError = '';
                                        $scope.productNameError = '';
                                        $scope.costFormatError = '';
                                        $scope.sellFormatError = '';
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
