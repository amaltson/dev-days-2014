/* global swift */
'use strict';

swift.config(function($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise('/');

  $stateProvider
    .state('service', {
      url: '/',
      templateUrl: 'views/services.html',
    });
});
