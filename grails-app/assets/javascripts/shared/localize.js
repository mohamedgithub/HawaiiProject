(function() {
  'use strict';
  angular.module('app.localization', []).factory('localize', [
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
    '$scope', 'localize', function($scope, localize) {
      localize.setLanguage('EN-US');
      $scope.lang = 'English';
      $scope.language = '';
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
    ]);

}).call(this);

//# sourceMappingURL=localize.js.map
