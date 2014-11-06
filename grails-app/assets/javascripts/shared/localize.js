(function() {
  'use strict';
        angular.module('app.localization', ['app.controllers']).factory('localize', [
            '$http', '$rootScope', '$window', function($http, $rootScope, $window) {
                var localize;
                    localize = {
                    language: '',
                    url: void 0,
                    resourceFileLoaded: false,
                    successCallback: function(data) {
                        localize.dictionary = data;
                        localize.resourceFileLoaded = true;
                        return $rootScope.$broadcast('localizeResourcesUpdated');
                    },
                    
                    setLanguage: function(value) {
                        $rootScope.lang = value;
                        localize.language = value.toLowerCase().split("-")[0];
                        return localize.initLocalizedResources();
                    },
                    
                    setUrl: function(value) {
                        localize.url = value;
                        return localize.initLocalizedResources();
                    },
                    
                    getLanguage: function() {
                        return localize.language;
                    },
                    
                    buildUrl: function() {
                        if (!localize.language) {
                            localize.language = ($window.navigator.userLanguage || $window.navigator.language).toLowerCase();
                            localize.language = localize.language.split("-")[0];
                        }
                        return 'Locale/resource?locale=' + localize.language;
                    },
                    
                    initLocalizedResources: function() {
                      var url;
                      url = localize.url || localize.buildUrl();
                      return $http({
                        method: "GET",
                        url: url,
                        cache: false
                      }).success(localize.successCallback).error(function() {
                        return $rootScope.$broadcast('localizeResourcesUpdated');
                      });
                    },
                    
                    getLocalizedString: function(value) {
                        var result, valueLowerCase;
                        result = void 0;
                        if (localize.dictionary && value) {
                            valueLowerCase = value.toLowerCase();
                            if (localize.dictionary[valueLowerCase] === '') {
                                result = value;
                            } else {
                                result = localize.dictionary[valueLowerCase];
                            }
                        } else {
                            result = value;
                        }
                            return result;
                    }
                };
              
                return localize;
            }
          ]).directive('i18n', [
            'localize', function(localize) {
                var i18nDirective;
                i18nDirective = {
                restrict: "EA",
                updateText: function(ele, input, placeholder) {
                    var result;
                    result = void 0;
                    if (input === 'i18n-placeholder') {
                      result = localize.getLocalizedString(placeholder);
                      return ele.attr('placeholder', result);
                    } else if (input.length >= 1) {
                      result = localize.getLocalizedString(input);
                      return ele.text(result);
                    }
                },
                link: function(scope, ele, attrs) {
                    scope.$on('localizeResourcesUpdated', function() {
                      return i18nDirective.updateText(ele, attrs.i18n, attrs.placeholder);
                    });
                    return attrs.$observe('i18n', function(value) {
                      return i18nDirective.updateText(ele, value, attrs.placeholder);
                    });
                }
            };
      
        return i18nDirective;
    }
        ]).controller('LangCtrl', [
        '$scope', 'localize','$location','$rootScope','$http', function($scope, localize, $location, $rootScope ,$http) {
            $scope.lang = 'English';
            $scope.language = '';
            
//            localize.setLanguage('EN-US');
            $http.get("user/getDefaultLanguage", {
                    }).success(function(data) {
                        localize.setLanguage(data);
                        $scope.lang = 'English';
                        if(data === 'AR-AE') {
                           $scope.language= '_ar'; 
                           $scope.lang = 'Arabic';
                        }
                    });
            
            $http.get("user/getCurrentUserName", {
                    }).success(function(data) {
                        $scope.headName = data.username;
                        $scope.file = data.filename; 
                    });
            
            return $scope.setLang = function(lang) {
                switch (lang) {
                    case 'English':
                        localize.setLanguage('EN-US');
                    break;
                    case 'Spanish':
                        localize.setLanguage('ES-ES');
                    break;
                    case 'Arab':
                        localize.setLanguage('AR-AE');
                    break;
                }

                $scope.language = localize.getLanguage();
                if($scope.language !=='ar') {
                    $scope.language='';
                } else {
                    $scope.language= '_' + $scope.language;

                }

                return $scope.lang = lang;
            };
        }

    ]).controller('ProfileCtrl', ['$scope', '$http','$rootScope','$location', function($scope, $http, $rootScope,$location) {
            $scope.user = {};
            $http.get("user/getLanguage", {
                    }).success(function(data) {
                        if(!$scope.user) {
                             $scope.user = {};
                    }
                    
                    angular.forEach($scope.defaultLanguages, function(value, key) {
                        if(value.name === data) {
                            $scope.user.myLanguage = $scope.defaultLanguages[key];
                        }
                    });
                });
            
            $http.get("user/getProfileImage", {
                    }).success(function(data) {
                        $scope.file = data.filename; 
                    });
            $scope.defaultLanguages = [
                {name:'English', value:'EN-US'},
                {name:'Spanish', value:'ES-ES'},
                {name:'Arabic', value:'AR-AE'}
            ];
            
            $scope.cancel = function() {
                $location.path('/dashboard');
            };
            
            $scope.showUserProfile = function() {
                $http.get("user/getCurrentUserName").success(function(data) {
                    $scope.user.userName = data.username;
                    $scope.user.email = data.email;
                    $scope.user.location = data.location;
                    $scope.user.phoneNumber = data.phonenumber;
                });
            };
            $scope.showUserProfile();
            $scope.save = function() {
            $scope.phoneNumberError = "";
            $scope.emailError = "";
            $scope.spaceError = "";
            $scope.success = false;
            $scope.showSaving = true;
                
                var phoneNumber = document.forms["myForm"]["phoneNumber"].value;
                var userName = document.forms["myForm"]["userName"].value;
                if (/^\S+$/.test(userName)) {
                    if (/^[0-9]{10}$/.test(phoneNumber)) {
                        $http.post("user/editProfile",{
                        userDetails: $scope.user
                    }).success(function(data) {
                       if(data === "Email not valid") {
                            $scope.emailError = "This Email already Exist";
                            $scope.success = false;
                            $scope.showSaving = false;
                            $scope.phoneNumberError = "";
                            $scope.spaceError = "";
                            $scope.nameError = '';
                       } else if(data === 'Name not valid') {
                            $scope.success = false;
                            $scope.showSaving = false;
                            $scope.phoneNumberError = "";
                            $scope.spaceError = "";
                            $scope.emailError = "";
                            $scope.nameError = "Name already Exist";
                       } else {
                            $scope.userName = data.username;
                            $scope.email = data.email;
                            $scope.user.location = data.location;
                            $scope.user.phoneNumber = data.phonenumber;
                            $scope.emailError = "";
                            $scope.showSaving = false;
                            $scope.success = true;
                            $scope.phoneNumberError = "";
                            $scope.spaceError = "";
                            $scope.nameError='';
                        }
                    });
                    } 
                    $scope.phoneNumberError = "Enter Valid Number";
                    $scope.showSaving = false;
                    $scope.emailError = "";
                    $scope.success = false;
                    $scope.spaceError = "";
                    $scope.nameError='';
                } else {
                    $scope.phoneNumberError = "";
                    $scope.showSaving = false;
                    $scope.emailError = "";
                    $scope.spaceError = "Space Not Allowed";
                    $scope.success = false;
                    $scope.nameError='';
                };
            };  
        }
    ]).controller('ChangePasswordController', ['$scope', '$http', function($scope, $http) {
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
}).call(this);
