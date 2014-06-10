/* global swift */
'use strict';

swift.directive('serviceHeader', function(){

	return{
		restrict:'E',
		scope:{
			service:'='
		},
		templateUrl:'/views/service-header-partial.html'
	}
});

swift.directive('deployment', function(){

	return{
		restrict:'E',
		templateUrl:'/views/deployment-partial.html'
	}
});

swift.directive('instance', function(){

	return{
		restrict:'E',
		scope:{
			service:'='
		},
		templateUrl:'/views/instance-partial.html'
	}
});